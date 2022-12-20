//
//  ViewController.swift
//  Xylophone
//
//  Created by Muhamed Alkhatib on 20/08/2020.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {

    
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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

