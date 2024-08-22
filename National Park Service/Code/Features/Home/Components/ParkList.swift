//
//  ParkList.swift
//  National Park Service
//
//  Created by Lorenzo Pantano on 21/08/24.
//

import SwiftUI

struct ParkList: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 16) {
                ForEach(parkCardItems, id: \.id) {
                    park in ParkCardItemUI(parkCardItem: park)
                        .frame(width: UIScreen.screenWidth * 0.9)
                        .padding(.vertical)
                }
            }.padding(.horizontal)
        }.scrollTargetBehavior(.paging)
    }
}

#Preview {
    ParkList()
}
