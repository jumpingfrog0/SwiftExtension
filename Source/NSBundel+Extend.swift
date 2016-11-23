//
//  NSBundel+Extend.swift
//  517Driver
//
//  Created by sheldon on 15/8/26.
//  Copyright (c) 2015年 517. All rights reserved.
//

import UIKit

import Foundation

extension Bundle {
    
    var bundleName: String? {
        return self.object(forInfoDictionaryKey: String(kCFBundleNameKey)) as? String
    }
    
    var bundleBuildVersion: String? {
        return self.object(forInfoDictionaryKey: String(kCFBundleVersionKey)) as? String
    }
    
    var bundleShortVersion: String? {
        return self.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    }
    
    var bundleExecuteable: String? {
        return self.object(forInfoDictionaryKey: String(kCFBundleExecutableKey)) as? String
    }
}
