//
//  TableViewController.swift
//  TSDX
//
//  Created by zwj on 2019/7/3.
//  Copyright © 2019 TSDX. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tableView = UITableView()
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = .red
        let head = UIView()
        head.backgroundColor = .blue
        head.frame = CGRect.init(x: 0, y: 0, width: tableView.bounds.width, height: 100)
        tableView.tableHeaderView = head
        let footer = UIView()
        footer.frame = CGRect.init(x: 0, y: 0, width: tableView.bounds.width, height: 100)
        footer.backgroundColor = .orange
        tableView.tableFooterView = footer
        if #available(iOS 11.0, *) {
//            tableView.insetsContentViewsToSafeArea = true
        } else {
            // Fallback on earlier versions
        }
    }
}

extension TableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
}
