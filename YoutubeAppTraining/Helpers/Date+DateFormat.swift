//
//  Date+DateFormat.swift
//  YoutubeAppTraining
//
//  Created by Marina on 8/24/20.
//  Copyright © 2020 Marina. All rights reserved.
//

import Foundation

extension Date{
     func getDate(format:String) -> String {
        let df = DateFormatter()
        df.dateFormat = format
        return df.string(from: self)
    }
}
