//
//  ProjectsListView.swift
//  ikwambe-foundation-ios
//
//  Created by Luuk Kenselaar on 11/11/2021.
//

import SwiftUI

struct ProjectsListView: View {
    var body: some View {
        VStack {
            NavigationLink(destination: DonateView()) {
                Text("Donate here")
            }
        }.navigationTitle("Projects")
    }
}

struct ProjectsListView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectsListView()
    }
}
