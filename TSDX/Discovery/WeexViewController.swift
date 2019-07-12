//
//  WeexViewController.swift
//  TSDX
//
//  Created by zwj on 2019/6/16.
//  Copyright © 2019 TSDX. All rights reserved.
//

import UIKit

class WeexViewController: BasicViewController {
    
    var weexView: UIView?
    
    var weexUrl: URL?
    
    lazy var instance: WXSDKInstance = {
        let instance = WXSDKInstance.init()
        return instance
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        initWeexInstance()
    }

    func initWeexInstance(){
        instance.viewController = self
        instance.frame = view.frame
        instance.onCreate = { [weak self] (view: UIView?) in
            self?.weexView?.removeFromSuperview()
            self?.weexView = view
            if (view != nil) {
                view?.backgroundColor = .white
                self?.view.addSubview(view!)
            }
        }
        instance.onFailed  = { (AnyObject) in
            print(AnyObject ?? self)
        }
        instance.renderFinish = { (view: UIView?) in
            print(view ?? self)
        }
        weexUrl = URL.init(string: "http://192.168.31.62:8087/dist/index.js")
//        weexUrl = URL.init(string: "http://dotwe.org/raw/dist/d833082538b37bf67ff63979ca704b55.bundle.wx")

        instance.render(with: weexUrl)
//        let url = Bundle.main.url(forResource: "index", withExtension: "js")
//        instance.render(with: url)
    }
    
    func apiTest() {
        let httpurl = "http://192.168.31.130:8080/columns/list?_search=false&nd=1560596254381&limit=10&page=1&sidx=priority&sord=asc&countyId=1"
        AF.request(httpurl, method: .get).response { response in
            debugPrint(response)
        }
    }
}
