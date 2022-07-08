//
//  Playlist.swift
//  PlaylistSwiftUI
//
//  Created by Tatiana Bondarenko on 7/8/22.
//

import Foundation

struct Playlist: Codable, Equatable, Identifiable {
    let title: String
    var id = UUID()
    var songs: [Song]
}
