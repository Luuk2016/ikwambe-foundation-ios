//
//  Story.swift
//  ikwambe-foundation-ios
//
//  Created by Luuk Kenselaar on 13/11/2021.
//

import Foundation

struct Story: Decodable, Identifiable {
    var id: String { storyId }
    let storyId: String
    let title: String
    let imageURL: String
    let publishDate: String
    let summary: String
    let description: String
    let author: String
}
