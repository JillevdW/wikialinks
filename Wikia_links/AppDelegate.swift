//
//  AppDelegate.swift
//  Wikia_links
//
//  Created by Jille van der Weerd on 24/09/2017.
//  Copyright © 2017 De Programmeermeneer. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    let statusItem = NSStatusBar.system.statusItem(withLength:NSStatusItem.squareLength)
    let popover = NSPopover()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        if let button = statusItem.button {
            button.image = NSImage(named:NSImage.Name("StatusBarButtonImage"))
            //button.action = #selector(printQuote(_:))
        }
        popover.behavior = NSPopover.Behavior.transient
        popover.contentViewController = UploadViewController.freshController()
        constructMenu()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    @objc func menuItemButton(_ sender: Any?) {
        closePopover(sender: nil)
    }
    
    @objc func uploadImage(_ sender: Any?) {
        togglePopover(nil)
    }
    
    @objc func openSettings(_ sender: Any?) {
        //stuff
    }
    
    func constructMenu() {
        let menu = NSMenu()
        
        menu.addItem(NSMenuItem(title: "Upload Image", action: #selector(AppDelegate.uploadImage(_:)), keyEquivalent: "U"))
        menu.addItem(NSMenuItem.separator())
        menu.addItem(NSMenuItem(title: "Quit", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q")) 
        
        statusItem.menu = menu
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

