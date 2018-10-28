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
        
        // TODO: Separate logics, handle error
        if let errorStatus = AVCaptureDeviceAuthorizer.authorize().error() {
            return
        }
        
        // TODO: Separate logics, handle error
        guard let session = ExposureMeterCaptureSessionBuilder.captureSession else { return }
        session.startRunning()
        cameraPreviewView.videoPreviewLayer?.session = session
    }

}
