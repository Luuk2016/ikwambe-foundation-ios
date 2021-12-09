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
                Text(NSLocalizedString("thank-you-for-helping", comment: ""))
                    .font(Font.title.weight(.medium))
                    .padding(.bottom, 25)
                
                Text(NSLocalizedString("your-money", comment: ""))
                    .font(Font.title2.weight(.light))

            }.padding(.bottom, 70)
                .multilineTextAlignment(.center)
            
            Toggle(NSLocalizedString("keep-me-up-to-date", comment: ""), isOn: $toggleValue)
                .padding(.bottom, 25)
           
            Button(NSLocalizedString("spread-the-word", comment: "")) {
                shareView()
            }.buttonStyle(BigOrangeButtonStyle())
            
            NavigationLink(destination: ContentView()) {
                Text(NSLocalizedString("continue", comment: ""))
            }.buttonStyle(BigBlueButtonStyle())

        }.navigationTitle(NSLocalizedString("donate", comment: ""))
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
