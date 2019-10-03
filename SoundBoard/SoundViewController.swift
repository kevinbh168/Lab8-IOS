//
//  SoundViewController.swift
//  SoundBoard
//
//  Created by yenifer santiago  on 10/3/19.
//  Copyright © 2019 yenifer santiago . All rights reserved.
//

import UIKit
import AVFoundation

class SoundViewController: UIViewController {
    
    @IBOutlet weak var recordButton: UIButton!
    
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var addButton: UIButton!
    
    var audioRecorder : AVAudioRecorder?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func recordTapped(_ sender: Any) {
        do{
            //creando sesison en el audio
            let session = AVAudioSession.sharedInstance()
            try session.setCategory(AVAudioSession.Category.playAndRecord)
            try session.overrideOutputAudioPort(.speaker)
            try session.setActive(true)
            // creando una direccion para el archivo de audio
            let basePath : String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let pathComponents = [basePath,"audio.m4"]
            let audioURL = NSURL.fileURL(withPathComponents: pathComponents)!
            print("**************")
            print(audioURL)
            print("**************")
            //crear opciones para el grbador de audio
            var settings : [String: AnyObject] = [:]
            settings[AVFormatIDKey] = Int(kAudioFormatMPEG4AAC)as AnyObject?
            settings[AVSampleRateKey] = 44100.0 as AnyObject?
            settings[AVNumberOfChannelsKey] = 2 as AnyObject?
            audioRecorder = try AVAudioRecorder(url:audioURL, settings: settings)
            audioRecorder!.prepareToRecord()
            
        }
        catch let error as NSError{ print(error) }
        
    }
    }
    
    
    
   


