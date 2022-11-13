//
//  UserInfoTableInt64.swift
//  EasyDB_Example
//
//  Created by liangdahong on 2022/11/13.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import Foundation
import EasyDB

struct UserInfoTableInt64: EasyTable {
    typealias Model = Int64
    static var tableName: String { "UserInfoTableInt64" }
}
