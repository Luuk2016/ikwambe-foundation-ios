//
//  ProjectsListView.swift
//  ikwambe-foundation-ios
//
//  Created by Luuk Kenselaar on 11/11/2021.
//

import SwiftUI

struct ProjectsListView: View {
    @ObservedObject var ikwambeAPI: IkwambeAPI = IkwambeAPI.shared
    @State var projects: [Project] = [Project.testProject]
//    @State var projects: [Project] = []
    
    var body: some View {
        VStack {
            Text("Our current projects:")
            
            if (projects.isEmpty == false) {
                ForEach(projects) { project in
                    NavigationLink(destination: ProjectView(project: project)) {
                        Text(project.nameOfProject)
                    }
                }
            } else {
                ProgressView("Loading projects")
                .onAppear {
                    ikwambeAPI.getProjects(){ (projects) in
                        self.projects = projects
                    }
                }
            }
        }.navigationTitle("Projects")
    }
}

struct ProjectsListView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectsListView()
    }
}
