//
//  HomeView.swift
//  National Park Service
//
//  Created by Lorenzo Pantano on 14/08/24.
//

import SwiftUI

struct HomeView: View {
    var imageUrl = NPS_BASE_URL + BRYCE_IMAGE;
    
    var body: some View {
        VStack(spacing: 24, content: {
            ParkList()
        })
    }
}

#Preview {
    HomeView()
}
