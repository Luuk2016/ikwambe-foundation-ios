//
//  DonateSummaryView.swift
//  ikwambe-foundation-ios
//
//  Created by Luuk Kenselaar on 01/01/2022.
//

import SwiftUI

struct DonationSummaryView: View {
    @ObservedObject var ikwambeAPI: IkwambeAPI = IkwambeAPI.shared

    let amount: Double
    let projectId: String
    let transactionId: String
    
    @State private var name: String = ""
    @State private var message: String = ""
    @State private var continueSuccessActive: Bool = false
    @State private var continueFailedActive: Bool = false
    @State private var showSpinner: Bool = false
    @State private var confirmVisible: Bool = true
    @State private var confirmClicked: Bool = false
    @State private var showError: Bool = false
    @State private var formsActive: Bool = true
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack {
                Image("child-water")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 120)
                    .cornerRadius(5)
                
                VStack(alignment: .leading, spacing: 15) {
                    Text("Ikwambe water pump")
                        .font(.title2)
                                        
                    Text(NSLocalizedString("you-donated", comment: "") + " € \(amount)0")
                }
            }
            
            Divider()
            
            VStack(alignment: .center) {
                Text(NSLocalizedString("leave-a-message", comment: ""))
                    .font(Font.headline.weight(.bold))
                    .padding(.bottom, 5)
                
                Text(NSLocalizedString("please-note-public", comment: ""))
                    .font(Font.headline.weight(.light))
                
                IkwambeTextField(title: NSLocalizedString("your-name", comment: ""), field: $name).disabled(!formsActive)

                IkwambeTextField(title: NSLocalizedString("your-message", comment: ""), field: $message).disabled(!formsActive)
                
                if confirmVisible {
                    Button("Confirm donation") {
                        confirmClicked = true
                        confirmVisible = false
                        
                    }.buttonStyle(BigOrangeButtonStyle())
                }
                
                if confirmClicked {
                    ProgressView("Validating transaction")
                    .onAppear {
                        ikwambeAPI.createDonation(userId: "", projectId: projectId, transactionId: transactionId, comment: message, name: name) { (donationResponse) in
                            print(donationResponse)
                            if donationResponse {
            
                                ikwambeAPI.verifyTransaction(transactionId: transactionId) { (transactionResponse) in
                                    print(transactionResponse)
            
                                    if transactionResponse {
                                        confirmClicked = false
                                        continueSuccessActive = true
                                        formsActive = false
                                    } else {
                                        showError = true
                                        confirmClicked = false
                                        continueFailedActive = true
                                        formsActive = false
                                    }
                                }
                            } else {
                                showError = true
                                confirmClicked = false
                                continueFailedActive = true
                                formsActive = false
                            }
                        }
                    }
                }
                
                if continueSuccessActive {
                    NavigationLink(destination: DonationConfirmedView()) {
                        Text(NSLocalizedString("continue", comment: ""))
                    }.buttonStyle(BigOrangeButtonStyle())
                }
                
                if continueFailedActive {
                    NavigationLink(destination: ContentView()) {
                        Text(NSLocalizedString("continue", comment: ""))
                    }.buttonStyle(BigOrangeButtonStyle())
                }
                
                if showError {
                    Text("Payment failed, please try again later")
                }
            
            }.padding(.top, 20)
                      
            Spacer()
        }.navigationTitle(NSLocalizedString("summary", comment: ""))
        .padding(.horizontal, 15)
        .navigationBarBackButtonHidden(true)
    }
}

struct DonateSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        DonationSummaryView(amount: 0.00, projectId: "", transactionId: "")
    }
}
