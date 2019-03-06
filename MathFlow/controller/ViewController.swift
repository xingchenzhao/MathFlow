//
//  ViewController.swift
//  MathShot
//
//  Created by 赵星辰 on 2/9/19.
//  Copyright © 2019 Xingchen Zhao. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSTableViewDelegate,
NSTableViewDataSource{
    
    var fs: MathShot!
    let viewWidth: CGFloat = 250
    let viewHeight: CGFloat = 250
    
    //var selected: Shot! = nil
    
    var keyPressed: Bool = false
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    
}

