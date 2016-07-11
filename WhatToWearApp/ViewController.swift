//
//  ViewController.swift
//  WhatToWearApp
//
//  Created by Luyuan Xing on 7/3/16.
//  Copyright © 2016 Luyuan Xing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var outfit: String = String()
//    let ref = Clothing().rootRef
    
    var listOfTops = Clothing().getTops()
    var listOfBottoms = Clothing().getBottoms()
    
    var badMatches: Array<[String:String]> = []
    var goodMatches: Array<[String:String]> = []
    
    var randomTop = Int()
    var randomBottom = Int()
    
    var display = UILabel()
    var refreshButton = UIButton()
    var voteBad = UIButton()
    var voteGood = UIButton()
    var addItem = UIButton()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        //
        self.refreshButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(refreshButton)
        view.addConstraint(NSLayoutConstraint(item: refreshButton, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: refreshButton, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: -30))
        view.addConstraint(NSLayoutConstraint(item: refreshButton, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: NSLayoutAttribute.width, multiplier: 0.5, constant: -20))
        view.addConstraint(NSLayoutConstraint(item: refreshButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: 60))
        self.refreshButton.layer.cornerRadius = 10
        self.refreshButton.layer.borderWidth = 2
        self.refreshButton.layer.borderColor = UIColor.black().cgColor
        self.refreshButton.backgroundColor = UIColor.clear()
        self.refreshButton.isUserInteractionEnabled = true
        self.refreshButton.setTitle("refresh!", for: [])
        self.refreshButton.setTitleColor(UIColor.black(), for: [])
        self.refreshButton.addTarget(self, action: #selector(ViewController.getOutfit), for: .touchUpInside)
        
        //
        self.display.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(display)
        
        self.view.addConstraint(NSLayoutConstraint(item: display, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: display, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1.0, constant: -60))
        self.view.addConstraint(NSLayoutConstraint(item: display, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 0.75, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: display, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 0.33, constant: 0))
        self.display.layer.borderWidth = 1
        self.display.layer.borderColor = UIColor.black().cgColor
        self.display.textAlignment = .center
        self.display.numberOfLines = 0
        
        //
        self.voteGood.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(voteGood)
        view.addConstraint(NSLayoutConstraint(item: voteGood, attribute: .right, relatedBy: .equal, toItem: self.refreshButton, attribute: .left, multiplier: 1.0, constant: -30))
        view.addConstraint(NSLayoutConstraint(item: voteGood, attribute: .centerY, relatedBy: .equal, toItem: self.refreshButton, attribute: .centerY, multiplier: 1.0, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: voteGood, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 45))
        view.addConstraint(NSLayoutConstraint(item: voteGood, attribute: .height, relatedBy: .equal, toItem: self.refreshButton, attribute: .height, multiplier: 1.0, constant: -5))
        self.voteGood.isUserInteractionEnabled = true
        self.voteGood.setImage(#imageLiteral(resourceName: "thumbsup"), for: [])
        self.voteGood.addTarget(self, action: #selector(ViewController.thumbsUp), for: .touchUpInside)
        
        
        //
        self.voteBad.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(voteBad)
        view.addConstraint(NSLayoutConstraint(item: voteBad, attribute: .left, relatedBy: .equal, toItem: self.refreshButton, attribute: .right, multiplier: 1.0, constant: 30))
        view.addConstraint(NSLayoutConstraint(item: voteBad, attribute: .centerY, relatedBy: .equal, toItem: self.refreshButton, attribute: .centerY, multiplier: 1.0, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: voteBad, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 45))
        view.addConstraint(NSLayoutConstraint(item: voteBad, attribute: .height, relatedBy: .equal, toItem: self.refreshButton, attribute: .height, multiplier: 1.0, constant: -5))
        self.voteBad.setTitleColor(UIColor.red(), for: [])
        self.voteBad.titleLabel?.textAlignment = .center
        self.voteBad.titleLabel?.numberOfLines = 0
        self.voteBad.isUserInteractionEnabled = true
        self.voteBad.setImage(#imageLiteral(resourceName: "thumbsdown"), for: [])
        self.voteBad.addTarget(self, action: #selector(ViewController.thumbsDown), for: .touchUpInside)
        
        //
        self.addItem.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addItem)
        view.addConstraint(NSLayoutConstraint(item: addItem, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 20))
        view.addConstraint(NSLayoutConstraint(item: addItem, attribute: .right, relatedBy: .equal, toItem: self.view, attribute: .right, multiplier: 1.0, constant: -20))
        self.addItem.setTitle("+", for: [])
        self.addItem.setTitleColor(UIColor.black(), for: [])
        self.addItem.addTarget(self, action: #selector(ViewController.itemAdd), for: .touchUpInside)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getOutfit()
//        let test = ref.child("4")
//        print("WHAT IS THE VALUE FOR ITEM 5\(test)")
    }
    
    func getOutfit() {
        self.randomTop = randomNum(someArray: listOfTops)
        self.randomBottom = randomNum(someArray: listOfBottoms)
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
    
    func randomNum(someArray: Array<[String:String]>) -> Int {
        let arraySize: Int = someArray.count
        let randomNum = Int(arc4random_uniform(UInt32(arraySize)))
        return randomNum
    }
    
    func thumbsDown() {
        addBadMatch(badMatch: [listOfTops[randomTop], listOfBottoms[randomBottom]])
        print("badMatches are \(badMatches)")
        getOutfit()
    }
    
    func thumbsUp() {
        addGoodMatch(goodMatch: [listOfTops[randomTop], listOfBottoms[randomBottom]])
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
    
    func itemAdd() {
        performSegue(withIdentifier: "addItemSegue", sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

