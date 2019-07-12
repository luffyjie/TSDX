//
//  BasicViewController.swift
//  TSDX
//
//  Created by zwj on 2019/5/3.
//  Copyright © 2019 TSDX. All rights reserved.
//

import UIKit

class BasicViewController: UIViewController, UIGestureRecognizerDelegate {

    private let pageStatusView: TSDXPageStatusView = {
        let view = TSDXPageStatusView()
        return view
    }()
    
    private func initPageStatus() {
        view.addSubview(pageStatusView)
        pageStatusView.snp.makeConstraints { (make) in
            make.width.equalTo(TSDXScreenWidth)
            make.height.equalTo(TSDXScreenHeigth)
            make.center.equalToSuperview()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        navigationController?.navigationBar.isTranslucent = false
        initPageStatus()
        
        // Do any additional setup after loading the view.
    }

    func showNavBack() {
        let backButton = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 24, height: 24))
        backButton.setImage(UIImage.init(named: "nav_back"), for: .normal)
        backButton.setImage(UIImage.init(named: "nav_back_light"), for: .highlighted)
        backButton.addTarget(self, action: #selector(navBack), for: .touchUpInside)
        let backItem = UIBarButtonItem.init(customView: backButton)
        navigationItem.leftBarButtonItems = [backItem]
        backButton.contentEdgeInsets=UIEdgeInsets.init(top: 5, left: -6, bottom: 5, right: 40)
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }

    func hiddenNavBack() {
        navigationItem.leftBarButtonItems?.removeAll()
    }
    
    @objc func navBack() {
        self.navigationController?.popViewController(animated: true)
    }

    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if gestureRecognizer == navigationController?.interactivePopGestureRecognizer {
            if let viewControllers = navigationController?.viewControllers {
                return viewControllers.count > 1
            }
            return false
        }
        return true
    }
    
    // MARK: PageStatus
    
    func showPageStatus(_ PageStatus: TSDXPageStatus = .success) {
        view.bringSubviewToFront(pageStatusView)
        pageStatusView.isHidden = false
        pageStatusView.showStatusView(PageStatus)
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
