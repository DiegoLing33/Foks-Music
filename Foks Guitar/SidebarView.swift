//
//  SidebarView.swift
//  Foks Guitar
//
//  Created by Яков Линг on 20.10.2021.
//

import Foundation
import Cocoa

class SidebarView: NSView{
    
    override func viewDidMoveToWindow() {
        super.viewDidMoveToWindow()
        self.layer = CALayer()
        self.layer!.backgroundColor = CGColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)
        
        self.shadow = NSShadow()
        self.layer!.shadowColor  = .black
        self.layer!.shadowOpacity = 1
        self.layer!.shadowOffset = .zero
        self.layer!.shadowRadius = 5
        self.layer!.zPosition = 100
    }
}
