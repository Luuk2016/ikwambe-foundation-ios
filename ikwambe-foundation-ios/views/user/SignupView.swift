//
//  SignupView.swift
//  ikwambe-foundation-ios
//
//  Created by Luuk Kenselaar on 11/11/2021.
//

import SwiftUI

struct SignupView: View {
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
                ikwambeAPI.signup(firstName: firstName, lastName: lastName, email: email, password: password)
                { (isSuccess) in
                    if (isSuccess) {
                        print("success!")
                    } else {
                        print("failure!")
                    }
                }
                isFailureAlertPresented = true
                print("test")
            }).disabled(formValid == false)
            
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
