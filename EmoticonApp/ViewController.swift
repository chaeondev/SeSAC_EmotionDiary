//
//  ViewController.swift
//  EmoticonApp
//
//  Created by ChaewonMac on 2023/07/25.
//

import UIKit

class ViewController: UIViewController {

   
    
//    var buttonCounters: [MoodButtonIdentifier: Int] = [:]
    var buttonCounters: [Int: Int] = [:]
    
    @IBOutlet var moodButtonCollection: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setPullDownButton()
    }

    
    @IBAction func moodButtonTapped(_ sender: UIButton) {
        plusMoodButtonScore(tag: sender.tag, num: 1)
    }
    
    
    func setPullDownButton() {
        for button in moodButtonCollection {
            let onePlusAction = UIAction(title: "+1", handler: { _ in self.plusMoodButtonScore(tag: button.tag, num: 1)})
            let fivePlusAction = UIAction(title: "+5",  handler: { _ in self.plusMoodButtonScore(tag: button.tag, num: 5) })
            let tenPlusAction = UIAction(title: "+10",  handler: { _ in self.plusMoodButtonScore(tag: button.tag, num: 10)})
            let reset = UIAction(title: "리셋",  handler: { _ in self.plusMoodButtonScore(tag: button.tag, num: 0)})
            
            let buttonMenu = UIMenu(title: "메뉴", children: [onePlusAction, fivePlusAction, tenPlusAction, reset])
            button.menu = buttonMenu
        }
        
        
    }
   
    func plusMoodButtonScore(tag: Int, num: Int) {
        
        guard let identifier = MoodButtonIdentifier(rawValue: tag) else {
            return
        }
        
        if num == 0 {
            buttonCounters[identifier.rawValue, default: 0] = 0
        } else {
            buttonCounters[identifier.rawValue, default: 0] += num
        }
        
        UserDefaults.standard.set(object: buttonCounters, forKey: "ButtonCounters")
    }

    
}

extension UserDefaults {
    func object<T: Codable>(_ type: T.Type, with key: String, usingDecoder decoder: JSONDecoder = JSONDecoder()) -> T? {
        guard let data = self.value(forKey: key) as? Data else { return nil }
        return try? decoder.decode(type.self, from: data)
    }

    func set<T: Codable>(object: T, forKey key: String, usingEncoder encoder: JSONEncoder = JSONEncoder()) {
        let data = try? encoder.encode(object)
        self.set(data, forKey: key)
    }
}
