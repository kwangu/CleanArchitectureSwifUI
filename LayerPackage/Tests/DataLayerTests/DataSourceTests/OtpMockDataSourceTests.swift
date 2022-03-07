//
//  OtpMockDataSourceTests.swift
//  
//
//  Created by 강관구 on 2022/03/07.
//

import XCTest
@testable import DataLayer
@testable import DomainLayer

class OtpMockDataSourceTests: XCTestCase {
    
    var dataSource: OtpMocDataSource?

    override func setUpWithError() throws {
        dataSource = OtpMocDataSource()
        
        guard dataSource != nil else {
            XCTFail("Not Exist DataSource")
            return
        }
    }
    
    func testInsertOtp() {
        Task {
            let reqValue = InsertOtpRequestValue(name: "Google", secretKey: "123 123", info: "info")
            
            if let service = try await dataSource?.insertOtp(value: reqValue) {
                XCTAssertNotNil(service.id)
                XCTAssertEqual(service.name, reqValue.name)
                XCTAssertEqual(service.info, reqValue.info)
                
            }
        }
    }
    
    func testFecthOtpList() {
        Task {
            if let services = await dataSource?.fetchOtpList() {
                for service in services {
                    XCTAssertNotNil(service.id)
                    XCTAssertNotNil(service.name)
                    XCTAssertNotNil(service.info)
                    XCTAssertNotNil(service.code)
                }
            }
        }
    }

}
