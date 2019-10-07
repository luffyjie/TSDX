//
//  MineViewController.swift
//  TSDX
//
//  Created by zwj on 2019/5/3.
//  Copyright © 2019 TSDX. All rights reserved.
//

import UIKit

class MineViewController: BasicViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        showPageStatus(.loading)
        let delayTime = DispatchTime.now() + Double(Int64(2 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: delayTime) {
            self.showPageStatus(.noContent)
            //self.showPageStatus(.networkError)
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
