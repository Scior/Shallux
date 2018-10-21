//
//  ExposureMeterCaptureSessionBuilderTests.swift
//  ShalluxTests
//
//  Created by Suita Fujino on 2018/10/21.
//  Copyright © 2018 Suita Fujino. All rights reserved.
//

import AVFoundation
import XCTest
@testable import Shallux

class ExposureMeterCaptureSessionBuilderTests: XCTestCase {
    
    // NOTE: Unit tests cannot be accomplished since there is no way to mock `AVCaptureDevice`.

    func testSetVideoDeviceNil() {
        let beforeInput = ExposureMeterCaptureSessionBuilder.videoDeviceInput
        ExposureMeterCaptureSessionBuilder.videoDevice = nil
        let afterInput = ExposureMeterCaptureSessionBuilder.videoDeviceInput
        
        XCTAssertEqual(beforeInput, afterInput)
        
    }

}
