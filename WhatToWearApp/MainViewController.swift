//
//  ViewController.swift
//  WhatToWearApp
//
//  Created by Luyuan Xing on 7/3/16.
//  Copyright © 2016 Luyuan Xing. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var outfit: String = String()
    
    var listOfTops = OutfitGenerator().getTops()
    var listOfBottoms = OutfitGenerator().getBottoms()
    var listOfOnepieces = OutfitGenerator().getOnePiece()
    
    var badMatches: Array<[String:String]> = []
    var goodMatches: Array<[String:String]> = []
    
    var randomTop = Int()
    var randomBottom = Int()
    var randomOnepiece = Int()
    
    var display = UILabel()
    var refreshButton = UIButton()
    var voteBad = UIButton()
    var voteGood = UIButton()
    var addItem = UIButton()
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        //
        self.refreshButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(refreshButton)
        self.view.addConstraint(NSLayoutConstraint(item: refreshButton, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: refreshButton, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: -30))
        self.view.addConstraint(NSLayoutConstraint(item: refreshButton, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.5, constant: -20))
        self.view.addConstraint(NSLayoutConstraint(item: refreshButton, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .Height, multiplier: 1.0, constant: 60))
        self.refreshButton.layer.cornerRadius = 10
        self.refreshButton.layer.borderWidth = 2
        self.refreshButton.layer.borderColor = UIColor.blackColor().CGColor
        self.refreshButton.backgroundColor = UIColor.clearColor()
        self.refreshButton.userInteractionEnabled = true
        self.refreshButton.setTitle("refresh!", forState: [])
        self.refreshButton.setTitleColor(UIColor.blackColor(), forState: [])
        self.refreshButton.addTarget(self, action: #selector(MainViewController.getOutfit), forControlEvents: .TouchUpInside)
        
        //
        self.display.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(display)
        
        self.view.addConstraint(NSLayoutConstraint(item: display, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: display, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1.0, constant: -60))
        self.view.addConstraint(NSLayoutConstraint(item: display, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.75, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: display, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.33, constant: 0))
        self.display.layer.borderWidth = 1
        self.display.layer.borderColor = UIColor.blackColor().CGColor
        self.display.textAlignment = .Center
        self.display.numberOfLines = 0
        
        //
        self.voteGood.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(voteGood)
        self.view.addConstraint(NSLayoutConstraint(item: voteGood, attribute: .Right, relatedBy: .Equal, toItem: self.refreshButton, attribute: .Left, multiplier: 1.0, constant: -30))
        self.view.addConstraint(NSLayoutConstraint(item: voteGood, attribute: .CenterY, relatedBy: .Equal, toItem: self.refreshButton, attribute: .CenterY, multiplier: 1.0, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: voteGood, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 45))
        self.view.addConstraint(NSLayoutConstraint(item: voteGood, attribute: .Height, relatedBy: .Equal, toItem: self.refreshButton, attribute: .Height, multiplier: 1.0, constant: -5))
        self.voteGood.userInteractionEnabled = true
        self.voteGood.setImage(UIImage(named: "thumbsup"), forState: [])
        self.voteGood.addTarget(self, action: #selector(MainViewController.thumbsUp), forControlEvents: .TouchUpInside)
        
        
        //
        self.voteBad.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(voteBad)
        self.view.addConstraint(NSLayoutConstraint(item: voteBad, attribute: .Left, relatedBy: .Equal, toItem: self.refreshButton, attribute: .Right, multiplier: 1.0, constant: 30))
        self.view.addConstraint(NSLayoutConstraint(item: voteBad, attribute: .CenterY, relatedBy: .Equal, toItem: self.refreshButton, attribute: .CenterY, multiplier: 1.0, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: voteBad, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 45))
        self.view.addConstraint(NSLayoutConstraint(item: voteBad, attribute: .Height, relatedBy: .Equal, toItem: self.refreshButton, attribute: .Height, multiplier: 1.0, constant: -5))
        self.voteBad.setTitleColor(UIColor.redColor(), forState: [])
        self.voteBad.titleLabel?.textAlignment = .Center
        self.voteBad.titleLabel?.numberOfLines = 0
        self.voteBad.userInteractionEnabled = true
        self.voteBad.setImage(UIImage(named: "thumbsdown"), forState: [])
        self.voteBad.addTarget(self, action: #selector(MainViewController.thumbsDown), forControlEvents: .TouchUpInside)
        
        //
        self.addItem.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(addItem)
        self.view.addConstraint(NSLayoutConstraint(item: addItem, attribute: .Top, relatedBy: .Equal, toItem: self.view, attribute: .Top, multiplier: 1.0, constant: 20))
        self.view.addConstraint(NSLayoutConstraint(item: addItem, attribute: .Right, relatedBy: .Equal, toItem: self.view, attribute: .Right, multiplier: 1.0, constant: -10))
        self.addItem.setImage(UIImage(named: "gear"), forState: [])
        self.addItem.setTitleColor(UIColor.blackColor(), forState: [])
        self.addItem.addTarget(self, action: #selector(openItemsTable), forControlEvents: .TouchUpInside)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //TODO: get the count of cases from Clothing class
        getOutfit()
    }
    
    func getOutfit() {
        self.randomTop = randomNum(listOfTops)
        self.randomBottom = randomNum(listOfBottoms)
        if (badMatches.contains { $0 == [listOfTops[randomTop], listOfBottoms[randomBottom]]} == true) {
            getOutfit()
        } else if badMatches.count == listOfTops.count * listOfBottoms.count{
            self.display.text = "no more matches possible :-("
        } else {
            var top = listOfTops[randomTop]
            var bottom = listOfBottoms[randomBottom]
            print("randomTop is \(randomTop)")
            print("randomBottom is \(randomBottom)")
            self.display.text = "top:" + "\r\n" + "\(top["color"]!) \(top["style"]!) from \(top["brand"]!)" + "\r\n" + "\r\n" + "bottom:" + "\r\n" + "\(bottom["color"]!) \(bottom["style"]!) from \(bottom["brand"]!)"
        }
    }

//    func getOutfitType() {
//        let num = Int(arc4random_uniform(UInt32(2)) + 1)
//        getOutfit(caseNum: num)
//    }
        
    
//    func getOutfit(caseNum: Int) {
//        if caseNum == 1 {
//            self.randomTop = randomNum(someArray: listOfTops)
//            self.randomBottom = randomNum(someArray: listOfBottoms)
//            if (badMatches.contains { $0 == [listOfTops[randomTop], listOfBottoms[randomBottom]]} == true) {
//                getOutfitType()
//            } else if badMatches.count == listOfTops.count * listOfBottoms.count{
//                self.display.text = "no more matches possible :-("
//            } else {
//                var top = listOfTops[randomTop]
//                var bottom = listOfBottoms[randomBottom]
//                print("randomTop is \(randomTop)")
//                print("randomBottom is \(randomBottom)")
//                self.display.text = "top:" + "\r\n" + "\(top["color"]!) \(top["style"]!) from \(top["brand"]!)" + "\r\n" + "\r\n" + "bottom:" + "\r\n" + "\(bottom["color"]!) \(bottom["style"]!) from \(bottom["brand"]!)"
//                return
//            }
//        } else if caseNum == 2 {
//            self.randomOnepiece = randomNum(someArray: listOfOnepieces)
//            var onePiece = listOfOnepieces[randomOnepiece]
//            self.display.text = "one piece:" + "\r\n" + "\(onePiece["color"]!) \(onePiece["style"]!) from \(onePiece["brand"]!)"
//            return
//        }
//    }
    
    func randomNum(someArray: Array<[String:String]>) -> Int {
        let arraySize: Int = someArray.count
        let randomNum = Int(arc4random_uniform(UInt32(arraySize)))
        return randomNum
    }
    
    func thumbsDown() {
        addBadMatch([listOfTops[randomTop], listOfBottoms[randomBottom]])
        print("badMatches are \(badMatches)")
        getOutfit()
    }
    
    func thumbsUp() {
        addGoodMatch([listOfTops[randomTop], listOfBottoms[randomBottom]])
        print("goodMatches are \(goodMatches)")
    }
    
    func addBadMatch(badMatch: Array<[String:String]>) {
        badMatches.append(badMatch.last!)
        print("the bad match is \(badMatch)")
    }
    
    func addGoodMatch(goodMatch: Array<[String:String]>) {
        goodMatches.append(goodMatch.last!)
        print("the good match is \(goodMatch)")
    }
    
    func openItemsTable() {
        let itemsTableVC = ItemsTableViewController()
        self.navigationController?.pushViewController(itemsTableVC, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

