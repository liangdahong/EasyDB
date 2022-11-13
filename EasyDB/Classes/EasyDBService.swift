
import Foundation

public protocol EasyDBService {
    func creatTable(_ tables: [EasyTableBase.Type])
    func insert<T: EasyTable>(table: T.Type, id: Int64, model: T.Model)
    func query<T: EasyTable>(table: T.Type, id: Int64) -> T.Model?
}
