
import Foundation

extension TableCodable where Self.Model == Int64 {
    
    public static func encode(_ model: Model) -> String? { String(model) }
    
    public static func decoder(_ string: String) -> Model? { Model(string) }
}
