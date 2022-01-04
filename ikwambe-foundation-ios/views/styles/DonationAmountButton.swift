//
//  SmallWhiteButtonStyle.swift
//  ikwambe-foundation-ios
//
//  Created by Luuk Kenselaar on 04/01/2022.
//

import SwiftUI

struct DonationAmountButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 24))
            .foregroundColor(configuration.isPressed ? Color.black : Color.white)
            .frame(width: 70, height: 45, alignment: .center)
            .padding(5)
            .background(configuration.isPressed ? Color(red: 60 / 255, green: 148 / 255, blue: 242 / 255) : Color(red: 64 / 255, green: 156 / 255, blue: 255 / 255))
            .cornerRadius(10)
            .shadow(color: .gray, radius: 2, x: 0, y: 2)
    }
}
