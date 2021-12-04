//
//  ProfileView.swift
//  ikwambe-foundation-ios
//
//  Created by Luuk Kenselaar on 11/11/2021.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var ikwambeAPI: IkwambeAPI = IkwambeAPI.shared
    @State private var value = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            if ikwambeAPI.isAuthenticated {
                Text("Welcome back!")
                    .font(.title3)
            } else {
                HStack {
                    NavigationLink(destination: LoginView()) {
                        Text("Login")
                    }
                    
                    NavigationLink(destination: RegisterView()) {
                        Text("Register")
                    }
                }
            }
            
            if !ikwambeAPI.isAuthenticated {
                Text("Do I need an account?")
                    .font(.title)
                
                Text("An account is fully optional. \nWith an account you can keep track of your donations.")
            }
            
            Text("Stay up-to-date")
                .font(.title)
            
            Toggle("Receive push notifications", isOn: $value)
            
            if ikwambeAPI.isAuthenticated {
                Text("My donations")
                    .font(.title)
                
                Text("No donations have been found")
            }
            
            Spacer()
        }.navigationTitle("Profile")
            .padding(.horizontal, 15)
            .padding(.top, 15)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                if ikwambeAPI.isAuthenticated {
                    Button(action: {
                        ikwambeAPI.logout()
                    }) {
                        Text("Logout")
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
