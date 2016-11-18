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
        view.backgroundColor = UIColor.white
        navigationController?.isNavigationBarHidden = true
        
        dismissButtonSetup()
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 40, width: view.frame.width, height: view.frame.height), collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = UIColor.white
        self.view.addSubview(collectionView)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    func dismissButtonSetup() {
        view.addSubview(dismissButton)
        dismissButton.frame = CGRect(x: view.frame.maxX-20, y: 20, width: 15, height: 15)
        dismissButton.setTitle("x", for: UIControlState())
        dismissButton.setTitleColor(UIColor.black, for: [])
        dismissButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
    }
    
    func dismissView() {
        self.dismiss(animated: true, completion: nil)
    }

    
}

extension AddItemViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as UICollectionViewCell
        cell.layer.cornerRadius = 8
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: cell.frame.width, height: cell.frame.height))
        label.numberOfLines = 0
        label.textAlignment = .center
        
        label.text = "\(array[(indexPath as NSIndexPath).row])"
        
        cell.contentView.addSubview(label)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let brandVC = BrandPickerViewController()
        self.navigationController?.show(brandVC, sender: self)
    }
    
}









