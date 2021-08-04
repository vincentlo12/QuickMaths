//
//  LessonsViewController.swift
//  QuickMaths
//
//  Created by User on 6/6/21.
//make a paid apple developer account
//make the right stack view black/lock it
//save the data
import UIKit
import AVFoundation
import AVKit
class LessonsViewController: UIViewController {
    var player = AVAudioPlayer()
    override func viewDidLoad() {
        super.viewDidLoad()
            
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        player.stop()
        playsound(name: "summer")
    }
    @IBAction func multiplyby11LessonBtnTpd(_ sender: UIButton) {
        player.stop()
        playvideo(name: "Multiplyby11V2")
    }
    @IBAction func diffofSquaresLessonBtnTpd(_ sender: UIButton) {
        player.stop()
        playvideo(name: "diffofsquaresV3")
    }
    @IBAction func Unitsdigit5squaredBtnTpd(_ sender: UIButton) {
        player.stop()
        playvideo(name: "Unitsdigit5squaredV2")
    }
    
    @IBAction func MutliplyBy1001BtnTpd(_ sender: UIButton) {
        player.stop()
        playvideo(name: "101V2")
    }
    @IBAction func GCDBtnTpd(_ sender: UIButton) {
        player.stop()
        playvideo(name: "distribute")
    }
    @IBAction func LCMBtnTpd(_ sender: UIButton) {
        player.stop()
        playvideo(name: "multiplyby9")
    }
    @IBAction func UDSumto10BtnTpd(_ sender: UIButton) {
        player.stop()
        playvideo(name: "UDaddupto10V2")
    }
    
    @IBAction func RepeatDecimalsBtnTpd(_ sender: UIButton) {
        player.stop()
        playvideo(name: "repeatingdecimals")
    }
    @IBAction func MixedNumbersBtnTpd(_ sender: UIButton) {
        player.stop()
        playvideo(name: "mixednumbersV2")
    }
    @IBAction func DivideBtnTpd(_ sender: UIButton) {
        player.stop()
        playvideo(name: "divideV3")
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
    func playvideo (name: String){
        let path = Bundle.main.path(forResource: name, ofType: "mp4")
        let videoURL = URL(fileURLWithPath: path!)
        let player = AVPlayer(url: videoURL)
        let vc = AVPlayerViewController()
        vc.player = player
        
        present (vc, animated: true) {
            vc.player?.play()
        }
    }
    
}
