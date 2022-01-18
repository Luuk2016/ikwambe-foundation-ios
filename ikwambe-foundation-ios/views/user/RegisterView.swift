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
            IkwambeTextField(title: NSLocalizedString("first-name", comment: ""), field: $firstName)
            
            IkwambeTextField(title: NSLocalizedString("last-name", comment: ""), field: $lastName)

            IkwambeTextField(title: NSLocalizedString("email", comment: ""), field: $email)

            IkwambeSecureField(title: NSLocalizedString("password", comment: ""), field: $password)

            IkwambeSecureField(title: NSLocalizedString("confirm-password", comment: ""), field: $confirmPassword)
            
            Button(NSLocalizedString("register", comment: ""), action: {
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
                Text(NSLocalizedString("login", comment: ""))
            } .buttonStyle(BigBlueButtonStyle())
            
            Spacer()
        }.navigationTitle(NSLocalizedString("register", comment: ""))
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
