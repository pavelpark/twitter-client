//
//  UserTimeLineViewController.swift
//  TwitterClient
//
//  Created by Pavel Parkhomey on 3/24/17.
//  Copyright © 2017 Pavel Parkhomey. All rights reserved.
//

import UIKit

class UserTimeLineViewController: UIViewController {

    @IBOutlet weak var tableViewFeed: UITableView!
    
    let tweetNib = UINib(nibName: "TweetNibCell", bundle: nil)
    //self.tableView.register(tweetNib, forCellReuseIdentifier: TweetNibCell.identifier)
    //let screenName = self.tweet.user.screenName
    //API.Shared.getTweetsFor(screenName)
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
