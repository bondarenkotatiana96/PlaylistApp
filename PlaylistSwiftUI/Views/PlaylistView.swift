//
//  PlaylistView.swift
//  PlaylistSwiftUI
//
//  Created by Tatiana Bondarenko on 7/8/22.
//

import SwiftUI

struct PlaylistView: View {
    
    @StateObject var viewModel = PlaylistViewModel()
    @State var title = ""
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "music.quarternote.3")
                    TextField("Enter title...", text: $title)
                }
                Rectangle()
                    .frame(height: 1.5)
                    .padding(.horizontal)
                List {
                    ForEach(viewModel.playlists) { playlist in
                        NavigationLink {
                            SongListView(playlist: .constant(playlist), playlistViewModel: viewModel)
                        } label: {
                            HStack {
                                Image(systemName: "person")
                                VStack(alignment: .leading) {
                                    Text(playlist.title)
                                        .font(.headline)
                                        .bold()
                                    Text("\(playlist.songs.count) songs")
                                        .font(.subheadline)
                                        .fontWeight(.light)
                                }
                                .padding(.leading)
                            }
                        }
                    }
                    .onDelete(perform: viewModel.deletePlaylist(index:))
                }
                .listStyle(.plain)
                .padding(.top)
            }
            .navigationTitle("My Playlists")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        viewModel.createPlaylist(title: title)
                        title = ""
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .onAppear {
            viewModel.loadFromPersistenceStore()
        }
    }
}

struct PlaylistView_Previews: PreviewProvider {
    static var previews: some View {
        PlaylistView()
    }
}
