//
//  DetailViewController.swift
//  Project1-StormViewer
//
//  Created by Ермоленко Константин on 13.03.2020.
//  Copyright © 2020 Ермоленко Константин. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    // MARK: - IB Outlets
    @IBOutlet var imageView: UIImageView!
    
    // MARK: - Public Properties
    var selectedImage: String?
    var selectedImageTitle: String?
    
    // MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = selectedImageTitle
        navigationItem.largeTitleDisplayMode = .never
        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
}
