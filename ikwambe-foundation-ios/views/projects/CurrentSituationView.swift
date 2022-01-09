//
//  CurrentSituationView.swift
//  ikwambe-foundation-ios
//
//  Created by Luuk Kenselaar on 09/01/2022.
//

import SwiftUI

struct CurrentSituationView: View {
    var body: some View {
        ScrollView {
            IkwambeHeader(title: NSLocalizedString("current-situation", comment: ""), image: "child-water-2")
            
        }.ignoresSafeArea(edges: .top)
    }
}

struct CurrentSituationView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentSituationView()
    }
}
