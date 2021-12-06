//
//  WhoWeAreView.swift
//  ikwambe-foundation-ios
//
//  Created by Luuk Kenselaar on 04/12/2021.
//

import SwiftUI

struct WhoWeAreView: View {
    var body: some View {
        ScrollView {
            VStack {
                IkwambeHeader(title: "Who we are", image: "child-water")
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("The initiative to help out the villages of Ikwambe and Nangonji came from our own chairwoman, Feliciana.\n\nFeliciana was born and raised in Ikwambe, therefor she has experienced the problems that exist in the village")

                    Text("Our board members")
                        .font(Font.title.weight(.medium))
                    
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
