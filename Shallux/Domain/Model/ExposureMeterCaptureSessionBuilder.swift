//
//  ExposureMeterCaptureSessionBuilder.swift
//  Shallux
//
//  Created by Suita Fujino on 2018/10/20.
//  Copyright © 2018 Suita Fujino. All rights reserved.
//

import AVFoundation

/**
 ExposureMeterViewController用のAVCaptutreSessionの生成クラス.
*/
final class ExposureMeterCaptureSessionBuilder {
    
    // MARK: Properties
    
    static var videoDeviceInput: AVCaptureInput?
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
    
    // MARK: Methods
    
    private init() {}
    
    /**
     ExposureMeter用のAVCaptutreSessionを生成する.
     
     - returns: AVCaptureSessionのインスタンス. 失敗した場合はnil
    */
    static func build() -> AVCaptureSession? {
        guard let videoDeviceInput = videoDeviceInput else { return nil }
        
        let captureSession = AVCaptureSession()
        captureSession.beginConfiguration()
        
        guard captureSession.canAddInput(videoDeviceInput) else { return nil }
        captureSession.addInput(videoDeviceInput)
        
        captureSession.commitConfiguration()
        
        return captureSession
    }
}
