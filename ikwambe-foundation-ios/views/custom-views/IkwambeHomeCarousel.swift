//
//  IkwambeHomeCarousel.swift
//  ikwambe-foundation-ios
//
//  Created by Luuk Kenselaar on 08/12/2021.
//

import SwiftUI

struct IkwambeHomeCarousel: View {
    var body: some View {
        HStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    HStack(spacing: 0) {
                        VStack(alignment: .center) {
                            Image("child-water")
                                .resizable()
                                .frame(width: 157, height: 145, alignment: .center)
                                .cornerRadius(10)
                        }.padding()
                        
                        VStack(alignment: .center) {
                            Text(NSLocalizedString("stories-from-ikwambe", comment: ""))
                                .multilineTextAlignment(.center)
                            
                            NavigationLink(destination: StoriesListView()) {
                                Text(NSLocalizedString("read-more", comment: ""))
                            }.buttonStyle(SmallOrangeButtonStyle())
                        }.padding()

                    }.frame(width: 335, height: 175)
                        .background(Color(red: 242 / 255, green: 242 / 255, blue: 247 / 255))
                        .cornerRadius(10)
                    
                    HStack(spacing: 0) {
                        VStack(alignment: .center) {
                            Image("child-water")
                                .resizable()
                                .frame(width: 157, height: 145, alignment: .center)
                                .cornerRadius(10)
                        }.padding()
                        
                        VStack(alignment: .center) {
                            Text(NSLocalizedString("the-people-behind-the-foundation", comment: ""))
                                .multilineTextAlignment(.center)
                            
                            NavigationLink(destination: WhoWeAreView()) {
                                Text(NSLocalizedString("read-more", comment: ""))
                            }.buttonStyle(SmallOrangeButtonStyle())
                        }.padding()

                    }.frame(width: 335, height: 175)
                        .background(Color(red: 242 / 255, green: 242 / 255, blue: 247 / 255))
                        .cornerRadius(10)
                }
            }
        }
    }
}
