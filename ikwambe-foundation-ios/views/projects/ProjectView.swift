//
//  ProjectView.swift
//  ikwambe-foundation-ios
//
//  Created by Luuk Kenselaar on 11/11/2021.
//

import SwiftUI

struct ProjectView: View {
    let images: [String] = ["current-situation-1", "current-situation-2"]
    
    var body: some View {
        ScrollView {
            IkwambeHeader(title: NSLocalizedString("build-a-water-pump", comment: ""), image: "child-water-2")
            
            VStack(alignment: .leading, spacing: 15) {
                IkwambeProjectStatus()

                Text(NSLocalizedString("overview", comment: ""))
                    .font(Font.title.weight(.medium))
                Text(NSLocalizedString("project-overview", comment: ""))

                HStack {
                    NavigationLink(destination: ProjectMilestonesView()) {
                        Text(NSLocalizedString("milestones", comment: ""))
                    }.buttonStyle(SmallBlueButtonStyle())
                }

                Text(NSLocalizedString("the-current-situation", comment: ""))
                    .font(Font.title.weight(.medium))
                
                IkwambeImageCarousel(images: images)

                NavigationLink(destination: CurrentSituationView()) {
                    Text(NSLocalizedString("read-more", comment: ""))
                }.buttonStyle(SmallBlueButtonStyle())
                
            }.padding(.horizontal, 15)
        }.ignoresSafeArea(edges: .top)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: shareView) {
                    Image(systemName: "square.and.arrow.up")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 26, height: 26)
                }
            }
        }
    }
    
    func shareView() {
       guard let urlShare = URL(string: "https://stichtingikwambe.com/") else { return }
       let activityVC = UIActivityViewController(activityItems: [urlShare], applicationActivities: nil)
       UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
    }
}

struct ProjectView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectView()
    }
}
