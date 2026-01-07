//
//  StartView.swift
//  GuardianAPI
//
//  Created by Alvin Alleyne on 1/6/26.
//

import SwiftUI


struct StartView: View {
    
    var category = ["General News", "Cricket", "Tennis", "Rugby", "Olympics", "Politics"]
    @State private var selectedCategory = "General News"
    
    var body: some View {
        
        NavigationStack {
//            ZStack {
//                LinearGradient(
//                    gradient: Gradient(colors: [.colGreen, .colBlue]),
//                    startPoint: .topLeading,
//                    endPoint: .bottomTrailing)
//                .ignoresSafeArea()
                
            Form {
                
                Text("____________________________________")
                
                Section("Category Selection") {
                    Picker("Select news category:", selection: $selectedCategory) {
                        ForEach(category, id: \.self)  {
                            Text($0)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                

                Text("____________________________________")

                    
                Section("Activate Selection") {
                    
                    NavigationLink("Go to \(selectedCategory)", destination: ContentView())
                        .buttonStyle(GlassProminentButtonStyle())
                }
            }
            .navigationTitle("The Guardian API")
        }
    }
}




#Preview {
    StartView()
}
