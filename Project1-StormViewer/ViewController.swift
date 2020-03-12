//
//  ViewController.swift
//  Project1-StormViewer
//
//  Created by Ермоленко Константин on 12.03.2020.
//  Copyright © 2020 Ермоленко Константин. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                // this is a picture to load
                pictures.append(item)
            }
        }
        
        print(pictures)
    }
}

