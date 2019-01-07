//
//  PageViewController.swift
//  NavigationTransition
//
//  Created by Leon Kang on 2019/1/7.
//  Copyright © 2019 Leon Kang. All rights reserved.
//

import UIKit

class PageViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let refreshControl: UIRefreshControl = UIRefreshControl(frame: CGRect(x: 0, y: 0, width: UIApplication.shared.keyWindow!.frame.width, height: 30))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.refreshControl = refreshControl
        refreshControl.target(forAction: Selector(("refreshing")), withSender: self)
    }
    
    func refreshing() {
        refreshControl.beginRefreshing()
        sleep(2000)
        refreshControl.endRefreshing()
    }

}


extension PageViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "card")!
    }
    
}
