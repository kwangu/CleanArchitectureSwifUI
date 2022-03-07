//
//  EntityTest.swift
//  
//
//  Created by 강관구 on 2022/03/07.
//

import XCTest
@testable import DomainLayer

class EntityTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func testExecute() {
        let otpModel = OtpModel(id: 1, code: "123 123", name: "Google", info: "info1")
        
        XCTAssertNotNil(otpModel)
        XCTAssertEqual(otpModel.id, 1)
    }

}
