//
//  DonateView.swift
//  ikwambe-foundation-ios
//
//  Created by Luuk Kenselaar on 13/11/2021.
//

import SwiftUI
import Combine

struct DonationView: View {
    @ObservedObject var ikwambeAPI: IkwambeAPI = IkwambeAPI.shared
    @State var transaction: TransactionResponse?
    @State private var amount: Double = 0.00
    
    @State private var customAmount: String = "0"
    @State private var customAmountEnabled: Bool = false
    
    @State private var donateClicked: Bool = false
    @State private var donateVisible: Bool = true
    @State private var continueVisible: Bool = false
    @State private var transactionOpened: Bool = false
    @State private var transactionId: String = ""
    @State private var buttonsEnabled: Bool = true
    let projectId: String
        
    var body: some View {
        VStack {
            Text(NSLocalizedString("by-donating", comment: ""))
                .multilineTextAlignment(.center)
            
            VStack(spacing: 50) {
                
                HStack(spacing: 30) {
                    Button("€ 2") {
                        amount = 2.00
                        customAmount = "0"
                        customAmountEnabled = false
                    }.buttonStyle(DonationAmountButton())
                        .disabled(!buttonsEnabled)

                    Button("€ 5") {
                        amount = 5.00
                        customAmount = "0"
                        customAmountEnabled = false
                    }.buttonStyle(DonationAmountButton())
                        .disabled(!buttonsEnabled)

                    Button("€ 10") {
                        amount = 10.00
                        customAmount = "0"
                        customAmountEnabled = false
                    }.buttonStyle(DonationAmountButton())
                        .disabled(!buttonsEnabled)
                }

                HStack(spacing: 30) {
                    Button("€ 20") {
                        amount = 20.00
                        customAmount = "0"
                        customAmountEnabled = false
                    }.buttonStyle(DonationAmountButton())
                        .disabled(!buttonsEnabled)

                    Button("€ 50") {
                        amount = 50.00
                        customAmount = "0"
                        customAmountEnabled = false
                    }.buttonStyle(DonationAmountButton())
                        .disabled(!buttonsEnabled)
                    
                    Button("Other") {
                        amount = 0.00
                        customAmountEnabled = true
                    }.buttonStyle(DonationAmountButton())
                        .disabled(!buttonsEnabled)
                }
                
                VStack {
                    IkwambeTextField(title: "Amount", field: $customAmount)
                        .keyboardType(.numberPad)
                        .onReceive(Just(customAmount)) { newValue in
                            let filtered = newValue.filter { "0123456789".contains($0) }
                            if filtered != newValue {
                                self.customAmount = filtered
                            }
                        }
                        .disabled(!customAmountEnabled)
                }
                
                VStack {
                    // Only show the buttons when an amount has been selected
                    if (amount != 0.00 || customAmount != "0") {
                        
                        // Only show the donate button when a transaction hasn't been created yet
                        if donateVisible {
                            
                            if (customAmount != "0") {
                                Button("\(NSLocalizedString("donate", comment: "")) € \(customAmount)") {
                                    amount = Double(customAmount)!
                                    customAmountEnabled = false
                                    donateVisible = false
                                    buttonsEnabled = false
                                    donateClicked = true
                                }.buttonStyle(BigOrangeButtonStyle())
                            } else {
                                Button("\(NSLocalizedString("donate", comment: "")) € \(amount, specifier: "%.2f")") {
                                    customAmountEnabled = false
                                    donateVisible = false
                                    buttonsEnabled = false
                                    donateClicked = true
                                }.buttonStyle(BigOrangeButtonStyle())
                            }
                        }
                        
                        // If the donate button has been clicked, show a spinner and get the payment url
                        if donateClicked {
                            if !transactionOpened {
                                ProgressView(NSLocalizedString("loading-payment", comment: ""))
                                .onAppear {
                                    ikwambeAPI.getPaymentLink(amount: amount) { (transactionResponse) in
                                        transactionId = transactionResponse.orderId
                                        UIApplication.shared.open(URL(string: transactionResponse.link)!)
                                        transactionOpened = true
                                    }
                                }
                            }
                        }
                            
                        // If the transaction has been opened, so the continue button
                        if transactionOpened {
                            NavigationLink(destination: DonationSummaryView(amount: amount, projectId: projectId, transactionId: transactionId)) {
                                Text(NSLocalizedString("continue", comment: ""))
                            }.buttonStyle(BigOrangeButtonStyle())
                        }
                    }
                }.padding(.top, 20)
                
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
