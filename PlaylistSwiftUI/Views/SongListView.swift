//
//  SongListView.swift
//  PlaylistSwiftUI
//
//  Created by Tatiana Bondarenko on 7/8/22.
//

import SwiftUI

struct SongListView: View {
    
    @StateObject var viewModel = SongViewModel()
    @State private var title = ""
    @State private var artist = ""
    
    @Binding var playlist: Playlist
    var playlistViewModel: PlaylistViewModel
    
    var body: some View {
        VStack {
            TextField(" Enter title...", text: $title)
            TextField(" Enter artist...", text: $artist)
            
            List {
                ForEach(playlist.songs) {
                    song in
                    HStack {
                        Image(systemName: "person")
                        VStack(alignment: .leading) {
                            Text(song.title)
                                .font(.headline)
                                .bold()
                            Text(song.artist)
                                .font(.subheadline)
                                .fontWeight(.light)
                        }.padding(.leading)
                        Spacer()
                        Image(systemName: "heart.fill")
                            .foregroundColor(.green)
                        Image(systemName: "play.circle")
                    }
                }
                .onDelete(perform: viewModel.deleteSong(playlist: playlist, index:))
            }
        }
        .navigationTitle("Songs")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    viewModel.createSong(playlist: playlist, title: title, artist: artist)
                    title = ""
                    artist = ""
                } label: {
                    Text("Save")
                }
            }
        }
    }
}

struct SongListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SongListView(playlist: .constant(Playlist(title: "Rock", songs: [Song(title: "a", artist: "1"), Song(title: "b", artist: "2"), Song(title: "c", artist: "3"), Song(title: "d", artist: "4")])), playlistViewModel: PlaylistViewModel())
        }
    }
}
