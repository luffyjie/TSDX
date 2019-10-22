//
//  DiscoveryViewController.swift
//  TSDX
//
//  Created by zwj on 2019/5/3.
//  Copyright © 2019 TSDX. All rights reserved.
//

import UIKit

private let PageSize = 20

class DiscoveryViewController: BasicViewController {
    
    fileprivate var dataSourceCount = PageSize
    
    lazy var tableView: UITableView = {
        let tableview = UITableView.init(frame: .zero, style: .plain)
        tableview.backgroundColor = TSDXLightGray
        tableview.dataSource = self
        tableview.delegate = self;
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableview.showsVerticalScrollIndicator = false
        return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        setupPullToRefresh()
    }
    
    func initUI() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.width.equalTo(TSDXScreenWidth)
            make.height.equalTo(TSDXScreenHeigth - navBarHeight - tabBarHeight)
            make.top.equalToSuperview()
        }
    }

    func setupPullToRefresh() {
        let topPull = PullToRefresh()
        topPull.shouldBeVisibleWhileScrolling = true
        tableView.addPullToRefresh(topPull) { [weak self] in
            let delayTime = DispatchTime.now() + Double(Int64(2 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
            DispatchQueue.main.asyncAfter(deadline: delayTime) {
                self?.tableView.endRefreshing(at: .top)
            }
        }
        
        tableView.addPullToRefresh(PullToRefresh(position: .bottom)) { [weak self] in
            let delayTime = DispatchTime.now() + Double(Int64(2 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
            DispatchQueue.main.asyncAfter(deadline: delayTime) {
                self?.tableView.endRefreshing(at: .bottom)
            }
        }
    }
    
    deinit {
        tableView.removeAllPullToRefresh()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        hidesBottomBarWhenPushed = false;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
}

extension DiscoveryViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourceCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "\((indexPath as NSIndexPath).row)"
        return cell
    }
}

extension DiscoveryViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        hidesBottomBarWhenPushed = true
//        let weex = WeexViewController()
//        self.navigationController?.pushViewController(weex, animated: true)
        navigationController?.pushViewController(StackViewController(), animated: true)
    }
}
