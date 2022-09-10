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
                    
                }
                .padding(10)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .foregroundColor(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 10,style: .continuous))
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
