//
//  Response.swift
//  YoutubeAppTraining
//
//  Created by Marina on 8/15/20.
//  Copyright © 2020 Marina. All rights reserved.
//

import Foundation


struct Response : Decodable {
    var items:[Video]?
    
    enum CodingKeys:String, CodingKey {
        case items = "items"
    }
    
    init(from decoder:Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.items =  try container.decode([Video].self, forKey: .items)
    }
    
    
}
