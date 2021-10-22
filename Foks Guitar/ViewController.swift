//
//  ViewController.swift
//  Foks Guitar
//
//  Created by Яков Линг on 20.10.2021.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var rootView: NSView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer = CALayer()
        view.layer?.backgroundColor = CGColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1)
        // Do any additional setup after loading the view.
        
        self.renderView()
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    override func viewDidLayout() {
        super.viewDidLayout()
      
        self.renderView()
    }
    
    var selectedNote: [Int] = []
    
    
    func renderView(){
        for sv in rootView.subviews{
            sv.removeFromSuperview()
        }
        
        let w = self.rootView.frame.width
        let h = self.rootView.frame.height
        
        //1033.0
        //h 623.0
        
        let main = NSView(frame: NSRect(x: 0, y: 0, width: w, height: h))
        main.layer = CALayer()
//        main.layer?.contents = NSImage(named: "guitar1")
        
        let img = NSImageView(frame: main.frame)
        img.image = NSImage(named: "guitar1")
        img.imageScaling = .scaleAxesIndependently
        main.addSubview(img)
        
        let kh = h / 619.0
        let k = w / 1033.0
        let noteSize = 18.0 * kh
        var i = 0
        
        var row = 0

        let coords = [45.0, 91.0, 168.9, 245.0, 320.5, 391.0, 457.0, 518.0, 577.0, 635.0, 688.0, 738.0, 785.0, 828.0, 867.0, 901.0, 934.0, 965.0, 994.0]
        let lines = [354.0, 333.0, 312.0, 291.0, 270.0, 249.0]
        let starts = [nE, nB, nG, nD, nA, nE]
        
        for y in lines{
            i = starts[row]
            for x in coords {
                let sub = GriffNoteView(frame: NSRect(x: x * k, y: y * kh, width: noteSize, height: noteSize))
                sub.note = i % NotesList.count
                sub.handler = { note in
                    if self.selectedNote.contains(note) {
                        self.selectedNote = []
                    }else{
                        self.selectedNote = [note]
                    }
                    self.renderView()
                }
                sub.selected = selectedNote.contains(sub.note)
                main.addSubview(sub)
                i = i + 1
                
            }
            row = row + 1
        }
        
       
        
        rootView.addSubview(main)
        
    }
    
    
}

