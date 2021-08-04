//
//  PickPracticeViewController.swift
//  QuickMaths
//
//  Created by User on 6/7/21.
// font change, to semibold
// font style change

import UIKit
import AVKit
class PickPracticeViewController: UIViewController {
    var player = AVAudioPlayer()
    var practiceTopicChosen = ""
    @IBAction func Multiplyby11ButtonTpd(_ sender: UIButton) {
        player.stop()
        practiceTopicChosen = "Multiply by 11"
        self.performSegue(withIdentifier: "goToPractice", sender: self)
    }
    @IBAction func diffOfSquaresButtonTpd(_ sender: UIButton) {
        player.stop()
        practiceTopicChosen = "Difference of squares"
        self.performSegue(withIdentifier: "goToPractice", sender: self)
    }
    @IBAction func UDof5squaredButtonTpd(_ sender: UIButton) {
        player.stop()
        practiceTopicChosen = "Unitsdigitof5"
        self.performSegue(withIdentifier: "goToPractice", sender: self)
    }
    @IBAction func multiplyBy101(_ sender: UIButton) {
        player.stop()
        practiceTopicChosen = "Multiplyby101"
        self.performSegue(withIdentifier: "goToPractice", sender: self)
    }
    @IBAction func Unitsdigitsaddto10BtnTpd(_ sender: UIButton) {
        player.stop()
        practiceTopicChosen = "Sumto10"
        self.performSegue(withIdentifier: "goToPractice", sender: self)
    }
    
    @IBAction func mixedNumbersBtnTpd(_ sender: UIButton) {
        player.stop()
        practiceTopicChosen = "mixedNumbers"
        self.performSegue(withIdentifier: "goToPractice", sender: self)
    }
    @IBAction func GCDBtnTpd(_ sender: UIButton) {
        player.stop()
        practiceTopicChosen = "distribute"
        self.performSegue(withIdentifier: "goToPractice", sender: self)
    }
    
    @IBAction func LCMBtnTpd(_ sender: UIButton) {
        player.stop()
        practiceTopicChosen = "multiplyby9"
        self.performSegue(withIdentifier: "goToPractice", sender: self)
    }
    @IBAction func DivisibilityBtnTpd(_ sender: UIButton) {
        player.stop()
        practiceTopicChosen = "divide"
        self.performSegue(withIdentifier: "goToPractice", sender: self)
    }
    @IBAction func DecimalBtnTpd(_ sender: UIButton) {
        player.stop()
        practiceTopicChosen = "decimal"
        self.performSegue(withIdentifier: "goToPractice", sender: self)
    }
    func playsound (name: String){
        let path = Bundle.main.path(forResource: name, ofType: "mp3")
        let url = URL(fileURLWithPath: path!)
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player.numberOfLoops = -1
            player.play()
        }catch{}
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
//        self.navigationController?.navigationBar.shadowImage = UIImage()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        playsound(name: "rainbow")
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToPractice" {
            let PracticeVC = segue.destination as! PracticeViewController
            PracticeVC.typeofProblem = practiceTopicChosen
            //resultVC.bmiValueDouble = Float(self.bmiString)!
            
        }
    }

}
