//
//  GriffNoteView.swift
//  Foks Guitar
//
//  Created by Яков Линг on 20.10.2021.
//

import Cocoa

class GriffNoteView: NSView{
    
    let noteView = NSTextView()
    var note: Int = nC
    var handler: ( (_ note: Int) -> Void)? = nil
    
    var selected = false
    
    override func viewDidMoveToWindow() {
        super.viewDidMoveToWindow()
        self.layer = CALayer()
        self.layer!.backgroundColor = CGColor.init(red: 1, green: 1, blue: 1, alpha: 1)
        self.layer?.cornerRadius = frame.height / 2
        
        if selected {
            self.layer!.backgroundColor = CGColor.init(red: 1, green: 0, blue: 0, alpha: 1)
        }
        
        noteView.frame = NSRect(x: -3.5, y: 0.7 * (frame.height / 20.0), width: self.frame.width + 7, height: self.frame.height)
        noteView.string = NotesList[note]
        noteView.isEditable = false
        noteView.font = NSFont(name: "PT Sans Bold", size: 14.0)
        noteView.isSelectable = false
        noteView.alignment = .center
        noteView.textColor = .black
        noteView.backgroundColor = .clear
        self.addSubview(noteView)
    }
    
    override func mouseUp(with event: NSEvent) {
        if let handler = handler {
            handler(note)
        }
    }
    
    
}
