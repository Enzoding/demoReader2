//
//  TabNoteData.swift
//  demoReader2
//
//  Created by 龙龙 on 2024/7/22.
//

import Foundation
import SwiftUI

// 表示一条笔记的结构
struct Note: Codable, Identifiable {
    var id: UUID
    var title: String
    var content: String
    var imageURLAppendix: String?
}

// 用来存多条笔记
class TabNoteData: ObservableObject{
    @Published var notes: [Note] = []
    static let sandBoxURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let notesURL = sandBoxURL.appendingPathComponent("notes.json")
    
    init() {
        notes = getNotes()
    }
    
    func getImage(_ imageURLAppendix: String) -> UIImage {
        let url = TabNoteData.sandBoxURL.appendingPathComponent(imageURLAppendix)
        let imageData = try! Data(contentsOf: url)
        return UIImage(data: imageData, scale: 1.0)!
    }
    
//    func getImage(_ imageURLAppendix: String) -> UIImage? {
//        let url = TabNoteData.sandBoxURL.appendingPathComponent(imageURLAppendix)
//        do {
//            let imageData = try Data(contentsOf: url)
//            return UIImage(data: imageData, scale: 0.0)
//        } catch {
//            print("Error loading image data: \(error)")
//            return nil
//        }
//    }
    
    // 存储图片的函数
    func saveImage(id: UUID, data: Data) {
        // 存储耗时，放入后台线程
        DispatchQueue.global(qos: .userInitiated).async {
            let url = TabNoteData.sandBoxURL.appendingPathComponent("\(id).png")
            try? data.write(to: url)
            
        }
    }
    
    
    func getNotes() -> [Note] {
        var result: [Note] = []
        // 判断是否有文件可供读取
        if FileManager.default.fileExists(atPath: notesURL.path) {
            let data = try! Data(contentsOf: notesURL)
            result = try! JSONDecoder().decode([Note].self, from: data)
        }
        
        return result
    }
    
    func saveNotes() {
        // 使用GCD分配，将任务放在后台执行，
        DispatchQueue.global(qos: .userInitiated).async {
            let data = try? JSONEncoder().encode(self.notes)
            try? data?.write(to: self.notesURL)
        }
    }
}
