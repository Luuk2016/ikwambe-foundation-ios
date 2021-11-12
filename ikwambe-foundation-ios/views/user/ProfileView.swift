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
                Text("Welcome John Doe")
                    .font(.title3)
            } else {
                Text("Together we can help Ikwambe")
                    .font(.title3)
                
                HStack {
                    NavigationLink(destination: LoginView()) {
                        Text("Login")
                    }
                    
                    NavigationLink(destination: SignupView()) {
                        Text("Signup")
                    }
                }
            }
            
            Text("Updates")
                .font(.title)
            
            Toggle("Stay up-to-date by receiving push notifications.", isOn: $value)
            
            Text("My donations")
                .font(.title)
            
            if ikwambeAPI.isAuthenticated {
                Text("No donations have been found")
            } else {
                Text("Please login/signup to keep track of your donations.")
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
