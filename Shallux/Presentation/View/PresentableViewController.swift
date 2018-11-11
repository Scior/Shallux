//
//  PresentableViewController.swift
//  Shallux
//
//  Created by Suita Fujino on 2018/11/11.
//  Copyright © 2018 Suita Fujino. All rights reserved.
//

import UIKit

class PresentableViewController<T: Presenter>: UIViewController {
    private(set) var presenter: T?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = T(self)
    }
}
