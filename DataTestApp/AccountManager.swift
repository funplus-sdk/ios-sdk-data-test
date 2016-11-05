//
//  AccountManager.swift
//  DataTestApp
//
//  Created by Yuankun Zhang on 6/6/16.
//  Copyright © 2016 funplus. All rights reserved.
//

import Foundation

class AccountManager {
    
//    let UID_LIST_KEY = "com.funplus.sdk.datatestapp.accounts"
//    
//    class Account {
//        let uid: String
//        var level: Int
//        var sessionCount: Int
//        
//        init(s: String) {
//            let components = s.components(separatedBy: ",")
//            self.uid = components[0]
//            self.level = Int(components[1]) ?? 0
//            self.sessionCount = Int(components[2]) ?? 0
//        }
//        
//        init(uid: String) {
//            self.uid = uid
//            self.level = 0
//            self.sessionCount = 0
//        }
//        
//        func login() {
//            sessionCount += 1
//            if sessionCount % 10 == 0 { level += 1 }
//        }
//        
//        func str() -> String {
//            return "\(uid),\(level),\(sessionCount)"
//        }
//    }
//    
//    static var sharedInstance = {
//        return AccountManager()
//    }()
//    
//    var accounts = [String: Account]()
//    
//    init() {
//        if let stored = UserDefaults.standard.stringArray(forKey: UID_LIST_KEY) {
//            for s in stored {
//                let account = Account(s: s)
//                accounts[account.uid] = account
//            }
//        }
//    }
//    
//    deinit {
//        var arr = [String]()
//        for (_, value) in accounts {
//            arr.append(value.str())
//        }
//        
//        UserDefaults.standard.set(arr, forKey: UID_LIST_KEY)
//    }
//    
//    func login(_ uid: String) {
//        let account = accounts[uid] ?? Account(uid: uid)
//        account.login()
//        accounts[uid] = account
//        
//        FunPlusData.sharedInstance.traceUserLogin(userId: uid, level: String(account.level))
//    }
//    
//    func logout() {
//        FunPlusData.sharedInstance.traceUserLogout()
//    }
//    
//    func payment() {
//        
//    }
}
