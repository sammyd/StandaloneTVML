//
//  ResourceLoader.swift
//  StandaloneTVML
//
//  Created by Sam Davies on 23/10/2015.
//  Copyright © 2015 Razeware. All rights reserved.
//

import Foundation
import JavaScriptCore


@objc protocol ResourceLoaderExport : JSExport {
  func loadBundleResource(name: String) -> String
  static func create() -> ResourceLoaderExport
}


@objc class ResourceLoader: NSObject, ResourceLoaderExport {
  
  func loadBundleResource(name: String) -> String {
    let path = NSBundle.mainBundle().pathForResource(name, ofType: nil)
    let fileContent: String
    do {
      fileContent = try String(contentsOfFile: path!, encoding: NSUTF8StringEncoding)
    } catch {
      print("There was a problem")
      return ""
    }
    return fileContent
  }
  
  static func create() -> ResourceLoaderExport {
    return ResourceLoader()
  }
}