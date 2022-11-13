
import Foundation
import FMDB
import EasyDB

class EasyDBService {
    
    private let db: FMDatabase
    private let dbQueue: FMDatabaseQueue
    
    init(_ path: String) {
        defer { db.open() }
        db = .init(path: path)
        dbQueue = .init(path: path) ?? .init()
        debugPrint("创建数据库：\(path)")
    }
    
    deinit {
        db.close()
        debugPrint("关闭数据库：\(db.databasePath ?? "")")
    }
}

extension EasyDBService {
    @discardableResult
    public func dbQueue<Result>(_ work: () throws -> Result) rethrows -> Result {
        var result: Result!
        dbQueue.inDatabase { _ in
            if let tmpResult = try? work() {
                result = tmpResult
            } else {
                assertionFailure()
            }
        }
        return result
    }
}

extension EasyDBService: EasyDB.EasyDBService {
    
    func creatTable(_ tables: [EasyTableBase.Type]) {
        dbQueue {
            tables.forEach {
                let sql =
                """
                CREATE TABLE IF NOT EXISTS \($0.tableName)(
                id integer NOT NULL UNIQUE,
                data text,
                PRIMARY KEY (id));
                """
                if db.executeStatements(sql) {
                    debugPrint("创建表 \($0.tableName) 成功")
                } else {
                    assertionFailure()
                    debugPrint("创建表 \($0.tableName) 出错, sql: \(sql)")
                }
            }
        }
    }
    
    func insert<T: EasyTable>(table: T.Type, id: Int64, model: T.Model) {
        dbQueue {
            guard let data = T.encode(model) else {
                assertionFailure()
                return
            }
            let sql = "replace into \(T.tableName)(id, data) values (?, ?);"
            do {
                try db.executeUpdate(sql, values: [id, data])
            } catch {
                debugPrint("操作数据库失败, sql: \(sql), err: \(error.localizedDescription)")
                assertionFailure()
            }
        }
    }
    
    func query<T: EasyTable>(table: T.Type, id: Int64) -> T.Model? {
        dbQueue {
            let sql = "select * from \(T.tableName) where id=?;"
            do {
                let result = try db.executeQuery(sql, values: [id])
                var model: T.Model?
                while result.next() {
                    if let data = result.string(forColumn: "data"),
                       let tmpModel = T.decoder(data) {
                        model = tmpModel
                        result.close()
                    }
                }
                return model
            } catch {
                debugPrint("操作数据库失败, sql: \(sql), err: \(error.localizedDescription)")
                assertionFailure()
                return nil
            }
        }
    }
}