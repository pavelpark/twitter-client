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
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var allTweets = [Tweet]() {
        didSet{
            self.tableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Timeline"
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.estimatedRowHeight = 50
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        updateTimeLine()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier == "showDetailSegue" {
            //do some things
            
            if let selectedIndex = self.tableView.indexPathForSelectedRow?.row {
                let selectedTweet = self.allTweets[selectedIndex]
                print (selectedTweet)
                guard let destinationController = segue.destination as? TweetDetailViewController else { return }
                
                destinationController.tweet = selectedTweet
                
            }
            
            
            
        }
        
    }
    
    func updateTimeLine(){
        
        self.activityIndicator.startAnimating() //start here
        
        API.shared.getTweets { (tweets) in
            OperationQueue.main.addOperation {
                self.allTweets = tweets ?? []
                self.activityIndicator.stopAnimating() //stop here
            }
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection
        section: Int) -> Int {
        return allTweets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if let cell = cell as? TweetCell{
            cell.tweetText.text = allTweets[indexPath.row].text
       
//        let currentTweet = allTweets[indexPath.row]
//        cell.textLabel?.text = currentTweet.text
       }
         return cell
    }
    
    //func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // print(indexPath.row)
    //}
}
