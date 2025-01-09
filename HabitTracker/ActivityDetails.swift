//
//  ActivityDetails.swift
//  HabitTracker
//
//  Created by Lin Ochoa on 1/9/25.
//

import SwiftUI

struct ActivityDetails: View {
    var activity: Activity
    var activities: Activities
    
    var body: some View {
        List {
            Text("Name: " + activity.name)
            Text("Description: " + activity.description)
            Text("Times Completed:" + String(activity.timesCompleted))
            Text("Goal: " + String(activity.goal))
            Button("Mark a single completion") {
                var newActivity = activity
                newActivity.timesCompleted += 1
                let index = activities.items.firstIndex(of: activity)
                activities.items[index ?? 0] = newActivity
            }
        }
    }
}

#Preview {
    ActivityDetails(activity: Activity(name:"Test", description: "Hello world", goal: 5), activities: Activities())
}
