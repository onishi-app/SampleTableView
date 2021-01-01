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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if retweetCount >= 10000 {
            retweetCount /= 10000
            retweetCount = floor(retweetCount * 10) / 10
        }
        
        if quoteRetweetCount >= 10000 {
            quoteRetweetCount /= 10000
            quoteRetweetCount = floor(quoteRetweetCount * 10) / 10
        }
        
        retweet.setTitle(String(retweetCount), for: .normal)
        quoteRetweet.setTitle(String(quoteRetweetCount), for: .normal)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
