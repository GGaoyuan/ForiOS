[toc]
## 内存
#### 理解属性这一概念
OC对实例变量的地址偏移量处理放在类方法中去保管，在运行时期去查找，保证每次对实例变量的指针偏移量是正确的。（这个就是稳定的二进制编程接口ABI）
@dynamic告诉编译器不要自动创建set/get方法，还有实例变量
@synthesize可以指定实例变量的名字（这个最好少用，不然代码让人看不懂）
默认情况下属性是atomic，是自动加了一个同步锁，这个历史遗留问题iOS同步锁的开销很大，而且atomic也不一定能保证线程安全，所以大部分都是nonatomic，再用其他的锁保证线程安全
#### 在category中添加属性，关联对象自定义数据(Associated Objct)
这个要自己写一些demo，就是以前的在category里加属性，但是这个最好少写一些，不然debug很麻烦
#### 类对象的能否继承，重写
可以
#### iOS中内存泄漏的场景还有如何解决
Block中
代理
通知
try/catch:出现异常用@throw可能会出现内存泄漏的情况，通常不是那种致命错误，用返回nil或者NSError，如果非要用try/catch那么要注意在final里释放资源（比如数据库）
#### 理解NSCopying
对象想要拷贝必须实现NSCopying协议，如果是想要深拷贝是实现NSMutableCopying协议，默认的拷贝都是浅拷贝
copywithzone方法里的zone参数是历史遗留问题，不必理会
#### 引用计数ARC
1.苹果系统是内部有一个引用计数表来管理引用计数
2.alloc/new/copy/mutableCopy生成的对象，这种对象会被当前的变量所持有，引用计数会加1，而其他的如array，mutibale等等需要在舒适化之后调用retain才能持有这个对象
3.ARC中的修饰符
__strong：
默认值，表示强引用，变量会在超出作用域的时候被废弃释放掉，这样省去了MRC的retain和release
__weak：
weak和strong的意思恰恰相反表示弱引用，不持有对象，当超过作用域的时候置为nil
__unsafe_unretain：
这个的意思和weak类似，但是不会置nil
__autoreleasing
将对象添加到autoreleasepool中
https://www.jianshu.com/p/b13983e341fd
#### 用assign修饰对象会怎样
会崩溃
assign和weak修饰类似，weak对应的关键修饰符是__weak，assign是__unsafe_unretained，俩的差别就是__weak释放后会置nil，assign会出现野指针，而用他们俩修饰，简单的allocinit编译后带代码是会发送消息让对象直接释放
#### 用autoreleasepool降低内存峰值
？？？
#### id和nill代表什么（nill和NULL的区别）
？？？
#### 向一个nill对象发送消息会发生什么？
？？？
#### AutoreleasePool的实现原理
？？？
#### 如何检测项目中的野指针
开启僵尸对象调试？？？
#### 用僵尸对象调试内存问题
开启僵尸对象调试后，原本要被系统回收的对象系统就不会将他们回收，而是转化成僵尸对象，所占用的内存也不会被复写，当他们收到消息的时候，就会抛出异常。僵尸对象的生成类似KVO，当设置了僵尸对象，系统会在dealloc的时候swizzle到new出来的新的僵尸Object，并指向原本的Object，原本的Object不会释放，当僵尸对象收到消息，就能找到原本将收到消息的对象了并抛出异常
#### id的实质(联系block为什么是一个OC对象)
```
//id为一个objc_object结构体的指针类型
typedef struct objc_object {
    Class isa;
} *id;

//Class为objc_class结构体的指针类型
typedef struct objc_class *Class;
struct objc_class {
    Class isa;
};
```
而block的结构体
```
struct __block_impl {
    void *isa;
    int Flags;
    int Reserved;
    void *FuncPtr;
}
```
一个普通对象
```
struct TestObject {
    Class isa;
    int val0;
    int val1;
}
```
对比一下，明白了吧？


--------------------------------------------
## Block
#### 理解Block
Block就是带有局部变量的匿名函数(RB.P80)
匿名函数：不带名称的函数。虽然说函数指针也是可以替换掉函数的，但是函数指针在赋值的时候也是需要知道函数名的
```
int (*funcptr)(int) = &func;
int result = (*funcptr)(10); 
```
#### blcok会截获局部变量
如代码所示
```
void blockFunc() {
    int val = 10;
    void (^blk)(void) = ^{
        printf("val in block = %d\n", val);
    };
    val = 20;
    printf("now the val = %d\n", val);
    blk();
}
```
最后打印的结果是
```
now the val = 20
val in block = 10
Program ended with exit code: 0
```
因为block会捕获局部变量的瞬间值，所以在block捕获之后，val的值改变成多少，都和block捕获的变量无关
#### blcok的实质
当一个block被转换为C代码后是这样的
```
//Block
void(^blk)(void) = ^{
    printf("Block\n");
};
blk();
//转化后是这样
struct __block_impl {
    void *isa;
    int Flags;
    int Reserved;
    void *FuncPtr;
}
//接下来是几个名叫__main_block_xxx_0的结构体和方法
//这里用impl代替原本的__main_block_impl_0
//这里用func代替原本的__main_block_func_0
//这里用desc代替原本的__main_block_desc_0
struct impl0 {
    struct __block_impl impl;
    struct desc *Desc;
    //block的一个构造方法
    impl0(void *fp ... ...) {
        impl.isa = &StackBlock;
        impl.FuncPtr = fp;
    }
}

static void func0(struct impl *__cself) {
    printf("Block\n");
}

static struct desc0 {    //这个里边就是关于版本，大小的数据
    unsigned long reserved;
    unsigned long Block_size;
}
//block的最终生成函数
void(^blk)(void) = (void (*)(void)) &imp0((void *)func0 ... ...)
//blk();转化
(*blk->imp.FuncPtr)(blk);
```
(以下分别省去__main_block_0这个前缀和后缀)
从源代码中就可以看出，其实Block内部最终的方法就是func里的内容。从这个方法的参数，又能联系到impl0这个结构体，在这个结构体里又有__block_impl这个结构体和desc这个结构体。
然后看最后的block生成函数，一个block就是调用结构体的impl0的构造函数初始化一个impl0的struct，传入代表源block内部方法的func0，impl0里的impl又有关于impl0需要的信息和函数指针。由此看出impl0结构体，实际上就是我们的block。
因为OC对象的实质就是个有isa指针的结构体，所以Block也可以看做一个OC对象(RB.P97~P99，这里有详细介绍id,即void *是什么个东西)
最后使用Block的代码blk()转换后就是简单的函数调用
#### Blcok如何截取局部变量
```
//Block
int dmy = 20;
int val = 10;
const char *fmt = "val = %d\n";
void(^blk)(void) = ^{
    printf(fmt, val);
};
blk();
//转化后代码合上面的block实质这部分差不多，不过下面这里不同
struct impl0 {
    struct __block_impl impl;
    struct desc *Desc;
    int val;
    const char *fmt;
    //block的一个构造方法
    impl0(void *fp , int _val, char *_fmt ... ...) {
        impl.isa = &StackBlock;
        impl.FuncPtr = fp;
    }
}
static void func0(struct impl *__cself) {
    const char *fmt = __cself->fmt;
    int val = __cself->val;
    printf(fmt, val);
}
```
从源码中可知，局部变量fmt和val会被作为impl0这个结构体的成员变量，但是dmy这个变量block没有使用，所以他是不会被追加进去的。
```
struct impl0 {
    struct __block_impl impl;
    struct desc *Desc;
    int val;
    const char *fmt;
}
```
由此我们可以看出block是如何截取变量的。即使在Block内部使用了被截取的变量，也不会对原来的对象有影响
所以所谓的截取成员变量，就是将成员变量值被保存到block的实例中（即impl0这个机构体之中）
#### __block
__block其实是和static将变量存在静态区，auto存在栈区等说明符一样，是指将变量放入某个特定的内存区域
```
__block int val = 10;
void(^blk)(void) = ^{
    val = 1;
};
```
```
__block int val = 10;
//编译后
struct __Block_byref_val_0 {
    void *__isa;
    __Block_byref_val_0 *__forwarding;
    int __flags;
    int __size;
    int val;
};
```
可以见得val加了__block之后成为了一个结构体，可以将它看成一个objc对象。其中，val就是真正的int val，而__forwarding是一个指向自己的指针,他存在的原因是因为->block都有哪几种类型的Block
这个结构体可以用在几个block中。
```
struct impl0 {
    struct __block_impl impl;
    struct desc *Desc;
    __Block_byref_val_0 *val;
    //block的一个构造方法
    impl0(void *fp, __Block_byref_val_0 *_val : val(val->__forwarding) ... ...) {
        impl.isa = &StackBlock;
        impl.FuncPtr = fp;
    }
}

static void func0(struct impl *__cself) {
    __Block_byref_val_0 *val = __cself->val;
    val->__forwarding->val = 1;
}
```
在这个func0中，我们可以看到，实际上，我们可以通过拿到当前Block结构体(即impl0)中的val，然后再通过val这个结构体(即__block编译出的结构体)找到最终的那个__block int val并赋值;
？？？
#### block都有哪几种类型的Block，__block的变量存储域
有StacK,Malloc,Global(数据区)
在block初始化的时候结构体__block_impl的isa指针会指向对应的block类型
```
//NSConcreteGlobalBlock
void(^blk)(void) = ^{printf("Global Block");};
int main() {
    //
}
//注意，全局Block是不能使用局部变量的
```
```
//NSConcreteStackBlock
int main() {
    void(^blk)(void) = ^{printf("Stack Block");};
}
```
GlobalBlock，任何地方都能访问，但是全局Block是不能使用局部变量的
StackBlock在ARC下其实已经没有了，一生成就会被编译器自动copy到堆上成为堆Block。通过编译后的代码可以看出一个StackBlock会初始化后将自己copy到堆上，然后加入到autoreleasepool中。
对于堆block，来说，是为了保证Block超出了作用域还能使用而存在的。如果一个Block是栈block，但是如果他需要在超过了作用域还需要存在，编译器会自动将他从栈复制到堆中。这个也是为啥Block的属性需要用copy，当然用strong也没什么问题，strong对应retain，block的retain实际上是由copy来实现。（苹果的原文copying block里说了，需要在作用域外使用block，copying block到heap）
然鹅有时候会因为编译器在特殊情况下是无法识别Block是否需要被copy，这时候得手动调用copy方法。反正对于block来说，调用copy就行，准没错
对于__block来说，当在栈上的时候，blk0和blk1使用它，如果blk0或blk1被复制到了堆上，那么__block这个被修饰的变量(即objc的对象)则会被一同复制过去的block持有，一个block持有引用计数+1，俩就+2。（因为__block的变量是对象）
对于__block里的__forwarding正是为了解决copy到堆上的问题。当被copy到堆上之后，新的__forwarding还是指向自己，但是老的__forwarding会指向新的，这样就能永远只访问同一个变量
#### block里面使用实例变量会造成循环引用吗
看实例变量是否被是否被强引用，看block是都被其他对象强引用
```
Person *person = [[Person alloc]init];
person.age = 20;
person.block = ^{
    NSLog(@"age is %d",person.age);
};
//编译后
struct __main_block_impl_0 {
  struct __block_impl impl;
  struct __main_block_desc_0* Desc;
  Person *__strong person; // 对 person 产生了强引用
  __main_block_impl_0(void *fp, struct __main_block_desc_0 *desc, Person *__strong _person, int flags=0) : person(_person) {
    impl.isa = &_NSConcreteStackBlock;
    impl.Flags = flags;
    impl.FuncPtr = fp;
    Desc = desc;
  }
};
```
由此看出，block里使用了person，那么block会持有person这个对象。但是person对象又持有了Block，那么就会循环引用
解决的办法有三个，__weak,_unsafe_unretain,还有__block
而__block的代码是：
```
Person *person = [[Person alloc]init];
__block Person *weakPerson = person;
person.age = 20;
person.block = ^{
    NSLog(@"my age is %d",weakPerson.age);
    //在 block 内部,把 person 对象置为nil
    weakPerson = nil;
};
person.block();
```
#### block为啥要用copy
其实用strong也行
？？？

--------------------------------------------
## 多线程
#### 简单介绍下GCD
DispatchQueue是FIFO先进先出的，模式有等待当前执行处理的Seria（串行）和不等待当前执行的的Concurrent（并行）
还有阻塞当前线程的sync（同步）和不阻塞当前线程的async（异步）


#### 线程死锁的四个条件
？？？
#### 进程和线程的区别
？？？
#### 自旋锁和互斥锁的区别
？？？
#### 多进程间的通讯
？？？
#### 开启一条线程的方法
？？？
#### 线程可以取消吗
？？？
#### 那子线程中的autorelease变量什么时候释放？
？？？
#### 子线程里面，需要加autoreleasepool吗
？？？
#### GCD和NSOperation的区别？
？？？


--------------------------------------------
## 持久化
#### iOS中的持久化方案有哪些
？？？
#### 你们的App是如何处理本地数据安全的(比如用户名的密码)
？？？
#### 事务的特征
？？？

--------------------------------------------
## runloop
#### runloop有几个mode

--------------------------------------------
## runtime
#### 消息转发机制objc_msgSend
objc_msgSend会查找当前对象的methodList，如果没有，会往自己的父类中去查找，如果都查不到会进行消息转发。当找到了对应的方法后，会吧方法缓存到一个表中，下一次再访问的时候就从缓存中查找，这样速度更快
消息转发分为两个阶段：
1.动态方法解析：先查询接受者，看有没有动态添加方法处理这个消息
2.完整的消息转发机制：这时候第一步已经执行完，运行时系统不会再动态添加方法，也不会再去查找动态添加的方法，这时系统会看有没有其他的消息接收对象，如果有就转发消息给备用对象，如果没有，系统会把消息封装在NSInvocation对象，给接受者最后一次机会处理消息
#### Method Swizzling
？？？
#### SEL和IMP的关系

--------------------------------------------
## KVO和通知
#### KVO的实现方式
直接访问实例变量不会触发KVO
#### 如何手动触发KVO的方式
？？？

--------------------------------------------
## 响应链和UI
#### UIViewController的生命周期
？？？loadView的加载等等？？

--------------------------------------------
## 其他
#### 内存区域有哪几个
？？？
#### 了解Objective-C起源
所有的Objective-C的对象都是声明一个指针*，指向的对象会被分配在堆空间中，堆中内存自己管理（ARC）
如果代码中不含有*的变量，那么就是在栈上，如NSInteger, CGRect
#### Objective-C如何实现多继承
？？？
#### 在类的头文件中尽量少引入其他头文件
如果在一个A.h里引用另外的一个B.h，那么A能获取B中的全部细节，延长编译时间，增加耦合，所以应该用向前声明@class这种形式在A.h中声明B，在A.m中去引入B.h
\#import和\#include相比，import可以避免“循环引用”文件的问题
#### 多用类型常量，少用#define预处理指令
多用static const 和extern const，少用define。static把数据保存在数据段，extern表示通知编译器这个东西是全局的
#### 理解“==”，“isEqual”，”isEqualToString“
\==和isEqual是不一样的，如果是基本数据类型如int，float可以用==，他判断的是简单的值，并不比较内存，isEqual是比较的指针的值，指向的内存相同才会返回true
声明NSString，就是 NSString *s1 = @"s";  而不是NSString *s2 = [NSString stringWithFormat:@"1"]; 
这里的s1 != s2, [s1 isEqualToString s2]是true
相同的对象有相同的哈希码，但是两个相同的哈希码未必相同
编写hash方法的时候，要使用速度快，碰撞率低的算法
#### 多用字面量语法，少用与之等价的方法
比如声明NSString，就是 NSString *s = @"s";  而不是NSString *s = [NSString stringWithFormat:@"1"];
#### Num31:在dealloc里移除通知和监听
#### Num32:编写“异常安全代码”时注意内存安全
注意try/catch时候的内存管理，因为这里是很容易造成内存泄漏的，比如在try中异常了，那么会直接跳到catch中，那么try中可能有关于释放内存的代码就无法
执行，会造成内存泄漏。这种时候最好是用try/catch/finally，在finally里释放资源
#### Num36：不要使用retainCount
注意String的引用计数，通常是在常量区，引用计数是(2^64)-1-->整数的最大值。系统会吧NSString当做单例对象，编译的时候都放在常量区，运行的时候直接用，并不创建对象。但是汉字，或者是其他的一些较长的文本，NSString会和其他对象一样在堆内存中，会有ARC的引用计数
#### 单例和全局变量的区别
？？？
#### MVVM
？？？
#### 字典的工作原理
？？？
#### 一张图片的内存占用大小是由什么决定的
？？？
#### Images.xcassets和直接用图片有什么不一样
？？？
#### 多态
？？？
#### KVC
？？？
#### main函数之前都有什么


--------------------------------------------
## 设计模式
#### 用类族模式隐藏细节
例子就是Button的init，在初始化的时候传入枚举值返回不同的对象
#### 工厂模式和抽象工厂的区别


--------------------------------------------
## 网络
#### HTTP请求的哪些方法用过？什么时候选择get、post、put？他们有什么区别
？？？
#### http中的同步和异步
？？？
#### TCP为什么是三次握手和四次挥手
？？？
#### ipv6
？？？
#### 断点续传怎么实现？需要设置什么？
？？？
#### Ping是什么协议
？？？
#### 输入一个字符串，判断这个字符串是否是有效的IP地址
？？？



--------------------------------------------
## 算法
#### 堆排序
？？？
#### 复杂度
？？？
#### 在100w个数据中怎么快速去取某个值
？？？
#### 两个链表找第一个相同结点
？？？
#### 字符串旋转
？？？
#### 找链表的倒数第k个结点
？？？
#### 二叉树的遍历
前序，中序，后续，递归非递归
？？？
#### 说一下hash算法
？？？
#### NSDictionary的实现原理是什么
？？？

--------------------------------------------
## 性能优化
#### 如何检测应用是否卡顿
？？？
#### 容错处理你们一般是注意哪些？
？？？
#### 如何防止拦截潜在的崩溃？
runtime消息转发？？？


--------------------------------------------
## Swift
#### 闭包和逃逸闭包
？？？
#### unowned和weak
？？？
#### 深拷贝和浅拷贝
？？？


--------------------------------------------
https://www.jianshu.com/p/89978870f49f