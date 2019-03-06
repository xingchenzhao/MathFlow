//
//  ContentViewController.swift
//  Mattth
//
//  Created by 赵星辰 on 2/9/19.
//  Copyright © 2019 Xingchen Zhao. All rights reserved.
//

import Foundation
import AppKit

class ViewController : NSViewController{
    
    weak var tableView : NSTableView!
    
    let tableViewData = [["Original Formula":"X+1 = 3","Converted Formula":"x+1 = 3"],
                         ["Original Formula":"X+1 = 3","Converted Formula":"x+1 = 3"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self as? NSTableViewDelegate
        self.tableView.dataSource = self as? NSTableViewDataSource
    }
}
    extension ViewController:NSTableViewDataSource{
        func numberOfRows(in tableView: NSTableView) -> Int {
            return tableViewData.count
        }
        
        func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
            return tableViewData[row][(tableColumn?.identifier.rawValue)!]
        }
    }
    
    

