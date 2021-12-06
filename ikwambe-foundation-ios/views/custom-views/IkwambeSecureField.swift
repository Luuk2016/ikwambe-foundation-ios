//
//  IkwambeSecureField.swift
//  ikwambe-foundation-ios
//
//  Created by Luuk Kenselaar on 04/12/2021.
//

import SwiftUI

struct IkwambeSecureField: View {
    let title: String
    
    @Binding var field: String

    init(title: String, field: Binding<String>) {
        self.title = title
        self._field = field
    }

    var body: some View {
        SecureField(title, text: $field)
            .padding(8)
            .cornerRadius(5.0)
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal)
    }
}
