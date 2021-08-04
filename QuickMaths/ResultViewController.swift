//
//  ResultViewController.swift
//  QuickMaths
//
//  Created by User on 6/17/21.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var gifImage: UIImageView!
    @IBOutlet weak var resultLbl: UILabel!
    
    var scaw: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        gifImage.loadGif(name: "minioncongrats")
        self.resultLbl.text = "You got a score of \(scaw)"
        navigationItem.hidesBackButton = true
        if (scaw >= 5) //change to 50 later
        {
            gifImage.loadGif(name: "minioncongrats")
        }
        else
        {
            gifImage.loadGif(name: "sadcat")
            //insert happy face
        }
        
        // Do any additional setup after loading the view.
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
