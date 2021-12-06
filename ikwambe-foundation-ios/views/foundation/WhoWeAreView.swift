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
                Text("The initiative to help out the villages of Ikwambe and Nangonji came from our own chairwoman, Feliciana.")
                
                Text("Feliciana was born and raised in Ikwambe, therefor she has experienced the problems that exist in the village")
                
                Text("Our board members")
                
            }.padding(.horizontal, 15)
            
        }.navigationTitle("Who we are")
    }
}

struct WhoWeAreView_Previews: PreviewProvider {
    static var previews: some View {
        WhoWeAreView()
    }
}
