//
//  MoodStatViewController.swift
//  EmoticonApp
//
//  Created by ChaewonMac on 2023/07/25.
//

import UIKit

class MoodStatViewController: UIViewController {
    
    
   
    
    
    @IBOutlet var moodScoreViewCollection: [UIView]!
    
    
    @IBOutlet var moodScoreLabelCollection: [UILabel]!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        designMoodLabel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            updateButtonCounts()
        }
    

    func updateButtonCounts() {
            
        let buttonCounters = UserDefaults.standard.object([Int: Int].self, with: "ButtonCounters")
        
        for (index, scoreLabel) in moodScoreLabelCollection.enumerated() {
            let buttonTag = index
            print(buttonTag)
            let count = buttonCounters?[buttonTag, default: 0]
            scoreLabel.text = "\(count!)점"
                }
        
    }
    
    func designMoodLabel() {
        for view in moodScoreViewCollection {
            view.layer.cornerRadius = 10
        }
    }
    
    

}
