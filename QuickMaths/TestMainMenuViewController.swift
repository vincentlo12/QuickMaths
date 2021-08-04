//
//  TestMainMenuViewController.swift
//  QuickMaths
//
//  Created by User on 7/30/21.
//

import UIKit
import AVKit
class TestMainMenuViewController: UIViewController {
    @IBAction func startBtnTpd(_ sender: UIButton) {
        player.stop()
    }
    var player = AVAudioPlayer()
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

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        playsound(name: "energykids")
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
