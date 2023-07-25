//
//  MoodStatViewController.swift
//  EmoticonApp
//
//  Created by ChaewonMac on 2023/07/25.
//

import UIKit

class MoodStatViewController: UIViewController {
    
    
   
    
    @IBOutlet var moodScoreView: [UIView]!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        designMoodLabel()
       
    }
    

    func designMoodLabel() {
        for view in moodScoreView {
            view.layer.cornerRadius = 10
        }
    }
    
    

}
