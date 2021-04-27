//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let hardnessValue : [String : Int] = ["Soft":5,"Medium":7,"Hard":12]
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let label = sender.currentTitle!
        
        switch label {
        case "Soft":
            print(hardnessValue[label]!)
        case "Medium":
            print(hardnessValue[label]!)
        case "Hard":
            print(hardnessValue[label]!)
        default :
            print("Error")
        }
    }
    
}
