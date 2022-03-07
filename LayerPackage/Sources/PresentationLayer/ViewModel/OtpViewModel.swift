//
//  File.swift
//  
//
//  Created by 강관구 on 2022/03/07.
//

import Foundation
import Combine
import DomainLayer

public class OtpViewModel: ObservableObject {
    @Published public var otpList = [OtpModel]()
    
    private let fetchOtpListUseCase: FetchOtpListUseCase?
    private let insertOtpUseCase: InsertOtpUseCase?
    
    private var bag = Set<AnyCancellable>()
    
    public init(fetchOtpListUseCase: FetchOtpListUseCase? = nil,
                insertOtpUseCase: InsertOtpUseCase? = nil) {
        self.fetchOtpListUseCase = fetchOtpListUseCase
        self.insertOtpUseCase = insertOtpUseCase
    }
    
    public func executeFetchOtpList() {
        self.fetchOtpListUseCase?.execute(value: ())
            .assign(to: \.otpList, on: self)
            .store(in: &bag)
    }
    
    public func executeInsertOtp(name: String?, secretKey: String?, info: String?) {
        self.insertOtpUseCase?.execute(value: InsertOtpRequestValue(name: name,
                                                                            secretKey: secretKey,
                                                                            info: info))
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                    break
                }
            }, receiveValue: { service in
                self.otpList.append(service)
            })
            .store(in: &bag)
    }
}
