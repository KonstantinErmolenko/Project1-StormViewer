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
    var selectedImageNumber = 0
    var totalImages = 0
    
    // MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()

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
    
    // MARK: - Private Methods
    private func setupNavigationBar() {
        title = "Picture \(selectedImageNumber) of \(totalImages)"
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .action,
            target: self,
            action: #selector(shareTapped)
        )
    }
    
    @objc private func shareTapped() {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8)
        else {
            print("No image found")
            return
        }
        
        let vc = UIActivityViewController(activityItems: [image, selectedImage!], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
}
