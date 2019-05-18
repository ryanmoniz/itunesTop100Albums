//
//  AlbumTableViewCell.swift
//  TopAlbums
//
//  Created by Ryan Moniz on 5/18/19.
//  Copyright © 2019 Ryan Moniz. All rights reserved.
//

import UIKit

let AlbumIdentifierCell = "AlbumIdentifierCell"

class AlbumTableViewCell: UITableViewCell {
    
    @IBOutlet weak var albumName: UILabel!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var albumArtwork: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(viewModel:AlbumsViewModel) {
        //configure view based on view model
    }
    
}
