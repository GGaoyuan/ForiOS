[toc]
#### 通识基础
##### 计算机计量单位换算
1Byte = 8 Bit 
1KB    = 1,024 Bytes
1MB   = 1,024 KB
#### 底层
##### IMP、SEL、Method的区别
SEL是方法编号，也是方法名
IMP是函数实现指针，找IMP就是找函数实现的过程
Method就是具体的实现
SEL和IMP的关系就可以解释为：
SEL就相当于书本的⽬录标题
IMP就是书本的⻚码
Method就是具体页码对应的内容
SEL是在dyld加载镜像到内存时，通过_read_image方法加载到内存的表中了
##### Autoreleasepool实现原理
autoReleasepool的两个核心方法：objc_autoreleasePoolPush和objc_autoreleasePoolPop
自动释放池的释放过程大概就是objc_autoreleasePoolPush-> [objct autorelease] -> objc_autoreleasePoolPop
再往里面看，每次AutoreleasePoolPush/pop就是调用Page的push/pop
![](/images/autoreleasepool01.png)
从图片里可以看出AutoreleasePool是一个双向链表，每个节点就是栈指针，里面有对象和一个Page，大小是一页虚拟内存的大小(4KB)
```
AutoReleasePool的官方注释
/***********************************************************************
   Autorelease pool implementation

   A thread's autorelease pool is a stack of pointers. 
   Each pointer is either an object to release, or POOL_SENTINEL which is 
     an autorelease pool boundary.
   A pool token is a pointer to the POOL_SENTINEL for that pool. When 
     the pool is popped, every object hotter than the sentinel is released.
   The stack is divided into a doubly-linked list of pages. Pages are added 
     and deleted as necessary. 
   Thread-local storage points to the hot page, where newly autoreleased 
     objects are stored. 
**********************************************************************/
```
一个线程的autoreleasepool就是一个指针栈。
栈中存放的指针指向加入需要release的对象或者POOL_SENTINEL(哨兵对象，用于分隔autoreleasepool）。
栈中指向POOL_SENTINEL的指针就是autoreleasepool的一个标记。当autoreleasepool进行出栈操作，每一个比这个哨兵对象后进栈的对象都会release。
##### NSThread、NSRunLoop 和 AutoreleasePool
苹果不允许直接创建AutoreleasePool，但是可以获取Main和CurrentRunloop
线程和Runloop是一一对应的，保存在一个全局的Dictionary中。
子线程默认是没有开启runloop的，需要自己手动run。当线程结束的时候，runloop被回收，可以通过runloop线程保活。
线程会对应一个runloop
线程在RunloopPage可以得知会对应一个autoreleasepool
##### runtime的内存模型（isa、对象、类、metaclass、结构体的存储信息等）
![](/images/objc_class01.png)
```
struct objc_object {
    isa_t isa;
}
union isa_t {
    Class cls;
    uintptr_t bits;
    struct {
        uintptr_t extra_rc  : 8;    //有8位，2^7-1
        ...
    };
    ... //乱七八糟的信息
}
typedef struct objc_class *Class;
struct objc_class : objc_object {
    Class superclass;
    cache_t cache;             // formerly cache pointer and vtable
    class_data_bits_t bits;    // class_rw_t * plus custom rr/alloc flags
    class_rw_t *data() {  
        return bits.data();
    }
    struct class_rw_t {  
        uint32_t flags;
        uint32_t version;
 
        const class_ro_t *ro;   //存储了当前类在编译期就已经确定的属性、方法以及遵循的协议
 
        method_array_t methods;
        property_array_t properties;
        protocol_array_t protocols;
 
        Class firstSubclass;
        Class nextSiblingClass;
    };
}
```
##### 为什么要设计metaclass
万物皆对象，类对象也能使用消息机制
每个类都有自己的metaclass有利于单一职责，不然就全写在NSObjct的Metaclass了，不好
##### id的本质是什么呢
```
typedef struct objc_object *id;
```
id是一个一个指向objc_object结构体的指针
##### runtime的API里class_copyIvarList & class_copyPropertyList区别
```
{
    NSString *str;
}
@property NSString *property;

//class_copyIvarList
str
_property
//class_copyPropertyList
property
```
class_copyIvarList能够获取.h和.m中的所有属性以及大括号中声明的成员变量，能获取属性的成员变量
class_copyPropertyList:只能获取由property声明的属性，包括.m中的，获取的属性名称不带下划线。
所以OC中没有真正的私有属性
##### category如何被加载的
在_objc_init->map_images->_read_images，然后将category的方法和类方法添加到对应的类里面
##### 两个category的load方法的加载顺序，两个category的同名方法的加载顺序呢，initialize,在继承关系中他们有什么区别
load在main前调用方法不管对象用不用都会调用，先调用父类，再调用子类
category的load是按照编译顺序来的，先编译的先调用，后编译的后调用
category的initialize是按照编译顺序来的，所有的initialize只调用一次，也就是最后编译的那个category中的initialize方法
##### category & extension区别，能给NSObject添加Extension吗，结果如何
category:
运行时添加分类属性/协议/方法
分类添加的方法会“覆盖”原类方法，因为方法查找的话是从头至尾，一旦查找到了就停止了
同名分类方法谁生效取决于编译顺序，读取的信息是倒叙的，所以编译越靠后的越先读入
extension:
编译时决议
只有.h文件，只以声明的形式存在，所以不能为系统类添加扩展
这东西就是用来访问自己写的类的私有方法的
##### 在方法调用的时候，方法查询-> 动态解析-> 消息转发 之前做了什么
检查selector是否需要忽略，比如retain和release这样的函数
检查target是不是为nil，如果是nil的话msg_send就会被忽略掉
之后就是在缓冲中找有没有方法，没有就去对象的method_list找，还没有就去父类中去找，还没找到就会到_objc_msgForward消息转发，还不行还有最后的一次机会包装NSInvocation给开发，还不行就崩溃了
##### weak的实现原理？SideTable的结构是什么样的
weak苹果是用的一个引用计数表进行管理
weak的管理表和引用计数表都是通过SideTables进行管理，SideTables全局的哈希表，由多个SideTable组成，一共有64个以对应的内存地址作为Key去查表
![](/images/sideTables01.jpeg)
SideTable里有有对应的自旋锁，用来加锁。这里苹果用的分离锁技术，自旋锁速度快，引用计数访问很频繁，只对单个表加锁，而不对整个SideTables一起加锁。对象通过自己的内存地址找到属于自己的SideTable。因为对象有很多很多，所以再查一次里面的RefcountMap这个Cpp的Map，查到对应的引用计数
同理，还有就是weak的管理，也是和这个类似，在SideTable的weak_table_t里找对应的对象
https://www.jianshu.com/p/ef6d9bf8fe59
##### ARC下的retain和release的优化（这个答案不确定对不对）
会对引用计数的溢出做处理，里面有一个extra_rc，如果溢出这个变量会有值
##### 简述一下Dealloc的实现机制
1.调用objc_rootdealloc()
2.rootdealloc()
3.object_dispose()  //dispose翻译是处理
4.objc_destructInstance()
    4.1:object_cxxDestruct:判断有没有关联Cpp的东西，删除掉
    4.2:_object_remove_assocations:去除和这个对象assocate的对象
    4.3:objc_clear_deallocating:清空引用计数表并清除弱引用表，将所有weak引用指nil（这也就是weak变量能安全置空的所在）
5.C的free()
##### 内存中的5大区分别是什么
栈区(stack):由编译器自动分配释放存放函数的参数值，局部变量的值等。其操作方式类似于数据结构中的栈。
堆区(heap):一般由程序员分配释放，若程序员不释放，程序结束时可能由OS回收。注意它与 数据结构中的堆是两回事，分配方式倒是类似于链表。
全局区(静态区)(static):全局变量和静态变量的存储是放在一块的，初始化的全局变量和静态变量在一块区域，未初始化的全局变量和未初始化的静态变量在相邻的另一块区域。程序结束后由系统释放。
常量区:常量就是放在这里的。程序结束后由系统释放。
程序代码区:存放函数体的二进制代码。
##### 一个NSObject对象占用多少内存
一个NSObject对象都会分配16byte(字节)的内存空间。
但是实际会只使用了8byte
系统是按16的倍数来分配对象的内存大小的，比如一个对象占用40字节，系统会分配给他48字节
##### 内存管理方案
1.taggedPointer:由于NSNumber、NSDate一类的变量本身的值需要占用的内存大小常常不需要8个字节，所以将一个对象的指针拆成两部分，一部分直接保存数据，另一部分作为特殊标记，表示这是一个特别的指针，不指向任何一个地址，将值直接存储到了指针本身里。但是TaggedPointer因为并不是真正的对象，而是一个伪对象，所以你如果完全把它当成对象来使，可能会让它露马脚。所有对象都有 isa指针，而TaggedPointer其实是没有的具体的
![](/images/taggedpointer.png)
2.NONPOINTER_ISA--(非指针型的 isa) -> 感觉很像taggedPointer
3.SideTables
https://www.jianshu.com/p/c9089494fb6c
#### KVO
##### 如何手动调用KVO
手动调用willChangeValueForKey和didChangeValueForKey方法
被观察的属性会被重写，举个栗子：
```
 - (void)setNow:(NSDate *)aDate {
    [self willChangeValueForKey:@"now"];    //记录旧的值
    [super setValue:aDate forKey:@"now"];   //将新值赋值给旧值
    [self didChangeValueForKey:@"now"];     //判断willChangeValueForKey，如果有再调用observeValueForKeyPath
}
```
只调用didChangeValueForKey方法不可以触发KVO方法，因为willChangeValueForKey记录旧的值，如果不记录旧的值，那就没有改变一说了

#### 算法
##### 判断单向链表是否有环
快指针和慢指针解决，一个指针每次走1个节点，一个指针每次都2个节点，如果有交点，那么必定会相遇

#### 优化

#### 计算机基础
##### 哈希表和哈希函数
哈希表又叫散列表，是根据关键码值（Key-Value）而直接进行访问的数据结构，也就是我们常用到的map。
哈希函数：也称为是散列函数，是Hash表的映射函数，它可以把任意长度的输入变换成固定长度的输出，该输出就是哈希值（哈希算法）。哈希函数能使对一个数据序列的访问过程变得更加迅速有效，通过哈希函数数据元素能够被很快的进行定位。如果一个函数实现了哈希算法，就称这个函数为哈希函数