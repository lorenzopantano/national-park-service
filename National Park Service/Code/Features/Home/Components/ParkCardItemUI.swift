//
//  ParkCardItemUI.swift
//  National Park Service
//
//  Created by Lorenzo Pantano on 21/08/24.
//

import SwiftUI

struct ParkCardItemUI: View {
    
    // Data
    var parkCardItem: ParkCardItem
    
    // Placeholder animation
    @State private var placeholderOpacity: Double = 0.4

    
    
    var body: some View {
        ZStack(content: {
            // Background Image
            CachedAsyncImage(url: parkCardItem.imageUrl).frame(width: UIScreen.screenWidth * 0.9, height: 250).clipped()
            
            
            // Gradient overlay
            LinearGradient(
                gradient: Gradient(
                    colors: [Color.black.opacity(0.65), Color.black.opacity(0.0)]),
                startPoint: .bottom,
                endPoint: .top
            )
            
            // Text Overlay
            VStack(alignment: .leading, spacing: 8) {
                Spacer()
                Text(parkCardItem.name).font(.title2).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                HStack() {
                    HStack(alignment: .center) {
                        Image(systemName: "mappin.and.ellipse")
                        Text(parkCardItem.state).font(.subheadline)
                    }
                    Spacer()
                    Text(parkCardItem.category).font(.subheadline)
                }
            }
            .padding([.leading, .trailing], 24)
            .padding(.bottom, 24)
            .foregroundColor(.white)
        })
        .frame(width: UIScreen.screenWidth * 0.9, height: 250)
        .cornerRadius(20)
    }
}

#Preview {
    ParkCardItemUI(parkCardItem: parkCardItems[1]).frame(height: 250)
}

