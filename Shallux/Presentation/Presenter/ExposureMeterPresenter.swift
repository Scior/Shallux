//
//  ExposureMeterPresenter.swift
//  Shallux
//
//  Created by Suita Fujino on 2018/10/29.
//  Copyright © 2018 Suita Fujino. All rights reserved.
//

import UIKit

/**
 A presenter for `ExposureMeterViewController`.
*/
final class ExposureMeterPresenter: Presenter {
    
    // MARK: - Properties
    
    var viewController: UIViewController
    /// The authorizer to use capture devices.
    let captureDeviceAuthorizer: AVCaptureDeviceAuthorizer
    
    // MARK: - Lifecycle
    
    /**
     Creates and returns a presenter for `ExposureMeterViewController`.
     
     - Parameters:
       - viewController: The `UIViewController` to present.
    */
    init(_ viewController: UIViewController) {
        self.viewController = viewController
        self.captureDeviceAuthorizer = AVCaptureDeviceAuthorizer()
    }
    
    // MARK: - Methods
    
    func authorize() {
        if let errorStatus = captureDeviceAuthorizer.authorize().error() {
            let alertController = UIAlertController(
                title: NSLocalizedString("Unable to access the camera", comment: ""),
                message: "\(errorStatus)",
                buttonTitle: "OK")
            viewController.present(alertController, animated: true)
        }
    }
}
