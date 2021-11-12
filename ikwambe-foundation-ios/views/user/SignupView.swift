//
//  SignupView.swift
//  ikwambe-foundation-ios
//
//  Created by Luuk Kenselaar on 11/11/2021.
//

import SwiftUI

struct SignupView: View {
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""
    
    var body: some View {
        VStack(spacing: 0) {
            TextField("First name", text: $firstName)
                .padding()
                .cornerRadius(5.0)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
            
            TextField("Last name", text: $lastName)
                .padding()
                .cornerRadius(5.0)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
            
            TextField("Email address", text: $email)
                .padding()
                .cornerRadius(5.0)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)

            SecureField("Password", text: $password)
                .padding()
                .cornerRadius(5.0)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
            
            SecureField("Confirm your password", text: $confirmPassword)
                .padding()
                .cornerRadius(5.0)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
            
            Button("Signup", action: {
                
            })
            
            NavigationLink(destination: LoginView()) {
                Text("Already have an account?")
            }
            
            Spacer()
                    
        }.navigationTitle("Signup")
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
