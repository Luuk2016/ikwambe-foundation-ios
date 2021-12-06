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
        VStack(spacing: 10) {
    
            IkwambeTextField(title: "Email address", field: $email)
            
            IkwambeSecureField(title: "Password", field: $password)
            
            Button("Login", action: {
                ikwambeAPI.login(email: email, password: password) { (isSuccess) in
                    if (isSuccess == false) {
                        print("failure!")
                        isFailureAlertPresented = true
                    }
                }
            }).disabled(formValid == false)
                .buttonStyle(BigOrangeButtonStyle())
            
            NavigationLink(destination: RegisterView()) {
                Text("Register")
            }.buttonStyle(BigBlueButtonStyle())
            
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
