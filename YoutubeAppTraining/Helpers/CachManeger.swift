//
//  CachManeger.swift
//  YoutubeAppTraining
//
//  Created by Marina on 8/15/20.
//  Copyright © 2020 Marina. All rights reserved.
//

import Foundation

class CacheManager {
    
    private static var cache = [String:Data]()
    static func setVideoCache(_ url:String, _ data:Data){
        cache[url] = data
        
    }
    
    static func getVideoCache(_ url:String) -> Data?{
        return cache[url]
    }
}
