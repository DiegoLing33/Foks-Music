//
//  Notes.swift
//  Foks Guitar
//
//  Created by Яков Линг on 20.10.2021.
//

import Foundation

let nC = 0
let nCSharp = 1
let nD = 2
let nDSharp = 3
let nE = 4
let nF = 5
let nFSharp = 6
let nG = 7
let nGSharp = 8
let nA = 9
let nASharp = 10
let nB = 11

let NotesList = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"]

let Chords = ["C", "Cm", "C#", "C#m", "D", "Dm", "D#", "D#m", "E", "Em", "F", "Fm", "F#", "F#m", "G", "Gm", "G#", "G#m", "A", "Am", "A#", "A#m", "B", "Bm"]

enum NoteKey: String {
    case C = "C", D = "D", E = "E", F = "F", G = "G", A = "A", B = "B"
}

enum ChordModifier: String {
    case minor = "m",
         major = ""
}

/// The note
struct Note: RawRepresentable {
    
    
    // Notes
    static let C = Note(.C)
    static let CSharp = Note(.C, sharp: true)
    static let D = Note(.D)
    static let DSharp = Note(.D, sharp: true)
    static let E = Note(.E)
    static let F = Note(.F)
    static let FSharp = Note(.F, sharp: true)
    static let G = Note(.G)
    static let GSharp = Note(.G, sharp: true)
    static let A = Note(.A)
    static let ASharp = Note(.A, sharp: true)
    static let B = Note(.B)
    
    /// List of all of the notes
    static let List = [
        Note.C,
        Note.CSharp,
        Note.D,
        Note.DSharp,
        Note.E,
        Note.F,
        Note.FSharp,
        Note.G,
        Note.GSharp,
        Note.A,
        Note.ASharp,
        Note.B,
    ]
    
    /// List of all whole notes (not sharp)
    static let WholeNotesList = [
        Note.C,
        Note.D,
        Note.E,
        Note.F,
        Note.G,
        Note.A,
        Note.B
    ]
    
    // Class
    typealias RawValue = String
    
    var rawValue: String {
        get { return "\(key.rawValue.uppercased())\(sharp ? "#" : "")"}
    }
    
    var key: NoteKey
    var sharp: Bool
    
    init(_ key: NoteKey, sharp: Bool = false){
        self.key = key
        self.sharp = sharp
    }
    
    init?(rawValue: String) {
        self.key = NoteKey(rawValue: rawValue.first?.uppercased() ?? "C") ?? .C
        self.sharp = rawValue.contains("#")
    }
}


/// Аккорд
struct Chord: RawRepresentable {
    // class
    
    typealias RawValue = String
    
    let note: Note
    let modifier: ChordModifier
    
    var rawValue: String {
        get { return "\(note.rawValue)\(modifier.rawValue)" }
    }
    
    /// Создает аккорд из исходного значения
    init?(rawValue: String) {
        self.note = Note(rawValue: rawValue.prefix(2).uppercased()) ?? .C
        self.modifier = ChordModifier(rawValue: rawValue.suffix(1).lowercased()) ?? .major
    }
    
    
    init(_ note: Note, modifier: ChordModifier = .major){
        self.note = note
        self.modifier = modifier
    }
}
