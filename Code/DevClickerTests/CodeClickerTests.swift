//
//  CodeClickerTests.swift
//  DevClicker
//
//  Created by Rodrigo Hilkner on 29/06/18.
//  Copyright © 2018 Rodrigo Hilkner. All rights reserved.
//

import XCTest
import UIKit
import DevClicker
@testable import DevClicker

class DevClickerStringsTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testLocString() {
        let millionLocString = UIServices.locStringFormat(loc: 123)
        XCTAssertEqual(millionLocString, "123 LoC")
    }

    func testThousandLocString() {
        let millionLocString = UIServices.locStringFormat(loc: 12345)
        XCTAssertEqual(millionLocString, "12.345 k LoC")
    }

    func testMillionLocString() {
        let millionLocString = UIServices.locStringFormat(loc: 3245671)
        XCTAssertEqual(millionLocString, "3.245 M LoC")
    }

    func testBillionLocString() {
        let millionLocString = UIServices.locStringFormat(loc: 1234245671)
        XCTAssertEqual(millionLocString, "1.234 B LoC")
    }

    func testDolString() {
        let millionDolString = UIServices.dolStringFormat(dol: 123.00)
        XCTAssertEqual(millionDolString, "D$ 123.00")
    }

    func testThousandDolString() {
        let millionDolString = UIServices.dolStringFormat(dol: 12345.00)
        XCTAssertEqual(millionDolString, "D$ 12.345 k")
    }

    func testMillionDolString() {
        let millionDolString = UIServices.dolStringFormat(dol: 3245671.00)
        XCTAssertEqual(millionDolString, "D$ 3.245 M")
    }

    func testBillionDolString() {
        let billionDolString = UIServices.dolStringFormat(dol: 1234245671.00)
        XCTAssertEqual(billionDolString, "D$ 1.234 B")
    }
    
}
