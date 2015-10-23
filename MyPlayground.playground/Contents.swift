//: Playground - noun: a place where people can play

import UIKit
var str = "Hello, playground"
var a = "woshibianliang "
var b = "wosh"
let letInteger : int_fast32_t = 70;
let letDouble : Double = 70.0;
let letString: NSString = "helloswift"
let myString = "myInt is";
let myInt = 94
let myString2 = myString + String(myInt)

var array = ["one", "two", "three", "four"]
var getTwo = array[1]
//6.数据字典创建与调用
var dictionary = ["oneName":"I am one value","twoName":"I am two value"]
var getTowValue = dictionary["twoName"]


//7.for语句
for item in array
{
    var i = item;
    print(i);
}

//8.函数
func getUserName(loginName:String)->String
{
    return "Lily";
}
//9.枚举
enum Week {
    case 星期一
    case 星期二
    case 星期三
    case 星期四
    case 星期五
    case 星期六
    case 星期天
}

//10.Switch语句
var today="星期三"
switch today
    {
        case "星期一":
        print("今天是星期一");
        case "星期二":
        print("今天是星期二");
        default:
        print("不知道今天星期几");
}

let possibleNumber = "123"
let convertedNumber : Int? = Int(possibleNumber)

if (convertedNumber != nil) {
    print("\(possibleNumber) has an integer value  of \(convertedNumber!)")
} else {
    print("\(possibleNumber) could not be converted to an integer")
}

if let actualNumber = Int(possibleNumber) {
    print("\(possibleNumber) has an integer value")
} else {
    print("FUck out")
}


