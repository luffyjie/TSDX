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
        
        let homeText = NSLocalizedString("home", comment: "")
        let vocabularyText = NSLocalizedString("vocabulary", comment: "")
        let discoveryText = NSLocalizedString("discovery", comment: "")
        let mineText = NSLocalizedString("mine", comment: "")

        home.tabBarItem = ESTabBarItem.init(BasicTabBarContentView(),
                                            title: homeText,
                                            image: UIImage(named: "home"),
                                    selectedImage: UIImage(named: "home_1"))
        
        cards.tabBarItem = ESTabBarItem.init(BasicTabBarContentView(),
                                                 title: vocabularyText,
                                                 image: UIImage(named: "cardboard"),
                                                 selectedImage: UIImage(named: "cardboard_1"))
        
        discovery.tabBarItem = ESTabBarItem.init(BasicTabBarContentView(),
                                                 title: discoveryText,
                                                 image: UIImage(named: "find"),
                                        selectedImage: UIImage(named: "find_1"))
        
        mine.tabBarItem = ESTabBarItem.init(BasicTabBarContentView(),
                                          title: mineText,
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
