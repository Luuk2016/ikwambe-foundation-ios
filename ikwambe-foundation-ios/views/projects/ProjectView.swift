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
            VStack(alignment: .center, spacing: 20) {
                Text("Our current progression")
                    .font(Font.title.weight(.medium))
                Text("For this project we need 27500, we already have 0.")
                
                NavigationLink(destination: DonateView(projectId: "4ae756ac-b37f-4651-b718-9d6b916b7f1e")) {
                    Text("Donate now")
                }
                
                Text("Overview")
                    .font(Font.title.weight(.medium))
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut molestie nunc scelerisque, suscipit metus feugiat, interdum augue. Nam dolor mauris, euismod sed lectus ut, hendrerit rutrum libero. Vestibulum facilisis quam rhoncus pharetra mattis. Nulla facilisi. Curabitur ex ligula, ornare vel ex sed, fringilla iaculis mauris.")
                
                Text("The current situation")
                    .font(Font.title.weight(.medium))
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut molestie nunc scelerisque, suscipit metus feugiat, interdum augue. Nam dolor mauris, euismod sed lectus ut, hendrerit rutrum libero. Vestibulum facilisis quam rhoncus pharetra mattis. Nulla facilisi. Curabitur ex ligula, ornare vel ex sed, fringilla iaculis mauris.")
                
            }
        }.navigationTitle("Build a water pump")
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
        ProjectView()
    }
}
