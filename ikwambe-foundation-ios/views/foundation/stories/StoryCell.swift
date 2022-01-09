//
//  StoryCell.swift
//  ikwambe-foundation-ios
//
//  Created by Luuk Kenselaar on 14/11/2021.
//

import SwiftUI

struct StoryCell: View {
    @ObservedObject var ikwambeAPI: IkwambeAPI = IkwambeAPI.shared
    let story: Story
    @State private var storyImage: UIImage? = nil
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 10) {
            if let storyImage = storyImage {
                Image(uiImage: storyImage)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(5)
            } else {
                ProgressView(NSLocalizedString("loading-image", comment: ""))
                    .onAppear {
                        ikwambeAPI.getImage(imageURL: story.storyImages[0].imageLink) { (image) in
                            self.storyImage = image
                        }
                    }
            }
            
            Text(story.title)
                .font(.title)
            
            Text(NSLocalizedString("a-story-by", comment: "") + story.author)
                .font(.title3)
                .fontWeight(.light)
            
            Text(story.summary)
            
            NavigationLink(destination: StoryView(story: story)) {
                Text(NSLocalizedString("read-more", comment: ""))
            }.buttonStyle(SmallBlueButtonStyle())
                .padding(.bottom, 20)
            
        }.multilineTextAlignment(.center)
    }
}

struct StoryCell_Previews: PreviewProvider {
    static var previews: some View {
        StoryCell(story: Story.testStory1)
    }
}
