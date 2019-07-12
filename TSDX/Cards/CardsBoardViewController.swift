//
//  CardsBoardViewController.swift
//  TSDX
//
//  Created by zwj on 2019/5/5.
//  Copyright © 2019 TSDX. All rights reserved.
//

import UIKit
import AnimatedCollectionViewLayout

class CardsBoardViewController: BasicViewController {

    var boardName: String?
    var boardCollectionView: UICollectionView?
    let boardCellId = "boardCellId"

    let cardsList = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "h", "i", "j", "k", "l", "m", "n", "o", "h", "i", "j", "k", "l", "m", "n", "o", "h", "i", "j", "k", "l", "m", "n", "o", "h", "i", "j", "k", "l", "m", "n", "o", "h", "i", "j", "k", "l", "m", "n", "o", "h", "i", "j", "k", "l", "m", "n", "o", "h", "i", "j", "k", "l", "m", "n", "o", "h", "i", "j", "k", "l", "m", "n", "o", "h", "i", "j", "k", "l", "m", "n", "o", "h", "i", "j", "k", "l", "m", "n", "o", "h", "i", "j", "k", "l", "m", "n", "o"]
    let vcs = [("f44336", "nature1"),
               ("9c27b0", "nature2"),
               ("3f51b5", "nature3"),
               ("03a9f4", "animal1"),
               ("009688", "animal2"),
               ("8bc34a", "animal3"),
               ("FFEB3B", "nature1"),
               ("FF9800", "nature2"),
               ("795548", "nature3"),
               ("607D8B", "animal1")]
    let animator = (CubeAttributesAnimator(), true, 1, 1)

    override func viewDidLoad() {
        super.viewDidLoad()
        title = boardName
        let layout = AnimatedCollectionViewLayout()
        layout.scrollDirection = .horizontal
        layout.animator = animator.0
        boardCollectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        boardCollectionView?.isPagingEnabled = true
        boardCollectionView?.backgroundColor = UIColor.white
        boardCollectionView?.showsVerticalScrollIndicator = false
        boardCollectionView?.register(BoardViewCell.self, forCellWithReuseIdentifier:boardCellId)
        boardCollectionView?.delegate = self
        boardCollectionView?.dataSource = self
        view.addSubview(boardCollectionView!)
        
        let swipe = UISwipeGestureRecognizer(target: self, action:#selector(respondToSwipeGesture))
        swipe.direction = UISwipeGestureRecognizer.Direction.down
        view.addGestureRecognizer(swipe)
    }
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    override var prefersStatusBarHidden: Bool { return true }
}

extension CardsBoardViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
   func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardsList.count
    }
    
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: boardCellId, for: indexPath) as! BoardViewCell
        let i = indexPath.row % vcs.count
        let v = vcs[i]
        cell.bind(color: v.0, imageName: v.1)
        cell.clipsToBounds = animator.1
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: TSDXScreenWidth / CGFloat(animator.2), height: TSDXScreenHeigth / CGFloat(animator.3))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

class BoardViewCell: UICollectionViewCell {
    
    var cardNameLabel: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        cardNameLabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 100, height: 200))
        cardNameLabel?.textAlignment = .center
        cardNameLabel?.textColor = UIColor.black
        cardNameLabel?.font = UIFont.systemFont(ofSize: 60)
        self.contentView.addSubview(cardNameLabel!)
    }
    
    func bind(color: String, imageName: String) {
        contentView.backgroundColor = color.hexColor
        cardNameLabel?.text = "\(arc4random_uniform(1000))"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension String {
    var hexColor: UIColor {
        let hex = trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            return .clear
        }
        return UIColor(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
