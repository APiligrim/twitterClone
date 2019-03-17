//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Albert Gertskis on 3/7/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var retweet: UIButton!
    @IBOutlet weak var userPictureView: UIImageView!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    
    
    var favorited: Bool = false
    var tweetId: Int = -1
   
    
    @IBAction func retweet(_ sender: Any) {
        TwitterAPICaller.client?.retweet(tweetId: tweetId, success: {
            self.setRetweeted(true)
        }, failure: { (error) in
            print("Error in retweeting: \(error)")
        })
    }
    
    @IBAction func favoriteTweet(_ sender: Any) {
        let toBeFavorited = !favorited
        if (toBeFavorited) {
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(true)
            }, failure: { (error) in
                print("Favorite did not succeed: \(error)")
            })
        } else {
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(false)
            }, failure: { (error) in
                print("Unfavorite did not succeed: \(error)")
            })
        }
    }
    
    func setFavorite(_ isFavorited: Bool) {
        favorited = isFavorited
        if (favorited) {
            favButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
            
        } else {
            favButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
        }
    }
    
    func setRetweeted(_ isRetweeted: Bool) {
        if (isRetweeted) {
            retweet.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            retweet.isEnabled = false
        } else {
            retweet.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
            retweet.isEnabled = true
        }
    }
    
    override func awakeFromNib() {
    
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
}
    
    
    
