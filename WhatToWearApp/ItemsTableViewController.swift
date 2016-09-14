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
        table.frame = CGRectMake(0, 0, view.frame.width, view.frame.height)
        table.dataSource = self
        table.delegate = self
        table.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        let segments = ["All", "Tops", "Bottoms", "Dresses"]
        segmentControl = UISegmentedControl(items: segments)
        segmentControl.selectedSegmentIndex = 0
        segmentControl.addTarget(self, action: #selector(ItemsTableViewController.changeSegment), forControlEvents: .ValueChanged)
        
        let addItemButton = UIBarButtonItem(title: "+", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(openAddItem(_:)))
        self.navigationItem.rightBarButtonItem = addItemButton
    }
    
    override func viewWillAppear(animated: Bool) {
//        let width: CGFloat = 240
//        if let navBar = self.navigationController?.navigationBar {
//            segmentControl.frame = CGRectMake(navBar.frame.width/2-width/2, 5, width, navBar.frame.height-10)
//            navBar.addSubview(segmentControl)
//        }
    }
    
    func openAddItem(sender: UIBarButtonItem) {
        let addItemVC = AddItemViewController()
        self.presentViewController(addItemVC, animated: true, completion: nil)
    }
    
    func changeSegment(sender: UISegmentedControl) {
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
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return outfitGenerator.items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        var item = outfitGenerator.items[indexPath.row]
        cell.textLabel?.text = "\(item["type"]!): \(item["color"]!) \(item["style"]!) from \(item["brand"]!)"
        return cell
    }

    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
        }
    }
    
}
