//
//  AsyncImageBox.swift
//  National Park Service
//
//  Created by Lorenzo Pantano on 14/08/24.
//

import SwiftUI

struct AsyncImageBox: View {
    let imageUrl: String
    let height: CGFloat
    
    var body: some View {
        AsyncImage(url: URL(string: imageUrl)) {
            phase in switch phase {
            case .success(let image):
                image.resizable().frame(width: .infinity, height: .infinity).frame(maxWidth: 400)
            case .failure(_):
                ZStack {
                    Rectangle().foregroundColor(.gray).opacity(0.4).frame(maxWidth: 400)
                    Text("Error")
                }
            case .empty:
                ZStack {
                    Rectangle().frame(height: height).foregroundColor(.gray).opacity(0.4).frame(maxWidth: 400)
                    ProgressView()
                }
            @unknown default:
                ZStack {
                    Rectangle().frame(height: height).foregroundColor(.gray).opacity(0.4).frame(maxWidth: 400)
                    ProgressView()
                }
            }
        }
    }
}

#Preview {
    AsyncImageBox(imageUrl: NPS_BASE_URL + BRYCE_IMAGE, height: 250)
}
