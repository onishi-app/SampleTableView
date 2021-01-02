//
//  ViewController.swift
//  SampleTableView
//
//  Created by ryosuke on 2021/01/01.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tweetArray = [
        TweetModel(name: "山田一郎", content: "今日はいい天気です。午前中に洗濯を干したいと思います。", time: Date().timeIntervalSince1970 - 12345678, good: 10, retweet: 2, quoteRetweet: 1),
        TweetModel(name: "山田二郎", content: "おはようございます。", time: Date().timeIntervalSince1970 - 1234567, good: 1000, retweet: 10, quoteRetweet: 7),
        TweetModel(name: "山田三郎", content: "朝ごはんは目玉焼きとパンです。", time: Date().timeIntervalSince1970 - 123456, good: 20392, retweet: 1232, quoteRetweet: 1221),
        TweetModel(name: "佐藤健", content: "映画「るろうに剣心」よろしくお願いします。", time: Date().timeIntervalSince1970 - 12345, good: 100022, retweet: 12911, quoteRetweet: 1292),
        TweetModel(name: "新垣結衣", content: "逃げるは恥だが役にたつ", time: Date().timeIntervalSince1970 - 1234, good: 1212121, retweet: 21321, quoteRetweet: 12131),
        TweetModel(name: "夏目漱石", content: "吾輩は猫である", time: Date().timeIntervalSince1970 - 123, good: 1200, retweet: 12, quoteRetweet: 12),
        TweetModel(name: "李朴", content: "なるべくしてなっている", time: Date().timeIntervalSince1970 - 12, good: 2112, retweet: 2112, quoteRetweet: 2112),
        TweetModel(name: "呉鳳明", content: "すりつぶせ", time: Date().timeIntervalSince1970 - 1, good: 1000000, retweet: 100000, quoteRetweet: 100000)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tableView = UITableView(frame: self.view.bounds, style: .grouped)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tweetArray.reverse()
        tableView.sectionHeaderHeight = 0.1
        
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
        return tweetArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
        let now = Date().timeIntervalSince1970
        let past = tweetArray[indexPath.row].time
        cell.time.text = timeCheck(now: now, past: past)
        cell.content.text = tweetArray[indexPath.row].content
        cell.name.text = tweetArray[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = storyboard?.instantiateViewController(identifier: "detailView") as! DetailViewController
        let time = tweetArray[indexPath.row].time
        
        detailVC.name = tweetArray[indexPath.row].name
        detailVC.content = tweetArray[indexPath.row].content
        detailVC.time = tweetArray[indexPath.row].chengeDateFormatter(time: time)
        detailVC.retweet = tweetArray[indexPath.row].retweet
        detailVC.quoteRetweet = tweetArray[indexPath.row].quoteRetweet
        detailVC.good = tweetArray[indexPath.row].good
        
        navigationController?.pushViewController(detailVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
}

