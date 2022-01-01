//
//  DonateView.swift
//  ikwambe-foundation-ios
//
//  Created by Luuk Kenselaar on 13/11/2021.
//

import SwiftUI

struct DonateView: View {
    @ObservedObject var ikwambeAPI: IkwambeAPI = IkwambeAPI.shared
    @State var transaction: TransactionResponse?
    @State private var amount: Double = 0
    @Environment(\.openURL) var openURL
    let projectId: String
    
    var body: some View {
        VStack {
            Text(NSLocalizedString("by-donating", comment: ""))
                .multilineTextAlignment(.center)
            
            VStack(spacing: 50) {
                HStack(spacing: 30) {
                    Button("€ 2.00") {
                        amount = 2.00
                    }
                    
                    Button("€ 5.00") {
                        amount = 5.00
                    }
                    
                    Button("€ 10.00") {
                        amount = 10.00
                    }
                }
                
                HStack(spacing: 30) {
                    Button("€ 20.00") {
                        amount = 20.00
                    }
                    
                    Button("€ 50.00") {
                        amount = 50.00
                    }
                    
                    Button("€ 100.00") {
                        amount = 100.00
                    }
                }
                                
                if (amount != 0) {
                    Text(NSLocalizedString("click-to-pay", comment: ""))
                    
                    NavigationLink(destination: DonateSummaryView()) {
                        Text("Donation confirmed")
                    }
                    
                    Button("Donate € \(amount, specifier: "%.2f")") {
                        ikwambeAPI.createDonation(userId: "", projectId: projectId, amount: amount) { (transactionResponse) in
                            openURL(URL(string: transactionResponse.link)!)
                        }
                    }.buttonStyle(BigOrangeButtonStyle())
                }
                
            }.padding(70)
            
            Spacer()
        }.navigationTitle(NSLocalizedString("donate", comment: ""))
    }
}

struct DonateView_Previews: PreviewProvider {
    static var previews: some View {
        DonateView(projectId: "4ae756ac-b37f-4651-b718-9d6b916b7f1e")
    }
}
