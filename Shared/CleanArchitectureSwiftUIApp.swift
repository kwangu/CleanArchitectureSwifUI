//
//  CleanArchitectureSwiftUIApp.swift
//  Shared
//
//  Created by 강관구 on 2022/03/07.
//

import SwiftUI
import PresentationLayer

@main
struct CleanArchitectureSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            OtpMainView(viewModel: AppDI.shared.otpViewModel)
        }
    }
}
