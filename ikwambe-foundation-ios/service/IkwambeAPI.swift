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
import JWTDecode

class IkwambeAPI: ObservableObject {
    @Published var isAuthenticated: Bool = false
    static let shared: IkwambeAPI = IkwambeAPI()
    private let keychain: Keychain = Keychain()
    
    private var accessTokenKeychainKey: String = "accessToken"
    private var userIdKeychainKey: String = "userId"

    private let baseURL: String = "https://stichtingikwambe.azurewebsites.net/api"
    
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
    
    var userId: String? {
        get {
            try? keychain.get(userIdKeychainKey)
        }
        set(newValue) {
            guard let userId = newValue else {
                try? keychain.remove(userIdKeychainKey)
                return
            }
            try? keychain.set(userId, key: userIdKeychainKey)
        }
    }
    
    private init() {
        isAuthenticated = accessToken != nil
    }
    
    func login(email: String, password: String, completionHandler:
    @escaping (Bool) -> ()) {
        let data = LoginRequest (
            email: email,
            password: password
        )
                
        AF.request("\(baseURL)/login", method: .post, parameters: data, encoder: JSONParameterEncoder.default).response { response in
            switch response.result {
            case .success(let data):
                if (response.response?.statusCode == 200) {
                    do {
                        let result = try JSONDecoder().decode(LoginResponse.self, from: data!)
                        
                        if (result.accessToken != "") {
                            let jwt = try decode(jwt: result.accessToken)
                            
                            let claim = jwt.claim(name: "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name")
                            if let tokenUserId = claim.string {
                                self.userId = tokenUserId
                            }
                            
                            print(result.accessToken)
                            self.accessToken = result.accessToken
                            
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
    
    func register(firstName: String, lastName: String, email: String, password: String, completionHandler:
    @escaping (Bool) -> ()) {
        let data = RegisterRequest(
            firstName: firstName,
            lastName: lastName,
            email: email,
            password: password,
            subscription: true
        )
                
        AF.request("\(baseURL)/users", method: .post, parameters: data, encoder: JSONParameterEncoder.default).response { response in
            switch response.result {
            case .success(let data):
                if (response.response?.statusCode == 200) {
                    do {
                        let result = try JSONDecoder().decode(RegisterResponse.self, from: data!)
                        
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
        userId = nil
    }
    
    func getStories(completionHandler:
    @escaping ([Story]) -> ()) {
        AF.request("\(baseURL)/stories", method: .get).response { response in
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
    
    func getProjects(completionHandler:
    @escaping ([Project]) -> ()) {
        AF.request("\(baseURL)/waterpumps", method: .get).response { response in
            switch response.result {
            case .success(let data):
                if (response.response?.statusCode == 200) {
                    do {
                        let result = try JSONDecoder().decode([Project].self, from: data!)
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
    
    func getProjectById(projectId: String, completionHandler:
    @escaping (Project) -> ()) {
        AF.request("\(baseURL)/waterpumps/\(projectId)", method: .get).response { response in
            switch response.result {
            case .success(let data):
                if (response.response?.statusCode == 200) {
                    do {
                        let result = try JSONDecoder().decode(Project.self, from: data!)
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
    
    func getPaymentLink(amount: Double, completionHandler:
    @escaping (TransactionResponse) -> ()) {
        let data: Parameters = [
            "currency": "EUR",
            "value": amount
        ]
                
        AF.request("\(baseURL)/transactions/paypal/checkout", method: .get, parameters: data, encoding: URLEncoding(destination: .queryString)).response { response in
            switch response.result {
            case .success(let data):
                if (response.response?.statusCode == 200) {
                    do {
                        let result = try JSONDecoder().decode(TransactionResponse.self, from: data!)
                        
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
    
    func createDonation(userId: String, projectId: String, transactionId: String, comment: String, name: String, completionHandler:
    @escaping (Bool) -> ()) {
        let data = CreateDonationRequest(
            userId: userId,
            projectId: projectId,
            transactionId: transactionId,
            comment: comment,
            name: name
        )
        
        AF.request("\(baseURL)/transactions/paypal/complete1", method: .post, parameters: data, encoder: JSONParameterEncoder.default).response { response in
            switch response.result {
            case .success:
                if (response.response?.statusCode == 201) {
                    completionHandler(true)
                } else {
                    completionHandler(false)
                }
            case .failure(let err):
                print(err.localizedDescription)
                completionHandler(false)
            }
        }.resume()
    }
    
    func verifyTransaction(transactionId: String, completionHandler:
    @escaping (Bool) -> ()) {
        AF.request("\(baseURL)/transactions/db/\(transactionId)", method: .get).response { response in
            switch response.result {
            case .success:
                if (response.response?.statusCode == 200) {
                    completionHandler(true)
                } else {
                    completionHandler(false)
                }
            case .failure(let err):
                print(err.localizedDescription)
                completionHandler(false)
            }
        }.resume()
    }
    
    func getDonationsByUser(bearerToken: String, userId: String, completionHandler:
    @escaping ([Donation]) -> ()) {
        let headers: HTTPHeaders = [.authorization(bearerToken: bearerToken)]
        
        AF.request("\(baseURL)/donations/user/\(userId)", method: .get, headers: headers).response { response in
            switch response.result {
            case .success(let data):
                if (response.response?.statusCode == 200) {
                    do {
                        let result = try JSONDecoder().decode([Donation].self, from: data!)
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
}
