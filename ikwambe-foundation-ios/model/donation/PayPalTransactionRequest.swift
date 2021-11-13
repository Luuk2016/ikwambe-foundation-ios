//
//  PaypalTransactionRequest.swift
//  ikwambe-foundation-ios
//
//  Created by Luuk Kenselaar on 13/11/2021.
//

import Foundation

struct PayPalTransactionRequest: Encodable {
    let currency: String
    let value: Double
}
