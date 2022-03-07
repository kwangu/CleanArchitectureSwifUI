//
//  OtpViewModelTests.swift
//  
//
//  Created by 강관구 on 2022/03/07.
//

import XCTest
import Combine
@testable import DomainLayer
@testable import PresentationLayer
import DataLayer

class OtpViewModelTests: XCTestCase {
    
    var viewModel: OtpViewModel?
    private var bag: Set<AnyCancellable> = Set<AnyCancellable>()

    override func setUpWithError() throws {
        let fetchOtpListUseCase = FetchOtpListUseCase(repository: FackeOtpRepository())
        let insertOtpUseCase = InsertOtpUseCase(repository: FackeOtpRepository())
        viewModel = OtpViewModel(fetchOtpListUseCase: fetchOtpListUseCase, insertOtpUseCase: insertOtpUseCase)
        
        guard viewModel != nil else {
            XCTFail("ViewModel is nil")
            return
        }
    }
    
    func testFetchOtpList() {
        // XCTestExpectation 비동기 호출
        let expectation = XCTestExpectation(description: self.description)
        
        viewModel?.$otpList
            .sink(receiveValue: { otps in
                guard otps.count > 0 else {
                    return
                }
                XCTAssertNotNil(otps)
                for otp in otps {
                    XCTAssertNotNil(otp.id)
                    XCTAssertNotNil(otp.name)
                }
                
                // 작업 완료
                expectation.fulfill()
            })
            .store(in: &bag)
        
        viewModel?.executeFetchOtpList()
        
        wait(for: [expectation], timeout: 1)
    }
    
    func testInsertOtp() {
        let expectation = XCTestExpectation(description: self.description)
        let name = "Google"
        let info = "test@google.com"
        let sercretKey = "123123"
        
        viewModel?.$otpList
            .sink(receiveValue: { otps in
                guard let otp = otps.last else {
                    return
                }
                XCTAssertNotNil(otp)
                XCTAssertNotNil(otp.id)
                XCTAssertEqual(otp.name, name)
                XCTAssertEqual(otp.info, info)
                expectation.fulfill()
            })
            .store(in: &bag)
        
        viewModel?.executeInsertOtp(name: name,
                                        secretKey: sercretKey,
                                        info: info)
        
        wait(for: [expectation], timeout: 1)
    }

}
