//
//  Donation.swift
//  ikwambe-foundation-ios
//
//  Created by Luuk Kenselaar on 12/01/2022.
//

import Foundation

struct Donation: Codable, Identifiable {
    var id: String { donationId }
    let donationId: String
    let userId: String
    let projectId: String
    let transactionId: String
    let amount: Double
    let donationDate: String
    let comment: String
    
    static let testDonation: Donation = .init(donationId: "0", userId: "0", projectId: "fake-project-id", transactionId: "fake-tx-id", amount: 100.0, donationDate: "fake-date", comment: "My comment")
    
    static let testDonations: [Donation] = [
        .init(donationId: "1", userId: "0", projectId: "fake-project-id", transactionId: "fake-tx-id", amount: 100.0, donationDate: "fake-date", comment: "My comment"),
        .init(donationId: "2", userId: "0", projectId: "fake-project-id", transactionId: "fake-tx-id", amount: 100.0, donationDate: "fake-date", comment: "My comment")
    ]
}
