//
//  Waterpump.swift
//  ikwambe-foundation-ios
//
//  Created by Luuk Kenselaar on 14/11/2021.
//

import Foundation

struct Project: Codable, Identifiable {
    var id: String { projectId }
    let projectId: String
    let nameOfProject: String
    let description: String
    let currentTotal: Double
    let targetGoal: Double
    let startDate: String
    let endDate: String
    let projectType: String
}
