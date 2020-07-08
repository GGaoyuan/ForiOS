[toc]
#### 通识基础
##### 计算机计量单位换算
1Byte = 8 Bit 
1KB    = 1,024 Bytes
1MB   = 1,024 KB
#### 底层
##### SEL和IMP的区别
SEL是方法编号，也是方法名
IMP是函数实现指针，找IMP就是找函数实现的过程
SEL和IMP的关系就可以解释为：
SEL就相当于书本的⽬录标题
IMP就是书本的⻚码
函数就是具体页码对应的内容
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