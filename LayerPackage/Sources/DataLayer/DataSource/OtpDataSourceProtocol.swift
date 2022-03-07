//
//  OtpDataSourceProtocol.swift
//  
//
//  Created by 강관구 on 2022/03/07.
//

import Foundation
import Combine
import DomainLayer

public protocol OtpDataSourceProtocol {
    func insertOtp(value: InsertOtpRequestValue) async throws -> OtpModel
    func fetchOtpList() async -> [OtpModel]
}
