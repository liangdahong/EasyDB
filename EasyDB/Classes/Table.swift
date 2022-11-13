
import Foundation

public protocol TableBase {
    static var tableName: String { get }
}

public protocol TableCodable {
    associatedtype Model
    static func encode(_ model: Model) -> String?
    static func decoder(_ string: String) -> Model?
}

public typealias EasyTable = TableBase & TableCodable
