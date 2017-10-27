//
//  ViewController.swift
//  PitchPerfect
//
//  Created by user131931 on 10/26/17.
//  Copyright © 2017 Hugo Angeles. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblRecordingStatus: UILabel!
    @IBOutlet weak var btRecord: UIButton!
    @IBOutlet weak var btStop: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func recordAudio(_ sender: Any) {
        lblRecordingStatus.text = "Recording in progress"
    }
    
    @IBAction func stopRecording(_ sender: Any) {
        lblRecordingStatus.text = "Tap to recording"
    }
}

