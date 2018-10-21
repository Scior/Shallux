//
//  ExposureMeterCaptureSessionBuilder.swift
//  Shallux
//
//  Created by Suita Fujino on 2018/10/20.
//  Copyright © 2018 Suita Fujino. All rights reserved.
//

import AVFoundation

/**
 A class for generating `AVCaptutreSession` for `CameraPreviewView`.
*/
final class ExposureMeterCaptureSessionBuilder {
    
    // MARK: Properties
    
    /// An input for the capture session.
    static var videoDeviceInput: AVCaptureInput?
    
    /// A capture device for `CameraPreviewView`. `videoDeviceInput` will be refreshed when this value is changed.
    static var videoDevice = AVCaptureDevice.default(
        .builtInWideAngleCamera,
        for: .video,
        position: .unspecified
    ) {
        didSet {
            guard let videoDevice = videoDevice else { return }
            videoDeviceInput = try? AVCaptureDeviceInput(device: videoDevice)
        }
    }
    
    /// Generates an `AVCaptureSession` instance when it is referenced.
    static var captureSession: AVCaptureSession? {
        guard let videoDeviceInput = videoDeviceInput else { return nil }
        
        let captureSession = AVCaptureSession()
        captureSession.beginConfiguration()
        
        guard captureSession.canAddInput(videoDeviceInput) else { return nil }
        captureSession.addInput(videoDeviceInput)
        captureSession.commitConfiguration()
        
        return captureSession
    }
    
    // MARK: Methods
    
    /// Singleton
    private init() {}
    
}
