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
                        Text(NSLocalizedString("help-to-build", comment: ""))
                            .font(Font.title.weight(.medium))

                        IkwambeProjectStatus()
                    }
                    
                    Text(NSLocalizedString("by-making-a-donation", comment: ""))

                    Text(NSLocalizedString("at-this-moment", comment: ""))

                    Text(NSLocalizedString("stories-from-ikwambe", comment: ""))
                        .font(Font.title.weight(.medium))
                    
                    IkwambeHomeCarousel()
                    
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
