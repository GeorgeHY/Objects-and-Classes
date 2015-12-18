//
//  main.swift
//  ObjectsAndClasses
//
//  Created by GE on 15/12/16.
//  Copyright © 2015年 GE. All rights reserved.
//

import Foundation

//class Shape {
//    var numberOfSides = 0
//    let borderWidth = 1
//    func simpleDescription() -> String
//    {
//        return "A shape with \(numberOfSides) sides."
//    }
//    func getParam(borderColor:String) -> String
//    {
//        return "参数值为\(borderColor)"
//    }
//    
//}
//
//
//var shape = Shape()
//shape.numberOfSides = 7
//var shapeDesc = shape.simpleDescription()
//print(shapeDesc)

class NameShape {
    var
    numberOfSides: Int = 0
    var name : String
    
    init(name: String){
        self.name = name;
    }
    
    func simpleDescription() -> String
    {
        return "A shape with \(numberOfSides) sides."
    }
}

class Square: NameShape {
    var sideLength: Double
    
    init(name: String, sideLength: Double) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double
    {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}

let test =  Square(name: "my test square", sideLength: 5.2)


//print(test.area())
//print(test.simpleDescription())

//class Circle: NameShape {
//    var radius : Double
//    
//    init(name: String, radius: Double) {
//        self.radius = radius
//        super.init(name: name)
//        
//    }
//    
//    func area() -> Double
//    {
//        return 3.14 * radius * radius
//    }
//    
//    override func simpleDescription() -> String {
//        return " 这是一个半径为 \(radius) 的圆"
//    }
//}
//
//let test = Circle(name:"测试圆", radius: 2)
//print(test.area())
//print(test.simpleDescription())

class EquilateralTriangle: NameShape {
    var sideLength: Double = 0.0
    
    init(name: String, sideLength: Double) {
        /**
            1.设置子类声明的属性值
            2.调用父类的构造器
            3.改变父类定义的属性值。其他的工作比如调用方法、getters和setters也可以在这个阶段完成。
        */
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter : Double
    {
        get{
            return 3.0 * sideLength
        }
        set{
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triagle with sides of length \(sideLength)."
    }
}

var triangle = EquilateralTriangle(name: "三角形", sideLength: 3.1)
//print(triangle.perimeter)
//triangle.perimeter = 9.9
//print(triangle.sideLength)


class TriangleAndSquare {
    var triangle: EquilateralTriangle
        {
        willSet
        {
            square.sideLength = newValue.sideLength
        }
    }
    
    var square:Square
        {
        willSet
        {
            triangle.sideLength = newValue.sideLength
        }
    }
    
    init(size: Double, name: String)
    {
        square = Square(name: name, sideLength: size)
        triangle = EquilateralTriangle(name: name, sideLength: size)
    }
}

var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(name: "large square", sideLength: 50)
print(triangleAndSquare.triangle.sideLength)

/**
    处理变量的可选值时，你可以在操作（比如方法、属性和子脚本）之前加?。如果?之前的值是nil，?后面的东西都会被忽略，并且整个表达式返回nil。否则，?之后的东西都会被运行。在这两种情况下，整个表达式的值也是一个可选值。
*/


let optionalSquare: Square? = nil
let sideLength = optionalSquare?.sideLength
print(sideLength)
