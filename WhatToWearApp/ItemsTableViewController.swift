//
//  AddItemViewController.swift
//  WhatToWearApp
//
//  Created by Luyuan Xing on 7/15/16.
//  Copyright © 2016 Luyuan Xing. All rights reserved.
//

import UIKit

class ItemsTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let mainVC = MainViewController()
    let outfitGenerator = OutfitGenerator()
    let clothing = Clothing()
    
    let table = UITableView()
    
    
    override func viewWillLayoutSubviews() {
        self.view.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(table)
        self.table.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraint(NSLayoutConstraint(item: table, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: table, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: table, attribute: .Top, relatedBy: .Equal, toItem: self.topLayoutGuide, attribute: .Bottom, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: table, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: 0.0))
    }
    
    override func viewDidLoad() {
        table.dataSource = self
        table.delegate = self
        table.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
//        let addItemButton = UIBarButtonItem(title: "+", style: UIBarButtonItemStyle.plain, target: self, action: #selector(openAddItem(sender:)))
        let addItemButton = UIBarButtonItem(title: "+", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(openAddItem(_:)))
        self.navigationItem.rightBarButtonItem = addItemButton
    }
    
    func openAddItem(sender: UIBarButtonItem) {
        let addItemVC = AddItemViewController()
        self.navigationController?.pushViewController(addItemVC, animated: true)
    }
    
    
    //************* UITableView Stuffs *************//
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
