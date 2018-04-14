//
//  AppDelegate.swift
//  Class8
//
//  Created by CLINK on 2018/4/14.
//  Copyright © 2018年 CLINK. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,UNUserNotificationCenterDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge]) { (agreed, error) in
            if agreed {
                print("允許")
            } else {
                print("不允許")
            }
        }
        UNUserNotificationCenter.current().delegate = self //複寫推播 讓推波可以在前景跳出
        // Override point for customization after application launch.
        return true
    }
    //複寫推播 讓推波可以在前景跳出
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.badge, .sound, .alert])
    }
    
    //覆蓋點擊通知後的行為
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        //取得內容
        let content: UNNotificationContent = response.notification.request.content
        completionHandler()
        //將內容中的userInfo 的link內的ＵＲＬ取得
        let requestUrl = URL(string: content.userInfo["direct-link"]! as! String)
       //開啟內建的 Ｓafari
        
//        //未來可以將ＵＲＬ換成某個ＩＤ值 用ＩＤ去區分要開的ＶＣ
//       let requestPath =  content.userInfo["direct-Path"]! as! String
//        if requestPath == "page1" {
//            let vc = ViewController()
//            再把ＶＣ顯示出來
//        }
//        else if requestPath == "page2" {
//        }
        
        
        UIApplication.shared.open(requestUrl!,
                                  options: [:],
                                  completionHandler: nil)
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

