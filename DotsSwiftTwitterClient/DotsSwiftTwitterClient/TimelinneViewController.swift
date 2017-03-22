//
//  TimelinneViewController.swift
//  DotsSwiftTwitterClient
//
//  Created by saekof on 2017-03-21.
//  Copyright © 2017 CICCC. All rights reserved.
//

import UIKit

class TimelinneViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    
    var tweets: [Tweet] = []
    
    var loginClosure: (Bool) -> () = { isSuccess in
        switch isSuccess {
        case false:
            print("fail to login")
        case true:
            print("success to login")
        
        }
    
    
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let user = User(id: "1", screenName: "saeko0032", name: "ふくいさえこ", profileImageURL: "https://pbs.twimg.com/profile_images/1272291147/181948_158497447536903_100001299475273_274822_7097829_n.jpg")
        let tweet = Tweet(id: "01", text: "Twitterクライアントの内容を取得して出すよ", user: user)
        
        let tweets = [tweet]
        self.tweets = tweets
        self.myTableView.reloadData()
        
        
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        
        LoginCommunicator().login() {
            isSuccess in switch isSuccess{
            case false:
                print("fail to login")
            case true:
                print("success to login")
        // Do any additional setup after loading the view.
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension TimelinneViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("the sell was tapped by user!")
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}

extension TimelinneViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TweetTableViewCell") as! TweetTableViewCell
        cell.fill(tweet: tweets[indexPath.row])
        return cell
    }

}
