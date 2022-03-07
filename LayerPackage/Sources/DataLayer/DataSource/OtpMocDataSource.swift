//
//  OtpMocDataSource.swift
//  
//
//  Created by 강관구 on 2022/03/07.
//

import Foundation
import Combine
import DomainLayer

public final actor OtpMocDataSource {
    var mockDatas: [OtpModel] = [
        OtpModel(id: 0, code: "123 123", name: "Google", info: "sample@google.com"),
        OtpModel(id: 1, code: "345 345", name: "Naver", info: "sample@naver.com"),
        OtpModel(id: 2, code: "678 678", name: "KaKao", info: "sample@kakao.com")
    ]
    
    public init() {}
}

extension OtpMocDataSource: OtpDataSourceProtocol {
    public func insertOtp(value: InsertOtpRequestValue) async throws -> OtpModel {
        guard let name = value.name else { throw OtpError.unknown }
        
        let insertData = OtpModel(id: Int64.random(in: 0..<Int64.max),
                                  code: "123 456",
                                  name: name,
                                  info: value.info ?? "")
        
        self.mockDatas.append(insertData)
        
        return insertData
    }
    
    public func fetchOtpList() async -> [OtpModel] {
        return mockDatas
    }
}
