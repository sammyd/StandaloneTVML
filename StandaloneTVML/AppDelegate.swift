//
//  AppDelegate.swift
//  StandaloneTVML
//
//  Created by Sam Davies on 23/10/2015.
//  Copyright © 2015 Razeware. All rights reserved.
//

import UIKit
import TVMLKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  var appController: TVApplicationController?
  let resourceLoader = ResourceLoader()
  
  
  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
    
    let appControllerContext = TVApplicationControllerContext()
    
    let javascriptURL = NSBundle.mainBundle().URLForResource("main", withExtension: "js")
    
    appControllerContext.javaScriptApplicationURL = javascriptURL!
    if let options = launchOptions {
      for (kind, value) in options {
        if let kindStr = kind as? String {
          appControllerContext.launchOptions[kindStr] = value
        }
      }
    }
    
    appController = TVApplicationController(context: appControllerContext, window: self.window, delegate: self)
    
    return true
  }
}

extension AppDelegate: TVApplicationControllerDelegate {
  func appController(appController: TVApplicationController, evaluateAppJavaScriptInContext jsContext: JSContext) {
    // Add the resource loader here later...
    jsContext.setObject(ResourceLoader.self, forKeyedSubscript: "ResourceLoader")
  }
}

