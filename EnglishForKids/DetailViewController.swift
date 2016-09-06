//
//  DetailViewController.swift
//  EnglishForKids
//
//  Created by Chung on 9/6/16.
//  Copyright © 2016 newayplus. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var stringTitle: String!
    var dictData: NSDictionary!
    var arrKeys: NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        //set titile nav
        self.title = stringTitle
        self.createDataWithName(stringTitle)
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Detail")

        
        
        
        
    }
    
    func createDataWithName(title:String){
        var path: String = ""
        if title == "Fruits" {
            path = NSBundle.mainBundle().pathForResource("FruitsList", ofType: "plist")!
        }
        if title == "Animals" {
            path = NSBundle.mainBundle().pathForResource("AnimalsList", ofType: "plist")!
        }
        if title == "Transportation" {
            path = NSBundle.mainBundle().pathForResource("TransportationsList", ofType: "plist")!
        }
        dictData = NSDictionary(contentsOfFile: path)!
        arrKeys = dictData.allKeys
        arrKeys = arrKeys.sortedArrayUsingSelector(#selector(NSNumber.compare(_:)))
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrKeys.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Detail", forIndexPath: indexPath)
        let key: String = arrKeys[indexPath.row] as! String
        
        cell.textLabel?.text = key
        cell.imageView?.image = UIImage(named: "\(dictData[key]!)")
        
        return cell
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("\(indexPath.row) - \(arrKeys[indexPath.row])")
                performSegueWithIdentifier("ShowDetailCell", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "ShowDetailCell") {
            let detailCell = segue.destinationViewController as! DetailCellViewController
            
            let selectedIndexPath: NSIndexPath = self.tableView.indexPathForSelectedRow!
            
            let selectedRow: UITableViewCell = self.tableView.cellForRowAtIndexPath(selectedIndexPath)!
            
            detailCell.stringTitle = selectedRow.textLabel?.text
            detailCell.stringImage = selectedRow.imageView?.image

        }
    }
    
    
    
}
