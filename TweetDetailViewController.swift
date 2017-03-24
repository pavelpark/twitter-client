//
//  TweetDetailViewController.swift
//  TwitterClient
//
//  Created by Pavel Parkhomey on 3/22/17.
//  Copyright © 2017 Pavel Parkhomey. All rights reserved.
//

import UIKit

class TweetDetailViewController: UIViewController {
    
    @IBOutlet weak var reTweets: UILabel!
    @IBOutlet weak var tweetText: UILabel!
    @IBOutlet weak var userTweet: UILabel!
    var tweet : Tweet!
    
    
    override func viewDidLoad() {
        self.navigationItem.rightBarButtonItem?.isEnabled = true
        super.viewDidLoad()

        self.tweetText.text = self.tweet.text
        self.userTweet.text = self.tweet.user?.name ?? "Unkonwn"
        self.reTweets.text = ("Retweeted: \(self.tweet.retweeted)")
        print(self.tweet.user?.name ?? "Unknown")
        print(self.tweet.text)
        
    }
    
   // @IBAction func tapButton(_ sender: Any) {
   // }
}
