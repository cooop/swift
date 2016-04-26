# SwiftCon

## 一个Swift项目的网络层变迁
enjoy-精选限量美食， 纯Swift项目
Swift化！

enum associated values
protocol extension

1. 网络驱动 AFN －> alamofire
回调方式 success, failure -> completion , enum APIResult {case Success, Failure}
公共framework

2. 网络Model Mantle -> ObjectMapper, class -> struct, 减少optional
ObjectMapper扩展 nonnil

3. 链式调用 optional chain

4. 数据处理通用组件

5. APIResult扩展

## 原生移动跨平台开发工具Project Mirai
tinyfool微信30010

跨平台开发方案
HTML
原生跨平台
HTML5裸机的原生UI的方案
环境模拟器

Project Mirai, iOS代码编译成安卓程序
1. Objective-C 语言: gnuobjc, dispatch, ffi, opengcd, iconv, icu
2. Runtime: icms, pixman, cairo, libpng, libjpeg, libtiff, freetype, fontconfig, expat, libxml
3. Gnustep: base, corebase, opal, QuartzCore
4. CoreText: gnustep-opal, glib ...
5. UIKit: Chameleon

## 逆向工程 从Obj-C到Swift
X86_64调用约定 rdi, rsi, rdx, rcx, r8, r9
			  rax, rdx, rax == rdi

O-C调用约定   rdi-> self rsi-> _cmd

sizeof(String) -> 24 -> StringCore
type lookup
swift-demangle
struct如果很小直接用寄存器返回

oc返回 rax
swift 返回 rax, rdx, rcx

protocol 

C/C++/OC/Swift
Assembly(x86, x86_64, arm/thumb, arm64)
平台ABI／ 语言特定ABI
编译器优化
操作系统

hopper IDA otool class-dump
lldb/gdb F-Script

Friday Q & A

github: hankBao

## 拥抱Swift 3.0与未来展望

1. Swift 3.0 大目标
- ABI稳定（应用二进制接口）：不稳定的ABI ＝＝ 不兼容的二进制包
使分发二进制的第三方库成为可能
iOS系统将内置Swift
生态圈
- 可移植性
完整支持Linus， 包管理

2. API和核心语言的完善
内置库API规范
与OC更好的兼容

Swift 2.2
#selector

Swift 3.0
#keyPath

3. Swift3.0标准库重命名
去OC化
简单和通用化
参数化

4. Swift3.0废除IUO
ImplicityUnwrappedOptional

IUO从类型（Type）变为属性（Attribute）

5. 其他变化
github：apple／swift-evolution

6. Swift3.0生态圈
Swifton, zewo, perfect.org
Swift Sandbox, Swift Package Catalog, Kitura

## Swift语言设计取舍及跨语言调用
1. GC与ARC
标记删除型的GC，Java为代表
ARC: 引用计数

GC:优势，内存清理彻底。劣势，世界停止问题，非内存资源管理
ARC：优势， 明确指导何时回收，可以管理内存资源。 劣势， 循环引用（解决方案，weak字段，只观察不持有）
python 引用计数 ＋ 标记删除

2. 值语义与引用语义
值语义 struct
引用语义 class，OC， JAVA
值语义： 降低心智负担，多线程友好，通过协议实现异构数组。 缺点， 没有deinit（struct不能管理文件句柄），可用defer进行操作
尽量食用struct！！！

3. 面向对象中的继承
预先假设
李氏替换原则 
逆变与协变

4. 跨语言调用
－ C
－ C++
－ 其他任何语言

## 从数学函数角度理解函数式编程
高阶函数
闭包（全局函数，嵌套函数，匿名函数（lambda））
柯里化
函数式编程：函数是一等公民，无副作用， 所有都是表达式（没有for，while控制状态）， 用函数组合表达一连串逻辑（链式调用）
lambda－calculus & Y-combinator
Swift & FP: 1. 函数是一等公民 2. Optional类型
Monads
optional，optional Binding, Optional Chaining
OC: NULL, nil, NSNull, swift: nil
optional 是monad 也是 enum

## Swift 设计模式
大侠 中国风风格 一本秘籍
码农 到 架构师 的蜕变
六大原则：                     				Swift
1. 开闭原则：多扩展少修改     				继承，组合，扩展
2. 单一原则								MVC －> MVVM
3. 里氏替换
4. 依赖倒置								POP
5. 接口隔离
6. 迪米特法则

三路武功：
创建类
结构类
行为类

二十三式：

单例模式：通知中心等，dispatch_once
工厂模式
建造者模式
原型模式

适配器模式
桥梁模式
外观模式：高层统一接口
享元模式：dequeTableViewCell
代理模式：下载图片时候先放一个缩略图

责任链模式
命令模式
解释器模式：正则，autolayout
迭代器模式：过气，做入语言 forin
中介者模式
备忘录模式
观察者模式：Notification，KVO
状态模式
模版方法模式： Mantle，SwiftyJSON
访问者模式

两大奥义
MVC －> C臃肿 －> MVVM
delegate是委托模式不是代理模式

＃redux in swift
playground也能做slides？
大中枢派发 gcd

iOS架构
MVC
MVP； From C#
MVVM
VIPER

Redux：
state： Application Data
action： predefined behaviour
reducer： state， action －> state（Pure Function）
store: reducer & state container

Distribution: OK  Testable: Great EasyToUse: Good

Pros and Cons
Statically Typed swift
Need to Provide initial State
One Unified Store
Relatively new in iOS

Kens
Animation & Navigation
Sometimes Fighting Against the Frameworks
Possible Performance Impact
Lack of Virtual DOM from React

怎么做异步？ dispatch接受一个同步的dispatch（半个action）
可以与RxSwift协同使用
 
## Swift异步编程
Apple的方案
GCD: low level C API, 很简单 －> callback hell（不可读，难维护，同步难）
NSOperation & NSOperationQueue： 依赖， 状态监控， 控制

难点：
同步难
错误处理难
状态管理难

completionHandler －> Result

第三方方案：
Futures／Promises
Reactive：RxSwift ReactiveCocoa Bond ...

Demo：传统，Reactive

近未来：描述性语言编程
asyn-await

## 理解Monad
如何成为iOS大V? 引爆点  1. 技术扎实 2. 传播技巧：关键人物法则 3. 环境威力法则

基础知识：
数组的map， flatMap（两个重载）
optional的map， flatMap
类型转换

Monad：链式调用的编程范式
链式调用解决深层次嵌套
编程范式是一种更General的设计模式

封装的数据： 数组，Optional，Result，Promise
封装的数据不能自动计算

map: 自动解包，计算之后再自动封装

计算之后的封装不能做到自动；多重Optional，let if判断失效

计算之后不自动封装的模式，就是monad
flatMap就是一种monad

Monad －> flatMap， Functor -> map

函数是一等公民 －> Applicative  apply

例子：ReactiveCocoa， SingalType
	Promise

## 如何解析浮点数
SwiftyJSON作者 又是Playground
have FUN
parser：有限状态机FSM

运算符重载
pure return／unit
>>-  flapMap
<^> map
<*> apply

Patterns!
map pattern
applicative pattern

parseFloat -> parseJSON

github.con/linger/SwiftyCharms

Monadic programming pattern: abstract state monads
Combinator programming pattern
combinded With operators

Building yuor own DSL -> ruby／ 元编程／ JSPatch，Runtime Swift不可用, 移动端动态特性
Since FSM is every thing. These pattern can be used in a lot of places

## 圆桌会议
如何学习Swift
官方文档，learn by working，github，分享型
关于分享
分享收获最大的是分享者本人