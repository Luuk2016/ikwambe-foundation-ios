//
//  ContentView.swift
//  ikwambe-foundation-ios
//
//  Created by Luuk Kenselaar on 11/11/2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var ikwambeAPI: IkwambeAPI = IkwambeAPI.shared

    @State var progressValue: Float = 0.10
    
    var body: some View {
        ScrollView {
            VStack {
                IkwambeHeader(title: "Ikwambe Foundation", image: "child-water")
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Help to build a water pump")
                            .font(Font.title.weight(.medium))

                        IkwambeProjectStatus()
                    }
                    
                    Text("By making a donation to the foundation, you can help us with building a water pump.")

                    Text("At this moment, drinking water isn't available in the village of ikwambe")

                    Text("Stories from Ikwambe")
                        .font(Font.title.weight(.medium))

                    HStack {
                        NavigationLink(destination: StoriesListView()) {
                            Text("Stories from Ikwambe")
                        }.buttonStyle(SmallOrangeButtonStyle())

                        NavigationLink(destination: WhoWeAreView()) {
                            Text("Who we are")
                        }.buttonStyle(SmallOrangeButtonStyle())
                    }
                }.padding(.horizontal, 15)
            }
        }.ignoresSafeArea(edges: .top)
        .navigationBarHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
