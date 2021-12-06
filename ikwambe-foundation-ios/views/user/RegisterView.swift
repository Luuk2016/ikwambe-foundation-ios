//
//  SignupView.swift
//  ikwambe-foundation-ios
//
//  Created by Luuk Kenselaar on 11/11/2021.
//

import SwiftUI

struct RegisterView: View {
    @ObservedObject var ikwambeAPI: IkwambeAPI = IkwambeAPI.shared
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""
    @State var isSuccessAlertPresented: Bool = false
    @State var isFailureAlertPresented: Bool = false
    
    var formValid: Bool {
        return firstName.count >= 3 && lastName.count >= 3 && email.count >= 3 && password.count >= 3 && confirmPassword.count >= 3 && password == confirmPassword
    }
    
    var body: some View {
        VStack(spacing: 10) {
            
            IkwambeTextField(title: "First name", field: $firstName)
            
            IkwambeTextField(title: "Last name", field: $lastName)

            IkwambeTextField(title: "Email address", field: $email)

            IkwambeSecureField(title: "Password", field: $password)

            IkwambeSecureField(title: "Confirm your password", field: $confirmPassword)
            
            Button("Register", action: {
                ikwambeAPI.register(firstName: firstName, lastName: lastName, email: email, password: password) { (isSuccess) in
                    if (isSuccess) {
                        print("success!")
                    } else {
                        print("failure!")
                    }
                }
                isFailureAlertPresented = true
            }).disabled(formValid == false)
                .buttonStyle(BigOrangeButtonStyle())
            
            NavigationLink(destination: LoginView()) {
                Text("Login")
            } .buttonStyle(BigBlueButtonStyle())
            
            Spacer()
        }.navigationTitle("Register")
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
