//
//  AlbumsViewModel.swift
//  TopAlbums
//
//  Created by Ryan Moniz on 5/18/19.
//  Copyright © 2019 Ryan Moniz. All rights reserved.
//

import Foundation

public struct AlbumsViewModel {
    
    var albumName: String
    
    var albumArtURL: URL? //url to retrieve album artwork thumbnail
    
    var artistName: String
    
    
    
    init(withAlbumName albumName:String, artist:String, albumArtURL:String?) {
        self.albumName = albumName
        self.artistName = artist
        
        if let _albumArtURL = albumArtURL {
            self.albumArtURL = URL(string: _albumArtURL)
        }
    }
    
    
}
