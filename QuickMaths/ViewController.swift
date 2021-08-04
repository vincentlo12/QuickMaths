//
//  ViewController.swift
//  QuickMaths
//
//  Created by User on 6/5/21.
//

import UIKit
import AVKit
class ViewController: UIViewController {
    
    var player = AVAudioPlayer()
    @IBOutlet weak var gifImage: UIImageView!
    @IBAction func LessonButtonTpd(_ sender: UIButton) {
        player.stop()
        self.performSegue(withIdentifier: "GoToButtonTpd", sender: self)
    }
    @IBAction func PracticeButtonTpd(_ sender: UIButton) {
        player.stop()
        self.performSegue(withIdentifier: "pickPractice", sender: self)
    }
    @IBAction func TestButtonTpd(_ sender: UIButton) {
        player.stop()
        self.performSegue(withIdentifier: "GoToTestStartingScreen", sender: self)
    }
    @IBAction func StatsButtonTpd(_ sender: UIButton) {
        player.stop()
        self.performSegue(withIdentifier: "GoStat", sender: self)
    }
    
    @IBAction func CreditsButtonTpd(_ sender: UIButton) {
        player.stop()
        self.performSegue(withIdentifier: "goToCredits", sender: self)
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
        //player.stop()
        navigationItem.hidesBackButton = true
        super.viewDidLoad()
        //playsound(name: "mathfun")
        gifImage.loadGif(name: "quickmathsgif")

        
    
    
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        playsound(name: "inspire")
    }
    

}

