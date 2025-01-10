//
//  Activities.swift
//  HabitTracker
//
//  Created by Lin Ochoa on 1/9/25.
//
import Observation
import Foundation

@Observable
class Activities {
    var items: [Activity] {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Activities")
            }
        }
    }
    
    init () {
        if let saved = UserDefaults.standard.data(forKey: "Activities") {
            if let decoded = try? JSONDecoder().decode([Activity].self, from: saved) {
                items = decoded
                return
            }
        }
        
        items = []
    }
}
