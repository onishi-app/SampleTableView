//
//  CustomSecondCell.swift
//  SampleTableView
//
//  Created by ryosuke on 2021/01/01.
//

import UIKit

class CustomSecondCell: UITableViewCell {

    @IBOutlet weak var retweet: UIButton!
    @IBOutlet weak var quoteRetweet: UIButton!
    
    var retweetCount = 0.0
    var quoteRetweetCount = 0.0
    var retweetResult = ""
    var quoteRetweetResult = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if retweetCount >= 10000 {
            retweetCount /= 10000
            retweetCount = floor(retweetCount * 10) / 10
            retweetResult = String("\(retweetCount)万")
        } else {
            retweetResult = String(retweetCount)
        }
        
        if quoteRetweetCount >= 10000 {
            quoteRetweetCount /= 10000
            quoteRetweetCount = floor(quoteRetweetCount * 10) / 10
            quoteRetweetResult = String("\(quoteRetweetCount)万")
        } else {
            quoteRetweetResult = String(quoteRetweetCount)
        }
        
        retweet.setTitle(retweetResult, for: .normal)
        quoteRetweet.setTitle(quoteRetweetResult, for: .normal)
    }
    
}
