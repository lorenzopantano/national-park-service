//
//  ContentView.swift
//  National Park Service
//
//  Created by Lorenzo Pantano on 13/08/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                HomeView()
                Spacer()
            }.navigationTitle("National Park Service")
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Image(systemName: "tree").font(.headline)
                };
                ToolbarItem {
                    Image(systemName: "gear").font(.headline)
                };
            }
        }
    }
}

#Preview {
    ContentView()
}
