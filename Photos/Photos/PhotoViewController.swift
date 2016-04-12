//
//  PhotoViewController.swift
//  Photos
//
//  Created by Eugene Tsai on 4/11/16.
//  Copyright © 2016 iOS DeCal. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    
    @IBOutlet var username: UILabel!
    @IBOutlet var date: UILabel!
    @IBOutlet var photoImage: UIImageView!
    @IBOutlet var numberOfLikes: UILabel!
    @IBOutlet var heartView: UIImageView!
    
    var photo = Photo!()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        username.text = String(photo!.username)
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .MediumStyle
        dateFormatter.timeStyle = .NoStyle
        date.text = dateFormatter.stringFromDate(photo!.date)
        
        let url = NSURL(string: photo!.url)
        if let data = NSData(contentsOfURL: url!) {
            photoImage.image = UIImage(data: data)
        }
        
        numberOfLikes.text = "Number of Likes: " + String(photo!.likes)
        
        heartView.userInteractionEnabled  = true
        heartView.addGestureRecognizer(UITapGestureRecognizer(target: self, action:Selector("heartPressed")))
    
        if photo.liked == true {
            heartView.image = UIImage(named: "filledheart.png")
        } else {
            heartView.image = UIImage(named: "emptyheart.png")
        }
    }

    func heartPressed() {
        if photo.liked == true {
            heartView.image = UIImage(named: "emptyheart.png")
            photo.liked = false
        } else {
            heartView.image = UIImage(named: "filledheart.png")
            photo.liked = true
        }
    }
}
