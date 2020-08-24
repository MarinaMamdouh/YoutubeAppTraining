//
//  DetailsViewController.swift
//  YoutubeAppTraining
//
//  Created by Marina on 8/24/20.
//  Copyright © 2020 Marina. All rights reserved.
//


import UIKit
import WebKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var videoTitleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var wxWebView: WKWebView!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var video:Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // clear the fields
        videoTitleLabel.text = ""
        dateLabel.text = ""
        descriptionTextView.text = ""
        
        // check if a video
        guard video != nil else {
            return
        }
        
        // create the embeded  url
        let embedURL = Constants.YT_EMBEDED_URL + video!.videoId
        let url = URL(string: embedURL)
        let request = URLRequest(url: url!)
        
        
        //Load it into the webview
        wxWebView.load(request)
        

        // set the title
        videoTitleLabel.text = video!.title
        
        // set the date
        dateLabel.text  = video!.published.getDate(format: Constants.DATE_FORMAT)
        
        // set the description text view
        descriptionTextView.text = video!.description
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
