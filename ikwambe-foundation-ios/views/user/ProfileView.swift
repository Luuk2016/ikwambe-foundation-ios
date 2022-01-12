//
//  ProfileView.swift
//  ikwambe-foundation-ios
//
//  Created by Luuk Kenselaar on 11/11/2021.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var ikwambeAPI: IkwambeAPI = IkwambeAPI.shared
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            if ikwambeAPI.isAuthenticated {
                Text(NSLocalizedString("welcome-back", comment: ""))
                    .font(.title3)
            } else {
                HStack(alignment: .center) {
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
                
                Text(NSLocalizedString("no-donations-found", comment: ""))
            }
            
            Spacer()
        }.navigationTitle(NSLocalizedString("profile", comment: ""))
            .padding(.horizontal, 15)
            .padding(.top, 15)
        .toolbar {
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
