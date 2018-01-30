//
//  BigViewController.swift
//  SlideshowApp
//
//  Created by kuroda tatsuaki on 2018/01/24.
//  Copyright © 2018年 tatsuaki.kuroda. All rights reserved.
//

import UIKit

class BigViewController: UIViewController {
    var fileName:String = ""
 
    @IBOutlet weak var bigView: UIImageView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        bigView.image = UIImage(named:fileName)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
