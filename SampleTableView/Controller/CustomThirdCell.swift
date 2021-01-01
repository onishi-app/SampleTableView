//
//  CustomThirdCell.swift
//  SampleTableView
//
//  Created by ryosuke on 2021/01/01.
//

import UIKit

class CustomThirdCell: UITableViewCell {
    
    @IBOutlet weak var good: UIButton!
    
    var goodCount = 0.0
    var goodResult = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if goodCount >= 10000 {
            goodCount /= 10000
            goodCount = floor(goodCount * 10) / 10
            goodResult = String("\(goodCount)万")
        } else {
            goodResult = String(goodCount)
        }
        good.setTitle(goodResult, for: .normal)
        
    }
    
}
