//
//  AccountManager.swift
//  EasyDB_Example
//
//  Created by liangdahong on 2022/11/13.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import Foundation

final class AccountManager {
    
    static let shared = AccountManager()
    
    private init() { }
    
    private(set) var currentAccount: Int64?
    
    func save(_ account: Int64) {
        currentAccount = account
    }
}
