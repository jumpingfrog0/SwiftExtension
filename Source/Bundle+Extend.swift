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
    
    /* The human-readable name of the bundle. */
    var bundleName: String? {
        return self.object(forInfoDictionaryKey: String(kCFBundleNameKey)) as? String
    }
    
    /* The build number of the bundle. */
    var bundleBuildVersion: String? {
        return self.object(forInfoDictionaryKey: String(kCFBundleVersionKey)) as? String
    }
    
    /* The version number of the bundle */
    var bundleShortVersion: String? {
        return self.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    }
    
    /* The name of the executable in this bundle */
    var bundleExecuteable: String? {
        return self.object(forInfoDictionaryKey: String(kCFBundleExecutableKey)) as? String
    }
}
