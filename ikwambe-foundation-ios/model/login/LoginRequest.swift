//
//  LoginRequest.swift
//  ikwambe-foundation-ios
//
//  Created by Luuk Kenselaar on 12/11/2021.
//

import Foundation

struct LoginRequest: Encodable {
    let email: String
    let password: String
}
