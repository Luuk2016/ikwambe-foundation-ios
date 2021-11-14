//
//  StoriesListView.swift
//  ikwambe-foundation-ios
//
//  Created by Luuk Kenselaar on 11/11/2021.
//

import SwiftUI

struct StoriesListView: View {
    @ObservedObject var ikwambeAPI: IkwambeAPI = IkwambeAPI.shared
    @State var stories: [Story] = []
    
    var body: some View {
        VStack {
            if (stories.isEmpty == false) {
                List(stories) { story in
                    Text(story.title)
                }
            } else {
                ProgressView("Loading stories")
                .onAppear {
                    ikwambeAPI.getStories()
                    { (storiesResponse) in
                        stories = storiesResponse
                    }
                }
            }
        }.navigationTitle("Stories")
    }
}

struct StoriesListView_Previews: PreviewProvider {
    static var previews: some View {
        StoriesListView()
    }
}
