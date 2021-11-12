//
//  LoginResponse.swift
//  ikwambe-foundation-ios
//
//  Created by Luuk Kenselaar on 12/11/2021.
//

import Foundation

struct LoginResponse: Codable {
    let accessToken: String
    let tokenType: String
    let expiresIn: Int
}
