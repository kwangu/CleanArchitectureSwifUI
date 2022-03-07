//
//  OtpUseCase.swift
//  
//
//  Created by 강관구 on 2022/03/07.
//

import Foundation
import Combine

protocol OtpUseCaseProtocol {
    associatedtype RequestValue
    associatedtype ResponseValue
    var repository: OtpRepositoryProtocol { get }
    
    init(repository: OtpRepositoryProtocol)
    func execute(value: RequestValue) -> ResponseValue
}
