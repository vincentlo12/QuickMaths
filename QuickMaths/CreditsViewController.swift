//
//  CreditsViewController.swift
//  QuickMaths
//
//  Created by User on 6/14/21.
//

import UIKit
import AVKit
class CreditsViewController: UIViewController {
    var player = AVAudioPlayer()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    override func viewDidAppear(_ animated: Bool) {
        playsound(name: "mathfun1")
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
