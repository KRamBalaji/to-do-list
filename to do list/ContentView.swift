//
//  ContentView.swift
//  to do list
//
//  Created by Ram Balaji Koppula on 07/09/22.
//

import SwiftUI

enum Priority: String, Identifiable, CaseIterable {
    var id: UUID {
        return UUID()
    }
    
    case low = "Low"
    case medium = "Medium"
    case high = "High"
}

extension Priority {
    var title: String {
        switch self {
        case .low:
            return "Low"
        case .medium:
            return "Medium"
        case .high:
            return "High"
        }
    }
}

struct ContentView: View {
    
    @State private var title: String = ""
    @State private var selectedPriority: Priority = .medium
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Task.entity(), sortDescriptors: [NSSortDescriptor(key: "dateCreated", ascending: false)]) private var allTasks: FetchedResults<Task>
    
    private func saveTask() {
        
        do {
            let task = Task(context: viewContext)
            task.title = title
            task.priority = selectedPriority.rawValue
            task.dateCreated = Date()
            try viewContext.save()
        }
        catch {
            print(error.localizedDescription)
        }
        
    }
    
    var body: some View {
        NavigationView{
            
            VStack{
                
                TextField("Enter the title",text: $title)
                    .textFieldStyle(.roundedBorder)
                Picker("Priority", selection: $selectedPriority) {
                    ForEach(Priority.allCases){ priority in
                        Text(priority.title).tag(priority)
                    }
                }
                .pickerStyle(.segmented)
                Button("Save") {
                    saveTask()
                }
                .padding(10)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .foregroundColor(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 10,style: .continuous))
                
                List {
                    ForEach(allTasks) { task in
                        Text(task.title ?? "")
                    }
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Tasks")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
