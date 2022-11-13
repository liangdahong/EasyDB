//
//  UserInfoTableString.swift
//  EasyDB_Example
//
//  Created by liangdahong on 2022/11/13.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import Foundation
import EasyDB

struct UserInfoTableString: EasyTable {
    typealias Model = String
    static var tableName: String { "UserInfoTableString" }
}
