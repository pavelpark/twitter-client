//
//  API.swift
//  TwitterClient
//
//  Created by Pavel Parkhomey on 3/21/17.
//  Copyright © 2017 Pavel Parkhomey. All rights reserved.
//

import Foundation
import Accounts
import Social

typealias AcccountCallback = (ACAccount?)->()
typealias UserCallback = (User?)->()
typealias TweetsCallback = ([Tweet]?)->()

class API {
    static let shared = API()
    
    var account : ACAccount?
    
    private func login(callback : @escaping AcccountCallback) {
        
        let accountStore = ACAccountStore()
        
        let accountType = accountStore.accountType(withAccountTypeIdentifier: ACAccountTypeIdentifierTwitter)
        
        accountStore.requestAccessToAccounts(with: accountType, options: nil) { (success, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                callback(nil)
                return
            }
            
            if success {
                if let account = accountStore.accounts(with: accountType).first as? ACAccount{
                    callback(account)
                }
//                Refactor this for the lab to have many account ^
            } else {
                print("The user did not allow access to their account")
                callback(nil)
            }
        }
    }
    
//    getting the account of the user^
    private func getOAuthUser(callback: @escaping UserCallback){
        
        let url = URL(string: "http://api.twitter.com/1.1/account/verify_credentials.json")
        
        if let request = SLRequest(forServiceType: SLServiceTypeTwitter, requestMethod: .GET, url: url, parameters: nil){
            
            request.account = self.account
            
            request.perform(handler: { (data, response, error) in
                
                if let error = error {
                    print("Error: \(error)")
                    callback(nil)
                    return
                }
                
                guard let response = response else {callback(nil); return }
                guard let data = data else { callback(nil); return }
                
                
                switch response.statusCode {
                case 200...299:
                    if let userJSON = try! JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                        let user = User(json: userJSON)
                        callback(user)
                        
                    }
//                    update in lab^ abstract out the parser json
                default:
                    print("Error: response came back with satusCode: \(response.statusCode) ")
                    callback(nil)
                }
            })
            
        }
    }
//    Sending the crodentials to varify with twitter that we have the account verified^
    
    private func updateTimeLine(callback: TweetsCallback){
        
        
    }
//    fetch all the tweets^
    
    func getTweets(callback: TweetsCallback){
        
        
    }
    
    
}
