//
//  ProfileViewController.swift
//  TwitterClient
//
//  Created by Pavel Parkhomey on 3/22/17.
//  Copyright © 2017 Pavel Parkhomey. All rights reserved.
//

import UIKit




class ProfileViewController: UIViewController {
    
    
    @IBOutlet weak var profileImg: UIImageView!
    
    @IBOutlet weak var nameProfile: UILabel!

    @IBOutlet weak var profileFollowers: UILabel!
    
    @IBOutlet weak var profileLocation: UILabel!
    
    var user: User!
    
        override func viewDidLoad() {
        super.viewDidLoad()
        self.getUser()
        
    }
    func getUser() {
        API.shared.getUserInfo { (user) in
            OperationQueue.main.addOperation {
                self.user = user
                self.nameProfile.text = user?.name
                
                let urlString = self.user.profileImageURL
                UIImage.fetchImageWith(urlString, callback: { (image) in
                    self.profileImg.image = image
                    self.profileFollowers.text = ("Followers: \(self.user.followerCount)")
                    self.profileLocation.text = self.user.location == "" ? "unknown" : self.user.location
                    
                })
                
            }
            

        }
    }
}

