//
//  StoriesListView.swift
//  ikwambe-foundation-ios
//
//  Created by Luuk Kenselaar on 11/11/2021.
//

import SwiftUI

struct StoriesListView: View {
    @ObservedObject var ikwambeAPI: IkwambeAPI = IkwambeAPI.shared
    @State var stories: [Story] = Story.testStories
//    @State var stories: [Story] = []
    
    var body: some View {
        ScrollView {
            VStack {
                IkwambeHeader(title: "Stories from Ikwambe", image: "child-water")
            }
            
            VStack(alignment: .leading){
                Text("Be surprised by the most unique, moving or telling stories of the Ikwambe foundation.\nRead their stories here.")
                
                if (stories.isEmpty == false) {
                    ForEach(stories) { story in
                        StoryCell(story: story)
                    }
                } else {
                    ProgressView("Loading stories")
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
