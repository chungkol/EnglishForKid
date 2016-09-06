//
//  DetailCellViewController.swift
//  EnglishForKids
//
//  Created by Chung on 9/6/16.
//  Copyright © 2016 newayplus. All rights reserved.
//

import UIKit

class DetailCellViewController: UIViewController {

    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var detailImage: UIImageView!
    
    var stringTitle: String!

    var stringImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailTitle.text = stringTitle
        detailImage.image = stringImage
        let backButton = UIBarButtonItem()
        self.navigationItem.backBarButtonItem = backButton
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
