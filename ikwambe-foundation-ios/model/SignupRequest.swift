//
//  SignupRequest.swift
//  ikwambe-foundation-ios
//
//  Created by Luuk Kenselaar on 12/11/2021.
//

import Foundation

struct SignupRequest: Encodable {
    let firstName: String
    let lastName: String
    let email: String
    let password: String
}
