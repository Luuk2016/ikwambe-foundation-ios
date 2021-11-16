//
//  DonationConfirmed.swift
//  ikwambe-foundation-ios
//
//  Created by Luuk Kenselaar on 16/11/2021.
//

import SwiftUI

struct DonationConfirmed: View {
    @State private var toggleValue: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Thank your for donating")
                .font(Font.title.weight(.medium)).padding(.bottom, 80)
            
            Toggle("Stay up-to-date", isOn: $toggleValue)
                .padding(.horizontal, 50)
           
            Button("Share donation") {
                shareView()
            }
            
            NavigationLink(destination: StoriesListView()) {
                Text("Read about Ikwambe")
            }

        }.navigationTitle("Donate")
            .padding(.horizontal, 15)
            .padding(.top, 150)
    }
    
    func shareView() {
       guard let urlShare = URL(string: "https://stichtingikwambe.com/") else { return }
       let activityVC = UIActivityViewController(activityItems: [urlShare], applicationActivities: nil)
       UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
   }
}

struct DonationConfirmed_Previews: PreviewProvider {
    static var previews: some View {
        DonationConfirmed()
    }
}
