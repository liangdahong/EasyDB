
import Foundation

public protocol DBService {
    func creatTable(_ tables: [TableBase.Type])
    func insert<T: Table>(table: T.Type, id: Int64, model: T.Model)
    func query<T: Table>(table: T.Type, id: Int64) -> T.Model?
}
