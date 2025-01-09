//
//  ContentView.swift
//  HabitTracker
//
//  Created by Lin Ochoa on 1/8/25.
//

import SwiftUI

struct ContentView: View {
    @State private var activities = Activities()
    @State private var showingAddActivity = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(activities.items) { item in
                    NavigationLink(item.name) {
                        ActivityDetails(activity: item, activities: activities)
                    }
                }
                .onDelete(perform: removeActivities)
            }
            .navigationTitle("Habit Tracker")
            .toolbar {
                Button("Add activity", systemImage: "plus") {
                    showingAddActivity = true
                }
            }
            .sheet(isPresented: $showingAddActivity) {
                AddActivity(activities: activities)
            }
        }
    }
    
    func removeActivities(at offset: IndexSet) {
        activities.items.remove(atOffsets: offset)
    }
}


#Preview {
    ContentView()
}
