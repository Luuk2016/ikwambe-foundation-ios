//
//  LoginView.swift
//  ikwambe-foundation-ios
//
//  Created by Luuk Kenselaar on 11/11/2021.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var ikwambeAPI: IkwambeAPI = IkwambeAPI.shared
    @State var email: String = ""
    @State var password: String = ""
    @State var isFailureAlertPresented: Bool = false
    
    var formValid: Bool {
        return email.count >= 3 && password.count >= 3
    }
    
    var body: some View {
        VStack(spacing: 0) {
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
            
            Button("Login", action: {
                ikwambeAPI.login(email: email, password: password) { (isSuccess) in
                    if (isSuccess == false) {
                        print("failure!")
                        isFailureAlertPresented = true
                    }
                }
            }).disabled(formValid == false)
            
            NavigationLink(destination: SignupView()) {
                Text("Don't have an account?")
            }
            
            Spacer()
                    
        }.navigationTitle("Login")
        .alert(isPresented: $isFailureAlertPresented) {
            Alert(title: Text("Message"), message: Text("Login has failed, please try again"))
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
