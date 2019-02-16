//
//  ViewController.swift
//  habittracker
//
//  Created by Katy Felkner on 2/16/19.
//  Copyright © 2019 Katy Felkner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var label: UILabel!
    //var label = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        label.isHidden = true;
    }
    @IBAction func buttonAction(_ sender:  UIButton) {
        label.isHidden = false;
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

