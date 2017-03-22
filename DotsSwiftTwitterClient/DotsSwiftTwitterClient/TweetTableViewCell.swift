//
//  TweetTableViewCell.swift
//  DotsSwiftTwitterClient
//
//  Created by saekof on 2017-03-21.
//  Copyright © 2017 CICCC. All rights reserved.
//

import UIKit

class TweetTableViewCell: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var screenName: UILabel!
    @IBOutlet weak var comments: UILabel!
    
    func fill(tweet: Tweet) {
        let downloadTask = URLSession.shared.dataTask(with: URL(string: tweet.user.profileImageURL)!) { [weak self] data, response, error in
            if let error = error {
                print(error)
                return
            }
            DispatchQueue.main.async {
                self?.userImage.image = UIImage(data: data!)
            }
        }
        downloadTask.resume()
        
        userName.text = tweet.user.name
        comments.text = tweet.text
        screenName.text = "@" + tweet.user.screenName
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
