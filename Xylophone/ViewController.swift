//
//  ViewController.swift
//  Xylophone
//
//  Created by Muhamed Alkhatib on 20/08/2020.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {


    @IBOutlet weak var btn: UIButton!
    
    @IBOutlet weak var btn2: UIButton!
    
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    
    @IBOutlet weak var btn5: UIButton!
    
    @IBOutlet weak var btn6: UIButton!
    
    @IBOutlet weak var btn7: UIButton!
    
    
    
    
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btn.layer.cornerRadius = 7
        btn2.layer.cornerRadius = 7
        btn3.layer.cornerRadius = 7
        btn4.layer.cornerRadius = 7
        btn5.layer.cornerRadius = 7
        btn6.layer.cornerRadius = 7
        btn7.layer.cornerRadius = 7
    }

    
   
    
    @IBAction func playSound(_ sender: Any) {
        
        print((sender as AnyObject).currentTitle!!)
        guard let url = Bundle.main.url(forResource: (sender as AnyObject).currentTitle!!, withExtension: "wav") else { return }

           do {
               try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
               try AVAudioSession.sharedInstance().setActive(true)

               /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
               player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

               /* iOS 10 and earlier require the following line:
               player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

               guard let player = player else { return }

               player.play()

           } catch let error {
               print(error.localizedDescription)
           }
    }
    
}

