//
//  WindowController.swift
//  TouchBarBounce
//
//  Created by Matt Gibson on 01/11/2016.
//  Copyright © 2016 Matt Gibson. All rights reserved.
//

import Cocoa

class WindowController: NSWindowController {

    @IBOutlet weak var cell0: NSView!
    @IBOutlet weak var cell1: NSView!
    @IBOutlet weak var cell2: NSView!
    @IBOutlet weak var cell3: NSView!
    @IBOutlet weak var cell4: NSView!
    @IBOutlet weak var cell5: NSView!
    @IBOutlet weak var cell6: NSView!
    @IBOutlet weak var cell7: NSView!
    
    var cells: [NSView] { return [cell0, cell1, cell2, cell3, cell4, cell5, cell6, cell7] }
    override func windowDidLoad() {
        super.windowDidLoad()
        print(cells)

        let anim = CABasicAnimation(keyPath: "backgroundColor")
        anim.fromValue = NSColor.black.cgColor
        anim.toValue = NSColor.blue.cgColor
        anim.fillMode = kCAFillModeForwards
        anim.isRemovedOnCompletion = false

        for (index, cell) in cells.enumerated() {
            cell.wantsLayer = true
            anim.duration = 1 * CFTimeInterval(index)
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
