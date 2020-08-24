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
        tableView.backgroundColor = .clear
        // set the model's delegate to VC
        model.delegate = self
        
        // get videos
        model.getVideos()
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = .clear
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // confirm a video is selected
        guard tableView.indexPathForSelectedRow != nil else {
            return
        }
        
        // get a refrence to the video that was tapped
        let selectedVideo  = videos[tableView.indexPathForSelectedRow!.row]
        
        /// get a refrence to a detail view controller
        let detailVC = segue.destination as! DetailsViewController
        detailVC.video = selectedVideo
        
        // set the video property of the detail view controller
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

