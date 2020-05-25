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
#### 理解引用计数ARC
苹果系统是内部有一个引用计数表来管理引用计数
修饰符有__strong,__weak,__autoreleasing
alloc/new/copy/mutableCopy生成的对象，这种对象会被当前的变量所持有，引用计数会加1，
#### 用assign修饰对象
---

## Block
#### 理解Block
???
## runtime
#### 消息转发机制objc_msgSend
objc_msgSend会查找当前对象的methodList，如果没有，会往自己的父类中去查找，如果都查不到会进行消息转发。当找到了对应的方法后，会吧方法缓存到一个表中，下一次再访问的时候就从缓存中查找，这样速度更快
消息转发分为两个阶段：
1.动态方法解析：先查询接受者，看有没有动态添加方法处理这个消息
2.完整的消息转发机制：这时候第一步已经执行完，运行时系统不会再动态添加方法，也不会再去查找动态添加的方法，这时系统会看有没有其他的消息接收对象，如果有就转发消息给备用对象，如果没有，系统会把消息封装在NSInvocation对象，给接受者最后一次机会处理消息
#### Method Swizzling
???
## KVO和通知
#### KVO的实现方式
直接访问实例变量不会触发KVO
#### 如何手动触发KVO的方式
???
## 其他
#### 了解Objective-C起源
所有的Objective-C的对象都是声明一个指针*，指向的对象会被分配在堆空间中，堆中内存自己管理（ARC）
如果代码中不含有*的变量，那么就是在栈上，如NSInteger, CGRect
#### Objective-C如何实现多继承
???
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
#### Num33：弱引用避免循环引用
unsafe_unretain和weak作用完全相同，也就是weak和assign的作用相同，但是weak会在系统回收对象后置为nil，unsafe_unretain不会
#### Num34：用autoreleasepool降低内存峰值
#### Num35：用僵尸对象调试内存问题
开启僵尸对象调试后，原本要被系统回收的对象系统就不会将他们回收，而是转化成僵尸对象，所占用的内存也不会被复写，当他们收到消息的时候，就会抛出异常。僵尸对象的生成类似KVO，当设置了僵尸对象，系统会在dealloc的时候swizzle到new出来的新的僵尸Object，并指向原本的Object，原本的Object不会释放，当僵尸对象收到消息，就能找到原本将收到消息的对象了并抛出异常

#### Num36：不要使用retainCount
注意String的引用计数，通常是在常量区，引用计数是(2^64)-1-->整数的最大值。系统会吧NSString当做单例对象，编译的时候都放在常量区，运行的时候直接用，并不创建对象。但是汉字，或者是其他的一些较长的文本，NSString会和其他对象一样在堆内存中，会有ARC的引用计数



## 设计模式
#### 用类族模式隐藏细节
例子就是Button的init，在初始化的时候传入枚举值返回不同的对象

#### 工厂模式和抽象工厂的区别