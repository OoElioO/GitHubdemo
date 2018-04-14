//
//  ViewController.swift
//  Class8
//
//  Created by CLINK on 2018/4/14.
//  Copyright © 2018年 CLINK. All rights reserved.
//

import UIKit
import UserNotifications
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func showNotification(_ sender: Any) {
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = "測試本地通知"
        notificationContent.subtitle = "副標題測試"
        notificationContent.body = "測試本地內容"
        notificationContent.badge = 1
        notificationContent.sound = UNNotificationSound.default()
        //Bundle 可以取得該ＡＰＰ內的所有資料
        if let imageURL = Bundle.main.url(forResource: "TTTT",
                                          withExtension: "png") {
            let attachment = try! UNNotificationAttachment(identifier: "image",
                                                           url: imageURL,
                                                           options: nil)
            notificationContent.attachments = [attachment]
            
        }
        
//        let attachment = try! UNNotificationAttachment(identifier: "image",
//                                                       url: imageURL,
//                                                       options: nil)
       
        notificationContent.userInfo = ["direct-link": "https://www.google.com"]
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
        
        let request = UNNotificationRequest(identifier: "notification", content: notificationContent, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { (error) in
            print("建立通知")
        }
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

