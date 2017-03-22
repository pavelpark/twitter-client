//
//  TweetDetailViewController.swift
//  TwitterClient
//
//  Created by Pavel Parkhomey on 3/22/17.
//  Copyright © 2017 Pavel Parkhomey. All rights reserved.
//

import UIKit

class TweetDetailViewController: UIViewController {

    @IBOutlet weak var tweetText: UILabel!
    @IBOutlet weak var userTweet: UILabel!
    var tweet : Tweet!
    
    override func viewDidLoad() {
        super.viewDidLoad()

 //       tweetText.text = self.tweet.text
        print(self.tweet.user?.name ?? "Unknown")
        print(self.tweet.text)
        
    }
    
}
