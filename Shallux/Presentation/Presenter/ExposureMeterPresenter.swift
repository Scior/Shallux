//
//  ExposureMeterPresenter.swift
//  Shallux
//
//  Created by Suita Fujino on 2018/10/29.
//  Copyright © 2018 Suita Fujino. All rights reserved.
//

import AVFoundation
import UIKit

/**
 A presenter for `ExposureMeterViewController`.
*/
final class ExposureMeterPresenter: Presenter {
    
    // MARK: - Constants
    
    private let errorMessages: [AVAuthorizationStatus: String] = [
        .denied: "Access denied.",
        .restricted: "Not permitted to access the camera device.",
        .notDetermined: "Access permission is needed.",
        .authorized: "Couldn't access the camera device."
    ]
    
    // MARK: - Properties
    
    var viewController: UIViewController
    /// The authorizer to use capture devices.
    let captureDeviceAuthorizer: AVCaptureDeviceAuthorizer
    /// The capture session for `CameraPreviewView`.
    let captureSessionConnector: ExposureMeterCaptureSessionConnector
    
    // MARK: - Lifecycle
    
    /**
     Creates and returns a presenter for `ExposureMeterViewController`.
     
     - Parameters:
       - viewController: The `UIViewController` to present.
    */
    init(_ viewController: UIViewController) {
        self.viewController = viewController
        // NOTE: Not injectable since it's hard to mock them.
        self.captureDeviceAuthorizer = AVCaptureDeviceAuthorizer()
        self.captureSessionConnector = ExposureMeterCaptureSessionConnector()
    }
    
    // MARK: - Methods
    
    /**
     Requires authorization for the capture device via `AVCaptureDeviceAuthorizer`.
    */
    func authorize() {
        if let errorStatus = captureDeviceAuthorizer.authorize(onSuccess: {
            return self.captureSessionConnector.connect()
        }).error() {
            guard let message = errorMessages[errorStatus] else { return }
            let alertController = UIAlertController(
                title: NSLocalizedString("Unable to access the camera", comment: ""),
                message: NSLocalizedString(message, comment: ""),
                buttonTitle: "OK")
            
            viewController.present(alertController, animated: true)
        }
    }
}
