//
//  CustomTableViewCell.swift
//  SampleTableView
//
//  Created by ryosuke on 2021/01/01.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var content: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func actionButton(_ sender: Any) {
        guard let button = sender as? UIButton else {
            return
        }
        
        switch button.tag {
        case 1:
            print("リプライボタンが押されました。")
        case 2:
            print("リツイートボタンが押されました。")
        case 3:
            print("いいねボタンが押されました。")
        case 4:
            print("共有ボタンが押されました。")
        default:
            print("Error:どのボタンが押されたかわかりません。")
        }
    }
    
    @IBAction func optionButton(_ sender: Any) {
        print("オプションボタンが押されました。")
    }
}
