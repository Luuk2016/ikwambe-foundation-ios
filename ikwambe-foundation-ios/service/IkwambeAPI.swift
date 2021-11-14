//
//  IkwambeAPI.swift
//  ikwambe-foundation-ios
//
//  Created by Luuk Kenselaar on 11/11/2021.
//

import Foundation
import Alamofire
import KeychainAccess
import UIKit

class IkwambeAPI: ObservableObject {
    @Published var isAuthenticated: Bool = false
    static let shared = IkwambeAPI()
    private let keychain = Keychain()
    private var accessTokenKeychainKey: String = "accessToken"
    private let baseURL: String = "https://ikwambefoundation.azurewebsites.net/api"
    
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
                
        AF.request("\(baseURL)/Login", method: .post, parameters: data, encoder: JSONParameterEncoder.default, headers: headers).response { response in
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
                
        AF.request("\(baseURL)/users", method: .post, parameters: data, encoder: JSONParameterEncoder.default, headers: headers).response { response in
            switch response.result {
            case .success(let data):
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
    
    func getStories(completionHandler:
    @escaping ([Story]) -> ()) {
        let headers: HTTPHeaders = [
            .contentType("application/json")
        ]
        
        AF.request("\(baseURL)/stories", method: .get, headers: headers).response { response in
            switch response.result {
            case .success(let data):
                if (response.response?.statusCode == 200) {
                    do {
                        let result = try JSONDecoder().decode([Story].self, from: data!)
                                                
                        completionHandler(result)

                    } catch {
                        print(error)
                    }
                }
            case .failure(let err):
                print(err)
            }
        }
    }
    
    func getImage(imageURL: String, completionHandler:
    @escaping (UIImage) -> ()) {
        AF.request(imageURL, method: .get).response { response in
            switch response.result {
            case .success(let data):
                if (response.response?.statusCode == 200) {
                    guard let result = UIImage(data: data!, scale: 1) else { return }
                                            
                    completionHandler(result)
                }
            case .failure(let err):
                print(err)
            }
        }
        
        
    }
    
    func createDonation(userId: String, projectId: String, amount: Double, completionHandler:
    @escaping (PayPalTransactionResponse) -> ()) {
        let headers: HTTPHeaders = [
            .contentType("application/json")
        ]
        
        let data: Parameters = [
            "currency": "EUR",
            "value": amount
        ]
                
        AF.request("\(baseURL)/transactions/paypal/checkout", method: .get, parameters: data, encoding: URLEncoding(destination: .queryString), headers: headers).response { response in
            switch response.result {
            case .success(let data):
                if (response.response?.statusCode == 200) {
                    do {
                        let result = try JSONDecoder().decode(PayPalTransactionResponse.self, from: data!)
                        
                        if (result.status == "CREATED") {
                            completionHandler(result)
                        } else {
                            
                        }

                    } catch {
                        print(error.localizedDescription)
                    }
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}
