//
//  OtpMainView.swift
//  
//
//  Created by 강관구 on 2022/03/07.
//

import SwiftUI
import DomainLayer

public struct OtpMainView: View {
    
    @ObservedObject var viewModel: OtpViewModel
    
    public init(viewModel: OtpViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        VStack {
                ZStack {
                    Text("OTP")
                        .font(.headline)
                    
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            viewModel.executeInsertOtp(name: "KKK", secretKey: "KKKKKK", info: "KKK")
                        }, label: {
                            Text("Insert")
                        })
                            .padding()
                    }
                }
                
                
            List {
                ForEach(self.viewModel.otpList) { otp in
                    VStack(alignment: .leading) {
                        Text(otp.name ?? "")
                        Text(otp.code ?? "")
                            .font(.title)
                            .bold()
                        Text(otp.info ?? "")
                    }
                    .padding()
                }
            }
            .listStyle(.plain)
        }
        .onAppear {
            viewModel.executeFetchOtpList()
        }
    }
}

#if DEBUG
struct OtpMainView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = OtpViewModel()
        vm.otpList.append(OtpModel(id: 0, code: "123 123", name: "Google", info: "info"))
        vm.otpList.append(OtpModel(id: 0, code: "123 123", name: "Google", info: "info"))
        return OtpMainView(viewModel: vm)
    }
}
#endif
