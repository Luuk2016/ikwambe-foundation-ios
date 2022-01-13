//
//  IkwambeHeader.swift
//  ikwambe-foundation-ios
//
//  Created by Luuk Kenselaar on 05/12/2021.
//

import SwiftUI

struct IkwambeHeader: View {
    let title: String
    let image: String
    
    init(title: String, image: String) {
        self.title = title
        self.image = image
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(image)
                .resizable()
                .scaledToFit()
            Text(title)
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding(10)
        }.edgesIgnoringSafeArea(.top)
    }
}
