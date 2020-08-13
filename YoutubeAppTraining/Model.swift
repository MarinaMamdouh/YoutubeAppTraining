//
//  Model.swift
//  YoutubeAppTraining
//
//  Created by Marina on 8/13/20.
//  Copyright © 2020 Marina. All rights reserved.
//

import Foundation


class Model {
    
    func getVideos() {
        // Create a url project
        let url = URL(string: Constants.API_URL)
        guard url != nil else{
            return
        }
        
        // Get a URLSession object
        let session = URLSession.shared
        
        // Get a data task  from the URLSession
        let dataTask = session.dataTask(with: url!) { (data, respone, error) in
            // check if there any errors
            if(error != nil || data == nil){
                return
            }
            
            // parsind the data into video objects
        }
        
        // kich off the data task
        dataTask.resume()
    }
}
