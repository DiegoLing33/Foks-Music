//
//  ChordCombobox.swift
//  Foks Guitar
//
//  Created by Яков Линг on 20.10.2021.
//

import Cocoa

class ChordCombobox: NSComboBox, NSComboBoxDataSource, NSComboBoxDelegate{
    
    var handler: ((_ selected: Int) -> Void)? = nil
    
    override func viewDidMoveToWindow() {
        super.viewDidMoveToWindow()
        self.delegate = self
        self.dataSource = self

    }
    

    func numberOfItems(in comboBox: NSComboBox) -> Int {
        return Chords.count
    }
    
    
    func comboBoxSelectionDidChange(_ notification: Notification) {
        if let handler = handler {
            handler(indexOfSelectedItem)
        }
        self.window?.makeFirstResponder(nil)
    }
    
    func comboBox(_ comboBox: NSComboBox, objectValueForItemAt index: Int) -> Any? {
        let cell = NSComboBoxCell(textCell: Chords[index])
        return cell
    }
    

    
}
