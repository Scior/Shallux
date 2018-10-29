//
//  AVCaptureDeviceAuthorizer.swift
//  Shallux
//
//  Created by Suita Fujino on 2018/10/23.
//  Copyright © 2018 Suita Fujino. All rights reserved.
//

import AVKit

/**
 An authorizer to permit accessing capture devices.
*/
final class AVCaptureDeviceAuthorizer {
    
    typealias AuthorizationResult = Result<AVCaptureSession, AVAuthorizationStatus>
    
    /**
     Requires authorization and returns the result.
     
     - Returns: `Result<AVCaptureSession, AVAuthorizationStatus>`
       - If the authorization succeeded, it contains `AVCaptureSession`.
       - Otherwise, it contains `AVAuthorizationStatus`.
    */
    func authorize() -> AuthorizationResult {
        let authorizationStatus = AVCaptureDevice.authorizationStatus(for: .video)
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            guard let captureSession = ExposureMeterCaptureSessionBuilder.captureSession else { break }
            return Result.ok(captureSession)
        case .notDetermined:
            let semaphore = DispatchSemaphore(value: 0)
            var result: AuthorizationResult?
            
            AVCaptureDevice.requestAccess(for: .video) { granted in
                if granted, let captureSession = ExposureMeterCaptureSessionBuilder.captureSession {
                    result = Result.ok(captureSession)
                }
                semaphore.signal()
            }
            semaphore.wait()
            
            guard let okResult = result else { break }
            return okResult
        default:
            break
        }
        
        // Not authorized
        return Result.error(authorizationStatus)
    }
}
