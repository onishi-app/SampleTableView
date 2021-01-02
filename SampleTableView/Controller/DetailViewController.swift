//
//  DetailViewController.swift
//  SampleTableView
//
//  Created by ryosuke on 2021/01/01.
//

import UIKit

class DetailViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    var reply: [TweetModel] = []
    var count = 0
    var name = ""
    var content = ""
    var time = ""
    var retweet = 0.0
    var quoteRetweet = 0.0
    var good = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableView = UITableView(frame: self.view.bounds, style: .grouped)
        tableView.sectionHeaderHeight = 0.1
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reply.count + 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch count {
        case 0:
            tableView.register(UINib(nibName: "CustomFirstCell", bundle: nil), forCellReuseIdentifier: "CustomFirstCell")
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomFirstCell", for: indexPath) as! CustomFirstCell
            cell.name.text = name
            cell.content.text = content
            cell.time.text = time
            count += 1
            return cell
        case 1:
            tableView.register(UINib(nibName: "CustomSecondCell", bundle: nil), forCellReuseIdentifier: "CustomSecondCell")
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomSecondCell", for: indexPath) as! CustomSecondCell
            cell.retweetCount = retweet
            cell.quoteRetweetCount = quoteRetweet
            count += 1
            return cell
        case 2:
            tableView.register(UINib(nibName: "CustomThirdCell", bundle: nil), forCellReuseIdentifier: "CustomThirdCell")
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomThirdCell", for: indexPath) as! CustomThirdCell
            cell.goodCount = good
            count += 1
            return cell
        case 3:
            tableView.register(UINib(nibName: "CustomFourthCell", bundle: nil), forCellReuseIdentifier: "CustomFourthCell")
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomFourthCell", for: indexPath) as! CustomFourthCell
            count += 1
            return cell
        default:
            tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
            let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
            let past = reply[count - 4].time
            let now = Date().timeIntervalSince1970
            cell.name.text = reply[count - 4].name
            cell.time.text = reply[count - 4].timeCheck(now: now, past: past)
            cell.content.text = reply[count - 4].content
            count += 1
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
}
