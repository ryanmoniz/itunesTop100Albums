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
    
    var viewModel : AlbumsViewModel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    @IBAction func purchaseAction(_ sender: Any) {
        
    }
}
