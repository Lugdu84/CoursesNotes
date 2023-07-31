//
//  Note.swift
//  CoursesNotes
//
//  Created by David Grammatico on 31/07/2023.
//

import SwiftData
import SwiftUI

@Model
class Note {
    @Attribute(.unique) var name: String
    var desc: String
    var lastUpdate: Date
    @Relationship(.cascade) var subnotes: [SubNote]
    
    init(name: String, desc: String, lastUpdate: Date, subnotes: [SubNote]) {
        self.name = name
        self.desc = desc
        self.lastUpdate = lastUpdate
        self.subnotes = subnotes
    }
}
