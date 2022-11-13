
import Foundation

extension TableCodable where Self.Model: Codable {
    
    public static func encode(_ model: Model) -> String? {
        guard let data = try? JSONEncoder().encode(model) else { return nil }
        return .init(data: data, encoding: .utf8)
    }
    
    public static func decoder(_ string: String) -> Model? {
        guard let data = string.data(using: .utf8) else { return nil }
        return (try? JSONDecoder().decode(Model.self, from: data))
    }
}
