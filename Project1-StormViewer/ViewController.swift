//
//  ViewController.swift
//  Project1-StormViewer
//
//  Created by Ермоленко Константин on 12.03.2020.
//  Copyright © 2020 Ермоленко Константин. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    // MARK: - Private Properties
    private var images = [String]()
    
    // MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        loadImages()
    }
    
    // MARK: - TableView Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = images[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController {
            vc.selectedImage = images[indexPath.row]
            vc.selectedImageTitle = "Picture \(indexPath.row + 1) of \(images.count)"
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    // MARK: - Private Methods
    private func loadImages() {
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                // this is a image to load
                images.append(item)
            }
        }
        images.sort()
    }
}

