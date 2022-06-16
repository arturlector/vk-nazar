//
//  Session.swift
//  vk-nazar
//
//  Created by Artur Igberdin on 07.06.2022.
//

import Foundation
import SwiftKeychainWrapper

//Класс-сервис - кот. выполняет бизнес-логику - управлять токеном
class Session {
    private init() {}
    
    //Глобальная память, константа
    static let shared = Session()
    
    //Keychain
    var accessToken: String {
        get {
            return KeychainWrapper.standard.string(forKey: "accessToken") ?? ""
            
        }
        set(newValue) {
            KeychainWrapper.standard.set(newValue, forKey: "accessToken")
        }
    }
    
    //UserDefaults
    var userid: Int {
        get {
            
            return UserDefaults.standard.integer(forKey: "userId")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "userId")
        }
    }
    var expiresIn: Int { //Сколько секунд действителен токен
        get {
            
            //print(self.expiresIn)
            return UserDefaults.standard.integer(forKey: "expiresIn")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "expiresIn")
        }
    }
    
    //isTokenValid
    
    static var isTokenValid: Bool {
        
        //print(self.expiresIn)
        
        let expiresIn = UserDefaults.standard.integer(forKey: "expiresIn")
        
        let tokenDate = Date(timeIntervalSinceNow: Double(expiresIn))
        let currentDate = Date()
        
        print("tokenDate", tokenDate)
        print("currentDate", currentDate)
        
//        if currentDate < tokenDate {
//            return true
//        } else {
//            return false
//        }
        
        return currentDate < tokenDate
    }
}
