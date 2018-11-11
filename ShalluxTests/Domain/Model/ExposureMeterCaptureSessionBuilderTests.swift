//
//  ExposureMeterCaptureSessionConnectorTests.swift
//  ShalluxTests
//
//  Created by Suita Fujino on 2018/10/21.
//  Copyright © 2018 Suita Fujino. All rights reserved.
//

import AVFoundation
import XCTest
@testable import Shallux

class ExposureMeterCaptureSessionConnectorTests: XCTestCase {
    
    // NOTE: Unit tests cannot be accomplished since there is no way to mock `AVCaptureDevice`.

    func testSetVideoDeviceNil() {
        let connector = ExposureMeterCaptureSessionConnector()
        let beforeInput = connector.videoDeviceInput
        XCTAssertNil(connector.connect())
        let afterInput = connector.videoDeviceInput
        
        XCTAssertEqual(beforeInput, afterInput)
        
    }

}
