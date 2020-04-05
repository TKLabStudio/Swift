//
//  AppDelegate.swift
//  PushViewController
//
//  Created by smallHappy on 2017/8/27.
//  Copyright © 2017年 SmallHappy. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var storyboard: UIStoryboard?
    var mainVC: ViewController?
    var navigationController: UINavigationController? //堆疊用這個
    var window: UIWindow?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        //push pop stack 堆疊
        //self.mainVC = ViewController() //注意是ViewController（此方法無法使用storyboard）
        self.storyboard = UIStoryboard(name: "Main", bundle: Bundle.main) //Main是指storyboard的檔名，Bundle.main是指從左側那欄尋找
        self.mainVC = self.storyboard?.instantiateInitialViewController() as? ViewController //用storyboard去建構mainVC，這樣才能用storyboard
        self.mainVC?.view.frame = UIScreen.main.bounds
        self.mainVC?.view.backgroundColor = UIColor.darkGray
        self.navigationController = UINavigationController(rootViewController: mainVC!) //建構同時填入rootViewController
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = self.navigationController //用navigationController的root
        self.window?.makeKeyAndVisible() //有好幾個window必須寫，一個不用
        
        return true
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

