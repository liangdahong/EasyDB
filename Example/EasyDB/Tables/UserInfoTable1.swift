
import Foundation
import EasyDB

struct UserInfoTable1: EasyTable {
    typealias Model = Message
    static var tableName: String { "user1" }
}

struct Message: Codable {
    let tag: Int
    let arr: [String]
    let arr2: [String]
}

struct UserInfoTable2: EasyTable {
    typealias Model = String
    static var tableName: String { "UserInfoTable2" }
}

struct UserInfoTableInt: EasyTable {
    typealias Model = Int
    static var tableName: String { "UserInfoTableInt" }
}

struct UserInfoTableInt64: EasyTable {
    typealias Model = Int64
    static var tableName: String { "UserInfoTableInt64" }
}
