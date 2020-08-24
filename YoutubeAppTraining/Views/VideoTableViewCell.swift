//
//  VideoTableViewCell.swift
//  YoutubeAppTraining
//
//  Created by Marina on 8/15/20.
//  Copyright © 2020 Marina. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var video:Video?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ v:Video){
        self.video = v
        
        self.titleLabel.text = video?.title
        self.dateLabel.text = video!.published.getDate(format: Constants.DATE_FORMAT)
        
    // set the thumbnail
        guard self.video!.thumbnail != "" else{
            return
        }
        // check the cached images if thumbnail is already downloaded
        if  let cachedData = CacheManager.getVideoCache(self.video!.thumbnail) {
            
            // get the image from CacheManager
            self.thumbnailImageView.image = UIImage(data: cachedData)
            return
        }
        
        // download the image
        let url = URL(string: self.video!.thumbnail)
        let session = URLSession.shared
        // create a data task
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if error == nil && data != nil {
                
                // save the image in cache
                CacheManager.setVideoCache(url!.absoluteString, data!)
                
                // check that the thumbnail is actually the one of the selected video
                if url?.absoluteString != self.video?.thumbnail{
                    // video cell is reused with new video
                    return
                }
                // load image in main thread
                let image = UIImage(data: data!)
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
                }
    
            }
        }
        dataTask.resume()
    }
}
