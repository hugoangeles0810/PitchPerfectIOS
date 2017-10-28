//
//  RecordSoundsViewController.swift
//  PitchPerfect
//
//  Created by user131931 on 10/26/17.
//  Copyright © 2017 Hugo Angeles. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {

    @IBOutlet weak var lblRecordingStatus: UILabel!
    @IBOutlet weak var btRecord: UIButton!
    @IBOutlet weak var btStop: UIButton!
    
    private var audioRecorder: AVAudioRecorder!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        btStop.isEnabled = false
    }
    
    @IBAction func recordAudio(_ sender: Any) {
        lblRecordingStatus.text = "Recording in progress"
        btStop.isEnabled = true
        btRecord.isEnabled = false
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with: .defaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    @IBAction func stopRecording(_ sender: Any) {
        lblRecordingStatus.text = "Tap to recording"
        btStop.isEnabled = false
        btRecord.isEnabled = true
        
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        
        if flag {
            performSegue(withIdentifier: "stopRecording", sender: audioRecorder.url)
        
        } else {
            print("Recordn wad not succcessful")
        }
        
        
    }
}

