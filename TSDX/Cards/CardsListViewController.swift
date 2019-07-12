//
//  CardsListViewController.swift
//  TSDX
//
//  Created by zwj on 2019/5/12.
//  Copyright © 2019 TSDX. All rights reserved.
//

import UIKit
import AVFoundation

class CardsListViewController: BasicViewController, UITableViewDataSource, UITableViewDelegate {

    var cardsCode: String?

    var listCellId = "listCellId"
    
    lazy var viewModel: CardsListViewModel = {
        let viewModel = CardsListViewModel()
        return viewModel
    }()

    lazy var listTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = TSDXLightGray
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CardsListCell.self, forCellReuseIdentifier: listCellId)
        tableView.separatorStyle = .none
        return tableView
    }()
    
    lazy var startButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = TSDXAPPColor
        button.setTitle("开始学习", for: .normal)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
       
        showNavBack()
        initUI()
        refreshData()
    }
    
    func initUI(){
        view.addSubview(listTableView)
        listTableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        view.addSubview(startButton)
        startButton.snp.makeConstraints { (make) in
            make.width.equalTo(TSDXScreenWidth*0.6)
            make.height.equalTo(48)
            make.bottom.equalToSuperview().offset(-60-49)
            make.centerX.equalToSuperview()
        }
        startButton.addTarget(self, action: #selector(startAudioAction), for: .touchUpInside)
    }
    
    func refreshData(){
        viewModel.updataBlock = {[unowned self] in
            self.listTableView.reloadData()
            self.title = self.viewModel.cardsListMap.cardsModel.nameCN
        }
        if let cardsCode = cardsCode {
            viewModel.requestData(cardsCode: cardsCode)
        }
    }
    
    @objc func startAudioAction(sender: UIButton!) {
        let cardsBoardViewController = CardsBoardViewController()
        present(cardsBoardViewController, animated: true, completion: nil)
//        navigationController?.popViewController(animated: false)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cardsListMap.cardsModel.totalCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: listCellId, for: indexPath) as! CardsListCell
        cell.contentView.backgroundColor = indexPath.row%2 == 0 ? .white: TSDXLightGray
        if let cardList = viewModel.cardsListMap.cardsModel.cardsList {
            let detailModel = cardList[indexPath.row]
            cell.configData(detailModel: detailModel)
        }
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRowAt(indexPath: indexPath)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}

class CardsListCell : UITableViewCell {
    
    var playerItem: AVPlayerItem?
    
    var player: AVPlayer?
    
    lazy var spellLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()
    
    lazy var phonicsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .gray
        return label
    }()
    
    lazy var phonicsAudioButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage.init(named: "audio"), for: .normal)
        button.setImage(UIImage.init(named: "audio_click"), for: .highlighted)
        return button
    }()
    
    lazy var meanLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    lazy var meanSubLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    lazy var sentenceENLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    lazy var sentenceCNLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    lazy var sentenceAudioButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage.init(named: "audio"), for: .normal)
        button.setImage(UIImage.init(named: "audio_click"), for: .highlighted)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        let paddingLeft:CGFloat = 15, paddingRight:CGFloat = -15, sapce:CGFloat = 5
        selectionStyle = .none
        contentView.addSubview(spellLabel)
        spellLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(paddingLeft)
            make.top.equalToSuperview().offset(10)
        }
        contentView.addSubview(phonicsLabel)
        phonicsLabel.snp.makeConstraints { (make) in
            make.left.equalTo(spellLabel.snp.right).offset(10)
            make.centerY.equalTo(spellLabel)
        }
        contentView.addSubview(phonicsAudioButton)
        phonicsAudioButton.snp.makeConstraints { (make) in
            make.left.equalTo(phonicsLabel.snp.right).offset(5)
            make.centerY.equalTo(spellLabel)
            make.width.height.equalTo(20)
        }
        contentView.addSubview(meanLabel)
        meanLabel.snp.makeConstraints { (make) in
            make.top.equalTo(spellLabel.snp.bottom).offset(sapce)
            make.left.equalToSuperview().offset(paddingLeft)
            make.right.equalToSuperview().offset(paddingRight)
        }
        contentView.addSubview(meanSubLabel)
        meanSubLabel.snp.makeConstraints { (make) in
            make.top.equalTo(meanLabel.snp.bottom).offset(sapce)
            make.left.equalToSuperview().offset(paddingLeft)
            make.right.equalToSuperview().offset(paddingRight)
        }
        contentView.addSubview(sentenceENLabel)
        sentenceENLabel.snp.makeConstraints { (make) in
            make.top.equalTo(meanSubLabel.snp.bottom).offset(sapce)
            make.left.equalToSuperview().offset(paddingLeft)
            make.right.lessThanOrEqualToSuperview().offset(-60)
        }
        contentView.addSubview(sentenceAudioButton)
        sentenceAudioButton.snp.makeConstraints { (make) in
            make.left.equalTo(sentenceENLabel.snp.right).offset(5)
            make.centerY.equalTo(sentenceENLabel)
            make.width.height.equalTo(20)
        }
        contentView.addSubview(sentenceCNLabel)
        sentenceCNLabel.snp.makeConstraints { (make) in
            make.top.equalTo(sentenceENLabel.snp.bottom).offset(sapce)
            make.left.equalToSuperview().offset(paddingLeft)
            make.right.equalToSuperview().offset(-60)
        }
        phonicsAudioButton.addTarget(self, action: #selector(phonicsAudioAction), for: .touchUpInside)
        sentenceAudioButton.addTarget(self, action: #selector(sentenceAudioAction), for: .touchUpInside)
    }
    
    @objc func phonicsAudioAction(sender: UIButton!) {
        let path = Bundle.main.path(forResource: "1001-1", ofType: "m4a")
        let url =  URL.init(fileURLWithPath: path!)
        playerItem = AVPlayerItem(url: url)
        player = AVPlayer(playerItem: playerItem!)
        player!.play()
    }
    
    @objc func sentenceAudioAction(sender: UIButton!) {
        let path = Bundle.main.path(forResource: "1001-1", ofType: "m4a")
        let url =  URL.init(fileURLWithPath: path!)
        playerItem = AVPlayerItem(url: url)
        player = AVPlayer(playerItem: playerItem!)
        player!.play()
    }
    
    func configData(detailModel: CardsDetailModel) {
        spellLabel.text = detailModel.spell
        phonicsLabel.text = detailModel.phonics
        meanLabel.text = detailModel.mean
        meanSubLabel.text = detailModel.meanSub
        sentenceENLabel.text = detailModel.sentenceEN
        sentenceCNLabel.text = detailModel.sentenceCN
        sentenceAudioButton.isHidden = false
        if let sentenceAudio = detailModel.sentenceAudio {
            sentenceAudioButton.isHidden = sentenceAudio.count > 0 ? false : true
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
