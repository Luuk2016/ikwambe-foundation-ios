//
//  Story.swift
//  ikwambe-foundation-ios
//
//  Created by Luuk Kenselaar on 13/11/2021.
//

import Foundation

struct Story: Codable, Identifiable {
    var id: String { storyId }
    let storyId: String
    let title: String
    let imageURL: String
    let publishDate: String
    let summary: String
    let description: String
    let author: String
    
    static let testStory1: Story = .init(storyId: "0", title: "Living in Ikwambe", imageURL: "https://picsum.photos/800/400", publishDate: "14-11-2021", summary: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ultricies metus sed ornare faucibus. Mauris dictum erat ac interdum rhoncus. Aliquam luctus nunc quis leo blandit varius. Duis eu finibus ex, quis auctor felis.", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ultricies metus sed ornare faucibus. Mauris dictum erat ac interdum rhoncus. Aliquam luctus nunc quis leo blandit varius. Duis eu finibus ex, quis auctor felis. Fusce mollis sapien quis pharetra pellentesque. Vestibulum vitae urna elit. Nullam dictum aliquam vulputate. Proin mollis lorem risus, sit amet posuere eros interdum eu. Integer semper mauris augue, id elementum magna laoreet quis. Ut luctus mi lacus, nec pellentesque turpis fringilla sed. Quisque laoreet tristique molestie. Fusce facilisis vulputate orci, ac aliquet nisi vestibulum id. Vestibulum imperdiet scelerisque gravida. Fusce at nibh finibus, accumsan leo sit amet, lobortis nunc. Cras ipsum neque, ullamcorper sit amet nulla sed, tincidunt faucibus est. Integer gravida et metus ac faucibus. Morbi interdum sem sed lectus efficitur tristique. Nulla facilisi. Quisque nec nibh sed metus auctor volutpat sit amet eu nibh. Nunc facilisis tincidunt feugiat. Integer non mattis felis. Morbi sit amet massa aliquam, venenatis quam consequat, pulvinar turpis. Nulla ac nunc enim. ", author: "Luuk Kenselaar")
    
    static let testStory2: Story = .init(storyId: "1", title: "Going to school", imageURL: "https://picsum.photos/800/400", publishDate: "01-10-2021", summary: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ultricies metus sed ornare faucibus. Mauris dictum erat ac interdum rhoncus. Aliquam luctus nunc quis leo blandit varius. Duis eu finibus ex, quis auctor felis.", description: " Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ultricies metus sed ornare faucibus. Mauris dictum erat ac interdum rhoncus. Aliquam luctus nunc quis leo blandit varius. Duis eu finibus ex, quis auctor felis. Fusce mollis sapien quis pharetra pellentesque. Vestibulum vitae urna elit. Nullam dictum aliquam vulputate. Proin mollis lorem risus, sit amet posuere eros interdum eu. Integer semper mauris augue, id elementum magna laoreet quis. Ut luctus mi lacus, nec pellentesque turpis fringilla sed. Quisque laoreet tristique molestie. Fusce facilisis vulputate orci, ac aliquet nisi vestibulum id. Vestibulum imperdiet scelerisque gravida. Fusce at nibh finibus, accumsan leo sit amet, lobortis nunc. Cras ipsum neque, ullamcorper sit amet nulla sed, tincidunt faucibus est. Integer gravida et metus ac faucibus. Morbi interdum sem sed lectus efficitur tristique. Nulla facilisi. Quisque nec nibh sed metus auctor volutpat sit amet eu nibh. Nunc facilisis tincidunt feugiat. Integer non mattis felis. Morbi sit amet massa aliquam, venenatis quam consequat, pulvinar turpis. Nulla ac nunc enim. ", author: "Casper van Genderingen")
    
    static let testStories: [Story] = [
        Story.testStory1,
        Story.testStory2,
        Story.testStory1,
        Story.testStory2,
        Story.testStory1,
        Story.testStory2,
        Story.testStory1,
        Story.testStory2
    ]
}
