//
//  CreateDonationRequest.swift
//  ikwambe-foundation-ios
//
//  Created by Luuk Kenselaar on 12/01/2022.
//

import Foundation

struct CreateDonationRequest: Encodable {
    let userId: String
    let projectId: String
    let transactionId: String
    let comment: String
    let name: String
}
