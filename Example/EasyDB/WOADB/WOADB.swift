
import Foundation
import EasyDB

final class WOADB {
    
    private struct DBInfo {
        let account: Int64
        let db: EasyDB.EasyDBService
    }
    
    private init() { }
    
    private static var currentDBInfo: DBInfo?
    
    private static var lock = NSLock()
    
    static var current: EasyDB.EasyDBService? {
        lock.lock()
        defer { lock.unlock() }
        guard let account = AccountManager.shared.currentAccount else { return nil }
        if let currentDBInfo, currentDBInfo.account == account {
            return currentDBInfo.db
        } else {
            let db = EasyDBService("\(NSHomeDirectory())/Documents/\(account).db")
            db.creatTable([
                UserInfoTable.self,
                MessageTable.self,
                UserInfoTableString.self,
                UserInfoTableInt.self,
                UserInfoTableInt64.self
            ])
            self.currentDBInfo = .init(account: account, db: db)
            return db
        }
    }
}
