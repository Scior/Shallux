//
//  AlertController+SingleAction.swift
//  Shallux
//
//  Created by Suita Fujino on 2018/10/29.
//  Copyright © 2018 Suita Fujino. All rights reserved.
//

import Foundation
import UIKit

/**
 An extension to make a `UIAlertController` with a single action.
*/
extension UIAlertController {
    /**
     Creates and returns a `UIAlertController` with a single action.
     
     - Parameters:
       - title: The title of the alert.
       - message: Descriptive text that provides additional details about the reason for the alert.
       - buttonTitle: The title of the button.
       - handler: Decribes the action.
     
     - Returns: An initialized alert controller object.
    */
    convenience init(title: String?, message: String?, buttonTitle: String, handler: ((UIAlertAction) -> Void)? = nil) {
        self.init(title: title, message: message, preferredStyle: .alert)
        
        let localizedString = NSLocalizedString(buttonTitle, comment: "Default action")
        let action = UIAlertAction(title: localizedString, style: .cancel, handler: handler)
        self.addAction(action)
    }
}
