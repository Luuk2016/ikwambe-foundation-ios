//
//  WhoWeAreView.swift
//  ikwambe-foundation-ios
//
//  Created by Luuk Kenselaar on 04/12/2021.
//

import SwiftUI

struct WhoWeAreView: View {
    let people: [String : String] = ["Feliciana Mutakyahwa": "foundation-feliciana", "Stephen Ransford": "foundation-stephen", "Max van Vliet": "foundation-max", "Pascalle Essed": "foundation-pascalle", "Jeroen van den Bulk": "foundation-jeroen"]
        
    var body: some View {
        ScrollView {
            VStack {
                IkwambeHeader(title: NSLocalizedString("who-we-are", comment: ""), image: "ikwambe-people")
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(NSLocalizedString("who-we-are-text", comment: ""))

                    Text(NSLocalizedString("our-board-members", comment: ""))
                        .font(Font.title.weight(.medium))
                        .padding(.top, 20)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(people.sorted(by: <), id: \.key) { key, value in
                                HStack(spacing: 15) {
                                    VStack {
                                        Image(value)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 175, height: 175, alignment: .center)
                                            .cornerRadius(10)
                                        
                                        Text(key)
                                    }
                                    
                                }.padding(.trailing, 10)
                            }
                        }
                    }
                    
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
