//
//  ArticleDetailViewController.swift
//  TSDX
//
//  Created by zwj on 2019/5/3.
//  Copyright © 2019 TSDX. All rights reserved.
//

import UIKit
import CryptoSwift

private let PageSize = 20

class ArticleDetailViewController: BasicViewController {
    
    
    fileprivate var dataSourceCount = PageSize
    
    lazy var tableView: UITableView = {
        let tableview = UITableView.init(frame: .zero, style: .plain)
        tableview.backgroundColor = TSDXLightGray
        tableview.dataSource = self
        //        tableview.delegate = self
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableview.showsVerticalScrollIndicator = false
        return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showNavBack()

        title = "发现"
        initUI()
        initPullToRefresh()
        showPageStatus(.loading)
        let delayTime = DispatchTime.now() + Double(Int64(2 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: delayTime) {
            self.showPageStatus(.success)
        }
        edgesForExtendedLayout = .all
        
        test()//
        afTest()
    }
    
    func test() {
        let appKey = "1ef9481a166e3f7a"
        let key = "G2cq2k0OpxCJf80MZoYp5p53jiiAcyqc"
        let salt = "123"
        let now = Date()
        let timeInterval:TimeInterval = now.timeIntervalSince1970
        let curtime = Int(timeInterval)
        let query = "good"
        let from = "en";
        let to = "zh-CHS";
        let signType = "v3"
        let str1 = appKey + "\(query)" + "\(salt)" + "\(curtime)" + key;
        let hash = str1.sha256()
        let urlString = "http://openapi.youdao.com/api?" + "q=\(query)" + "&from=\(from)" + "&to=\(to)" + "&appKey=\(appKey)" + "&salt=\(salt)" + "&sign=\(hash)" + "&signType=\(signType)" + "&curtime=\(curtime)"
        AF.request(urlString).response { response in
            debugPrint(response)
        }
    }
    
    func afTest() {
        let url = "http://192.168.31.119:8080/user/list"
        AF.request(url, method: .post).response { response in
            debugPrint(response)
        }
    }
    
    func initUI() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.width.equalTo(TSDXScreenWidth)
            make.height.equalTo(TSDXScreenHeigth - navBarHeight - bottomSafeHeight)
        }
    }
    
    func initPullToRefresh() {
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
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
}

extension ArticleDetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourceCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "\((indexPath as NSIndexPath).row)"
        return cell
    }
}
