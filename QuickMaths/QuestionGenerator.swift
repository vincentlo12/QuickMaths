//
//  QuestionGenerator.swift
//  QuickMaths
//
//  Created by User on 6/17/21.
//

import Foundation
import UIKit
//questiongenerator.generate()
class QuestionGenerator {
    var instructionTxt: String = ""
    var answer: String = ""
    var instructions = false
    let superscriptDigits = ["⁰","¹","²","³","⁴","⁵","⁶","⁷","⁸","⁹"]
    let subscriptDigits = ["₀", "₁", "₂", "₃", "₄", "₅", "₆", "₇", "₈", "₉"]
    var problem: NSMutableAttributedString?
    func generate() {
        let a = Int.random(in: 0...9) 
        //print(a)
        switch a {
            case 0: //11
                instructions = false
                let s = Int.random(in: 10...99)
                problem = NSMutableAttributedString(string: "\(s)*11 =")
                answer = String(s*11)
            case 1: //101
                instructions = false
                let b = Int.random(in: 1...2)
                if b == 1 {
                    let a = Int.random(in: 10...99)
                    problem = NSMutableAttributedString (string: "\(a) x 101 = ")
                    answer = String(a*101)
                }
                else {
                    let a = Int.random(in: 100...999)
                    problem = NSMutableAttributedString( string: "\(a) x 1001 = ")
                    answer = String(a*1001)
                }
            case 2: //units digits add up to 10
                instructions = false
                let a = Int.random(in: 5...9)
                let d = 10 - a
                let b = Int.random(in: 1...15)
                problem = NSMutableAttributedString(string: "\(b)\(a) x \(b)\(d) =")
                answer = String((10*b+a)*(10*b+d))
            case 3: //repeating decimal
                instructions = true
                instructionTxt = "Please provide a simplified fraction."
                let a = Int.random(in: 1...500)
                
                var ans = ""
                if (a < 10){
                    let str1 = makeBar(a: a)
                    problem = NSMutableAttributedString(string: "0.\(a)\(a)...")
                    ans = simplifyFraction2(a: a, b: 9)
                }
                else if (a >= 10 && a <= 99)
                {
                    let str1 = makeBar(a: a%10)
                    let str2 = makeBar(a: a/10)
                    problem = NSMutableAttributedString(string: "0.\(a)\(a)...")
                    ans = simplifyFraction2(a: a, b: 99)
                }
                else{
                    let str1 = makeBar(a: (a%100)/10)
                    let str2 = makeBar(a: a%10)
                    let str3 = makeBar(a: a/100)
                    problem = NSMutableAttributedString(string: "0.\(a)\(a)...")
                    ans = simplifyFraction2(a: a, b: 999)
                }
                answer = String(ans)
            case 4: //ud of 5
                instructions = false
                let a = Int.random(in: 1...50)
                problem = NSMutableAttributedString(string: "\(a)5^2 = ")
                let number = 10*a+5
                let firstPart = squaringSubscript(number: number)
                let equal = NSMutableAttributedString(string: " = ")
                firstPart.append(equal)
                problem = firstPart
                answer = String((10*a+5)*(10*a+5))
            case 5: //divide
                instructions = true
                instructionTxt = "Type 1 for yes, 0 for no."
                let a = Int.random(in: 1...6)
                let b = Int.random(in: 11...999)
                problem = NSMutableAttributedString(string: "Is \(b) divisible by \(a)?")
                var ans = false
                if (b % a == 0)
                {
                    ans = true
                }
                if (ans)
                {
                    answer = "1"
                }
                else{
                    answer = "0"
                }
            case 6: //distributive
                instructions = false
                let choice = Int.random(in: 1...3)
                let c = Int.random(in: 1...50)
                if choice == 1 {
                    let a = Int.random(in: 1...100)
                    let b = 100-a
                    problem = NSMutableAttributedString(string: "\(c) x \(a) + \(c) x \(b) =")
                    answer = String(c*a+c*b)
                }
                else if choice == 2 {
                    let a = Int.random(in: 1...50)
                    let b = 50-a
                    problem = NSMutableAttributedString(string: "\(c) x \(a) + \(c) x \(b) =")
                    answer = String(c*a+c*b)
                }
                else {
                    let a = Int.random(in: 1...1000)
                    let b = 1000-a
                    problem = NSMutableAttributedString(string: "\(c) x \(a) + \(c) x \(b) =")
                    answer = String(c*a+c*b)
                }
            case 7://multiply by 9
                instructions = false
                let a = Int.random(in: 1...100)
                problem = NSMutableAttributedString(string: "\(a) x 9 =")
                answer = String(a*9)
            case 8:
                instructions = false
                let hundred_or_thousand = Int.random(in: 1...2) //1 stands for hundred, 2 stands for thousand
                if hundred_or_thousand == 1{
                    let a = Int.random(in: 51...99)
                    let b = 100-a
                    let firstPart = squaringSubscript(number: a)
                    let secondPart = squaringSubscript(number: b)
                    //print (firstPart)
                    let minus = NSMutableAttributedString(string: " - ")
                    let equal = NSMutableAttributedString(string: " = ")
                    firstPart.append(minus)
                    firstPart.append(secondPart)
                    firstPart.append(equal)
                    problem = firstPart
                }
                else{
                    let a = Int.random(in: 501...999)
                    let b = 1000-a
                    let firstPart = squaringSubscript(number: a)
                    let secondPart = squaringSubscript(number: b)
                    //print (firstPart)
                    let minus = NSMutableAttributedString(string: " - ")
                    let equal = NSMutableAttributedString(string: " = ")
                    firstPart.append(minus)
                    firstPart.append(secondPart)
                    firstPart.append(equal)
                    problem = firstPart
                    answer = String(a*a-b*b)
                }
            case 9:
                instructions = false
                let a = Int.random(in: 1...10)
                //let b = Int.random(in: 1...10)
                let c = Int.random(in: 2...10)
                //let f = Int.random(in: 2...10)
                let d = Int.random(in: 1...c - 1)
                let g: String = simplifyFraction(a: d, b: c)
                let h: String = simplifyFraction(a: c - d, b: c)
                //(vulgarFractionWithNumerator(numerator: 123, denominator: 45678))
                problem = NSMutableAttributedString(string: "\(a) \(g) x \(a) \(h) =")
                let improperfractionone = a*c+d
                let improperfractiontwo = a*c+c-d
                let product = improperfractiontwo * improperfractionone
                let quotient = product/(c*c)
                let remainder = product % (c*c)
                answer = "\(quotient) \(simplifyFraction2(a: remainder, b: c*c))"
            
                
            
            
                
            default:
                print("")
        }
    }
//    func makeBarOverLine(number: Int) -> String{
//        var character: Character = "6\u{0305}"
//        print(character)
//        var str5: String = "678\u{0305}"
//        print(str5)
//    }
    func makeBar(a: Int) -> String{
        var ans: String = "\(a)\u{0305}"
        return ans
    }
    func squaringSubscript(number: Int) -> NSMutableAttributedString {
        let numberString = "\(number)"
        //var c = "\(a)\()"
        var c = "\(number)2"
        let font:UIFont? = UIFont(name: "Helvetica", size:37)//location:8,length:2
        let fontSuper:UIFont? = UIFont(name: "Helvetica", size:20)//"6.022*1023"
        let attString:NSMutableAttributedString = NSMutableAttributedString(string: c, attributes: [.font:font!])
        attString.setAttributes([.font:fontSuper!,.baselineOffset:15], range: NSRange(location: numberString.count, length: c.count-numberString.count))
        return attString
//        self.questionLbl.attributedText = attString

    }
    
    func vulgarFractionWithNumerator(numerator: Int, denominator: Int) -> String {
        let zeroBias = UnicodeScalar("0").value
        let supers = "\(numerator)".unicodeScalars.map { superscriptDigits[Int($0.value - zeroBias)] }
        let subs = "\(denominator)".unicodeScalars.map { subscriptDigits[Int($0.value - zeroBias)] }
        let arr = supers + [ "⁄" ] + subs
        return arr.joined()
    }
    
    func simplifyFraction(a: Int, b: Int) -> String{
        let numerator = a/gcd(a: a, b: b)
        let denominator = b/gcd(a: a, b: b)
        return vulgarFractionWithNumerator(numerator: numerator, denominator: denominator)
    }
    
    func gcd(a: Int, b: Int) -> Int {
        let remainder = abs(a) % abs(b)
        if remainder != 0 {
            return gcd(a: abs(b), b: remainder)
        } else {
            return abs(b)
        }
    }
    func lcm(a: Int, b: Int) -> Int{
        return a*b/gcd(a: a, b: b)
    }
    func simplifyFraction2(a: Int, b: Int) -> String {
        let numerator = a/gcd(a: a, b: b)
        let denominator = b/gcd(a: a, b: b)
        return "\(numerator)/\(denominator)"
    }
}
