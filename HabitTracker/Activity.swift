//
//  Activity.swift
//  HabitTracker
//
//  Created by Lin Ochoa on 1/9/25.
//

import Foundation

struct Activity: Codable, Identifiable, Equatable {
    var id: UUID = UUID()
    var name: String
    var description: String
    var goal: Int
    var timesCompleted = 0
}
