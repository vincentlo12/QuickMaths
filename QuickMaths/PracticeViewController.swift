//
//  PracticeViewController.swift
//  QuickMaths
//
//  Created by User on 6/7/21.
//
//Ask Malika about repeating decimals case and mixed numbers
//Don't allow letters to be accepted
//Make everything have equal sign and space in front
import UIKit
import AVFoundation
import AVKit

class PracticeViewController: UIViewController {
    var answer: String = ""
    var player = AVAudioPlayer()
    let superscriptDigits = ["⁰","¹","²","³","⁴","⁵","⁶","⁷","⁸","⁹"]
    let subscriptDigits = ["₀", "₁", "₂", "₃", "₄", "₅", "₆", "₇", "₈", "₉"]
    @IBOutlet weak var questionLbl: UILabel!
    @IBOutlet weak var instructionsLbl: UILabel!
    @IBOutlet weak var answerInputBox: UITextField!
    @IBOutlet weak var resultLbl: UILabel!
    var typeofProblem: String = ""
    
    @IBAction func nextQuestionButtonTpd(_ sender: UIButton) {
        instructionsLbl.isHidden = true
        answerInputBox.isEnabled = true
        if answerInputBox.text != "" {
            resultLbl.isHidden = true
            answerInputBox.text = ""
            let a = Int.random(in: 10...99)

            if typeofProblem == "Multiply by 11" {
                
                self.questionLbl.text = "\(a) x 11 ="
                answer = String(a*11)
            }
            else if typeofProblem == "Difference of squares" {
                let hundred_or_thousand = Int.random(in: 1...2) //1 stands for hundred, 2 stands for thousand
                if hundred_or_thousand == 1{
                    let a = Int.random(in: 51...99)
                    let b = 100-a
                    let firstPart = squaringSubscript(number: a)
                    let secondPart = squaringSubscript(number: b)
                    //print (firstPart)
                    self.questionLbl.text = "\(a)^2 - \(b)^2 ="
                    let minus = NSMutableAttributedString(string: " - ")
                    let equal = NSMutableAttributedString(string: " = ")
                    firstPart.append(minus)
                    firstPart.append(secondPart)
                    firstPart.append(equal)
                    self.questionLbl.attributedText = firstPart
                    answer = String(a*a-b*b)
                }
                else{
                    let a = Int.random(in: 501...999)
                    let b = 1000-a
                    let firstPart = squaringSubscript(number: a)
                    let secondPart = squaringSubscript(number: b)
                    //print (firstPart)
                    self.questionLbl.text = "\(a)^2 - \(b)^2 ="
                    let minus = NSMutableAttributedString(string: " - ")
                    let equal = NSMutableAttributedString(string: " = ")
                    firstPart.append(minus)
                    firstPart.append(secondPart)
                    firstPart.append(equal)
                    self.questionLbl.attributedText = firstPart
                    
                    //self.questionLbl.text = "\(a)^2 - \(b)^2="
                    answer = String(a*a-b*b)
                }
            }
            else if typeofProblem == "Unitsdigitof5" {
                let a = Int.random(in: 1...50)
                self.questionLbl.text = "\(a)5^2"
                let number = 10*a+5
                let firstPart = squaringSubscript(number: number)
                let equal = NSMutableAttributedString(string: " = ")
                firstPart.append(equal)
                self.questionLbl.attributedText = firstPart
                answer = String((10*a+5)*(10*a+5))
            }
            else if typeofProblem == "Multiplyby101" {
                let b = Int.random(in: 1...2)
                if b == 1 {
                    let a = Int.random(in: 10...99)
                    self.questionLbl.text = "\(a) x 101 = "
                    answer = String(a*101)
                }
                else {
                    let a = Int.random(in: 100...999)
                    self.questionLbl.text = "\(a) x 1001 = "
                    answer = String(a*1001)
                }
            }
            else if typeofProblem == "Sumto10" {
                let a = Int.random(in: 5...9)
                let d = 10 - a
                let b = Int.random(in: 1...15)
                self.questionLbl.text = "\(b)\(a) x \(b)\(d) ="
                answer = String((10*b+a)*(10*b+d))
            }
            else if typeofProblem == "mixedNumbers" {
                let a = Int.random(in: 1...10)
                //let b = Int.random(in: 1...10)
                let c = Int.random(in: 2...10)
                //let f = Int.random(in: 2...10)
                let d = Int.random(in: 1...c - 1)
                let g: String = simplifyFraction(a: d, b: c)
                let h: String = simplifyFraction(a: c - d, b: c)
                //(vulgarFractionWithNumerator(numerator: 123, denominator: 45678))
                self.questionLbl.attributedText = NSMutableAttributedString(string: "\(a) \(g) x \(a) \(h) =")
                let improperfractionone = a*c+d
                let improperfractiontwo = a*c+c-d
                let product = improperfractiontwo * improperfractionone
                let quotient = product/(c*c)
                let remainder = product % (c*c)
                answer = "\(quotient) \(simplifyFraction2(a: remainder, b: c*c))"
            }
            else if typeofProblem == "multiplyby9" {
                let a = Int.random(in: 1...100)
                self.questionLbl.attributedText = NSMutableAttributedString(string: "\(a) x 9 =")
                answer = String(a*9)
            }
            else if typeofProblem == "distribute" {
                let choice = Int.random(in: 1...3)
                let c = Int.random(in: 1...50)
                if choice == 1 {
                    let a = Int.random(in: 1...100)
                    let b = 100-a
                    self.questionLbl.attributedText = NSMutableAttributedString(string: "\(c) x \(a) + \(c) x \(b) =")
                    answer = String(c*a+c*b)
                }
                else if choice == 2 {
                    let a = Int.random(in: 1...50)
                    let b = 50-a
                    self.questionLbl.attributedText = NSMutableAttributedString(string: "\(c) x \(a) + \(c) x \(b) =")
                    answer = String(c*a+c*b)
                }
                else {
                    let a = Int.random(in: 1...1000)
                    let b = 1000-a
                    self.questionLbl.attributedText = NSMutableAttributedString(string: "\(c) x \(a) + \(c) x \(b) =")
                    answer = String(c*a+c*b)
                }
            }
            else if typeofProblem == "divide" {
                instructionsLbl.isHidden = false
                let a = Int.random(in: 1...6)
                let b = Int.random(in: 11...999)
                self.questionLbl.attributedText = NSMutableAttributedString(string: "Is \(b) divisible by \(a)?")
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
                
            }
            else if typeofProblem == "decimal" {
                self.instructionsLbl.isHidden = false
                self.instructionsLbl.text = "Please provide a simplified fraction."
                let a = Int.random(in: 1...500)
                
                var ans = ""
                if (a < 10){
                    let str1 = makeBar(a: a)
                    self.questionLbl.attributedText = NSMutableAttributedString(string: "0.\(a)\(a)...")
                    ans = simplifyFraction2(a: a, b: 9)
                }
                else if (a >= 10 && a <= 99)
                {
                    let str1 = makeBar(a: a%10)
                    let str2 = makeBar(a: a/10)
                    self.questionLbl.attributedText = NSMutableAttributedString(string: "0.\(a)\(a)...")
                    ans = simplifyFraction2(a: a, b: 99)
                }
                else{
                    let str1 = makeBar(a: (a%100)/10)
                    let str2 = makeBar(a: a%10)
                    let str3 = makeBar(a: a/100)
                    self.questionLbl.attributedText = NSMutableAttributedString(string: "0.\(a)\(a)...")
                    ans = simplifyFraction2(a: a, b: 999)
                }
                answer = String(ans)
            }
        }
        else {
            answerInputBox.placeholder = "Please type something."
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        instructionsLbl.isHidden = true
        resultLbl.isHidden = true
        answerInputBox.delegate = self
        answerInputBox.keyboardType = .numbersAndPunctuation
        //print (typeofProblem)
        if typeofProblem == "Multiply by 11" {
            let a = Int.random(in: 10...99)
            self.questionLbl.text = "\(a) x 11 ="
            answer = String(a*11)
        }
        
        else if typeofProblem == "Difference of squares" {
            let hundred_or_thousand = Int.random(in: 1...2) //1 stands for hundred, 2 stands for thousand
            if hundred_or_thousand == 1{
                let a = Int.random(in: 51...99)
                let b = 100-a
                let firstPart = squaringSubscript(number: a)
                let secondPart = squaringSubscript(number: b)
                //print (firstPart)
                self.questionLbl.text = "\(a)^2 - \(b)^2="
                let minus = NSMutableAttributedString(string: " - ")
                let equal = NSMutableAttributedString(string: " = ")
                firstPart.append(minus)
                firstPart.append(secondPart)
                firstPart.append(equal)
                self.questionLbl.attributedText = firstPart
//                let minus:NSMutableAttributedString = handleHtml(-)
//                let equal:NSMutableAttributedString = NSMutableAttributedString(string: " = ")
//                let string_1 : NSAttributedString = self.questionLbl.attributedText
//                let string_2 : NSAttributedString = handleHtml(i) // a function that returns a NSAttributedString
//                let tmpStr : NSMutableAttributedString = string_1.mutableCopy()
//                tmpStr.appendAttributedString(string_2)
//                let finalStr : NSAttributedString = tmpStr.copy()
//                self.questionLbl.attributedText = firstPart.append(minus)//secondPart + equal
                answer = String(a*a-b*b)
            }
            else{
                let a = Int.random(in: 501...999)
                let b = 1000-a
                let firstPart = squaringSubscript(number: a)
                let secondPart = squaringSubscript(number: b)
                //print (firstPart)
                self.questionLbl.text = "\(a)^2 - \(b)^2 = "
                let minus = NSMutableAttributedString(string: " - ")
                let equal = NSMutableAttributedString(string: " = ")
                firstPart.append(minus)
                firstPart.append(secondPart)
                firstPart.append(equal)
                self.questionLbl.attributedText = firstPart
                answer = String(a*a-b*b)
            }
        }
        else if typeofProblem == "Unitsdigitof5" {
            let a = Int.random(in: 1...50)
            self.questionLbl.text = "\(a)5^2 = "
            let number = 10*a+5
            let firstPart = squaringSubscript(number: number)
            let equal = NSMutableAttributedString(string: " = ")
            firstPart.append(equal)
            self.questionLbl.attributedText = firstPart
            answer = String((10*a+5)*(10*a+5))
        }
        else if typeofProblem == "Multiplyby101" {
            
            let b = Int.random(in: 1...2)
            if b == 1 {
                let a = Int.random(in: 10...99)
                self.questionLbl.text = "\(a) x 101 = "
                answer = String(a*101)
            }
            else {
                let a = Int.random(in: 100...999)
                self.questionLbl.text = "\(a) x 1001 = "
                answer = String(a*1001)
            }
            
        }
        else if typeofProblem == "Sumto10" {
            let a = Int.random(in: 5...9)
            let d = 10 - a
            let b = Int.random(in: 1...15)
            //let c = Int.random(in: 1...b)
            self.questionLbl.text = "\(b)\(a) x \(b)\(d) ="
            answer = String((10*b+a)*(10*b+d))
        }
        else if typeofProblem == "mixedNumbers" {
            let a = Int.random(in: 1...10)
            //let b = Int.random(in: 1...10)
            let c = Int.random(in: 2...10)
            //let f = Int.random(in: 2...10)
            let d = Int.random(in: 1...c - 1)
            let g: String = simplifyFraction(a: d, b: c)
            let h: String = simplifyFraction(a: c - d, b: c)
            //(vulgarFractionWithNumerator(numerator: 123, denominator: 45678))
            self.questionLbl.attributedText = NSMutableAttributedString(string: "\(a) \(g) x \(a) \(h) =")
            let improperfractionone = a*c+d
            let improperfractiontwo = a*c+c-d
            let product = improperfractiontwo * improperfractionone
            let quotient = product/(c*c)
            let remainder = product % (c*c)
            answer = "\(quotient) \(simplifyFraction(a: remainder, b: c*c))"
        }
        else if typeofProblem == "multiplyby9" {
            let a = Int.random(in: 1...100)
            self.questionLbl.attributedText = NSMutableAttributedString(string: "\(a) x 9 =")
            answer = String(a*9)
            
        }
        else if typeofProblem == "distribute" {
            let choice = Int.random(in: 1...3)
            let c = Int.random(in: 1...50)
            if choice == 1 {
                let a = Int.random(in: 1...100)
                let b = 100-a
                self.questionLbl.attributedText = NSMutableAttributedString(string: "\(c) x \(a) + \(c) x \(b) =")
                answer = String(c*a+c*b)
            }
            else if choice == 2 {
                let a = Int.random(in: 1...50)
                let b = 50-a
                self.questionLbl.attributedText = NSMutableAttributedString(string: "\(c) x \(a) + \(c) x \(b) =")
                answer = String(c*a+c*b)
            }
            else {
                let a = Int.random(in: 1...1000)
                let b = 1000-a
                self.questionLbl.attributedText = NSMutableAttributedString(string: "\(c) x \(a) + \(c) x \(b) =")
                answer = String(c*a+c*b)
            }
        }
        else if typeofProblem == "divide" {
            instructionsLbl.isHidden = false
            let a = Int.random(in: 1...6)
            let b = Int.random(in: 11...999)
            self.questionLbl.attributedText = NSMutableAttributedString(string: "Is \(b) divisible by \(a)?")
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
            
        }
        else if typeofProblem == "decimal" {
            self.instructionsLbl.isHidden = false
            self.instructionsLbl.text = "Please provide a simplified fraction."
            let a = Int.random(in: 1...500)
            
            var ans = ""
            if (a < 10){
                let str1 = makeBar(a: a)
                self.questionLbl.attributedText = NSMutableAttributedString(string: "0.\(a)\(a)...")
                ans = simplifyFraction2(a: a, b: 9)
            }
            else if (a >= 10 && a <= 99)
            {
                let str1 = makeBar(a: a%10)
                let str2 = makeBar(a: a/10)
                self.questionLbl.attributedText = NSMutableAttributedString(string: "0.\(a)\(a)...")
                ans = simplifyFraction2(a: a, b: 99)
            }
            else{
                let str1 = makeBar(a: (a%100)/10)
                let str2 = makeBar(a: a%10)
                let str3 = makeBar(a: a/100)
                self.questionLbl.attributedText = NSMutableAttributedString(string: "0.\(a)\(a)...")
                ans = simplifyFraction2(a: a, b: 999)
            }
            answer = String(ans)
        }
    }
    
    func vulgarFractionWithNumerator(numerator: Int, denominator: Int) -> String {
        let zeroBias = UnicodeScalar("0").value
        let supers = "\(numerator)".unicodeScalars.map { superscriptDigits[Int($0.value - zeroBias)] }
        let subs = "\(denominator)".unicodeScalars.map { subscriptDigits[Int($0.value - zeroBias)] }
        let arr = supers + [ "⁄" ] + subs
        return arr.joined()
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
    
    func simplifyFraction(a: Int, b: Int) -> String{
        let numerator = a/gcd(a: a, b: b)
        let denominator = b/gcd(a: a, b: b)
        return vulgarFractionWithNumerator(numerator: numerator, denominator: denominator)
    }
    func simplifyFraction2(a: Int, b: Int) -> String {
        let numerator = a/gcd(a: a, b: b)
        let denominator = b/gcd(a: a, b: b)
        return "\(numerator)/\(denominator)"
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
    func playvideo (name: String){
        let path = Bundle.main.path(forResource: name, ofType: "wav")
        let url = URL(fileURLWithPath: path!)
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player.play()
        }catch{}
    }
    func playsound (name: String){
        let path = Bundle.main.path(forResource: name, ofType: "mp3")
        let url = URL(fileURLWithPath: path!)
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player.play()
        }catch{}
    }
    func makeBar(a: Int) -> String{
        var ans: String = "\(a)\u{0305}"
        return ans
    }

}
extension PracticeViewController: UITextFieldDelegate{
    public func textFieldShouldReturn(_ textView: UITextField) -> Bool {
        
        textView.resignFirstResponder()
        let trimmedString = answerInputBox.text!.trimmingCharacters(in: .whitespaces)
        let answerString = answer.trimmingCharacters(in: .whitespaces)
        if answerInputBox.text == "" {
            answerInputBox.placeholder = "Please type something."
            return true
        }
        if let _ = answerInputBox.text!.rangeOfCharacter(from: NSCharacterSet.decimalDigits) {
            //print ("valid")
            self.resultLbl.isHidden = false
            if trimmedString == answerString {
                self.resultLbl.text = "Congrats, you got it right!"
                playvideo(name: "cheers1")
            }
            else {
                self.resultLbl.text = "Incorrect, the answer was \(answer)"
                playsound(name: "wonwon")
            }
            answerInputBox.isEnabled = false
        } else {
            self.answerInputBox.text = ""
            answerInputBox.placeholder = "Please type a number."
        }
        
        return true
    }
    
}
