//
//  ContentView.swift
//  CoursesNotes
//
//  Created by David Grammatico on 31/07/2023.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var notes: [Note]
    @State var showSheet = false
    @State var noteName: String = ""
    var body: some View {
        NavigationStack {
            VStack(content: {
                Text("Nombre de notes : \(notes.count)")
                List {
                    ForEach(notes) { note in
                        NavigationLink {
                            NoteDetailView(note: note)
                        } label: {
                            VStack(content: {
                                Text(note.name)
                                Text(note.dateString)
                                    .font(.footnote)
                                    .foregroundStyle(.secondary)
                            })
                        }

                    }
                    .onDelete(perform: { indexSet in
                        for index in indexSet {
                            modelContext.delete(notes[index])
                        }
                    })
                }
            })
            .toolbar(content: {
                ToolbarItem {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: {
                        showSheet = true
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
            })
            .sheet(isPresented: $showSheet, content: {
                VStack(content: {
                    Text("Ajoutez une nouvelle note")
                    TextField("Nouvelle note", text: $noteName)
                    Button(action: {
                        let note = Note(name: noteName, desc: "", lastUpdate: Date(), subnotes: [])
                        modelContext.insert(note)
                        noteName = ""
                        showSheet = false
                    }, label: {
                        Text("OK")
                    })
                    .disabled(noteName.isEmpty)
                })
                .padding()
            })
            .navigationTitle("Mes notes")
        }
    }
}

#Preview {
    ContentView()
}
