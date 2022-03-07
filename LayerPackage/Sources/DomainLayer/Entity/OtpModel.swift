//
//  OtpModel.swift
//  
//
//  Created by 강관구 on 2022/03/07.
//

import Foundation

public struct OtpModel: Identifiable {
    public var id: Int64 = 0
    public var code: String?
    public var name: String?
    public var info: String?
    public var period: Int
    
    public init(id: Int64 = 0,
                code: String? = nil,
                name: String? = nil,
                info: String? = nil,
                period: Int = 30) {
        self.id = id
        self.code = code
        self.name = name
        self.info = info
        self.period = period
    }
}
