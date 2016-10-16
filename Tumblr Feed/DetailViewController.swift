//
//  DetailViewController.swift
//  Tumblr Feed
//
//  Created by Harshit Mapara on 10/15/16.
//  Copyright © 2016 Harshit Mapara. All rights reserved.
//

import Foundation
import UIKit
import AFNetworking

class DetailViewController: UIViewController {
    
    @IBOutlet weak var detailImageView: UIImageView!
    var photoUrl:String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()    
        detailImageView.setImageWith(URL(string: photoUrl!)!)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
