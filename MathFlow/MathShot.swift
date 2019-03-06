//
//  MathShot.swift
//  MathShot
//
//  Created by 赵星辰 on 2/9/19.
//  Copyright © 2019 Xingchen Zhao. All rights reserved.
//

import Foundation
class MathShot{
    private var tempDir: String!
    
    init(){
        self.tempDir = NSTemporaryDirectory()
    }
    
    func screenCapture()->String{
        //implement screen capture use /usr/sbin/screencapture
        
        let task = Process()
        
        let timestamp = lround(NSDate().timeIntervalSince1970+1000)
        let fileName = "\(timestamp)_shot.png"
        let destination = "/Users/zhaoxingchen/Desktop/abc/Mattth/Build/Products/Debug/screenshot" + fileName
        
        task.launchPath = "/usr/sbin/screencapture/"
        task.arguments = ["-i","-r",destination]
        task.launch()
        task.waitUntilExit()
        
        
        print("Your screen image has been saved at +",destination)
        return destination
}
    
    @discardableResult
    func shell(launchPath: String, arguments: [String]) -> String? {
        let task = Process()
        task.launchPath = launchPath
        task.arguments = arguments
        
        let pipe = Pipe()
        task.standardOutput = pipe
        task.launch()
        
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output = String(data: data, encoding: String.Encoding.utf8)
        
        return output

    }
    
    
    
}
