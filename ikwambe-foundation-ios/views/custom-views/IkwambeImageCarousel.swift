//
//  IkwambeProjectImageCarousel.swift
//  ikwambe-foundation-ios
//
//  Created by Luuk Kenselaar on 08/12/2021.
//

import SwiftUI

struct IkwambeImageCarousel: View {
    let images: [String]
    
    var body: some View {
        HStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(images, id: \.self) { image in
                        HStack(spacing: 15) {
                            VStack {
                                Image(image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 175, height: 175, alignment: .center)
                                    .cornerRadius(10)
                            }
                            
                        }.padding(.trailing, 10)
                    }
                }
            }
        }
    }
}
