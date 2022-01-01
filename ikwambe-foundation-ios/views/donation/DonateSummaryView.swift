//
//  DonateSummaryView.swift
//  ikwambe-foundation-ios
//
//  Created by Luuk Kenselaar on 01/01/2022.
//

import SwiftUI

struct DonateSummaryView: View {
    var amount: Double = 0.00
    @State private var name: String = ""
    @State private var message: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack {
                Image("child-water")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(5)
                
                VStack(alignment: .leading, spacing: 15) {
                    Text("Ikwambe water pump")
                        .font(.title2)
                                        
                    Text(NSLocalizedString("you-donated", comment: "") + " € \(amount)")
                }
            }
            
            Divider()
            
            VStack(alignment: .center) {
                Text(NSLocalizedString("leave-a-message", comment: ""))
                    .font(Font.headline.weight(.bold))
                
                IkwambeTextField(title: NSLocalizedString("your-name", comment: ""), field: $name)

                IkwambeTextField(title: NSLocalizedString("your-message", comment: ""), field: $message)
                
                NavigationLink(destination: DonationConfirmedView()) {
                    Text(NSLocalizedString("continue", comment: ""))
                }.buttonStyle(BigOrangeButtonStyle())
            }.padding(.top, 20)
                        
            Spacer()
        }.navigationTitle(NSLocalizedString("summary", comment: ""))
            .padding(.horizontal, 15)
    }
}

struct DonateSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        DonateSummaryView()
    }
}
