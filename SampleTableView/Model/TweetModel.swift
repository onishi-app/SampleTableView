//
//  TweetModel.swift
//  SampleTableView
//
//  Created by ryosuke on 2021/01/02.
//

import Foundation

struct TweetModel {
    var name: String
    var content: String
    var time: TimeInterval
    var good: Double
    var retweet: Double
    var quoteRetweet: Double
    
    func chengeDateFormatter(time: TimeInterval) -> String {
        let date = Date(timeIntervalSince1970: time)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss yyyy/MM/dd"
        
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
}

