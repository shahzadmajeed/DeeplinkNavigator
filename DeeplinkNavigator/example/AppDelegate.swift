//
//  AppDelegate.swift
//  DeeplinkNavigator
//
//  Created by Hanguang on 13/03/2017.
//  Copyright © 2017 Hanguang. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        Navigator.scheme = "navigator"
        Navigator.map("/StoryboardNavigable", StoryboardViewController.self, context: "I am a StoryboardViewController")
        Navigator.map("/XibNavigable", XibViewController.self, context: "I am a XibViewController")
        Navigator.map("/InitNavigable", InitViewController.self, context: "I am a InitViewController")
        Navigator.map("/PushOrPop", PushOrPopViewController.self, context: "I am a PushOrPopViewController")
        Navigator.map("/test", TestViewController.self, context: "I am a PushOrPopViewController")
        Navigator.map("navigator://<path>") {(url, context, from, values) -> Bool in
            return Navigator.push(url) != nil
        }
        return true
    }
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        if Navigator.open(url) {
            return true
        }
        return false
    }
    
    @available(iOS 9.0, *)
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        if Navigator.open(url) {
            return true
        }
        return false
    }
}

