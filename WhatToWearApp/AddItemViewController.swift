//
//  AddItemViewController.swift
//  WhatToWearApp
//
//  Created by Luyuan Xing on 7/15/16.
//  Copyright © 2016 Luyuan Xing. All rights reserved.
//

import UIKit

class AddItemViewController :UIViewController, UICollectionViewDelegate {
    let grid = UICollectionView()
    let items = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q"]
    
    override func viewWillAppear(_ animated: Bool) {
        self.view.addSubview(grid)
        self.grid.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addConstraint(NSLayoutConstraint(item: grid, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: grid, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1.0, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: grid, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 1.0, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: grid, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 1.0, constant: 0))
        grid.delegate = self
    }
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.red()
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        let cell = grid.dequeueReusableSupplementaryView(ofKind: reuseIdentifier, withReuseIdentifier: "cell", for: IndexPath)
    }
    
    
    
}
