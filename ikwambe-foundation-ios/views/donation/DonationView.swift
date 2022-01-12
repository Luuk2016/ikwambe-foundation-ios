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
    @State private var donateClicked: Bool = false
    @State private var donateVisible: Bool = true
    @State private var continueVisible: Bool = false
    @State private var transactionOpened: Bool = false
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
                
                VStack {
                    // Only show the buttons when an amount has been selected
                    if (amount != 0.00) {
                        
                        // Only show the donate button when a transaction hasn't been created yet
                        if donateVisible {
                            Button("\(NSLocalizedString("donate", comment: "")) € \(amount, specifier: "%.2f")") {
                                donateVisible = false
                                donateClicked = true
                            }.buttonStyle(BigOrangeButtonStyle())
                        }
                        
                        // If the donate button has been clicked, show a spinner and get the payment url
                        if donateClicked {
                            if !transactionOpened {
                                ProgressView(NSLocalizedString("loading-payment", comment: ""))
                                .onAppear {
                                    ikwambeAPI.getPaymentLink(amount: amount) { (transactionResponse) in
                                        UIApplication.shared.open(URL(string: transactionResponse.link)!)
                                        transactionOpened = true
                                    }
                                }
                            }
                        }
                            
                        // If the transaction has been opened, so the continue button
                        if transactionOpened {
                            NavigationLink(destination: DonationSummaryView(amount: amount)) {
                                Text(NSLocalizedString("continue", comment: ""))
                            }.buttonStyle(BigOrangeButtonStyle())
                        }
                        
//                        FOR DEVELOPMENT ONLY, REMOVE LATER
                        NavigationLink(destination: DonationSummaryView(amount: amount)) {
                            Text("Donation summary")
                        }.buttonStyle(BigOrangeButtonStyle())
                    }
                }.padding(.top, 75)
                
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
