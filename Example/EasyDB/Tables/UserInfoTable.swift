
import Foundation
import EasyDB

struct UserInfoTable: Table {
    typealias Model = UserInfo
    static var tableName: String { "t_user" }
}

struct UserInfo: Codable {
    let id: Int
    let name: String
}
