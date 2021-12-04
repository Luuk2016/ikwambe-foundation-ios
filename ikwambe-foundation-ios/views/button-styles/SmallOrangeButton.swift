//
//  SmallOrangeButton.swift
//  ikwambe-foundation-ios
//
//  Created by Luuk Kenselaar on 04/12/2021.
//

import SwiftUI

struct SmallOrangeButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 18))
            .foregroundColor(.white)
            .frame(width: 133, height: 47, alignment: .center)
            .padding(5)
            .background(configuration.isPressed ? Color(red: 242 / 255, green: 170 / 255, blue: 61 / 255) : Color(red: 255 / 255, green: 179 / 255, blue: 64 / 255))
            .cornerRadius(10)
    }
}
