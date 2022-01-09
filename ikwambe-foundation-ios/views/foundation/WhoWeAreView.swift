//
//  WhoWeAreView.swift
//  ikwambe-foundation-ios
//
//  Created by Luuk Kenselaar on 04/12/2021.
//

import SwiftUI

struct WhoWeAreView: View {
    let images: [String] = ["foundation-feliciana", "foundation-stephen", "foundation-max", "foundation-pascalle", "foundation-jeroen"]
    
    var body: some View {
        ScrollView {
            VStack {
                IkwambeHeader(title: NSLocalizedString("who-we-are", comment: ""), image: "ikwambe-people")
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(NSLocalizedString("who-we-are-text", comment: ""))

                    Text(NSLocalizedString("our-board-members", comment: ""))
                        .font(Font.title.weight(.medium))
                        .padding(.top, 20)
                    
                    IkwambeImageCarousel(images: images)
                    
                }.padding(.horizontal, 8)
            }
        }.ignoresSafeArea(edges: .top)
    }
}

struct WhoWeAreView_Previews: PreviewProvider {
    static var previews: some View {
        WhoWeAreView()
    }
}
