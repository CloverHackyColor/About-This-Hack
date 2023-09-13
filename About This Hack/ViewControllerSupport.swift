//
//  ViewControllerDisplays.swift
//  ViewControllerDisplays
//
//  Created by Marc Nich on 8/26/21.
//

import Foundation
import Cocoa

class ViewControllerSupport: NSViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        start()
        
    }
    
    @IBAction func macOSUserGuidePress(_ sender: NSButton) {
        let url = URL(string: "https://support.apple.com/guide/mac-help/welcome/mac")!
        if NSWorkspace.shared.open(url) {
            print("Browser Successfully opened")
        }
    }
    @IBAction func whatsNewInMacOSPress(_ sender: NSButton) {
        let url = URL(string: "https://help.apple.com/macos/sonoma/whats-new/")!
        if NSWorkspace.shared.open(url) {
            print("Browser Successfully opened")
        }
    }
    @IBAction func AppleSupportPress(_ sender: NSButton) {
        let url = URL(string: "https://support.apple.com")!
        if NSWorkspace.shared.open(url) {
            print("Browser Successfully opened")
        }
    }
    @IBAction func HackintoshPress(_ sender: NSButton) {
        let url = URL(string: "https://github.com/CloverHackyColor/CloverBootloader/wiki")!
        if NSWorkspace.shared.open(url) {
            print("Browser Successfully opened")
        }
    }
    @IBAction func HackCafeDiscordPress(_ sender: NSButton) {
        let url = URL(string: "https://www.insanelymac.com/forum/")!
        if NSWorkspace.shared.open(url) {
            print("Browser Successfully opened")
        }
    }
    @IBAction func MacBasicsPress(_ sender: NSButton) {
        let url = URL(string: "https://help.apple.com/macos/ventura/mac-basics/")!
        if NSWorkspace.shared.open(url) {
            print("Browser Successfully opened")
        }
    }
    //
    
    
    
    @IBAction func MacUserGuidePress(_ sender: NSButton) {
    
        let url = URL(string: "https://support.apple.com/manuals")!
        if NSWorkspace.shared.open(url) {
            print("Browser Successfully opened")
        }
    }
    
    override var representedObject: Any? {
        didSet {
        }
    }

    override func viewDidAppear() {
        self.view.window?.styleMask.remove(NSWindow.StyleMask.resizable)
    }
    
    func start() {
        print("Support View Initializing...")
    }
}
