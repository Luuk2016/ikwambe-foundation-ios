//
//  Story.swift
//  ikwambe-foundation-ios
//
//  Created by Luuk Kenselaar on 13/11/2021.
//

import Foundation

struct Story: Codable {
    let StoryId: String
    let Title: String
    let ImageURL: String
    let PublishDate: String
    let Summary: String
    let Description: String
    let Author: String
}
