//
//  SignupResponse.swift
//  ikwambe-foundation-ios
//
//  Created by Luuk Kenselaar on 12/11/2021.
//

import Foundation

struct SignupResponse: Codable {
    let userId: String
    let firstName: String
    let lastName: String
    let email: String
    let password: String
    let subscription: Bool
    let role: Int
    let partitionKey: String
}
