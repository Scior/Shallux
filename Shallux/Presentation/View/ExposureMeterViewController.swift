//
//  ExposureMeterViewController.swift
//  Shallux
//
//  Created by Suita Fujino on 2018/10/08.
//  Copyright © 2018 Suita Fujino. All rights reserved.
//

import UIKit
import AVFoundation

/**
 An `UIViewController` for the main view.
*/
class ExposureMeterViewController: UIViewController {
    
    // MARK: - Properties
    
    /// A view for showing the input from the camera.
    @IBOutlet weak private var cameraPreviewView: CameraPreviewView!
    
    private var presenter: ExposureMeterPresenter?
    
    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = ExposureMeterPresenter(self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard let presenter = presenter else { fatalError("Presenter is absent.") }
        
        presenter.authorize()
        if let session = presenter.captureSessionConnector.captureSession {
            session.startRunning()
            cameraPreviewView.videoPreviewLayer?.session = session
        }
    }

}
