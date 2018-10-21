//
//  ExposureMeterViewController.swift
//  Shallux
//
//  Created by Suita Fujino on 2018/10/08.
//  Copyright © 2018 Suita Fujino. All rights reserved.
//

import UIKit
import AVFoundation

/**
 An `UIViewController` for the main view.
*/
class ExposureMeterViewController: UIViewController {
    
    // MARK: Properties
    
    /// A view for showing input from the camera.
    @IBOutlet weak private var cameraPreviewView: CameraPreviewView!
    
    // MARK: Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cameraPreviewView.videoPreviewLayer?.session = ExposureMeterCaptureSessionBuilder.captureSession
    }

}
