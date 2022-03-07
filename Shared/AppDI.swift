//
//  AppDI.swift
//  CleanArchitectureSwiftUI
//
//  Created by 강관구 on 2022/03/07.
//

import Foundation
import DomainLayer
import DataLayer
import PresentationLayer

public class AppDI: AppDIProtocol {
    
    static let shared = AppDI()
    
    public lazy var otpViewModel: OtpViewModel = {
        
        // MARK: Data Layer
        // DEV, PRODUCT 분기 필요
        let dataSource: OtpDataSourceProtocol
        dataSource = OtpMocDataSource()

        let repository = OtpRepository(dataSource: dataSource)

        // MARK: Domain Layer
        let fetchOtpListUseCase = FetchOtpListUseCase(repository: repository)
        let insertOtpUseCase = InsertOtpUseCase(repository: repository)

        // MARK: Presentation
        let viewModel = OtpViewModel(fetchOtpListUseCase: fetchOtpListUseCase,
                                     insertOtpUseCase: insertOtpUseCase)
        
        return viewModel
        
    }()
    
}
