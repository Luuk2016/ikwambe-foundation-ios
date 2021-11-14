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
                Text("Be surprised by the most unique, moving or telling stories of the Ikwambe foundation.\n\nRead the stories of the farmers and residents of Ikwambe.")
                
                if (stories.isEmpty == false) {
                    ForEach(stories) { story in
                        NavigationLink(destination: StoryView(story: story)) {
                            StoryCell(story: story)
                        }
                    }
                } else {
                    ProgressView("Loading stories")
//                    .onAppear {
//                        ikwambeAPI.getStories(){ (storiesResponse) in
//                            stories = storiesResponse
//                        }
//                    }
                }
            }.padding(.horizontal, 15)
            
            
        }.navigationTitle("Stories")
    }
}

struct StoriesListView_Previews: PreviewProvider {
    static var previews: some View {
        StoriesListView()
    }
}
