//
//  CameraPreviewView.swift
//  Shallux
//
//  Created by Suita Fujino on 2018/10/20.
//  Copyright © 2018 Suita Fujino. All rights reserved.
//

import UIKit
import AVFoundation

class CameraPreviewView: UIView {
    override class var layerClass: AnyClass {
        return AVCaptureVideoPreviewLayer.self
    }
    
    var videoPreviewLayer: AVCaptureVideoPreviewLayer? {
        return layer as? AVCaptureVideoPreviewLayer
    }
}
