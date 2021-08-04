//
//  TestViewController.swift
//  QuickMaths
//
//  Created by User on 6/16/21.


import UIKit

class TestViewController: UIViewController {
    var questionGenerator: QuestionGenerator = QuestionGenerator()
    //questionGenerator.generate()
    @IBOutlet weak var timerLbl: UILabel!
    @IBOutlet weak var questionLbl: UILabel!
    @IBOutlet weak var instructionsLbl: UILabel!
    @IBOutlet weak var answerInputBoxTextField: UITextField!
    var cnt = 0
    var timer: Timer?
    var prev = ""
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ScoreManager.scoreManager.saveData()
        var backbutton = UIButton(type: .custom)
        //backbutton.setImage(UIImage(named: "BackButton.png"), for: .normal) // Image can be downloaded from here below link
        backbutton.setTitle("Back", for: .normal)
        backbutton.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        backbutton.setTitleColor(backbutton.tintColor, for: .normal) // You can change the TitleColor
        backbutton.addTarget(self, action: "backPressed", for: .touchUpInside)
        //#selector(backPressed)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backbutton)
        
        questionGenerator.generate()
        answerInputBoxTextField.delegate = self
        answerInputBoxTextField.keyboardType = .numbersAndPunctuation
        if questionGenerator.instructions == true {
            instructionsLbl.isHidden = false
            self.instructionsLbl.text = questionGenerator.instructionTxt
        }
        else
        {
            instructionsLbl.isHidden = true
        }
        self.questionLbl.attributedText =  (questionGenerator.problem)
//        print (questionGenerator.answer)
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.cnt += 1
            if (self.cnt == 300){ //change later
                ScoreManager.scoreManager.score += [Double(self.score)]
                ScoreManager.scoreManager.saveData()
                timer.invalidate()
                self.timerLbl.text = "Time's up!"
               
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute:{
                    
                    self.performSegue(withIdentifier: "GoToResult", sender: self)
                } )
                
            }
            else {
                self.secondToMinute(seconds: 300 - self.cnt)
            }
            
        }
        // Do any additional setup after loading the view.
    }
    
    @objc func backPressed() {
            
            //print("yeah")
        let alertVC = UIAlertController(title: "Warning!", message: "Are you sure you want to go back?  Your progress will not be saved.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {_ in 
            self.navigationController?.popViewController(animated: true)
        }) //go to homescreen
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        alertVC.addAction(okAction)
        alertVC.addAction(cancelAction)
        timer?.invalidate()
        self.present(alertVC, animated: true, completion: nil)
    }
    
    func secondToMinute(seconds:Int){
        var quotient = seconds/60
        var remainder = seconds % 60
        if remainder >= 10{
            self.timerLbl.text = "\(quotient):\(remainder)"
        }
        else{
            self.timerLbl.text = "\(quotient):0\(remainder)"
        }
    }
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        let allowedCharacters = CharacterSet.decimalDigits
//        let characterSet = CharacterSet(charactersIn: string)
//        return allowedCharacters.isSuperset(of: characterSet)
//    }
//    func alphabet(word: String) -> Bool {
//        if let range = word.rangeOfCharacterFromSet(NSCharacterSet.letterCharacterSet){
//            return true
//        }
//        else {
//            return false
//        }
//    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToResult" {
            let resultVC = segue.destination as! ResultViewController
            resultVC.scaw = score //Float(self.bmiString) ?? 0
            
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
}
extension TestViewController: UITextFieldDelegate{
    public func textFieldShouldReturn(_ textView: UITextField) -> Bool {
        textView.resignFirstResponder()
        instructionsLbl.isHidden = true
        if answerInputBoxTextField.text == "" {
            answerInputBoxTextField.placeholder = "Please type something"
        }
        let trimmedString = answerInputBoxTextField.text!.trimmingCharacters(in: .whitespaces)
        //malika will show code
        prev = questionGenerator.answer
        if let _ = answerInputBoxTextField.text!.rangeOfCharacter(from: NSCharacterSet.decimalDigits) {
            //print ("valid")
            if trimmedString == String(prev) {
                score += 1
            }
            else {
                score -= 0
            }
        }
        else if answerInputBoxTextField.text!.range(of:"/") != nil {
            if trimmedString == String(prev) {
                score += 1
            }
            else {
                score -= 0
            }
        }
        else {
            self.answerInputBoxTextField.text = ""
            answerInputBoxTextField.placeholder = "Please type a number."
        }
        
        if answerInputBoxTextField.text != "" {
            answerInputBoxTextField.text = ""
            questionGenerator.generate()
            if questionGenerator.instructions == true {
                instructionsLbl.isHidden = false
                instructionsLbl.text = questionGenerator.instructionTxt
                //self.instructionsLbl.text = "Please provide a simplified fraction."
            }
            else
            {
                instructionsLbl.isHidden = true
            }
            self.questionLbl.attributedText =  (questionGenerator.problem)
        }
        else
        {
            return false
        }
        //print (questionGenerator.answer)
        
        return true
    }
    
}
