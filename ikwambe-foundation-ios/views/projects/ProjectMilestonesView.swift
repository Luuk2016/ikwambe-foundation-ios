//
//  ProjectMilestones.swift
//  ikwambe-foundation-ios
//
//  Created by Luuk Kenselaar on 09/01/2022.
//

import SwiftUI

struct ProjectMilestonesView: View {
    @ObservedObject var ikwambeAPI: IkwambeAPI = IkwambeAPI.shared
    @State var project: Project?
    
    var body: some View {
        ScrollView {
            IkwambeHeader(title: NSLocalizedString("project-milestones", comment: ""), image: "child-water-2")
            
            VStack(spacing: 10) {
                if let project = project {
                    HStack(spacing: 12) {
                        VStack(alignment: .center, spacing: 10) {
                            Text("&euro; \(project.currentTotal, specifier: "%.2f") of &euro; \(project.targetGoal, specifier: "%.0f")")
                                .font(.title3)
                            
                            GeometryReader { geometry in
                                ZStack(alignment: .leading) {
                                    Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
                                        .opacity(0.3)
                                        .foregroundColor(Color(UIColor.systemTeal))
                                    
                                    Rectangle().frame(width: min(CGFloat(project.currentTotal / project.targetGoal)*geometry.size.width, geometry.size.width), height: geometry.size.height)
                                        .foregroundColor(Color(UIColor.systemBlue))
                                        .animation(.linear)
                                }.cornerRadius(45.0)
                            }.frame(height: 15)
                        }
                    }.padding(.top, 10)
                    
                } else {
                    ProgressView(NSLocalizedString("loading-project", comment: ""))
                    .onAppear {
                        ikwambeAPI.getProjectById(projectId: "4ae756ac-b37f-4651-b718-9d6b916b7f1e"){ (project) in
                            self.project = project
                        }
                    }
                }
                
                VStack(alignment: .center, spacing: 10) {
                    Text(NSLocalizedString("milestone-1", comment: ""))
                        .font(Font.headline.weight(.bold))
                    
                    Text(NSLocalizedString("milestone-1-text", comment: ""))
                    
                    Text(NSLocalizedString("milestone-2", comment: ""))
                        .font(Font.headline.weight(.bold))

                    Text(NSLocalizedString("milestone-2-text", comment: ""))
                    
                    Text(NSLocalizedString("milestone-3", comment: ""))
                        .font(Font.headline.weight(.bold))

                    Text(NSLocalizedString("milestone-3-text", comment: ""))
                }.padding(.top, 20)
               
                NavigationLink(destination: DonationView(projectId: "4ae756ac-b37f-4651-b718-9d6b916b7f1e")) {
                    Text(NSLocalizedString("help-now", comment: ""))
                }.buttonStyle(SmallOrangeButtonStyle())
                    .padding(.top )
                
            }.padding(.horizontal, 20)
            
        }.ignoresSafeArea(edges: .top)
    }
}

struct ProjectMilestones_Previews: PreviewProvider {
    static var previews: some View {
        ProjectMilestonesView()
    }
}
