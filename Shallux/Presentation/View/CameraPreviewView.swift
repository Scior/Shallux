//
//  CameraPreviewView.swift
//  Shallux
//
//  Created by Suita Fujino on 2018/10/20.
//  Copyright © 2018 Suita Fujino. All rights reserved.
//

import UIKit
import AVFoundation

/**
 A `UIView` for showing input from a back camera.
*/
class CameraPreviewView: UIView {
    /// Redefines the layer class as a `AVCaptureVideoPreviewLayer`.
    override class var layerClass: AnyClass {
        return AVCaptureVideoPreviewLayer.self
    }
    
    /// Casts `layer` to `AVCaptureVideoPreviewLayer`.
    var videoPreviewLayer: AVCaptureVideoPreviewLayer? {
        return layer as? AVCaptureVideoPreviewLayer
    }
}
