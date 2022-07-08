//
//  Song.swift
//  PlaylistSwiftUI
//
//  Created by Tatiana Bondarenko on 7/8/22.
//

import Foundation

struct Song: Codable, Equatable, Identifiable {
    let title: String
    let artist: String
    var id = UUID()
}
