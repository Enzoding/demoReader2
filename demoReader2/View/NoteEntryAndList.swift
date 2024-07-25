//
//  NoteEntryAndList.swift
//  demoReader2
//
//  Created by 龙龙 on 2024/7/23.
//

import SwiftUI

struct NoteEntryAndList: View {
    @StateObject var noteData = TabNoteData()
    @State var titleInput = ""
    @State var contentInput = ""
    
    var body: some View {
        VStack {
            // 存储输入笔记
            VStack{
                TextField("Title", text: $titleInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Content", text: $contentInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                HStack{
                    Spacer()
                    Button(action: {
                        let id = UUID()
                        let newNote = Note(id: id, title: titleInput, content: contentInput)
                        noteData.notes.append(newNote)
                        noteData.saveNotes()
                        titleInput = ""
                        contentInput = ""
                    }) {
                        RoundButtonView(text: "储存笔记", image: "note.text.badge.plus")
                    }
                }
            }
            .padding()
            .background(Color.gray.gradient)
            .cornerRadius(10)
            .shadow(radius: 3)
            .padding()
            // 读取现有笔记
            List {
                ForEach(noteData.notes) { note in
                    VStack(alignment:.leading,spacing: 10){
                        Text(note.title)
                            .font(.title3)
                            .bold()
                        Text(note.content)
                    }
                }
                .onDelete(perform: deletae)
            }
            .listStyle(InsetGroupedListStyle())
        }
    }
    func deletae(offsets: IndexSet) {
        noteData.notes.remove(atOffsets: offsets)
        noteData.saveNotes()
    }
}

#Preview {
    NoteEntryAndList()
}

