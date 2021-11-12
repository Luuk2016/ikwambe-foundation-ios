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
    
    func login(email: String, password: String) {
        
    }
    
    func signup(fullname: String, email: String, password: String) {
        
    }
    
    func logout() {
        accessToken = nil
    }
    
    func getStories() {
        
    }
}
