//
//  StartView.swift
//  GuardianAPI
//
//  Created by Alvin Alleyne on 1/6/26.
//

import SwiftUI


struct StartView: View {

    private var introFont: Font {
        #if targetEnvironment(macCatalyst)
        .title.weight(.medium)
        #else
        .body.weight(.medium)
        #endif
    }

    var category = ["World News",
                    "US News",
                    "UK News",
                    "Australia News",
                    "Cricket",
                    "Tennis",
                    "Rugby Union",
                    "World Cup 2026"]

    @State private var selectedCategory = "World News"
    
    var body: some View {
        NavigationStack {
            
            Form {
                Section("Introduction") {
                    Text("This app retrieves news articles from The Guardian API.  The Guardian is a British daily newspaper.\n\nUsers can select a news category from the picker below and then view the top 40 articles in the selected category, sorted by age (newest first).")
                        .font(introFont)
//                        .fontDesign(.serif)
//                        .italic()
                        .foregroundStyle(Color.accentColor)
                }
                
                Section("Category Selection") {
                    Picker("Select news category:", selection: $selectedCategory) {
                        ForEach(category, id: \.self)  {
                            Text($0)
                        }
                        .font(introFont)
                        .foregroundStyle(Color.blue)
                    }
                    .pickerStyle(.navigationLink)
                    .font(introFont)
                    .foregroundStyle(Color.black)
                }

                Section("Activate Category Selection") {
                    NavigationLink("Go to \(selectedCategory)", destination: ContentView(apiUrlCategory: selectedCategory))
                        .font(introFont)
                        .foregroundStyle(Color.blue).bold()
                        .padding()
                        .border(Color.blue, width: 1)
                        .background(Color.colLightYellow)
                }
            }
            .navigationTitle("The Guardian API")
            .preferredColorScheme(ColorScheme.light)
        }
    }
}




#Preview {
    StartView()
}
