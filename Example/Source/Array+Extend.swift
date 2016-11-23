//
//  Array+Extend.swift
//  dinner517
//
//  Created by sheldon on 15/10/30.
//  Copyright (c) 2015年 anglesoft. All rights reserved.
//

import Foundation

extension Array {
    func indexOfObject<T: Equatable>(_ object: T) -> Int?
    {
        var index: Int?
        for (idx, objectToCompare) in self.enumerated() {
            if let to = objectToCompare as? T {
                if object == to {
                    index = idx
                    break
                }
            }
        }
        
        return index
    }
    
    func indexesOfObject<T: Equatable>(_ object: T) -> [Int]? {
        var indexes = [Int]()
        for (idx, objectToCompare) in self.enumerated() {
            if let to = objectToCompare as? T {
                if object == to {
                    indexes.append(idx)
                }
            }
        }
        
        if indexes.count > 0 {
            return indexes
        } else {
            return nil
        }
    }
    
    mutating func removeObject<T: Equatable>(_ object : T) -> Bool
    {
        if let index = self.indexOfObject(object) {
            self.remove(at: index)
            return true
        } else {
            return false
        }
    }
}
