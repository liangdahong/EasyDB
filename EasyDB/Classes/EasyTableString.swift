
import Foundation

extension EasyTableCodable where Self.Model == String {
    
    public static func encode(_ model: Model) -> String? { model }
    
    public static func decoder(_ string: String) -> Model? { string }
}
