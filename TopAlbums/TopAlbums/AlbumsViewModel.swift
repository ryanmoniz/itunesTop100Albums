//
//  AlbumsViewModel.swift
//  TopAlbums
//
//  Created by Ryan Moniz on 5/18/19.
//  Copyright © 2019 Ryan Moniz. All rights reserved.
//

import Foundation

struct AlbumsViewModel {
    
    var albumName: String
    
    var albumArtURL: URL? //url to retrieve album artwork thumbnail
    
    var artistName: String
    
    
    
    init(withAlbumName albumName:String, artist:String, albumArtURL:String) {
        self.albumName = albumName
        self.artistName = artist
        
        self.albumArtURL = URL(string: albumArtURL)
    }
    
    
}
