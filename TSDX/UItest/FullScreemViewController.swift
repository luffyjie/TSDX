//
//  FullScreemViewController.swift
//  TSDX
//
//  Created by zwj on 2019/7/3.
//  Copyright © 2019 TSDX. All rights reserved.
//

import UIKit

class FullScreemViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let view1 = TSDXUIView()
        view1.frame = CGRect.init(x: 0, y: 0, width: view.bounds.width, height: 200)
        view1.backgroundColor = .red
        view.addSubview(view1)
        let view2 = TSDXUIView()
        view2.frame = CGRect.init(x: 0, y: view.bounds.height - 200, width: view.bounds.width, height: 200)
        view2.backgroundColor = .yellow
        view.addSubview(view2)
        
        print("view1", view1.bounds)
        
        print("view2",view2.frame)
 
        if #available(iOS 11.0, *) {
            print("additionalSafeAreaInsets", additionalSafeAreaInsets)
            additionalSafeAreaInsets.top = 24.0
            additionalSafeAreaInsets.bottom = 34.0
            print("additionalSafeAreaInsets2", additionalSafeAreaInsets)
        } else {
            // Fallback on earlier versions
        }
        
        if #available(iOS 11.0, *) {
            let insets = UIApplication.shared.delegate?.window??.safeAreaInsets ?? UIEdgeInsets.zero
            
        } else {
            // Fallback on earlier versions
        }

    }

    override func viewSafeAreaInsetsDidChange() {
        print("viewSafeAreaInsetsDidChange")
    }
}


class TSDXUIView: UIView {
    
    var label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        label.text = "36氪获悉，在今日举行的2019年百度AI开发者大会上，有观众冲上演讲台向百度CEO李彦宏头部倒了一瓶水。百度官方微博回应称，“今天AI开发者大会上，有人给AI‘泼冷水’。我们想说，AI前进的道路上会有各种各样想象不到的事情发生，但我们前行的决心不会改变36氪获悉，在今日举行的2019年百度AI开发者大会上，有观众冲上演讲台向百度CEO李彦宏头部倒了一瓶水。百度官方微博回应称，“今天AI开发者大会上，有人给AI‘泼冷水’。我们想说，AI前进的道路上会有各种各样想象不到的事情发生，但我们前行的决心不会改变"
        label.numberOfLines = 0
        addSubview(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if #available(iOS 11.0, *) {
            label.frame = safeAreaLayoutGuide.layoutFrame
            print("--1--")
            print(safeAreaInsets)
            print(safeAreaLayoutGuide.layoutFrame)
            print("--2--")
        }
    }
    
    override func safeAreaInsetsDidChange() {
        print("open func safeAreaInsetsDidChange()")
    }
    
}
