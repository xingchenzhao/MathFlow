//
//  AppDelegate.swift
//  MathShot
//
//  Created by 赵星辰 on 2/9/19.
//  Copyright © 2019 Xingchen Zhao. All rights reserved.
//

import Cocoa


@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate,NSPopoverDelegate {
    
    let statusItem:NSStatusItem
    let ms: MathShot! = MathShot()
    var menu = NSMenu()
    var popover: NSPopover
    var popoverMonitor: AnyObject?
    var str = ""
    override init(){
        popover = NSPopover()
        popover.contentViewController = NSViewController()
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
        
        super.init()
        
////        if let button = statusItem.button{
////            let cloudImage = NSImage(named:NSImage.Name("math"))
////            button.image = cloudImage
////        }
//        self.createMenu()
        
    }
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        if let button = statusItem.button {
            button.image = NSImage(named:NSImage.Name("math"))
            button.action = #selector(togglePopover(_:))
        }
        self.createMenu()
        popover.contentViewController = TextViewController.freshController()
    }
    
    func createMenu(){
        
        let screenCaptureItem = NSMenuItem(title: "Capture Screen", action: #selector(self.screenCapture), keyEquivalent: "s")
        
        menu.addItem(screenCaptureItem)
        
        statusItem.menu = menu
        

//        let showResultItem = NSMenuItem(title: "This is a test", action:      #selector(self.test), keyEquivalent: "x")
//        menu.addItem(showResultItem)
//        statusBar.menu = menu
        
   
        
    }
    
    
    @objc func test(){
        print("balah")
    }
    @objc func screenCapture(){
        var picAddress = ms.screenCapture()
        var x: [String] = [picAddress]
      
        let result: String?
        result = ms.shell(launchPath: "/Users/zhaoxingchen/Desktop/abc/Mattth/Build/Products/Debug/screenshot/mathbox/mathbox", arguments: x)
        
      
        if(result != nil ){
            str = result!
            self.addNewItem(result: result!)
            print(result!)
        }else{
            self.addNewItem(result: "Cannot recognize")
        }
    }
    
    func addNewItem(result:String){
        menu = NSMenu()
        
        let screenCaptureItem = NSMenuItem(title: "Capture Screen", action: #selector(self.screenCapture), keyEquivalent: "s")
        
        menu.addItem(screenCaptureItem)
        
        let convert = NSMenuItem(title:"Wolfram form: " + result, action: #selector(self.pasteBoard), keyEquivalent: "c")
    
        menu.addItem(convert)
        
        statusItem.menu = menu
//        statusItem.menu?.addItem()
        
        
    }

    @objc func pasteBoard(){
        let pasteBoard = NSPasteboard.general
        pasteBoard.clearContents()
        if(str != "Cannot recognize" ){
             pasteBoard.setString(str, forType: .string)
        }
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    @objc func togglePopover(_ sender: Any?) {
        if popover.isShown {
            closePopover(sender: sender)
        } else {
            showPopover(sender: sender)
        }
    }
    
    func showPopover(sender: Any?) {
        if let button = statusItem.button {
            popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
        }
    }
    
    func closePopover(sender: Any?) {
        popover.performClose(sender)
    }
    
    
}

