//
//  WindowController.swift
//  TouchBarBounce
//
//  Created by Matt Gibson on 01/11/2016.
//  Copyright © 2016 Matt Gibson. All rights reserved.
//

import Cocoa

@available(OSX 10.12.1, *)
class WindowController: NSWindowController {

    @IBOutlet weak var cell0: NSView!
    @IBOutlet weak var cell1: NSView!
    @IBOutlet weak var cell2: NSView!
    @IBOutlet weak var cell3: NSView!
    @IBOutlet weak var cell4: NSView!
    @IBOutlet weak var cell5: NSView!
    @IBOutlet weak var cell6: NSView!
    @IBOutlet weak var cell7: NSView!
    
    @IBOutlet weak var touchBarGroup: NSGroupTouchBarItem!
    var cells: [NSView] { return [cell0, cell1, cell2, cell3, cell4, cell5, cell6, cell7] }
    override func windowDidLoad() {
        super.windowDidLoad()
        for cell in cells {
            cell.layer = CALayer()
            cell.wantsLayer = true
        }
        let anim = CABasicAnimation(keyPath: "backgroundColor")
        anim.fromValue = NSColor.black.cgColor
        anim.toValue = NSColor(red: 0.7, green: 0, blue: 0, alpha: 1).cgColor
        anim.fillMode = kCAFillModeForwards
        anim.autoreverses = true
        anim.isRemovedOnCompletion = false
        
        for (index, cell) in cells.enumerated() {
            anim.beginTime = CACurrentMediaTime() + (0.2 * CFTimeInterval(index)) + 2
            anim.duration = 0.3
            cell.layer?.add(anim, forKey: nil)
        }
        for (index, cell) in cells.reversed().enumerated() {
            anim.beginTime = CACurrentMediaTime() + (0.2 * CFTimeInterval(index)) + 3.4
            anim.duration = 0.3
            cell.layer?.add(anim, forKey: nil)
        }
    }
}



/*
@available(OSX 10.12.1, *)
extension WindowController: NSTouchBarDelegate {
    override func makeTouchBar() -> NSTouchBar? {
        let touchBar = NSTouchBar()
        touchBar.delegate = self
        touchBar.defaultItemIdentifiers = [.launch, .hyperspace]
        return touchBar
    }
    
    func launch() {
        
    }
    func hyperspace() {
    
    }
    
    func touchBar(_ touchBar: NSTouchBar, makeItemForIdentifier identifier: NSTouchBarItemIdentifier) -> NSTouchBarItem? {
        // Later
        switch identifier {
        case NSTouchBarItemIdentifier .launch:
            let item = NSCustomTouchBarItem(identifier: identifier)
            item.view = NSButton(title: "🚀 Launch", target: self, action: #selector(launch))
            return item
        case NSTouchBarItemIdentifier .hyperspace:
            let item = NSCustomTouchBarItem(identifier: identifier)
            item.view = NSButton(title: "😱 Hyperspace", target: self, action: #selector(hyperspace))
            return item
        default:
            return nil
        }
    }
}

extension NSTouchBarItemIdentifier {
    static let launch = NSTouchBarItemIdentifier("uk.co.gothick.bounce.launch")
    static let hyperspace = NSTouchBarItemIdentifier("uk.co.gothick.bounce.hyperspace")
}
*/
