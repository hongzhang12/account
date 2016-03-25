//
//  main.swift
//  HelloWorld
//
//  Created by zhanghong on 16/3/16.
//  Copyright © 2016年 zhanghong. All rights reserved.
//

import Foundation
//变量和常量
//var a = 1
//a = 10
//let b = 2
//
//print(a)
//print(b)


// 可以自动推断类型
//var name:String = "zhanghong"
//
//print(name)


// 字符串连接
//var firstName:String = "zhang"
//var lastName:String = "hong"
//
//var name = firstName + "," + lastName
////var name = "\(firstName),\(lastName)"

//print(name)

// 数组
//var array = ["zhang" ,"hong" ,123 ,2.1]
//
//print(array)
//
//var arr1 = []
//var arrString = [String]()


// 字典
//var dictionary = ["firstName":"zhang","lastName":"hong"]
//
//dictionary["age"] = "23"
//
//print(dictionary)
//print(dictionary["age"])


// 循环
//var array = [String]()
//
//for var i = 0; i<5; ++i{
//    
//    array.append("arr\(i)")
//}
//
//print(array)
//
//for value in array{
//    
//    print(value)
//}
//
//var i = 0
//
//while i<array.count{
//    
//    print(array[i])
//    
//    i++
//}
//
//var dict = ["name":"zhanghong","age":"23"]
//
//for(key ,value) in dict{
//    
//    print("\(key):\(value)")
//}


// if 语句
//var name:String = "zhanghong"
//
//if name == "zhanghong"{
// 
//    print("\(name)")
//}


// 函数

//func printName(name:String){
//    
//    print(name)
//}
//
//printName("zhanghong")
//
//// 返回多个值
//
//func getNameAndAge()->(String ,Int){
//    
//    return ("zhanghong" ,23)
//}
//
//let (name ,age) = getNameAndAge()
//
//print("\(name)---\(age)")
//
//print("Hello, World!")


// 类

//class Animal {
//    
//    var _name:String
//    
//    init(name:String){
//        
//        self._name = name
//    }
//    
//    func printName(){
//        
//        print(self._name)
//    }
//}
//
//var animal = Animal(name:"猪")
//
//animal.printName()
//
//class Dog: Animal {
//    
//    var _age:Int = 0
//    
//    init(name: String ,age: Int) {
//        
//        super.init(name: name)
//        self._age = age
//    }
//    
//    func returnNameAndAge()->(String ,Int){
//        
//        return (self._name ,self._age)
//    }
//}
//
//
//var dog = Dog(name: "Tom", age: 3)
//var (dogName ,dogAge) = dog.returnNameAndAge()
//
//print("\(dogName)===\(dogAge)")


// 取类型别名和类型强制转换

//typealias aaa = Int
//var xxx:aaa = 1;
//xxx = aaa(1.4)


// 元组

//var coder = (name:"zhanghong" ,age:23)
//var name = coder.name
//print("\(name)====\(coder.age)")
//
//var (a ,b ,c) = (1 ,2 ,3)
//print("\(a)-\(b)-\(c)")
//
//(a ,b ,c) = (c ,a ,b)
//print("\(a)-\(b)-\(c)")


// optional可选类型
//var name:String?
//name = "zhanghong"
//print(name)
//
//if name == "zhang" {
//    
//    print("已经输入名字")
//}else{
//    
//    print("没有输入名字")
//}
//
//
//var age:Int? = 23
//
//if let age = age ,name = name where age == 23 && name == "zhanghong"{
//    
//    print("age=\(age)-----name=\(name)")
//}else{
//    
//    print("输入信息不全")
//}
//
//var phoneNumber:String!
//// 可选类型可以为nil,不可选类型不可以为nil
//
//// 断言
//
//var isMorning = true
//
//assert(isMorning, "sds")
//
//var dd:String!
//dd = "zhanghh"
//print(dd)



var array1 = Array<String>()
var array2 = Array<String>(count: 10, repeatedValue: "zz")
var array3 = [String](count: 100, repeatedValue: "xx")
var array4 = Array(1...100)
var array5 = ["111" ,"222" ,"333" ,"444" ,"555" ,"666" ,"777"]

print(array5.count)

var dic1 = Dictionary<String ,String>()
var dic2 = [String :String]()
dic2 = ["xx" :"1" ,"ssd" :"2"]
dic2["ww"] = "3"
dic2["ww"] = "4"
print(dic2["ww"])


func add(name:String = "张洪",age:Int...) -> (Int ,String){
    
    return (5 ,"ssss")
}




