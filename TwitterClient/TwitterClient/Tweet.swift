//
//  Tweet.swift
//  TwitterClient
//
//  Created by Pavel Parkhomey on 3/20/17.
//  Copyright © 2017 Pavel Parkhomey. All rights reserved.
//

import Foundation

class Tweet {
    
    let text : String
    let id : String
    let retweeted : Int
    
    var user: User?
    
    init?(json: [String: Any]) {
        if let text = json["text"] as? String, let id = json["id_str"] as? String, let retweeted = json["retweet_count"] as? Int {
            self.text = text
            self.id = id
            self.retweeted = retweeted
            
            
            if let userDictionary = json["user"] as? [String : Any]{
                self.user = User(json: userDictionary)
            }
        } else {
            return nil
        }
    }
    
}
