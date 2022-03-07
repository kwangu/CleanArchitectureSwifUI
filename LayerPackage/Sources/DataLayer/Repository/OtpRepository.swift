//
//  OtpRepository.swift
//  
//
//  Created by 강관구 on 2022/03/07.
//

import Foundation
import DomainLayer
import Combine

public struct OtpRepository: OtpRepositoryProtocol {
    
    private let dataSource: OtpDataSourceProtocol
    
    public init(dataSource: OtpDataSourceProtocol) {
        self.dataSource = dataSource
    }
    
    public func insertOtp(value: InsertOtpRequestValue) -> AnyPublisher<OtpModel, Error> {
        return Just(value)
            .setFailureType(to: Error.self)
            .tryAsyncMap { try await dataSource.insertOtp(value: $0) }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
    public func fetchOtpList() -> AnyPublisher<[OtpModel], Never> {
        return Just(())
            .asyncMap { await dataSource.fetchOtpList() }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
    
}
