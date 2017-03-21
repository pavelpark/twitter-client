//
//  HomeTimelineViewController.swift
//  TwitterClient
//
//  Created by Pavel Parkhomey on 3/20/17.
//  Copyright © 2017 Pavel Parkhomey. All rights reserved.
//

import UIKit

class HomeTimelineViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var dataSource = [Tweet]()
    
    class TweetList {
        static let shared = TweetList()
        
        var allTweets = [Tweet]()
        
        private init(){}
        
        func add(tweet: Tweet){
            self.allTweets.append(tweet)
        }
    }

    @IBOutlet weak var tableView: UITableView!
    
    var allTweets = [Tweet]() {
        didSet{
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        updateTimeLine()
    }
    
    func updateTimeLine(){
        API.shared.getTweets { (tweets) in
            OperationQueue.main.addOperation {
                self.allTweets = tweets ?? []
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection
        section: Int) -> Int {
        return allTweets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        
        let currentTweet = allTweets[indexPath.row]
        
        cell.textLabel?.text = currentTweet.text
        cell.detailTextLabel?.text = currentTweet.user?.name
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
