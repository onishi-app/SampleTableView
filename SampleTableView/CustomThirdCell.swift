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
    
    override func awakeFromNib() {
        super.awakeFromNib()

        if goodCount >= 10000 {
            goodCount /= 10000
            goodCount = floor(goodCount * 10) / 10
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
