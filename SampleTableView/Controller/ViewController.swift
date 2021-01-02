//
//  ViewController.swift
//  SampleTableView
//
//  Created by ryosuke on 2021/01/01.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tweetArray = [
        TweetModel(name: "山田一郎", content: "今日はいい天気です。午前中に洗濯を干したいと思います。", time: Date().timeIntervalSince1970 - 12345678, good: 10, retweet: 2, quoteRetweet: 1, reply: []),
        TweetModel(name: "山田二郎", content: "おはようございます。", time: Date().timeIntervalSince1970 - 1234567, good: 1000, retweet: 10, quoteRetweet: 7,  reply: []),
        TweetModel(name: "山田三郎", content: "朝ごはんは目玉焼きとパンです。", time: Date().timeIntervalSince1970 - 123456, good: 20392, retweet: 1232, quoteRetweet: 1221, reply: []),
        TweetModel(name: "佐藤健", content: "映画「るろうに剣心」よろしくお願いします。", time: Date().timeIntervalSince1970 - 12345, good: 100022, retweet: 12911, quoteRetweet: 1292, reply: []),
        TweetModel(name: "新垣結衣", content: "逃げるは恥だが役にたつ", time: Date().timeIntervalSince1970 - 1234, good: 1212121, retweet: 21321, quoteRetweet: 12131, reply: []),
        TweetModel(name: "夏目漱石", content: "吾輩は猫である", time: Date().timeIntervalSince1970 - 123, good: 1200, retweet: 12, quoteRetweet: 12, reply: []),
        TweetModel(name: "李朴", content: "なるべくしてなっている", time: Date().timeIntervalSince1970 - 12, good: 2112, retweet: 2112, quoteRetweet: 2112, reply: []),
        TweetModel(name: "呉鳳明", content: "すりつぶせ", time: Date().timeIntervalSince1970 - 10, good: 1000000, retweet: 100000, quoteRetweet: 100000, reply: [])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tableView = UITableView(frame: self.view.bounds, style: .grouped)
        let reply1 = TweetModel(name: "山田二郎", content: "本当ですよね。", time: Date().timeIntervalSince1970 - 1234567, good: 11, retweet: 1, quoteRetweet: 2, reply: [])
        let reply2 = TweetModel(name: "山田三郎", content: "こっちは雨です。", time: Date().timeIntervalSince1970 - 12345634, good: 12, retweet: 4, quoteRetweet: 2, reply: [])
        let reply3 = TweetModel(name: "麃公", content: "バハァ！！！", time: Date().timeIntervalSince1970 - 5, good: 120031020, retweet: 1032000, quoteRetweet: 1122, reply: [])
        let reply4 = TweetModel(name: "王騎", content: "天下の大将軍ですよぉ", time: Date().timeIntervalSince1970 - 1, good: 1223456543, retweet: 123123, quoteRetweet: 123123, reply: [])
        tweetArray[0].reply.append(reply1)
        tweetArray[0].reply.append(reply2)
        tweetArray[7].reply.append(reply3)
        tweetArray[7].reply[0].reply.append(reply4)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tweetArray.reverse()
        tableView.sectionHeaderHeight = 0.1
        
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
        view.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweetArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
        let now = Date().timeIntervalSince1970
        let past = tweetArray[indexPath.row].time
        cell.time.text = tweetArray[indexPath.row].timeCheck(now: now, past: past)
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
        detailVC.reply = tweetArray[indexPath.row].reply
        
        navigationController?.pushViewController(detailVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }

}

