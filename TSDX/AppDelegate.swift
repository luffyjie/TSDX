//
//  AppDelegate.swift
//  TSDX
//
//  Created by zwj on 2019/5/1.
//  Copyright © 2019 TSDX. All rights reserved.
//

import UIKit
import GDPerformanceView_Swift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var mainTab: MainTabBarController?
    var mainNav: BasicNavViewController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        initNavBar()
        initWeexSDK()

        mainTab = MainTabBarController()
        mainNav = BasicNavViewController(rootViewController: mainTab!)
        mainNav?.isNavigationBarHidden = true
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        window?.rootViewController = mainNav
//        window?.rootViewController = UINavigationController.init(rootViewController: FullScreemViewController())
//        window?.rootViewController =  ScrollViewController()
//        window?.rootViewController = UINavigationController.init(rootViewController: ScrollViewController())
        
//        window?.rootViewController =  TableViewController()
//        window?.rootViewController = UINavigationController.init(rootViewController: TableViewController())

        
        window?.makeKeyAndVisible()
        
        // mark PerformanceMonitor
        PerformanceMonitor.shared().start()
        PerformanceMonitor.shared().performanceViewConfigurator.options = .all
        PerformanceMonitor.shared().hide()

        return true
    }
    
    func initNavBar() {
        UINavigationBar.appearance().tintColor = .red
        UINavigationBar.appearance().barTintColor = TSDXAPPColor
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    func initWeexSDK() {
        WXAppConfiguration.setAppGroup("TSDX")
        WXAppConfiguration.setAppName("TSDX")
        WXAppConfiguration.setAppVersion("1.0")
        
        //Initialize WeexSDK
        WXSDKEngine.initSDKEnvironment();
        WXLog.setLogLevel(WeexLogLevel.WXLogLevelWarning)
        // register Model
        WXSDKEngine.registerHandler(WeexImageDownloader(), with: WXImgLoaderProtocol.self)
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

