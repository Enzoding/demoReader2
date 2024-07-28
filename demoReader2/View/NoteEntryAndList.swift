//
//  NoteEntryAndList.swift
//  demoReader2
//
//  Created by 龙龙 on 2024/7/23.
//

import SwiftUI
import ImagePickerView

struct NoteEntryAndList: View {
    @StateObject var noteData = TabNoteData()
    @State var titleInput = ""
    @State var contentInput = ""
    @State var image: UIImage?
    @State var showImagePicker: Bool = false
    
    var body: some View {
        VStack {
            // 存储输入笔记
            VStack{
                HStack {
                    // 如果有图片，就显示，反之，什么都不显示
                    if image != nil {
                        Image(uiImage: image!)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .cornerRadius(100)
                    }
                    // 文字输入框
                    VStack{
                        TextField("Title", text: $titleInput)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        TextField("Content", text: $contentInput)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                }
                HStack{
                    Button(action: {
                        showImagePicker.toggle()
                    }) {
                        RoundButtonView(text: "图片", image: "photo")
                    }
                    .sheet(isPresented: $showImagePicker) {
                        ImagePickerView(sourceType: .photoLibrary) {
                            image in
                            self.image = image
                        }
                    }
                    
                    Spacer()
                    Button(action: {
                        save()
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
                    HStack {
                        if note.imageURLAppendix != nil {
                            Image(uiImage: noteData.getImage(note.imageURLAppendix!))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 60, height: 60)
                                .cornerRadius(100)
                        }
                        VStack(alignment:.leading,spacing: 10){
                            Text(note.title)
                                .font(.title3)
                                .bold()
                            Text(note.content)
                        }
                    }
                    
                }
                .onDelete(perform: delete)
            }
            .listStyle(InsetGroupedListStyle())
        }
    }
    func delete(offsets: IndexSet) {
        noteData.notes.remove(atOffsets: offsets)
        noteData.saveNotes()
    }
    
    func save() {
        let id = UUID()
        if let data = image?.pngData() {
            noteData.saveImage(id: id, data: data)
        }
        let newNote = Note(id: id, title: titleInput, content: contentInput, imageURLAppendix: image == nil ? nil :"\(id).png")
        noteData.notes.append(newNote)
        noteData.saveNotes()
        titleInput = ""
        contentInput = ""
        image = nil
    }
}

#Preview {
    NoteEntryAndList()
}

