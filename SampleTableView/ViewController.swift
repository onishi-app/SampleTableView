//
//  ViewController.swift
//  SampleTableView
//
//  Created by ryosuke on 2021/01/01.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var item = [
        ["content": "2020年\nが\n終わります。\n今年も\n良い\n一年\nでした。", "date": Date().timeIntervalSince1970 - 313123123, "name": "斎藤"],
        ["content": "良いお年をお過ごしください。", "date": Date().timeIntervalSince1970 - 123212312, "name": "本田"],
        ["content": "新年明けましておめでとうございます。", "date": Date().timeIntervalSince1970 - 20000000, "name": "鈴木"],
        ["content": "お年玉を1万円あげます。", "date": Date().timeIntervalSince1970 - 2323232, "name": "川崎"],
        ["content": "2021年はもっと勉強を頑張ります。", "date": Date().timeIntervalSince1970 - 13213, "name": "三菱"],
        ["content": "今年は本厄なので気を引き締めます。", "date": Date().timeIntervalSince1970 - 3333, "name": "豊田"],
        ["content": "今年もよろしくお願いします。", "date": Date().timeIntervalSince1970 - 10, "name": "武田"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tableView = UITableView(frame: self.view.bounds, style: .plain)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        item = item.reversed()
        
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")

        view.addSubview(tableView)
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
        let now = Date().timeIntervalSince1970
        
        let past = item[indexPath.row]["date"] as! TimeInterval
        cell.time.text = timeCheck(now: now, past: past)
        cell.content.text = (item[indexPath.row]["content"] as! String)
        cell.name.text = (item[indexPath.row]["name"] as! String)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = storyboard?.instantiateViewController(identifier: "detailView") as! DetailViewController
        
        detailVC.name = (item[indexPath.row]["name"] as! String)
        detailVC.content = (item[indexPath.row]["content"] as! String)
        detailVC.time = "2021年1月1日"
        detailVC.retweet = 10000
        detailVC.quoteRetweet = 10000
        detailVC.good = 123456
        
        navigationController?.pushViewController(detailVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

