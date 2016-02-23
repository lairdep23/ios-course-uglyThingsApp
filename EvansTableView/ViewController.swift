//
//  ViewController.swift
//  EvansTableView
//
//  Created by Evan Laird on 2/23/16.
//  Copyright © 2016 Evan Laird. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var uglyThings = ["https://s-media-cache-ak0.pinimg.com/236x/f1/9a/51/f19a5199180cc1f5c82bb5367fca65b8.jpg", "http://cdn0.lostateminor.com/wp-content/uploads/2009/02/richard-stipl-2.jpg","http://application.denofgeek.com/images/gb/25bb/gremlins2.jpg","http://i.telegraph.co.uk/multimedia/archive/01565/blobfish_1565953c.jpg","https://monoinfinito.files.wordpress.com/2010/08/ugly3_lg1.gif"]
    
    var uglyTitles = ["Man, this one is ugly", "This one isn't so bad", "Fuck no man", "I wouldn't wanna look like that", "Someone turn this shit off"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
       
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("UglyCell")
            as? UglyCell {
                
                var img: UIImage!
                
                let url = NSURL(string: uglyThings[indexPath.row])!
                if let data = NSData(contentsOfURL: url) {
                    img = UIImage(data: data)
                } else {
                    img = UIImage(named: "dog")
                }
                
                cell.configureCell(img, text: uglyTitles[indexPath.row])
                
                return cell
        } else {
            return UglyCell()
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return uglyThings.count
    }

 


}

