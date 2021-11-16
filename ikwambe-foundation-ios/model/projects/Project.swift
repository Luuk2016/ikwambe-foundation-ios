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
    
    static let testProject: Project = .init(projectId: "0", nameOfProject: "Waterpump", description: "Build a waterpump", currentTotal: 15000.00, targetGoal: 27500.00, startDate: "01-01-2021", endDate: "01-01-2022", projectType: "health_service")
}
