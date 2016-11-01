//
//  WindowController.swift
//  TouchBarBounce
//
//  Created by Matt Gibson on 01/11/2016.
//  Copyright © 2016 Matt Gibson. All rights reserved.
//

import Cocoa

class WindowController: NSWindowController {
    override func windowDidLoad() {
        super.windowDidLoad();
    }
}

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
