
import Foundation

public protocol EasyTableBase {
    static var tableName: String { get }
}

public protocol EasyTableCodable {
    associatedtype Model
    static func encode(_ model: Model) -> String?
    static func decoder(_ string: String) -> Model?
}

public typealias EasyTable = EasyTableBase & EasyTableCodable
