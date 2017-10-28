//
//  ViewController.swift
//  MotionController
//
//  Created by Ausias on 12/10/2017.
//  Copyright © 2017 kobiuter. All rights reserved.
//

import UIKit
import CoreMotion



class ViewController: UIViewController {

    @IBOutlet weak var rollValue: UILabel!
    
    @IBOutlet weak var pitchValue: UILabel!
    
    @IBOutlet weak var yawValue: UILabel!
    
    var motion: CMMotionManager = CMMotionManager()
    var queue: OperationQueue = OperationQueue()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Start receiving motion updates from sensors
        startQueuedUpdates()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    func startQueuedUpdates() {
        
        if motion.isDeviceMotionAvailable {
            self.motion.deviceMotionUpdateInterval = 1.0 / 60.0
            self.motion.showsDeviceMovementDisplay = true
            self.motion.startDeviceMotionUpdates(
                using: .xMagneticNorthZVertical,
                to: self.queue, withHandler: {
                    (data, error) in
                    // Make sure the data is valid before accessing it.
                    if let validData = data {
                        // Get the attitude relative to the magnetic north reference frame.
                        let roll = validData.attitude.roll
                        let pitch = validData.attitude.pitch
                        let yaw = validData.attitude.yaw
                        
                        print("r,p,y: ", roll, ", ", pitch, ", ", yaw)
                        
                        OperationQueue.main.addOperation {
                            // update UI here
                            self.rollValue.text = String(roll)
                            self.pitchValue.text = String(pitch)
                            self.yawValue.text = String(yaw)
                        }
                    }
            })
        }
    }

}

