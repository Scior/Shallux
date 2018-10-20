//
//  ExposureMeterViewController.swift
//  Shallux
//
//  Created by Suita Fujino on 2018/10/08.
//  Copyright © 2018 Suita Fujino. All rights reserved.
//

import UIKit
import AVFoundation

class ExposureMeterViewController: UIViewController {
    
    @IBOutlet weak var cameraPreviewView: CameraPreviewView!
    
    lazy var captureSession: AVCaptureSession? = ExposureMeterCaptureSessionBuilder.build()
    
    var previewLayer: AVCaptureVideoPreviewLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cameraPreviewView.videoPreviewLayer?.session = ExposureMeterCaptureSessionBuilder.build()
    }

}
