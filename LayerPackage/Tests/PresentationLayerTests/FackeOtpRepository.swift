//
//  FackeOtpRepository.swift
//  
//
//  Created by 강관구 on 2022/03/07.
//

import Foundation
import Combine
import DomainLayer

struct FackeOtpRepository: OtpRepositoryProtocol {
    func insertOtp(value: InsertOtpRequestValue) -> AnyPublisher<OtpModel, Error> {
        return Just(OtpModel(id: 0,
                                 code: value.secretKey,
                                 name: value.name,
                                 info: value.info))
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

    func fetchOtpList() -> AnyPublisher<[OtpModel], Never> {

        let mockedList = [
            OtpModel(id: 0, name: "0"),
            OtpModel(id: 1, name: "1"),
            OtpModel(id: 2, name: "2"),
            OtpModel(id: 3, name: "3"),
            OtpModel(id: 4, name: "4")
        ]

        return Just(mockedList)
            .eraseToAnyPublisher()
    }
}

