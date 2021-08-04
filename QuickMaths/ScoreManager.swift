//
//  ScoreManager.swift
//  QuickMaths
//
//  Created by User on 7/1/21.
//

import Foundation
import UIKit

class ScoreManager {
    static var scoreManager = ScoreManager()
    private init() {}
    var score: [Double] = []
    
    let defaults = UserDefaults.standard
    func initWithZero(){
        if (score.count == 0)
        {
            score.append(0)
        }
    }
    func saveData(){
        initWithZero()
        defaults.set(score, forKey: "score")
    }
    func fetchScore() -> [Double] {
        score = defaults.array(forKey: "score") as? [Double] ?? []
        return score
    }
//    func reset(){
//        score = []
//        saveData()
//    }
}
