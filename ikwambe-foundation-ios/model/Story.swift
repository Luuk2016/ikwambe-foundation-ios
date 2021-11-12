//
//  Story.swift
//  ikwambe-foundation-ios
//
//  Created by Luuk Kenselaar on 12/11/2021.
//

import Foundation

struct Story: Codable {
    let storyId: String
    let title: String
    let imageURL: String
    let publishDate: String
    let summary: String
    let description: String
    let author: String
    let partitionKey: String
}
