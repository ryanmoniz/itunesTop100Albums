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
    var genre: String
    var releaseDate: String
    var copyright: String
    
    
    init(withAlbumName albumName:String, artist:String, albumArtURL:String?, genreArray:[Genre], releaseDate:String, copyright:String) {
        self.albumName = albumName
        self.artistName = artist
        
        if let _albumArtURL = albumArtURL {
            self.albumArtURL = URL(string: _albumArtURL)
        }
        
        var genrelist = [String]()
        for genreElement in genreArray {
            if let genreName = genreElement.name {
                genrelist.append(genreName)
            }
        }
        genre = genrelist.joined(separator: ", ")

        
        self.releaseDate = releaseDate
        self.copyright = copyright
    }
    
    
}
