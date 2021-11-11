//
//  ProfileView.swift
//  ikwambe-foundation-ios
//
//  Created by Luuk Kenselaar on 11/11/2021.
//

import SwiftUI

struct ProfileView: View {
    @State private var value = true
    @State private var login = true
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
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
            
            Text("Updates")
                .font(.title)
            Toggle("Keep me up-to-date ", isOn: $value)
            
            Text("My donations")
                .font(.title)
            
            if !login {
                Text("Please login/signup to keep track of your donations")
            } else {
                Text("No donations have been found")
            }
            
            Spacer()
        }.navigationTitle("Profile")
            .padding(.horizontal, 15)
            .padding(.top, 15)
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
