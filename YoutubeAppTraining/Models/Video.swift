//
//  Video.swift
//  YoutubeAppTraining
//
//  Created by Marina on 8/13/20.
//  Copyright © 2020 Marina. All rights reserved.
//

import Foundation
struct Video : Decodable{
    var videoId = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var published = Date()
    
    enum CodingKeys:String, CodingKey {
        case snippet = "snippet"
        case thumbnails = "thumbnails"
        case highResolution = "high"
        case resourceId = "resourceId"
        
        case publlished = "publishedAt"
        case title = "title"
        case description = "description"
        case thumbnail = "url"
        case videoId = "videoId"
    }
    
    init(from decoder:Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let snippetContainer =  try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        // parse title
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        
        // parse description
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        
        // parse published
        self.published = try snippetContainer.decode(Date.self, forKey: .publlished)
        
        // parse thumbnails
        let thumbnailsContainer =  try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        // parse thumbnail high resolution
        let hightContainer = try thumbnailsContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .highResolution)
        // parse thumbnail url
        self.thumbnail = try hightContainer.decode(String.self, forKey: .thumbnail)
        
        // parse resource id to get the video id
        let resourceContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        // parse video id
        self.videoId = try resourceContainer.decode(String.self, forKey: .videoId)
        


    }
    
}
