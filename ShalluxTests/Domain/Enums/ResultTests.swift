//
//  ResultTests.swift
//  ShalluxTests
//
//  Created by Suita Fujino on 2018/10/24.
//  Copyright © 2018 Suita Fujino. All rights reserved.
//

import XCTest
@testable import Shallux

class ResultTests: XCTestCase {
    typealias Res = Result<Int, String>
    
    private let testError = "hoge"
    private let testResult = 1_234
    private var errorResult: Res {
        return Res.error(testError)
    }
    private var okResult: Res {
        return Res.ok(testResult)
    }
    private let testMapper: (Int) -> String = { number in "\(number)" }
    
    func test_checkSwitchWhichHasResult() {
        switch okResult {
        case .ok(let result):
            XCTAssertEqual(result, testResult)
        default:
            XCTFail("switch statement has fallen through")
        }
    }
    
    func test_checkSwitchWhichHasError() {
        switch errorResult {
        case .error(let error):
            XCTAssertEqual(error, testError)
        default:
            XCTFail("switch statement has fallen through")
        }
    }
    
    func test_isOkReturnsTrue() {
        XCTAssertTrue(okResult.isOk())
    }
    
    func test_isOkReturnsFalse() {
        XCTAssertFalse(errorResult.isOk())
    }
    
    func test_isErrorReturnsTrue() {
        XCTAssertTrue(errorResult.isError())
    }
    
    func test_isErrorReturnsFalse() {
        XCTAssertFalse(okResult.isError())
    }
    
    func test_okReturnsValue() {
        XCTAssertEqual(okResult.ok(), testResult)
    }
    
    func test_okReturnsNil() {
        XCTAssertNil(errorResult.ok())
    }
    
    func test_errorReturnsValue() {
        XCTAssertEqual(errorResult.error(), testError)
    }
    
    func test_errorReturnsNil() {
        XCTAssertNil(okResult.error())
    }
    
    func test_mapWhenOk() {
        XCTAssertEqual(okResult.map(testMapper).ok(), testMapper(testResult))
    }
    
    func test_mapWhenError() {
        XCTAssertNil(errorResult.map(testMapper).ok())
    }
    
    func test_ifOkWhenOk() {
        var isFailed = true
        okResult.ifOk { _ in
            isFailed = false
        }
        if isFailed {
            XCTFail("Never pass")
        }
    }
    
    func test_ifOkWhenError() {
        errorResult.ifOk { _ in
            XCTFail("Never pass")
        }
    }

}
