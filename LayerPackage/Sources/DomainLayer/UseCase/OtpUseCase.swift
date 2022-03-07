//
//  File.swift
//  
//
//  Created by 강관구 on 2022/03/07.
//

import Foundation
import Combine

// Fetch OtpList
public struct FetchOtpListUseCase: OtpUseCaseProtocol {
    typealias RequestValue = Void
    typealias ResponseValue = AnyPublisher<[OtpModel], Never>
    
    let repository: OtpRepositoryProtocol
    
    public init(repository: OtpRepositoryProtocol) {
        self.repository = repository
    }
    
    public func execute(value: Void) -> AnyPublisher<[OtpModel], Never> {
        return repository.fetchOtpList()
    }
}

//Insert Otp
public struct InsertOtpRequestValue {
    public let name: String?
    public let secretKey: String?
    public let info: String?
    
    public init(name: String? = nil,
                secretKey: String? = nil,
                info: String? = nil) {
        self.name = name
        self.secretKey = secretKey
        self.info = info
    }
}

public struct InsertOtpUseCase: OtpUseCaseProtocol {
    typealias RequestValue = InsertOtpRequestValue
    typealias ResponseValue = AnyPublisher<OtpModel, Error>
    let repository: OtpRepositoryProtocol
    
    public init(repository: OtpRepositoryProtocol) {
        self.repository = repository
    }
    
    public func execute(value: InsertOtpRequestValue) -> AnyPublisher<OtpModel, Error> {
        return repository.insertOtp(value: value)
    }
}
