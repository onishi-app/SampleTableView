//
//  CustomFirstCell.swift
//  SampleTableView
//
//  Created by ryosuke on 2021/01/01.
//

import UIKit

class CustomFirstCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var time: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func optionButton(_ sender: Any) {
        print("オプションボタンが押されました。")
    }
}
