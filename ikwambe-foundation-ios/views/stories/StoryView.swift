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
                if let storyImage = storyImage {
                    Image(uiImage: storyImage)
                        .resizable()
                        .scaledToFit()
                } else {
                    ProgressView("Loading image")
                        .onAppear {
                            ikwambeAPI.getImage(imageURL: story.imageURL) { (image) in
                                self.storyImage = image
                            }
                        }
                }
                
                VStack(alignment: .leading, spacing: 25) {
                    Text(story.summary)
                        .font(Font.headline.weight(.bold))
                    
                    Text(story.description)
                    
                   
                }.padding(.horizontal, 15)
                
                VStack {
                    Text("A story by \(story.author)")
                        .font(Font.headline.weight(.bold))
                }
                
               
                
            }
        }.navigationTitle(story.title)
    }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView(story: Story.testStory1)
    }
}
