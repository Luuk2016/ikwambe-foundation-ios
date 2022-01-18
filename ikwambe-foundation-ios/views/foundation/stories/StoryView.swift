//
//  StoryView.swift
//  ikwambe-foundation-ios
//
//  Created by Luuk Kenselaar on 11/11/2021.
//

import SwiftUI

struct StoryView: View {
    @ObservedObject var ikwambeAPI: IkwambeAPI = IkwambeAPI.shared
    let story: Story
    @State private var storyImage: UIImage? = nil
    
    var body: some View {
        ScrollView {
            VStack {
                IkwambeHeader(title: story.title, image: "child-water")
                
                VStack(alignment: .leading, spacing: 25) {
                    Text(story.summary)
                        .font(Font.headline.weight(.bold))

                    Text(story.description)
                }.padding(.horizontal, 15)

                VStack {
                    Text(NSLocalizedString("a-story-by", comment: "") + story.author)
                        .font(Font.headline.weight(.bold))
                }
            }
        }.ignoresSafeArea(edges: .top)
    }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView(story: Story.testStory1)
    }
}
