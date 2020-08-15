//
//  ViewController.swift
//  YoutubeAppTraining
//
//  Created by Marina on 8/13/20.
//  Copyright © 2020 Marina. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate , ModelDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var model = Model()
    var videos:[Video]  = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // set te table's datasource and deleget to VC
        tableView.dataSource = self
        tableView.delegate = self
        
        // set the model's delegate to VC
        model.delegate = self
        
        // get videos
        model.getVideos()
    }

    // MARK: - TableView Data Source protocol methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell  = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath) as! VideoTableViewCell
        //configure the cell with data
        let video = videos[indexPath.row]
        cell.setCell(video)
        
        // return the cell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    // MARK: Model delegate Methods
    
    func VideosFetched(_ videos: [Video]) {
        self.videos = videos
        
        // refresh the table with data
        tableView.reloadData()
    }
}

