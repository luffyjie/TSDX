//
//  BasicNavViewController.swift
//  TSDX
//
//  Created by zwj on 2019/5/2.
//  Copyright © 2019 TSDX. All rights reserved.
//

import UIKit

class BasicNavViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white

        // Do any additional setup after loading the view.
    }
}

extension UINavigationController {
    
    open override var childForStatusBarStyle: UIViewController? {
        return viewControllers.last
    }
    
    open override var childForStatusBarHidden: UIViewController? {
        return viewControllers.last
    }
    
}
