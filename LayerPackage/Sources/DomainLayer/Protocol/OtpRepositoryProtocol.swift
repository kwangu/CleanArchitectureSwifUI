//
//  OtpRepositoryProtocol.swift
//  
//
//  Created by 강관구 on 2022/03/07.
//

import Foundation
import Combine

public protocol OtpRepositoryProtocol {
    func insertOtp(value: InsertOtpRequestValue) -> AnyPublisher<OtpModel, Error>
    func fetchOtpList() -> AnyPublisher<[OtpModel], Never>
}
