//
//  IkwambeProjectStatus.swift
//  ikwambe-foundation-ios
//
//  Created by Luuk Kenselaar on 06/12/2021.
//

import SwiftUI

struct IkwambeProjectStatus: View {
    @ObservedObject var ikwambeAPI: IkwambeAPI = IkwambeAPI.shared
    @State var project: Project?
    
    var body: some View {
        if let project = project {
            HStack(spacing: 12) {
                VStack(alignment: .leading, spacing: 10) {
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
                    
                    Text("X people are already helping")
                        .font(.subheadline)
                }
                
                NavigationLink(destination: DonateView(projectId: project.id)) {
                    Text("Help now")
                }.buttonStyle(SmallOrangeButtonStyle())
            }.padding(.top, 10)
        } else {
            ProgressView("Loading project")
            .onAppear {
                ikwambeAPI.getProjectById(projectId: "4ae756ac-b37f-4651-b718-9d6b916b7f1e"){ (project) in
                    self.project = project
                }
            }
        }
    }
}
