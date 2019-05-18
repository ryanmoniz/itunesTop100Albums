//
//  AlbumDetailViewController.swift
//  TopAlbums
//
//  Created by Ryan Moniz on 5/18/19.
//  Copyright © 2019 Ryan Moniz. All rights reserved.
//

import UIKit

class AlbumDetailViewController: UIViewController {

    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var albumName: UILabel!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var genre: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var copyright: UILabel!
    
    var albumArtImage: UIImage?
    var viewModel : AlbumsViewModel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.albumName.text = viewModel.albumName
        self.artistName.text = viewModel.artistName
        self.genre.text = viewModel.genre
        self.releaseDate.text = viewModel.releaseDate
        self.copyright.text = viewModel.copyright
        
        if let _albumArtImage = albumArtImage {
            self.albumImageView.image = _albumArtImage
        } else {
            self.albumImageView.image = UIImage(named: "album-unknown")
        }
    }
    
    @IBAction func purchaseAction(_ sender: Any) {
        
    }
}
