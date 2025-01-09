//
//  AddActivity.swift
//  HabitTracker
//
//  Created by Lin Ochoa on 1/9/25.
//

import SwiftUI

struct AddActivity: View {
    @State private var name = ""
    @State private var description = ""
    @State private var goal: Int = 0
    
    var activities: Activities
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                TextField("Description", text: $description)
                TextField("Goal", value: $goal, format: .number)
                    .keyboardType(.numberPad)
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let activity = Activity(name: name, description: description, goal: goal)
                        activities.items.append(activity)
                        dismiss()
                    }
                    .disabled(name.isEmpty || description.isEmpty || goal == nil)
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel", role: .cancel) {
                        dismiss()
                    }
                }
            }
        }
    }
    
    init(activities: Activities) {
        self.activities = activities
    }
}

#Preview {
    AddActivity(activities: Activities())
}
