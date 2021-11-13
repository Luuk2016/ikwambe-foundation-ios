//
//  PayPalTransactionResponse.swift
//  ikwambe-foundation-ios
//
//  Created by Luuk Kenselaar on 13/11/2021.
//

import Foundation

struct PayPalTransactionResponse: Codable {
    let message: String
    let link: String
    let orderId: String
    let status: String
}
