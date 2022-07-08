//
//  SongViewModel.swift
//  PlaylistSwiftUI
//
//  Created by Tatiana Bondarenko on 7/8/22.
//

import Foundation

class SongViewModel: ObservableObject {
    
    // MARK: - CRUD
    
    func createSong(playlist: Playlist, title: String, artist: String) {
        let newSong = Song(title: title, artist: artist)
        playlist.songs.append(newSong)
    }

    func deleteSong(playlist: Playlist, index: IndexSet) {
        let songToDelete = playlist.songs[index]
        playlist.songs.remove(songToDelete)
    }
    
}
