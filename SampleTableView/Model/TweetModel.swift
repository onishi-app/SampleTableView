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
    var reply: [TweetModel]
    
    func chengeDateFormatter(time: TimeInterval) -> String {
        let date = Date(timeIntervalSince1970: time)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss yyyy/MM/dd"
        
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
    
    func timeCheck(now: TimeInterval, past: TimeInterval) -> String {
        let timeDiff = Int(now - past)
        
        let year = timeDiff / 31104000
        let month = timeDiff / 2592000
        let day = timeDiff / 86400
        let hour = timeDiff / 3600
        let minute = timeDiff / 60
        let second = timeDiff
        
        if year != 0 {
            return "\(year)年前"
        } else if month != 0 {
            return "\(month)ヶ月前"
        } else if day != 0 {
            return "\(day)日前"
        } else if hour != 0 {
            return "\(hour)時間前"
        } else if minute != 0 {
            return "\(minute)分前"
        } else {
            return "\(second)秒前"
        }
        
    }
}

