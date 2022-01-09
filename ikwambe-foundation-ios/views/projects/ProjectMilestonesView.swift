//
//  ProjectMilestones.swift
//  ikwambe-foundation-ios
//
//  Created by Luuk Kenselaar on 09/01/2022.
//

import SwiftUI

struct ProjectMilestonesView: View {
    var body: some View {
        ScrollView {
            IkwambeHeader(title: NSLocalizedString("project-milestones", comment: ""), image: "child-water-2")
            
        }.ignoresSafeArea(edges: .top)
    }
}

struct ProjectMilestones_Previews: PreviewProvider {
    static var previews: some View {
        ProjectMilestonesView()
    }
}
