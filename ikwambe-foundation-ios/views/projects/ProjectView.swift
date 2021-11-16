//
//  ProjectView.swift
//  ikwambe-foundation-ios
//
//  Created by Luuk Kenselaar on 11/11/2021.
//

import SwiftUI

struct ProjectView: View {
    var project: Project
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            
            Text("How we're gonna do it")
                .font(Font.title.weight(.medium))
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut molestie nunc scelerisque, suscipit metus feugiat, interdum augue. Nam dolor mauris, euismod sed lectus ut, hendrerit rutrum libero. Vestibulum facilisis quam rhoncus pharetra mattis. Nulla facilisi. Curabitur ex ligula, ornare vel ex sed, fringilla iaculis mauris.")
            
            Text("Our current progression")
                .font(Font.title.weight(.medium))
            Text("For this project we need \(project.targetGoal, specifier: "%.0f"), we already have \(project.currentTotal, specifier: "%.0f").")
            
            NavigationLink(destination: DonateView(project: project)) {
                Text("Donate now")
            }
            
        }.navigationTitle("Project \(project.nameOfProject)")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: shareView) {
                        Image(systemName: "square.and.arrow.up")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                }
            }
            .padding(.horizontal, 15)
            .padding(.top, 15)
    }
    
    func shareView() {
       guard let urlShare = URL(string: "https://stichtingikwambe.com/") else { return }
       let activityVC = UIActivityViewController(activityItems: [urlShare], applicationActivities: nil)
       UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
   }
}

struct ProjectView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectView(project: Project.testProject)
    }
}
