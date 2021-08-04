//
//  GIFViewController.swift
//  QuickMaths
//
//  Created by User on 7/25/21.
//

import UIKit
import AVFoundation
import AVKit
class GIFViewController: UIViewController {
    @IBOutlet weak var gif: UIImageView!
    var player: AVAudioPlayer?
    override func viewDidLoad() {
        super.viewDidLoad()
        //gif.loadGif(name: "Quick Maths")
        // Do any additional setup after loading the view.
    }
    @IBAction func playBtnPressed(_ sender: UIButton) {
        player?.pause()
    }
    func playsound (name: String){
        let path = Bundle.main.path(forResource: name, ofType: "mp3")
        let url = URL(fileURLWithPath: path!)
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player?.numberOfLoops = -1
            player?.play()
        }catch{}
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
