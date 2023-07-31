//
//  NoteDetailView.swift
//  CoursesNotes
//
//  Created by David Grammatico on 31/07/2023.
//

import SwiftUI
import SwiftData
import PhotosUI

struct NoteDetailView: View {
    @Bindable var note: Note
    @State var subText: String = ""
    @State var photoItem: PhotosPickerItem?
    @State var data: Data?
    
    var body: some View {
        List {
            VStack(alignment: .leading, content: {
                Text("Nom : ")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                TextField(note.name, text: $note.name)
            })
            VStack(alignment: .leading, content: {
                Text("Description : ")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                TextEditor(text: $note.desc)
                    .frame(height: 150)
            })
            .onChange(of: note.name) { oldValue, newValue in
                note.updateDate()
            }
            .onChange(of: note.desc) { oldValue, newValue in
                note.updateDate()
            }
            Section("Les sous-notes") {
                VStack(content: {
                    HStack(content: {
                        TextField("Ajouter", text: $subText)
                        Button(action: {
                            // Add
                        }, label: {
                            Text("Ajouter")
                        })
                    })
                    HStack(content: {
                        PhotosPicker(selection: $photoItem, photoLibrary: .shared()) {
                            Image(systemName: "camera")
                        }
                        if data != nil, let uuimage = UIImage(data: data!) {
                            Image(uiImage: uuimage)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 75, height: 75, alignment: .center)
                            
                        }
                        if data != nil {
                            Button(action: {
                                data = nil
                            }, label: {
                                Text("Supprimer l'image")
                            })
                        }
                    })
                })
            }
        }
    }
}

//#Preview {
//    NoteDetailView(note: Note(name: "Apprendre swiftUI", desc: "", lastUpdate: Date(), subnotes: []))
//}
