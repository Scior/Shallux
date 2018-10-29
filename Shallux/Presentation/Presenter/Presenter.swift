//
//  Presenter.swift
//  Shallux
//
//  Created by Suita Fujino on 2018/10/29.
//  Copyright © 2018 Suita Fujino. All rights reserved.
//

import UIKit

/**
 A protocol which has constraint for `Presenter`.
 */
protocol Presenter {
    /// A `UIViewController` to present.
    var viewController: UIViewController { get }
}
