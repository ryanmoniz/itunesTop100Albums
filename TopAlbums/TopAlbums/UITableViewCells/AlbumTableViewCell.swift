//
//  AlbumTableViewCell.swift
//  TopAlbums
//
//  Created by Ryan Moniz on 5/18/19.
//  Copyright © 2019 Ryan Moniz. All rights reserved.
//

import UIKit

public let AlbumIdentifierCell = "AlbumIdentifierCell"

public class AlbumTableViewCell: UITableViewCell {
    
    @IBOutlet weak var albumName: UILabel!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var albumArtwork: UIImageView!
    
    override public func awakeFromNib() {
        super.awakeFromNib()
    }

    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func configureCell(viewModel:AlbumsViewModel) {
        self.albumName.text = viewModel.albumName
        self.artistName.text = viewModel.artistName
        
        self.albumArtwork.image = UIImage(named: "album-unknown")
        //album artwork will be lazy loaded in main tableview controller
    }
    
}
