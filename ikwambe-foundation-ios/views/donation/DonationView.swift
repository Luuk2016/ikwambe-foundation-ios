//
//  DonateView.swift
//  ikwambe-foundation-ios
//
//  Created by Luuk Kenselaar on 13/11/2021.
//

import SwiftUI

struct DonationView: View {
    @ObservedObject var ikwambeAPI: IkwambeAPI = IkwambeAPI.shared
    @State var transaction: TransactionResponse?
    @State private var amount: Double = 0.00
    @Environment(\.openURL) var openURL
    let projectId: String
        
    var body: some View {
        VStack {
            Text(NSLocalizedString("by-donating", comment: ""))
                .multilineTextAlignment(.center)
            
            VStack(spacing: 50) {
                
                HStack(spacing: 30) {
                    Button("€ 2") {
                        amount = 2.00
                    }.buttonStyle(DonationAmountButton())

                    Button("€ 5") {
                        amount = 5.00
                    }.buttonStyle(DonationAmountButton())

                    Button("€ 10") {
                        amount = 10.00
                    }.buttonStyle(DonationAmountButton())
                }

                HStack(spacing: 30) {
                    Button("€ 20") {
                        amount = 20.00
                    }.buttonStyle(DonationAmountButton())

                    Button("€ 50") {
                        amount = 50.00
                    }.buttonStyle(DonationAmountButton())
                    
                    Button("€ 100") {
                        amount = 100.00
                    }.buttonStyle(DonationAmountButton())
                }
                                                
                if (amount != 0.00) {
//                    Button("Donate € \(amount, specifier: "%.2f")") {
//                        ikwambeAPI.createDonation(userId: "", projectId: projectId, amount: amount) { (transactionResponse) in
//                            openURL(URL(string: transactionResponse.link)!)
//                        }
//                    }.buttonStyle(BigOrangeButtonStyle())
                    
                    NavigationLink(destination: DonationSummaryView(amount: amount)) {
                        Text("Donation summary")
                    }.buttonStyle(BigOrangeButtonStyle())
                    
                }
                
            }.padding(70)
            
            Spacer()
        }.navigationTitle(NSLocalizedString("donate", comment: ""))
    }
}

struct DonateView_Previews: PreviewProvider {
    static var previews: some View {
        DonationView(projectId: "4ae756ac-b37f-4651-b718-9d6b916b7f1e")
    }
}
