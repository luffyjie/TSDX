//
//  CardsViewController.swift
//  TSDX
//
//  Created by zwj on 2019/5/3.
//  Copyright © 2019 TSDX. All rights reserved.
//

import UIKit
import AnimatedCollectionViewLayout

class CardsViewController: BasicViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    let cardsCellId = "cardsCellId"

    lazy var cardsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 10
        layout.itemSize = CGSize(width: (TSDXScreenWidth - 30)/2, height: 100)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = TSDXLightGray
        collectionView.register(CardsViewCell.self, forCellWithReuseIdentifier:cardsCellId)
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.alwaysBounceVertical = true
        return collectionView
    }()
    
    lazy var viewModel: CardsViewModel = {
        let viewModel = CardsViewModel()
        return viewModel
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        refreshData()
        setupPullToRefresh()
    }
    
    func initUI(){
        view.addSubview(cardsCollectionView)
        cardsCollectionView.snp.makeConstraints { (make) in
            make.width.equalTo(TSDXScreenWidth)
            make.height.equalTo(TSDXScreenHeigth - navBarHeight - tabBarHeight)
            make.top.equalToSuperview()
        }
    }
    
    func refreshData() {
        viewModel.updataBlock = {[unowned self] in
            self.cardsCollectionView.reloadData()
        }
        viewModel.requestData()
    }
    
    func setupPullToRefresh() {
        cardsCollectionView.addPullToRefresh(PullToRefresh(position: .top)) { [weak self] in
            let delayTime = DispatchTime.now() + Double(Int64(2 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
            DispatchQueue.main.asyncAfter(deadline: delayTime) {
//                self.refreshData()
                self?.cardsCollectionView.endRefreshing(at: .top)
            }
        }
        
        cardsCollectionView.addPullToRefresh(PullToRefresh(position: .bottom)) { [weak self] in
            let delayTime = DispatchTime.now() + Double(Int64(2 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
            DispatchQueue.main.asyncAfter(deadline: delayTime) {
//                self.refreshData()
                self?.cardsCollectionView.endRefreshing(at: .bottom)
            }
        }
    }

    deinit {
        cardsCollectionView.removeAllPullToRefresh()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        hidesBottomBarWhenPushed = false;
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.cardsSourceMap.rowData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cardsCellId, for: indexPath) as! CardsViewCell
        let cardModel = viewModel.cardsSourceMap.rowData[indexPath.row]
        cell.cardNameLabel.text = cardModel.nameCN
        cell.totalCountLabel.text = "\(cardModel.totalCount)个单词"
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let listViewController = CardsListViewController()
        let cardModel = viewModel.cardsSourceMap.rowData[indexPath.row]
        listViewController.cardsCode = cardModel.cardsCode
        navigationController?.pushViewController(listViewController, animated: true)
    }
}

class CardsViewCell: UICollectionViewCell {
    
    lazy var cardNameLabel: UILabel = {
        let label = UILabel.init()
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    lazy var totalCountLabel: UILabel = {
        let label = UILabel.init()
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 13)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.masksToBounds = true
        layer.cornerRadius = 6
        self.addSubview(cardNameLabel)
        cardNameLabel.snp.makeConstraints { (make) in
            make.height.equalTo(30)
            make.width.equalToSuperview()
            make.bottom.equalTo(self.snp.centerY)
        }
        self.addSubview(totalCountLabel)
        totalCountLabel.snp.makeConstraints { (make) in
            make.height.equalTo(20)
            make.width.equalToSuperview()
            make.centerX.equalToSuperview()
            make.top.equalTo(self.snp.centerY)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
