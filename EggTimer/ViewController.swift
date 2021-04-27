//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player : AVAudioPlayer?

    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    let eggTimes : [String : Int] = ["Soft":6,"Medium":420,"Hard":720]
    var totalTime : Int = 0
    var secondsPassed : Int = 0
    
    var timer = Timer()
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        // everytime the button is pressed invalidate the previous timers
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0,target: self,selector: #selector(updateTimer),userInfo: nil,repeats: true)
        
    }
    
    @objc func updateTimer(){
        if secondsPassed < totalTime {
            progressBar.progress = Float(secondsPassed)/Float(totalTime);
            secondsPassed+=1
        } else {
            timer.invalidate()
            playAlarm()
            titleLabel.text = "DONE!"
        }
    }
    
    func playAlarm(){
        guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else { return }
               
               do {
                   try AVAudioSession.sharedInstance().setCategory(.playback,mode: .default)
                   try AVAudioSession.sharedInstance().setActive(true)
                   
                   player = try AVAudioPlayer(contentsOf : url,fileTypeHint: AVFileType.mp3.rawValue)
                   
                   guard let player = player else { return }
                   
                   player.play()
               } catch let error {
                   print(error.localizedDescription)
               }
    }
}
