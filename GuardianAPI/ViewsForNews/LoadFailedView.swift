//
//  LoadFailedView.swift
//  NewsAPI
//
//  Created by Alvin Alleyne on 11/28/25.
//

import SwiftUI


struct LoadFailedView: View {
    
    var error: (any Error)?
    var retry: () async -> Void
    
    var body: some View {
        ContentUnavailableView {
            Text("Load Error")
                .font(.headline)
        } description: {
            Text("There was an error loading the articles.")
        }
        actions: {
            Button("Retry") {
                Task {
                    await retry()
                }
            }
        }
    }
}



#Preview {
    LoadFailedView(error: NSError(domain: "Take Home Test", code: 1, userInfo: nil)) {
        // do nothing
    }
}
