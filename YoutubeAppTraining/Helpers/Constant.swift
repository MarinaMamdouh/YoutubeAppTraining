//
//  Constant.swift
//  YoutubeAppTraining
//
//  Created by Marina on 8/13/20.
//  Copyright © 2020 Marina. All rights reserved.
//

import Foundation

struct Constants{
    static var API_KEY = "AIzaSyB1v5uUFydI3SjtLmgKJD4rMTIcVVTzMd0"
    static var PLAYLIST_ID = "PLT1DdSENy_R7IAzmfnRsd6s-dGYDbMflc"
    static var API_URL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
    static var VIDEOCELL_ID = "VideoCell"
}
