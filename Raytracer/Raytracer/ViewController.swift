//
//  ViewController.swift
//  Raytracer
//
//  Created by quockhai on 2019/3/15.
//  Copyright © 2019 Polymath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    weak var imageView: UIImageView!
    weak var statusLabel: UILabel!
    
    override func loadView() {
        super.loadView()
        
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(imageView)
        
        let statusLabel = UILabel(frame: .zero)
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(statusLabel)
        
        NSLayoutConstraint.activate([
            statusLabel.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            statusLabel.heightAnchor.constraint(equalToConstant: 100.0),
            statusLabel.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            statusLabel.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor)
            ])
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 0.5),
            imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
            ])
        
        self.imageView = imageView
        self.statusLabel = statusLabel
    }
    
    func configureSubViews() {
        self.statusLabel.numberOfLines = 0
        self.statusLabel.textAlignment = .center
        self.statusLabel.isHidden = true
        
        
        let width = Int(UIScreen.main.bounds.width)
        
        let pixelSet = makePixelSet(width: width, width / 2)
        self.imageView.image = UIImage(ciImage: imageFromPixels(pixels: pixelSet))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureSubViews()
        
        guard MTLCreateSystemDefaultDevice() != nil else {
            self.statusLabel.isHidden = false
            self.statusLabel.text = " Your device is not supported Metal 🤪"
            return
        }
    }
}

