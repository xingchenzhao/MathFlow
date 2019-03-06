//
//  TextViewController.swift
//  MathFlow
//
//  Created by 赵星辰 on 2/9/19.
//  Copyright © 2019 Xingchen Zhao. All rights reserved.
//

import Cocoa

class TextViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
}

extension TextViewController {
    // MARK: Storyboard instantiation
    static func freshController() -> TextViewController {
        //1.
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        //2.
        let identifier =  "TextViewController"
        //3.
        guard let viewcontroller = storyboard.instantiateController(withIdentifier: identifier) as? TextViewController else {
            fatalError("Why cant i find Text? - Check Main.storyboard")
        }
        return viewcontroller
    }
}
