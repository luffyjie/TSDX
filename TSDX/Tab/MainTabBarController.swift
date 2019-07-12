//
//  MainTabBarController.swift
//  TSDX
//
//  Created by zwj on 2019/5/2.
//  Copyright © 2019 TSDX. All rights reserved.
//

import UIKit
import ESTabBarController_swift

class MainTabBarController: ESTabBarController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let home = HomeViewController()
        let cards = CardsViewController()
        let discovery = DiscoveryViewController()
        let mine = MineViewController()
        
        home.tabBarItem = ESTabBarItem.init(BasicTabBarContentView(),
                                            title: "首页",
                                            image: UIImage(named: "home"),
                                    selectedImage: UIImage(named: "home_1"))
        
        cards.tabBarItem = ESTabBarItem.init(BasicTabBarContentView(),
                                                 title: "单词",
                                                 image: UIImage(named: "cardboard"),
                                                 selectedImage: UIImage(named: "cardboard_1"))
        
        discovery.tabBarItem = ESTabBarItem.init(BasicTabBarContentView(),
                                                 title: "发现",
                                                 image: UIImage(named: "find"),
                                        selectedImage: UIImage(named: "find_1"))
        
        mine.tabBarItem = ESTabBarItem.init(BasicTabBarContentView(),
                                          title: "我的",
                                          image: UIImage(named: "me"),
                                  selectedImage: UIImage(named: "me_1"))
        
        let navHome = BasicNavViewController(rootViewController: home)
        let navCards = BasicNavViewController(rootViewController: cards)
        let navDiscovery = BasicNavViewController(rootViewController: discovery)
        let navMine = BasicNavViewController(rootViewController: mine)
        
        viewControllers = [navHome, navCards, navDiscovery, navMine]
        delegate = self
        
        //test
        mine.tabBarItem.badgeValue = "2"
        self.tabBar.isTranslucent = false
    }
}


extension MainTabBarController : UITabBarControllerDelegate{
    
    //other delegate methods as required....
}
