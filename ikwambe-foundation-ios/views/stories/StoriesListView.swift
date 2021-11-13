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
            Text("Hello World")
            
            Button("Get Stories") {
                ikwambeAPI.getStories()
                { (storiesResponse) in
                    stories = storiesResponse.stories
                    ForEach(stories) { story in
                        
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
