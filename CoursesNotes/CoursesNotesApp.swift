//
//  CoursesNotesApp.swift
//  CoursesNotes
//
//  Created by David Grammatico on 31/07/2023.
//

import SwiftUI
import SwiftData

@main
struct CoursesNotesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Note.self)
    }
}
