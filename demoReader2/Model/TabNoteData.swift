//
//  TabNoteData.swift
//  demoReader2
//
//  Created by 龙龙 on 2024/7/22.
//

import Foundation

// 表示一条笔记的结构
struct Note: Codable, Identifiable {
    var id: UUID
    var title: String
    var content: String
}

// 用来存多条笔记
class TabNoteData: ObservableObject{
    @Published var notes: [Note] = []
    static let sandBoxURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let notesURL = sandBoxURL.appendingPathComponent("notes.json")
    
    init() {
        notes = getNotes()
    }
    
    func getNotes() -> [Note] {
        var result: [Note] = []
        
        return result
    }
    
    func saveNotes() {
        
    }
}
