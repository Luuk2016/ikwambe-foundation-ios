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
            
            VStack(alignment: .center, spacing: 25) {
                Text(NSLocalizedString("current-situation-story", comment: ""))

                NavigationLink(destination: DonationView(projectId: "4ae756ac-b37f-4651-b718-9d6b916b7f1e")) {
                    Text(NSLocalizedString("help-now", comment: ""))
                }.buttonStyle(SmallOrangeButtonStyle())
                
            }.padding(.horizontal, 15)
            
        }.ignoresSafeArea(edges: .top)
    }
}

struct CurrentSituationView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentSituationView()
    }
}
