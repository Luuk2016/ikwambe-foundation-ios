//
//  SmallBlueButton.swift
//  ikwambe-foundation-ios
//
//  Created by Luuk Kenselaar on 04/12/2021.
//

import SwiftUI

struct SmallBlueButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 18))
            .foregroundColor(.white)
            .frame(width: 133, height: 47, alignment: .center)
            .padding(5)
            .background(configuration.isPressed ? Color(red: 60 / 255, green: 148 / 255, blue: 242 / 255) : Color(red: 64 / 255, green: 156 / 255, blue: 255 / 255))
            .cornerRadius(10)
    }
}
