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
            NavigationLink(destination: DonateView(projectId: "138eef32-5e38-4c7d-9c18-d8f22afca86a")) {
                Text("Donate to Ikwambe Waterpump")
            }
        }.navigationTitle("Projects")
    }
}

struct ProjectsListView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectsListView()
    }
}
