//
//  AppDelegate.swift
//  orange_obd
//
//  Created by 王建智 on 2019/7/4.
//  Copyright © 2019 王建智. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import SQLite3
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
   var act: ViewController?
    var window: UIWindow?
    var db:OpaquePointer? = nil

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        IQKeyboardManager.shared.enable = true
        let fm=FileManager.default
        let src=Bundle.main.path(forResource: "obd", ofType: "db")
        let dst=NSHomeDirectory()+"/Documents/mmytb.db"
        if !fm.fileExists(atPath: dst){
            try! fm.copyItem(atPath: src!, toPath: dst)
        }
        if sqlite3_open(dst, &db) == SQLITE_OK{
            print("資料庫開啟成功")
        }else{
            print("資料庫開啟失敗")
            db=nil
        }
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
