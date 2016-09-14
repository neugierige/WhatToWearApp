//
//  AddItemViewController.swift
//  WhatToWearApp
//
//  Created by Luyuan Xing on 7/29/16.
//  Copyright © 2016 Luyuan Xing. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class AddItemViewController: UIViewController {
    
    let dismissButton = UIButton()
    let array = ["Tank top", "Sleeveless", "T-Shirt", "Long sleeve", "3/4 sleeve", "Button Down", "Blouse", "Tunic", "Collarless", "Sweatshirt", "Cardigan", "Sweater", "Vest", "Shorts", "Capris", "Skirt", "Pencil Skirt", "Skinny jeans", "Bootleg Jeans", "Bellbottom Jeans", "Khakis", "Dress pants", "Wideleg", "Leggings"]
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor.whiteColor()
        navigationController?.navigationBarHidden = true
        
        dismissButtonSetup()
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSizeMake(100, 100)
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        
        let collectionView = UICollectionView(frame: CGRectMake(0, 40, view.frame.width, view.frame.height), collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(collectionView)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
    }
    
    func dismissButtonSetup() {
        view.addSubview(dismissButton)
        dismissButton.frame = CGRectMake(view.frame.maxX-20, 20, 15, 15)
        dismissButton.setTitle("x", forState: .Normal)
        dismissButton.setTitleColor(UIColor.blackColor(), forState: [])
        dismissButton.addTarget(self, action: #selector(dismissView), forControlEvents: .TouchUpInside)
    }
    
    func dismissView() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    
}

extension AddItemViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as UICollectionViewCell
        cell.layer.cornerRadius = 8
        cell.layer.borderColor = UIColor.blackColor().CGColor
        cell.layer.borderWidth = 1
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: cell.frame.width, height: cell.frame.height))
        label.numberOfLines = 0
        label.textAlignment = .Center
        
        label.text = "\(array[indexPath.row])"
        
        cell.contentView.addSubview(label)
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let brandVC = BrandPickerViewController()
        self.navigationController?.showViewController(brandVC, sender: self)
    }
    
}









