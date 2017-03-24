//
//  User.swift
//  TwitterClient
//
//  Created by Pavel Parkhomey on 3/20/17.
//  Copyright © 2017 Pavel Parkhomey. All rights reserved.
//

import Foundation


class User {
    
    let name: String
    let profileImageURL : String
    let location: String
    let screenName : String
    let followerCount : Int
    
    
    init?(json: [String: Any]) {
        print(json)
        
        if let name = json["name"] as? String, let profileImageURL = json["profile_image_url_https"] as? String, let location = json["location"] as? String, let screenName = json["screen_name"] as? String, let followerCount = json["followers_count"] as? Int{
            
            self.name = name
            self.profileImageURL = profileImageURL.replacingOccurrences(of: "_normal", with: "")
            self.location = location
            self.screenName = screenName
            self.followerCount = followerCount
            
        } else {
            return nil
        }
    }
}
