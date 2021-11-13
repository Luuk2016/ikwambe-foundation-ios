//
//  IkwambeAPI.swift
//  ikwambe-foundation-ios
//
//  Created by Luuk Kenselaar on 11/11/2021.
//

import Foundation
import Alamofire
import KeychainAccess

class IkwambeAPI: ObservableObject {
    static let shared = IkwambeAPI()

    private let keychain = Keychain()
    private var accessTokenKeychainKey: String = "accessToken"
    
    @Published var isAuthenticated: Bool = false
    
    var accessToken: String? {
        get {
            try? keychain.get(accessTokenKeychainKey)
        }
        set(newValue) {
            guard let accessToken = newValue else {
                try? keychain.remove(accessTokenKeychainKey)
                isAuthenticated = false
                return
            }
            try? keychain.set(accessToken, key: accessTokenKeychainKey)
            isAuthenticated = true
        }
    }
    
    private init() {
        isAuthenticated = accessToken != nil
    }
    
    func login(email: String, password: String, completionHandler:
    @escaping (Bool) -> ()) {
        let headers: HTTPHeaders = [
            .contentType("application/json")
        ]
        
        let data = LoginRequest (
            email: email,
            password: password
        )
                
        AF.request("https://ikwambefoundation.azurewebsites.net/api/Login", method: .post, parameters: data, encoder: JSONParameterEncoder.default, headers: headers).response { response in
            switch response.result {
            case .success(let data):
                if (response.response?.statusCode == 200) {
                    do {
                        let result = try JSONDecoder().decode(LoginResponse.self, from: data!)
                        
                        if (result.accessToken != "") {
                            DispatchQueue.main.async {
                                print(result.accessToken)
                                self.accessToken = result.accessToken
                            }
                            completionHandler(true)
                        } else {
                            completionHandler(false)
                        }
                    } catch {
                        print(error.localizedDescription)
                    }
                } else {
                    completionHandler(false)
                }
            case .failure(let err):
                print(err.localizedDescription)
                completionHandler(false)
            }
        }
    }
    
    func signup(firstName: String, lastName: String, email: String, password: String, completionHandler:
    @escaping (Bool) -> ()) {
        let headers: HTTPHeaders = [
            .contentType("application/json")
        ]
        
        let data = SignupRequest(
            firstName: firstName,
            lastName: lastName,
            email: email,
            password: password,
            subscription: true
        )
                
        AF.request("https://ikwambefoundation.azurewebsites.net/api/users", method: .post, parameters: data, encoder: JSONParameterEncoder.default, headers: headers).response { response in
            switch response.result {
            case .success(let data):
//                print(response.response?.statusCode)
                if (response.response?.statusCode == 200) {
                    do {
                        let result = try JSONDecoder().decode(SignupResponse.self, from: data!)
                        
                        if (result.userId != "") {
                            completionHandler(true)
                        } else {
                            completionHandler(false)
                        }
                    } catch {
                        print(error.localizedDescription)
                    }
                } else {
                    completionHandler(false)
                }
            case .failure(let err):
                print(err.localizedDescription)
                completionHandler(false)
            }
        }.resume()
    }
    
    func logout() {
        accessToken = nil
    }
    
    func getStories() {
        
    }
    
    func createDonation(userId: String, projectId: String, amount: Double, completionHandler:
    @escaping (Bool) -> ()) {
        completionHandler(true)
    }
}
