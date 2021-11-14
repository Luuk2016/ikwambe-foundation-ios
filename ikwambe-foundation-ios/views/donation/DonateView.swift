//
//  DonateView.swift
//  ikwambe-foundation-ios
//
//  Created by Luuk Kenselaar on 13/11/2021.
//

import SwiftUI

struct DonateView: View {
    @ObservedObject var ikwambeAPI: IkwambeAPI = IkwambeAPI.shared
    @Environment(\.openURL) var openURL
    let projectId: String
    @State private var amount: Double = 0
    @State private var paymentMethodSelected: Bool = false
    @State var transaction: PayPalTransactionResponse?
    
    var body: some View {
        VStack {
            Text("By donating, you will help to bring clean water to Ikwambe. Please select an amount below:").multilineTextAlignment(.center)
            
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
                    Text("Select payment method")
                    
                    Button("PayPal") {
                        paymentMethodSelected = true
                    }
                }
                
                if (paymentMethodSelected) {
                    Text("Click the button below to pay")
                    
                    Button("Donate € \(amount, specifier: "%.2f")") {
                        ikwambeAPI.createDonation(userId: "", projectId: projectId, amount: amount) { (transactionResponse) in
                            openURL(URL(string: transactionResponse.link)!)
                        }
                    }
                }
                
            }.padding(70)
            
            Spacer()
        }.navigationTitle("Donate")
    }
}

struct DonateView_Previews: PreviewProvider {
    static var previews: some View {
        DonateView(projectId: "138eef32-5e38-4c7d-9c18-d8f22afca86a")
    }
}
