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
    var voteDown = UIButton()
    var voteUp = UIButton()
    var gearIcon = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewsArray = [display, refreshButton, voteDown, voteUp, gearIcon]
        for item in viewsArray {
            view.addSubview(item)
        }
        
        display.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraint(NSLayoutConstraint(item: display, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: display, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1.0, constant: -60))
        view.addConstraint(NSLayoutConstraint(item: display, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.75, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: display, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.33, constant: 0))
        display.layer.borderWidth = 1
        display.layer.borderColor = UIColor.blackColor().CGColor
        display.textAlignment = .Center
        display.numberOfLines = 0
        
        let buffer: CGFloat = 30
        let fullWidth: CGFloat = view.frame.width - buffer*4
        let height: CGFloat = 60

        refreshButton.frame = CGRectMake(view.frame.midX - fullWidth/4, view.frame.maxY-(height+buffer), fullWidth/2, height)
        refreshButton.layer.cornerRadius = 10
        refreshButton.layer.borderWidth = 2
        refreshButton.layer.borderColor = UIColor.blackColor().CGColor
        refreshButton.backgroundColor = UIColor.clearColor()
        refreshButton.userInteractionEnabled = true
        refreshButton.setTitle("refresh!", forState: [])
        refreshButton.setTitleColor(UIColor.blackColor(), forState: [])
        refreshButton.addTarget(self, action: #selector(MainViewController.getOutfit), forControlEvents: .TouchUpInside)
        
        let buttonWidth = height-10
        voteUp.frame = CGRectMake(buffer, refreshButton.frame.minY, buttonWidth, buttonWidth)
        voteUp.userInteractionEnabled = true
        voteUp.setImage(UIImage(named: "thumbsup"), forState: [])
        voteUp.addTarget(self, action: #selector(MainViewController.thumbsUp), forControlEvents: .TouchUpInside)
        
        voteDown.frame = CGRectMake(view.frame.maxX - buttonWidth - buffer, refreshButton.frame.minY, buttonWidth, buttonWidth)
        voteDown.userInteractionEnabled = true
        voteDown.setImage(UIImage(named: "thumbsdown"), forState: [])
        voteDown.addTarget(self, action: #selector(MainViewController.thumbsDown), forControlEvents: .TouchUpInside)
        
        gearIcon.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraint(NSLayoutConstraint(item: gearIcon, attribute: .Top, relatedBy: .Equal, toItem: self.view, attribute: .Top, multiplier: 1.0, constant: 20))
        view.addConstraint(NSLayoutConstraint(item: gearIcon, attribute: .Right, relatedBy: .Equal, toItem: self.view, attribute: .Right, multiplier: 1.0, constant: -10))
        gearIcon.setImage(UIImage(named: "gear"), forState: [])
        gearIcon.setTitleColor(UIColor.blackColor(), forState: [])
        gearIcon.addTarget(self, action: #selector(openItemsTable), forControlEvents: .TouchUpInside)
        
        getOutfit()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
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
    
    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

