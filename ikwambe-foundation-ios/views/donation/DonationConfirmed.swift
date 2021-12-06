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
            VStack {
                Text("Thank you for helping!")
                    .font(Font.title.weight(.medium))
                    .padding(.bottom, 25)
                
                Text("Your money will be used to\nsupport the build of the \nwater pump.")
                    .font(Font.title2.weight(.light))

            }.padding(.bottom, 70)
                .multilineTextAlignment(.center)
            
            Toggle("Keep me up-to-date", isOn: $toggleValue)
                .padding(.bottom, 25)
           
            Button("Spread the word") {
                shareView()
            }.buttonStyle(BigOrangeButtonStyle())
            
            NavigationLink(destination: ContentView()) {
                Text("Continue")
            }.buttonStyle(BigBlueButtonStyle())

        }.navigationTitle("Donate")
            .padding(.horizontal, 50)
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
