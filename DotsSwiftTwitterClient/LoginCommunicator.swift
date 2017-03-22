//
//  LoginCommunicator.swift
//  DotsSwiftTwitterClient
//
//  Created by saekof on 2017-03-21.
//  Copyright © 2017 CICCC. All rights reserved.
//

import Social
import Accounts

struct LoginCommunicator {
    func login(handler: @escaping (Bool) ->()) {
        if !SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter) {
            handler(false)
            return
        }
        
        let store = ACAccountStore()
        let type = store.accountType(withAccountTypeIdentifier: ACAccountTypeIdentifierTwitter)
        
        store.requestAccessToAccounts(with: type, options: nil, completion:( { granted, error in
        
            guard granted else {
                handler(false)
                return
            }
            if let _ = error {
            
                handler(false)
                return
            }
            let accounts = store.accounts(with: type)
            
            if let account = accounts?.first as? ACAccount {
                Account.twitterAccount = account
                handler(true)
            
            }
        }))
    }
}
