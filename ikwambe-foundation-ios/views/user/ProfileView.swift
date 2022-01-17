//
//  ProfileView.swift
//  ikwambe-foundation-ios
//
//  Created by Luuk Kenselaar on 11/11/2021.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var ikwambeAPI: IkwambeAPI = IkwambeAPI.shared
//    @State var donations: [Donation] = Donation.testDonations
    @State var donations: [Donation] = []
        
    func getDonations() {
        ikwambeAPI.getDonationsByUser(bearerToken: ikwambeAPI.accessToken!, userId: ikwambeAPI.userId!) { (donations) in
            self.donations = donations
        }
    }
        
    var body: some View {
        VStack(spacing: 15) {
            if ikwambeAPI.isAuthenticated {
                Text(NSLocalizedString("welcome-back", comment: ""))
                    .font(.title3)
            } else {
                HStack {
                    NavigationLink(destination: LoginView()) {
                        Text(NSLocalizedString("login", comment: ""))
                    }.buttonStyle(SmallBlueButtonStyle())
                    
                    NavigationLink(destination: RegisterView()) {
                        Text(NSLocalizedString("register", comment: ""))
                    }.buttonStyle(SmallBlueButtonStyle())
                }
            }
            
            if !ikwambeAPI.isAuthenticated {
                Text(NSLocalizedString("do-i-need-account", comment: ""))
                    .font(.title)
                
                Text(NSLocalizedString("account-explanation", comment: ""))
            }
            
            if ikwambeAPI.isAuthenticated {
                Text(NSLocalizedString("my-donations", comment: ""))
                    .font(.title)
                
                if (donations.isEmpty == false) {
                    ForEach(donations) { donation in
                        VStack(alignment: .center) {
                            Text("Waterpump")
                                .font(Font.headline.weight(.bold))
                            
                            Text("&euro;\(donation.amount, specifier: "%.2f") on \(String(donation.donationDate.prefix(10)))")
                            
                            if donation.comment != "" {
                                Text("\(donation.comment)")
                                    .italic()
                            }
                            
                        }.multilineTextAlignment(.center)
                    }
                } else {
                    ProgressView("Loading donations")
                    .onAppear {
                        getDonations()
                    }
                }
            }
            
            Spacer()
        }.navigationTitle(NSLocalizedString("profile", comment: ""))
            .padding(.top, 15)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                if ikwambeAPI.isAuthenticated {
                    Button(action: {
                        getDonations()
                    }) {
                        Text(NSLocalizedString("refresh", comment: ""))
                    }
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                if ikwambeAPI.isAuthenticated {
                    Button(action: {
                        ikwambeAPI.logout()
                    }) {
                        Text(NSLocalizedString("logout", comment: ""))
                    }
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
