//
//  ParkCardItem.swift
//  National Park Service
//
//  Created by Lorenzo Pantano on 21/08/24.
//

import Foundation
import SwiftUI

struct ParkCardItem: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var category: String
    var state: String
    var imageUrl: String
}
