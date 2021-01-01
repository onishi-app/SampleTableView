//
//  ViewController.swift
//  SampleTableView
//
//  Created by ryosuke on 2021/01/01.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let item = ["Cell 1Cell 1Cell 1Cell 1Cell 1Cell 1Cell 1Cell 1Cell 1Cell 1Cell 1Cell 1Cell 1Cell 1Cell 1Cell 1Cell 1Cell 1Cell 1Cell 1Cell 1Cell 1Cell 1Cell 1Cell 1Cell 1Cell 1", "Cell 2", "Cell 3", "Cell 4", "Cell 5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tableView = UITableView(frame: self.view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
        
        view.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
        cell.content.text = self.item[indexPath.row]
        return cell
    }
}

