//
//  ViewController.swift
//  EasyDB
//
//  Created by liangdahong on 11/12/2022.
//  Copyright (c) 2022 liangdahong. All rights reserved.
//

import UIKit
import EasyDB
import SVProgressHUD

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AccountManager.shared.save(1)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let alert = UIAlertController(title: "切换数据库", message: nil, preferredStyle: .alert)
        
        alert.addAction(.init(title: "\(UserInfoTable0.self) 保存数据", style: .default, handler: { (_) in
            (1...100).forEach { _ in
                DispatchQueue.global().async {
                    WOADB.current?.insert(table: UserInfoTable0.self, id: 0, model: .init(id: 0, name: "哈哈\(Date().description)"))
                    WOADB.current?.insert(table: UserInfoTable2.self, id: 0, model: "\(Date().description)")
                    WOADB.current?.insert(table: UserInfoTableInt.self, id: 0, model: Int(arc4random()))
                    WOADB.current?.insert(table: UserInfoTableInt64.self, id: 0, model: Int64(arc4random()))
                }
            }
        }))
        
        alert.addAction(.init(title: "\(UserInfoTable0.self) 查询数据", style: .default, handler: { (_) in
            if let data = WOADB.current?.query(table: UserInfoTable0.self, id: 0) {
                SVProgressHUD.showSuccess(withStatus: "\(data.id) \(data.name)")
            } else {
                SVProgressHUD.showSuccess(withStatus: "没有查询到数据")
            }
        }))
        
        alert.addAction(.init(title: "\(UserInfoTable1.self) 保存数据", style: .default, handler: { (_) in
            WOADB.current?.insert(table: UserInfoTable1.self, id: 0, model: .init(tag: 1, arr: ["\(Date().description)","\(Date().description)","\(Date().description)","\(Date().description)","\(Date().description)"], arr2: ["xxx", "\("\(Date().description)")"]))
        }))
        
        alert.addAction(.init(title: "\(UserInfoTable1.self) 查询数据", style: .default, handler: { (_) in
            if let data = WOADB.current?.query(table: UserInfoTable1.self, id: 0) {
                SVProgressHUD.showSuccess(withStatus: "\(data)")
            } else {
                SVProgressHUD.showSuccess(withStatus: "没有查询到数据")
            }
        }))
        
        alert.addAction(.init(title: "切换账号", style: .default, handler: { (_) in
            AccountManager.shared.save(Int64(arc4random()))
        }))
        
        alert.addAction(.init(title: "取消", style: .default))
        
        present(alert, animated: true)
    }
}
