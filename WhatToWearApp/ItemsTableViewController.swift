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
    let clothing = Clothing()
    
    let table = UITableView()
    
    
    override func viewWillLayoutSubviews() {
        self.view.backgroundColor = UIColor.white()
        self.view.addSubview(table)
        self.table.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraint(NSLayoutConstraint(item: table, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: table, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: table, attribute: .top, relatedBy: .equal, toItem: self.topLayoutGuide, attribute: NSLayoutAttribute.bottom, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: table, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: 0.0))
    }
    
    override func viewDidLoad() {
        table.dataSource = self
        table.delegate = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        let addItemButton = UIBarButtonItem(title: "+", style: UIBarButtonItemStyle.plain, target: self, action: #selector(openAddItem(sender:)))
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
        return clothing.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        var item = clothing.items[indexPath.row]
        cell.textLabel?.text = "\(item["type"]!): \(item["color"]!) \(item["style"]!) from \(item["brand"]!)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            clothing.items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
        }
    }
    
    
    
}
