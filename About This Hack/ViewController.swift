//
//  ViewController.swift
//  About This Hack
//
//  Created by 8itCat on 8/20/21.
//

// NOTE: This code is horribly unoptimized. If you find anything at all that can make it better, please change it. This is my first time making a storyboard app this complicated.

import Cocoa

class ViewController: NSViewController {
    
    
    // MARK: IBOutlets Overview
    
    @IBOutlet weak var picture: NSImageView!
    @IBOutlet weak var osVersion: NSTextField!
    @IBOutlet weak var osPrefix: NSTextField!
    @IBOutlet weak var systemVersion: NSTextField!
    @IBOutlet weak var macModel: NSTextField!
    @IBOutlet weak var cpu: NSTextField!
    @IBOutlet weak var ram: NSTextField!
    @IBOutlet weak var graphics: NSTextField!
    @IBOutlet weak var display: NSTextField!
  @IBOutlet weak var metal: NSTextField!
  @IBOutlet weak var startupDisk: NSTextField!
    @IBOutlet weak var serialNumber: NSTextField!
    @IBOutlet weak var ocVersion: NSTextField!
    @IBOutlet weak var ocPrefix: NSTextField!
    
  
  @IBAction func openSysInfo(_ sender: Any) {
    _ = run("open /System/Applications/Utilities/System\\ Information.app")
  }
    
    
    var osNumber = run("sw_vers | grep ProductVersion | cut -c 17-")
    var modelID = "Mac"
    var ocLevel = "Unknown"
    var ocVersionID = "Version"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        start()
        
    }
    

    override var representedObject: Any? {
        didSet {
        }
    }

    override func viewDidAppear() {
        self.view.window?.styleMask.remove(NSWindow.StyleMask.resizable)
    }
    

    func start() {
        print("Initializing...")
        HardwareCollector.getAllData()
        
        // Image
        switch HardwareCollector.OSvers {
        case .SONOMA:
          picture.image = NSImage(named: "Sonoma")
          break
        case .VENTURA:
          picture.image = NSImage(named: "Ventura")
          break
        case .MONTEREY:
            picture.image = NSImage(named: "Monterey")
            break
        case .BIG_SUR:
            picture.image = NSImage(named: "Big Sur")
            break
        case .CATALINA:
            picture.image = NSImage(named: "Catalina")
            break
        case .MOJAVE:
            picture.image = NSImage(named: "Mojave")
            break
        case .HIGH_SIERRA:
            picture.image = NSImage(named: "High Sierra")
            break
        case .SIERRA:
            picture.image = NSImage(named: "Sierra")
            break
        case .EL_CAPITAN:
            picture.image = NSImage(named: "El Capitan")
            break
        case .YOSEMITE:
            picture.image = NSImage(named: "Yosemite")
            break
        case .MAVERICKS:
            picture.image = NSImage(named: "Mavericks")
            break
        case .macOS:
            picture.image = NSImage(named: "Unknown")
            break
        }
        // macOS Version Name
        osVersion.stringValue = HardwareCollector.OSname
        
        // macOS Version ID
        systemVersion.stringValue = HardwareCollector.OSBuildNum
        
        // Mac Model
        macModel.stringValue = HardwareCollector.macName
        
        // CPU
        cpu.stringValue = HardwareCollector.CPUstring
        
        // RAM
        ram.stringValue = HardwareCollector.RAMstring
        
        // GPU
        graphics.stringValue = HardwareCollector.GPUstring
        
        // Display
        display.stringValue = HardwareCollector.DisplayString
      
      // Accelerator
      metal.stringValue = HardwareCollector.metalString
        
        // Startup Disk
        startupDisk.stringValue = HardwareCollector.StartupDiskString
        
        // Serial Number
        serialNumber.stringValue = HardwareCollector.SerialNumberString
        
        // OpenCore Version (Optional)
        if HardwareCollector.qHackintosh {
            ocVersion.stringValue = HardwareCollector.BootloaderString
            ocVersion.isHidden = false
            ocPrefix.isHidden = false
        }
        else {
            ocVersion.isHidden = true
            ocPrefix.isHidden = true
            ocVersion.stringValue = ""
        }
        updateView()
    }

    
    func updateView() {
        // Update View
        picture.needsDisplay = true
        osVersion.needsDisplay = true
        systemVersion.needsDisplay = true
        macModel.needsDisplay = true
        cpu.needsDisplay = true
        ram.needsDisplay = true
        graphics.needsDisplay = true
        display.needsDisplay = true
        startupDisk.needsDisplay = true
        serialNumber.needsDisplay = true
        ocVersion.needsDisplay = true
      metal.needsDisplay = true
    }
    
}
