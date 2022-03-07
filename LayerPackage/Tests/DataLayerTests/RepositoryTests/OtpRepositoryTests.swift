//
//  OtpRepositoryTests.swift
//  
//
//  Created by 강관구 on 2022/03/07.
//

import XCTest
import Combine
@testable import DataLayer
@testable import DomainLayer

class OtpRepositoryTests: XCTestCase {
    
    var repository: OtpRepository?
    private var bag = Set<AnyCancellable>()

    override func setUpWithError() throws {
        repository = OtpRepository(dataSource: OtpMocDataSource())
        
        guard repository != nil else {
            XCTFail("Not Exist Repository")
            return
        }
    }
    
    func testInsertOtp() {
        let reqValue = InsertOtpRequestValue(name: "Google", secretKey: "123", info: "info1")
        
        repository?.insertOtp(value: reqValue)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let err):
                    XCTFail(err.localizedDescription)
                    break
                }
            }, receiveValue: { otp in
                XCTAssertNotNil(otp)
                XCTAssertNotNil(otp.id)
                XCTAssertEqual(otp.name, reqValue.name)
                XCTAssertEqual(otp.info, reqValue.info)
            })
            .store(in: &bag)
    }

    func testFetchOtpList() {
        repository?.fetchOtpList()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let err):
                    XCTFail(err.localizedDescription)
                    break
                }
            }, receiveValue: { otps in
                XCTAssertGreaterThan(otps.count, 0)
                for otp in otps {
                    XCTAssertNotNil(otp.id)
                    XCTAssertNotNil(otp.name)
                    XCTAssertNotNil(otp.info)
                    XCTAssertNotNil(otp.code)
                }
            })
            .store(in: &bag)
    }

}
