//
//  AddItemViewController.swift
//  WhatToWearApp
//
//  Created by Luyuan Xing on 7/15/16.
//  Copyright © 2016 Luyuan Xing. All rights reserved.
//

import UIKit

class ItemsTableViewController: UIViewController {
    
    let mainVC = MainViewController()
    let outfitGenerator = OutfitGenerator()
    
    var segmentControl = UISegmentedControl()
    let table = UITableView()
    
    
    override func viewDidLoad() {
        view.addSubview(table)
        table.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        table.dataSource = self
        table.delegate = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        let segments = ["All", "Tops", "Bottoms", "Dresses"]
        segmentControl = UISegmentedControl(items: segments)
        segmentControl.selectedSegmentIndex = 0
        segmentControl.addTarget(self, action: #selector(ItemsTableViewController.changeSegment), for: .valueChanged)
        
        let addItemButton = UIBarButtonItem(title: "+", style: UIBarButtonItemStyle.plain, target: self, action: #selector(openAddItem(_:)))
        self.navigationItem.rightBarButtonItem = addItemButton
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        let width: CGFloat = 240
//        if let navBar = self.navigationController?.navigationBar {
//            segmentControl.frame = CGRectMake(navBar.frame.width/2-width/2, 5, width, navBar.frame.height-10)
//            navBar.addSubview(segmentControl)
//        }
    }
    
    func openAddItem(_ sender: UIBarButtonItem) {
        let addItemVC = AddItemViewController()
        self.present(addItemVC, animated: true, completion: nil)
    }
    
    func changeSegment(_ sender: UISegmentedControl) {
        print("segement value changed")
//        let dm = DataManager()
//        switch sender.selectedSegmentIndex {
//        case 0: dm.getClothing()
//        case 1: dm.getTops()
//        case 2: dm.getBottoms()
//        case 3: dm.getOnePieces()
//        default: break
//        }
    }
    
}

extension ItemsTableViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return outfitGenerator.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var item = outfitGenerator.items[(indexPath as NSIndexPath).row]
        cell.textLabel?.text = "\(item["type"]!): \(item["color"]!) \(item["style"]!) from \(item["brand"]!)"
        return cell
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
        }
    }
    
}
