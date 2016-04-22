//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
let constant:Float = 23.1
let constant1 = 22 // 自动推断类型
let constant2:Int = Int(234.344) // 强制转换类型
let str1:String = "\(constant)"

var hobbyArr = ["Dota" ,"Bike" ,"Music" ,12] // 可以在数组中放入不同的数据类型
hobbyArr[3]


var dotaerDic = ["name":"zhanghong" ,"age":23 ,"level":"familiar"]
dotaerDic["name"]

// 创建空数组和字典
var hobbyArr1 = [String]()
var dotaerdic = [String:String]()

for var hobby in hobbyArr{
  
    if hobby == 12{
        
        print(hobby)
    }
}


for (key ,value) in dotaerDic{
    
    print("key:" ,key ,"value:" ,value)
}

for i in 1...5{
    
    print(i)
}

for var i in 1..<5{
    
    print(i)
}

// 利用可选变量做判断
var optionalStr:String? = "jsjsj"
print(optionalStr == nil)

if let str = optionalStr {
    
    print(str)
}

// 可选类型默认值,如果可选类型为nil,就可以指定一个默认值
var optionalName:String?
var defaultName = "zhanglijun"
var name = "\(optionalName ?? defaultName)"
print(optionalName ?? defaultName)

let age = "2123"

switch age {
    
case "10" :print("age is \(10)")
case "20" ,"30" : print("age is \(20) or \(30)")
case let a where a.hasSuffix("123") :print("age has suffix 123")
default: break
}

func average(scores:Float...) -> (max :Float ,min :Float ,average :Float){
    
    var max1:Float = 0.0;
    var min1:Float = 0.0;
    var average1:Float = 0.0;
    var sum:Float = 0.0;
    
    for score in scores{
        
        if score > max1 {
            
            max1 = score
        }
        
        if score < min1 {
            
            min1 = score
        }
        
        sum += score
    }
    
    average1 = sum/Float(scores.count)
    
    return (max1 ,min1 ,average1)
}

let result = average(16.3 ,33.3 ,55.1)

print(result)
// 函数可作为函数值和返回值



class Coder: NSObject {

    var _firstName:String = ""
    var _lastName:String = ""
    init(firstName:String = "" ,lastName:String = "") {
        
        _firstName = firstName
        _lastName = lastName
    }
    func fullName() -> String {
        
        return _firstName + _lastName
    }
    // 析构函数
    deinit{
        
        print("deinit")
    }
}

var zh:Coder = Coder()
zh._firstName = "zhang"
zh._lastName = "hong"

print(zh.fullName())


class Shape {
    
    var numberOfSides: Int = 0
    var name: String = ""
    init(name:String){
        
        self.name = name
    }
    
    func simpleDescription(){
        
        print("A shape with \(numberOfSides) sides")
    }
}

class Circle: Shape {
    
    var radius:Float = 0
    init(name:String ,radius:Float){
        
        // 不可以访问父类变量
        super.init(name: name)
        self.radius = radius
    }
    
    func area(){
        
        print(M_PI*Double(self.radius*self.radius))
    }
    
    override func simpleDescription(){
        
        print("circle has no sides")
    }
    
    var fullname:String{
        
        get{
            
            return self.name
        }
        
        set{
            
            self.name += newValue
        }
    }
}

var circle:Circle = Circle(name: "circle", radius: 20.0)
circle.radius = 1
circle.area()
circle.simpleDescription()

circle.fullname = "ss"
print(circle.fullname)



// 枚举

enum COLORS :Int{
    
    case GREEN ,BLUE ,RED ,YELLOW ,WHITE ,BLACK
    func isWhite(){
        
        if self == COLORS.WHITE{
            
            print("zhe color is white")
        }
    }
}

var color:COLORS = COLORS.WHITE
color.isWhite()


enum LEVEL {
    
    case LEVELMASTER
    case LEVELFAMILIAR
    case LEVELNEWHAND
}

enum CODER {
    
    case iOS (String ,Int ,LEVEL)
    case Android (String ,Int ,LEVEL)
    case PHP (String ,Int ,LEVEL)
}

let zhangHong = CODER.iOS("zhanghong", 23, LEVEL.LEVELFAMILIAR)

let xiangXiuHua = CODER.Android("xiangxiuhua", 25, LEVEL.LEVELFAMILIAR)

switch zhangHong{
    
case CODER.iOS: print("an iOS developer")
    
case CODER.Android(let name ,let age ,let level): print("an android developer" ,name ,age ,level)
    
default: break
}




protocol ExampleProtocol1{
    
    var name:String {get}
    
    // 标记可以修改协议属性的方法
    mutating func changeName()
}

protocol ExampleProtocol2{
    
    var age:Int {get}
    mutating func changeAge()
}


extension Double: ExampleProtocol1 ,ExampleProtocol2{
//    var simpleDescription: String = "A very simple class."
//
//    var anotherProperty: Int = 69105
//    func adjust() {
//        simpleDescription += "  Now 100% adjusted."
//    }
//    var name:String = "sdfsdfsd"
    var name:String{
        
        get{
            
            return self.name
        }
        
        set{
            
            self.name = newValue
        }
    }
    mutating func changeName() {
        
        self.name = "changeName"
    }
    
    // 添加mutating使方法可以修改协议属性
    mutating func cn(){
        
        self.name = "asada"
    }
    
    var age:Int{
        
        get{
            
            return self.age
        }
        
        set{
            
            self.age = newValue
        }
    }
    
    mutating func changeAge() {
        
        self.age = 23;
    }
}

// 类型别名
typealias dou = double_t
var ss:Bool = true

// bool 是类型安全的.普通Int类型不能取代bool的作用 ,编译会直接报错


// optional
let str11:String = "123"
var int = Int(str)

print(int)

// 可以对小数求🐟,oc不可以
-7.75%2.5

// 空合运算符,如果为空则返回默认值
// 和!强制解析相比,如果a11为空,就会返回默认值.
var a11:NSMutableString? = NSMutableString()
var b11:String = "default value"
var c11 = a11 ?? b11


b11.isEmpty

var a12:String? = "dsds"
var a13 = a12! + "fdsfds"

var arr:NSMutableArray = NSMutableArray()

for character in b11.characters{
    
    print(character)
}


var intArr1 = [Int]();
print("\(intArr1)");

intArr1.append(5);

var intArr2 = [Int]();
intArr2.append(22);

var intArr3 = intArr1 + intArr2;

var intArr4 = [1 ,2 ,"xxc"];
intArr4.append(3)

intArr4.isEmpty

intArr4.insert("zhang", atIndex: 2)


print(intArr4.count)
print(intArr4[1])


// 字典

var dict1 = NSMutableDictionary()
dict1["dd"] = "gg"


var yz = (2 ,3)

switch yz {
    
case (var x1 ,1...100) where x1 == 20: x1 = 20
    
default :break
}

print(yz)

if #available(iOS 9, *){
    
    
}


var name1 = "zahnghong"

func sayHello(inout name name:String ,var age1 age:Int = 23) -> (value1:String ,value2:String)?{
    
    name = "hong"
    if age < 20 {
        
        return nil
    }
    return ("hello \(name)" ,"age is \(age)")
}

if let relust = sayHello(name:&name1){
    
    print(relust.value1 + relust.value2)
}

print(name1)

// 函数类型
// 嵌套函数



let names = ["zhangliangrong" ,"lihemei" ,"zhanglirong" ,"zhanghong" ,"zhangyafeng"]

var names2 = names.sort (){ (s1, s2) -> Bool in // 尾随闭包
    
    return s1 < s2
}
print(names2)


















