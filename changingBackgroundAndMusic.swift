//
//  ViewController.swift
//  Xylophone
//
//  Created by rishabh on 27/01/2016.
//  Copyright © 2019. All rights reserved.
//

import UIKit
import AVFoundation
// import AudioToolbox

class ViewController: UIViewController, AVAudioPlayerDelegate{
    
    var audioPlayer: AVAudioPlayer!
    var index: Int!
    let soundArray: [String] = ["note1", "note2", "note3", "note4", "note5", "note6", "note7"]
    let colorArr: [String] = ["red", "orange", "yellow", "green", "seaGreen", "blue", "purple"]
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func notePressed(_ sender: UIButton) {
        
        // 	print(sender.tag)

        let selectedSoundfileName = soundArray[sender.tag - 1]
        playSound(fileName: selectedSoundfileName)
        index = sender.tag - 1
        performSegue(withIdentifier: colorArr[sender.tag - 1], sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! SecondViewController
        destinationVC.textPassedOver = colorArr[index] // forced unwrap

    }
    
    func playSound(fileName: String) {
        let soundUrl = Bundle.main.url(forResource: fileName, withExtension: "wav")
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundUrl!)
            //            player = try AVAudioPlayer(contentsOf: soundUrl!)
            //            guard let player = player else { return }
            //
            //            player.prepareToPlay()
            //            player.play()
            
        } catch  {
            print(error)
        }
        audioPlayer.prepareToPlay()
        audioPlayer.play()
        
        //        if let soundURL = Bundle.main.url(forResource: "note\(sender.tag)", withExtension: "wav") {
        //            var mySound: SystemSoundID = 0
        //            AudioServicesCreateSystemSoundID(soundURL as CFURL, &mySound)
        //            AudioServicesPlaySystemSound(mySound)
        //        }
    }
    
  

}



//
//  SecondViewController.swift
//  Xylophone
//
//  Created by ios on 27/08/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    var textPassedOver: String?
    var colorsDict: [String: UIColor] = ["red" : UIColor(displayP3Red: 1.0, green: 0, blue: 0, alpha: 1.0), "orange": UIColor.orange, "blue": UIColor.blue, "yellow": UIColor.yellow, "seaGreen": UIColor(displayP3Red: 0.125, green: 0.698, blue: 0.667, alpha: 1.0), "green": UIColor.green, "purple": UIColor(displayP3Red: 191.0/255, green: 85.0/255, blue: 236.0/255, alpha: 1.0)
    ]
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = textPassedOver // "String"
        self.view.backgroundColor = colorsDict[textPassedOver!]
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
