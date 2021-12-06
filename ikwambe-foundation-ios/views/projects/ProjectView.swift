//
//  ProjectView.swift
//  ikwambe-foundation-ios
//
//  Created by Luuk Kenselaar on 11/11/2021.
//

import SwiftUI

struct ProjectView: View {
    var body: some View {
        ScrollView {
            IkwambeHeader(title: "Build a water pump", image: "child-water")
            
            VStack(alignment: .leading, spacing: 15) {
                
                IkwambeProjectStatus()

                Text("Overview")
                    .font(Font.title.weight(.medium))
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut molestie nunc scelerisque, suscipit metus feugiat, interdum augue. Nam dolor mauris, euismod sed lectus ut, hendrerit rutrum libero. Vestibulum facilisis quam rhoncus pharetra mattis. Nulla facilisi. Curabitur ex ligula, ornare vel ex sed, fringilla iaculis mauris.")

                HStack {
                    NavigationLink(destination: ProfileView()) {
                        Text("Milestones")
                    }.buttonStyle(SmallBlueButtonStyle())

                    NavigationLink(destination: ProfileView()) {
                        Text("Donations")
                    }.buttonStyle(SmallBlueButtonStyle())
                }

                Text("The current situation")
                    .font(Font.title.weight(.medium))
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut molestie nunc scelerisque, suscipit metus feugiat, interdum augue. Nam dolor mauris, euismod sed lectus ut, hendrerit rutrum libero. Vestibulum facilisis quam rhoncus pharetra mattis. Nulla facilisi. Curabitur ex ligula, ornare vel ex sed, fringilla iaculis mauris.")

                NavigationLink(destination: ProfileView()) {
                    Text("Read more")
                }.buttonStyle(SmallBlueButtonStyle())
                
            }.padding(.horizontal, 15)
        }.ignoresSafeArea(edges: .top)
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
