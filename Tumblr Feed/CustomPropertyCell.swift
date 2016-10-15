//
//  CustomPropertyCell.swift
//  Tumblr Feed
//
//  Created by Harshit Mapara on 10/12/16.
//  Copyright © 2016 Harshit Mapara. All rights reserved.
//

import UIKit

class CustomPropertyCell: UITableViewCell {

    @IBOutlet weak var cellLable: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    
    var _post: [String:String]?
    
    //func setPost(post: [String:String]?) {
      //  self._post = post
        //if let post = post {
            //self.cellLable.text = "post"
            // AFNetworking.async(){
                //self.cellImage = ""
        //}
        //}
    //}
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
