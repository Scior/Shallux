//
//  ExposureMeterCaptureSessionConnector.swift
//  Shallux
//
//  Created by Suita Fujino on 2018/10/20.
//  Copyright © 2018 Suita Fujino. All rights reserved.
//

import AVFoundation

/**
 A class for generating `AVCaptutreSession` for `CameraPreviewView`.
*/
final class ExposureMeterCaptureSessionConnector {
    
    // MARK: Properties
    
    /// The device input for the capture session.
    private(set) var videoDeviceInput: AVCaptureInput?
    
    /// The capture device for `CameraPreviewView`. `videoDeviceInput` will be refreshed when this value is changed.
    private(set) var videoDevice: AVCaptureDevice? {
        didSet {
            guard let videoDevice = videoDevice else { return }
            videoDeviceInput = try? AVCaptureDeviceInput(device: videoDevice)
        }
    }
    
    /// The object responsible to the camera device I/O.
    private(set) var captureSession: AVCaptureSession?
    
    // MARK: Methods
    
    /**
     Creates an `AVCaptureSession` instance when it is referenced.
     
     - Returns: Created session or `nil`.
    */
    func connect() -> AVCaptureSession? {
        videoDevice = AVCaptureDevice.default(
            .builtInWideAngleCamera,
            for: .video,
            position: .unspecified
        )
        
        guard let videoDeviceInput = videoDeviceInput else { return nil }
        
        let session = AVCaptureSession()
        session.beginConfiguration()
        
        guard session.canAddInput(videoDeviceInput) else { return nil }
        session.addInput(videoDeviceInput)
        session.commitConfiguration()
        
        captureSession = session
        return session
    }
    
}
