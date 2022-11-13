
import Foundation
import EasyDB

struct MessageTable: EasyTable {
    typealias Model = Message
    static var tableName: String { "t_msg" }
}

struct Message: Codable {
    let tag: Int
    let arr: [String]
    let arr2: [String]
}
