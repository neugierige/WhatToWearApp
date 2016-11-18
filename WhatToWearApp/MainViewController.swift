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
        
        let viewsArray = [display, refreshButton, voteDown, voteUp, gearIcon] as [Any]
        for item in viewsArray {
            view.addSubview(item as! UIView)
        }
        
        display.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraint(NSLayoutConstraint(item: display, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: display, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1.0, constant: -60))
        view.addConstraint(NSLayoutConstraint(item: display, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 0.75, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: display, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 0.33, constant: 0))
        display.layer.borderWidth = 1
        display.layer.borderColor = UIColor.black.cgColor
        display.textAlignment = .center
        display.numberOfLines = 0
        
        let buffer: CGFloat = 30
        let fullWidth: CGFloat = view.frame.width - buffer*4
        let height: CGFloat = 60

        refreshButton.frame = CGRect(x: view.frame.midX - fullWidth/4, y: view.frame.maxY-(height+buffer), width: fullWidth/2, height: height)
        refreshButton.layer.cornerRadius = 10
        refreshButton.layer.borderWidth = 2
        refreshButton.layer.borderColor = UIColor.black.cgColor
        refreshButton.backgroundColor = UIColor.clear
        refreshButton.isUserInteractionEnabled = true
        refreshButton.setTitle("refresh!", for: [])
        refreshButton.setTitleColor(UIColor.black, for: [])
        refreshButton.addTarget(self, action: #selector(MainViewController.getOutfit), for: .touchUpInside)
        
        let buttonWidth = height-10
        voteUp.frame = CGRect(x: buffer, y: refreshButton.frame.minY, width: buttonWidth, height: buttonWidth)
        voteUp.isUserInteractionEnabled = true
        voteUp.setImage(UIImage(named: "thumbsup"), for: [])
        voteUp.addTarget(self, action: #selector(MainViewController.thumbsUp), for: .touchUpInside)
        
        voteDown.frame = CGRect(x: view.frame.maxX - buttonWidth - buffer, y: refreshButton.frame.minY, width: buttonWidth, height: buttonWidth)
        voteDown.isUserInteractionEnabled = true
        voteDown.setImage(UIImage(named: "thumbsdown"), for: [])
        voteDown.addTarget(self, action: #selector(MainViewController.thumbsDown), for: .touchUpInside)
        
        gearIcon.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraint(NSLayoutConstraint(item: gearIcon, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 20))
        view.addConstraint(NSLayoutConstraint(item: gearIcon, attribute: .right, relatedBy: .equal, toItem: self.view, attribute: .right, multiplier: 1.0, constant: -10))
        gearIcon.setImage(UIImage(named: "gear"), for: [])
        gearIcon.setTitleColor(UIColor.black, for: [])
        gearIcon.addTarget(self, action: #selector(openItemsTable), for: .touchUpInside)
        
        getOutfit()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
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
    
    func randomNum(_ someArray: Array<[String:String]>) -> Int {
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
    
    func addBadMatch(_ badMatch: Array<[String:String]>) {
        badMatches.append(badMatch.last!)
        print("the bad match is \(badMatch)")
    }
    
    func addGoodMatch(_ goodMatch: Array<[String:String]>) {
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

