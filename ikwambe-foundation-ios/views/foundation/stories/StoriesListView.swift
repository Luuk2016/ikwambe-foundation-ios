//
//  StoriesListView.swift
//  ikwambe-foundation-ios
//
//  Created by Luuk Kenselaar on 11/11/2021.
//

import SwiftUI

struct StoriesListView: View {
    @ObservedObject var ikwambeAPI: IkwambeAPI = IkwambeAPI.shared
//    @State var stories: [Story] = Story.testStories
    @State var stories: [Story] = []
    
    var body: some View {
        ScrollView {
            VStack {
                IkwambeHeader(title: NSLocalizedString("stories-from-ikwambe", comment: ""), image: "ikwambe-people")
            }
            
            VStack(alignment: .center){
                Text(NSLocalizedString("stories-from-ikwambe-text", comment: ""))
                
                if (stories.isEmpty == false) {
                    ForEach(stories) { story in
                        StoryCell(story: story)
                    }
                } else {
                    ProgressView(NSLocalizedString("loading-stories", comment: ""))
                    .onAppear {
                        ikwambeAPI.getStories(){ (stories) in
                            self.stories = stories
                        }
                    }
                }
            }.padding(.horizontal, 15)
            
        }.ignoresSafeArea(edges: .top)
    }
}

struct StoriesListView_Previews: PreviewProvider {
    static var previews: some View {
        StoriesListView()
    }
}
