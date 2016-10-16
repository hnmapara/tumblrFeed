//
//  PhotoViewController.swift
//  Tumblr Feed
//
//  Created by Harshit Mapara on 10/12/16.
//  Copyright © 2016 Harshit Mapara. All rights reserved.
//

import Foundation
import UIKit
import AFNetworking

class PhotoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var posts: Array? = []
    var valueToPass:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        //tableView.estimatedRowHeight = 300
        //tableView.rowHeight = UITableViewAutomaticDimension
        
        let apiKey = "Q6vHoaVm5L1u2ZAW1fqv3Jw48gFzYVg9P0vH0VHl3GVy6quoGV"
        let url = URL(string:"https://api.tumblr.com/v2/blog/humansofnewyork.tumblr.com/posts/photo?api_key=\(apiKey)")
        let request = URLRequest(url: url!)
        let session = URLSession(
            configuration: URLSessionConfiguration.default,
            delegate:nil,
            delegateQueue:OperationQueue.main
        )
        
        let task : URLSessionDataTask = session.dataTask(with: request,completionHandler: { (dataOrNil, response, error) in
            if let data = dataOrNil {
                if let responseDictionary = try! JSONSerialization.jsonObject(with: data, options:[]) as? NSDictionary {
                    NSLog("response: \(responseDictionary)")
                    self.posts = responseDictionary.value(forKeyPath: "response.posts") as? Array
                    self.tableView.reloadData()
                }
            }
        });
        task.resume()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // initialize the cell with the model
        // Ask cell to async load the image and when done display the image in the cell
    //}
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "com.mapara.customcell", for: indexPath as IndexPath) as! CustomPropertyCell
        //let cityState = data[indexPath.row].componentsSeparatedByString(", ")
        //cell.cityLabel.text = cityState.first
        //cell.stateLabel.text = cityState.last
        
        //cell.cellLable.text = "\(indexPath.row)"
        if let curDict = posts?[indexPath.row] as? NSDictionary {
            if let tempLable = curDict.value(forKeyPath: "blog_name") as? String {
                cell.cellLable.text = tempLable
            }
            if let tempPhotos = curDict.value(forKeyPath: "photos") as? Array<NSDictionary> {
                if  let photoDict = tempPhotos[0] as? NSDictionary {
                    if let photoUrl = photoDict.value(forKeyPath:"original_size.url") as? String {
                        cell.cellImage.setImageWith(URL(string: photoUrl)!)
                        cell.photoUrl = photoUrl
                    }
                }
            }
        }
        
        return cell
    }
    //func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    //    <#code#>
    //}
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (posts?.count)!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "MasterDetail") {
            // initialize new view controller and cast it as your view controller
            let viewController = segue.destination as! DetailViewController
            // your new view controller should have property that will store passed value
            let indexPath = tableView.indexPathForSelectedRow!
            let currentCell = tableView.cellForRow(at: indexPath)! as! CustomPropertyCell
            
            valueToPass = currentCell.photoUrl
            
            viewController.photoUrl = valueToPass
        }
    }
    
}

