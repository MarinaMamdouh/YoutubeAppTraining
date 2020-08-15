//
//  Model.swift
//  YoutubeAppTraining
//
//  Created by Marina on 8/13/20.
//  Copyright © 2020 Marina. All rights reserved.
//

import Foundation

protocol ModelDelegate {
    func  VideosFetched(_ videos:[Video])
}

class Model {
    
    var delegate:ModelDelegate?
    
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
            
            do{
                // parsind the data into video objects
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let response = try decoder.decode(Response.self, from: data!)
                if response.items != nil{
                    DispatchQueue.main.async {
                        // call the VideoFetched method of model delegate
                        self.delegate?.VideosFetched(response.items!)
                    }
                    
                }
                
                dump(response)
            }
            catch{
                
            }
            
            
      
        }
        
        // kich off the data task
        dataTask.resume()
    }
}
