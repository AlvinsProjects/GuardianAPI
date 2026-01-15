//
//  StartView.swift
//  GuardianAPI
//
//  Created by Alvin Alleyne on 1/6/26.
//

import SwiftUI


struct StartView: View {
    
    var category = ["World News", "US News", "UK News", "Cricket", "Tennis", "Rugby", "Olympics"]
    @State private var selectedCategory = "World News"
    
    var body: some View {
        NavigationStack {
            
            Form {
                Section("Introduction") {
                    Text("This app retrieves news articles from The Guardian API.  The Guardian is a British daily newspaper.\n\nUsers can select a news category from the picker below and then view the top 40 articles in the selected category, sorted by age (newest first).")
                        .font(.system(size: 17, weight: .medium, design: .serif))
                        .italic()
//                        .foregroundStyle(Color.darkBlue)
                }
                
                Section("Category Selection") {
                    Picker("Select news category:", selection: $selectedCategory) {
                        ForEach(category, id: \.self)  {
                            Text($0)
                        }
                        .foregroundStyle(Color.blue)
                    }
                    .pickerStyle(NavigationLinkPickerStyle())
//                    .foregroundStyle(Color.darkBlue)
                }

                Section("Activate Category Selection") {
                    NavigationLink("Go to \(selectedCategory)", destination: ContentView(apiUrlCategory: selectedCategory))
                        .foregroundStyle(Color.blue).bold(true)
                        .padding()
                        .border(Color.blue, width: 1)
                        .background(Color.colLightYellow)
                }
            }
            .navigationTitle("The Guardian API")
            .preferredColorScheme(ColorScheme.dark)
        }
    }
}




#Preview {
    StartView()
}
