//
//  HomeViewController.swift
//  TSDX
//
//  Created by zwj on 2019/5/3.
//  Copyright © 2019 TSDX. All rights reserved.
//

import UIKit
import FSPagerView

class HomeViewController: BasicViewController {

    let homeCellId = "homeCell"
    let homeHeaderCellId = "homeHeaderCellId"

    lazy var homeTableView: UITableView = {
        let tableview = UITableView.init(frame: .zero, style: .plain)
        tableview.backgroundColor = TSDXLightGray
        tableview.dataSource = self
        tableview.delegate = self
        tableview.register(HomeViewCell.self, forCellReuseIdentifier: homeCellId)
        tableview.register(HomeHeaderViewCell.self, forCellReuseIdentifier: homeHeaderCellId)
        tableview.tableHeaderView = HeaderView.init(frame: CGRect.init(x: 0, y: 0, width: TSDXScreenWidth, height: 160.0))
        tableview.showsVerticalScrollIndicator = false
        return tableview
    }()
    lazy var viewModel: HomeViewModel = {
        let viewmodel = HomeViewModel()
        return viewmodel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "首页"
        initUI()
        showPageStatus(.loading)
        let delayTime = DispatchTime.now() + Double(Int64(2 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: delayTime) {
            self.showPageStatus(.success)
        }
        self.refreshData()
//        let banner = NotificationBanner(title: "ssssssccc", subtitle: "kkalslkjljkslkjaasdlkj", style: .success)
//        banner.show()
    }
    
    func initUI() {
        view.addSubview(homeTableView)
        homeTableView.snp.makeConstraints { (make) in
            make.width.equalTo(TSDXScreenWidth)
            make.height.equalTo(TSDXScreenHeigth - navBarHeight - tabBarHeight)
            make.center.equalToSuperview()
        }
        homeTableView.es.addPullToRefresh {
            [unowned self] in
            let delayTime = DispatchTime.now() + Double(Int64(2 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
            DispatchQueue.main.asyncAfter(deadline: delayTime) {
                self.homeTableView.es.stopPullToRefresh()
            }
        }
        homeTableView.es.addInfiniteScrolling {
            [unowned self] in
            let delayTime = DispatchTime.now() + Double(Int64(2 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
            DispatchQueue.main.asyncAfter(deadline: delayTime) {
                self.homeTableView.es.stopLoadingMore()
            }
        }
    }
    
    func refreshData(_ pull: Bool = false) {
        viewModel.updataBlock = {[unowned self] in
            self.homeTableView.reloadData()
        }
        viewModel.requestData()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        hidesBottomBarWhenPushed = false;
    }
    
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.homeSourceMap.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 0
        let sectionName = viewModel.homeSourceMap.sections[section].rawValue
        if let articleSource:ArticleSourceModel = viewModel.homeSourceMap.rowData[sectionName]  {
            if let list = articleSource.list {
                count = list.count
            }
        }
        return count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 40.0
        }
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10.0
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let headerView = UIView()
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: homeHeaderCellId, for: indexPath) as! HomeHeaderViewCell
            cell.headerNameLabel.text = viewModel.homeSourceMap.sections[indexPath.section].description().name
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: homeCellId, for: indexPath) as! HomeViewCell
        let sectionName = viewModel.homeSourceMap.sections[indexPath.section].rawValue
        if let articleSource = viewModel.homeSourceMap.rowData[sectionName] {
            if let list = articleSource.list {
                let article = list[indexPath.row]
                if let icon = article.icon {
                    cell.iconImageView.image = UIImage(named: icon)
                }
                cell.titleLabel.text = article.title
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            return
        }
        tableView.deselectRow(at: indexPath, animated: true)
        let articleViewController = ArticleDetailViewController()
        hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(articleViewController, animated: true)
    }
    
}

class HomeViewCell: UITableViewCell {
    
    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)

        accessoryType = .disclosureIndicator
        contentView.backgroundColor = .white
        contentView.addSubview(iconImageView)
        iconImageView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(15)
            make.centerY.equalToSuperview()
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(iconImageView.snp.right).offset(20)
            make.centerY.equalToSuperview()
            make.height.equalTo(40)
            make.right.equalToSuperview().offset(-80)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class HomeHeaderViewCell: UITableViewCell {
    
    lazy var headerNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)

        selectionStyle = .none
        self.backgroundColor = .white
        self.addSubview(headerNameLabel)
        headerNameLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(15)
            make.centerY.equalToSuperview()
            make.height.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class HeaderView: UIView {
    
    let pageViewCellId = "pageViewCellId"
    
    lazy var panelView: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 8
        return view
    }()
    
    lazy var pagerView: FSPagerView = {
        let view = FSPagerView()
        view.dataSource = self
        view.delegate = self
        view.register(FSPagerViewCell.self, forCellWithReuseIdentifier: pageViewCellId)
        view.isInfinite = true
        view.automaticSlidingInterval = 5
        return view
    }()

    lazy var pageControl: FSPageControl = {
        let control = FSPageControl()
        control.numberOfPages = HomeModel.headerBanners.count
        control.contentHorizontalAlignment = .right
        control.contentInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        control.hidesForSinglePage = true
        return control
    }()
    
    lazy var spaceView: UIView = {
        let view = UIView()
        view.backgroundColor = TSDXLightGray
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        self.addSubview(panelView)
        panelView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 10, left: 10, bottom: 20, right: 10)).priority(.high)
        }
        panelView.addSubview(pagerView)
        pagerView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        panelView.addSubview(pageControl)
        pageControl.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(30)
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        self.addSubview(spaceView)
        spaceView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(10)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension HeaderView: FSPagerViewDataSource, FSPagerViewDelegate {
    
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return HomeModel.headerBanners.count
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: pageViewCellId, at: index)
        cell.imageView?.image = UIImage(named: HomeModel.headerBanners[index])
        cell.imageView?.contentMode = .scaleAspectFill
        cell.imageView?.clipsToBounds = true
        return cell
    }
    
    func pagerView(_ pagerView: FSPagerView, shouldHighlightItemAt index: Int) -> Bool {
        return false
    }
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        pagerView.deselectItem(at: index, animated: true)
        pagerView.scrollToItem(at: index, animated: true)
    }
    
    func pagerViewWillEndDragging(_ pagerView: FSPagerView, targetIndex: Int) {
        self.pageControl.currentPage = targetIndex
    }
    
    func pagerViewDidEndScrollAnimation(_ pagerView: FSPagerView) {
        self.pageControl.currentPage = pagerView.currentIndex
    }
    
}

