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

    var session: URLSession!
    var task: URLSessionDownloadTask!
    var cache:NSCache<AnyObject, AnyObject> = NSCache()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        session = URLSession.shared
        task = URLSessionDownloadTask()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(viewModel:AlbumsViewModel) {
        self.albumName.text = viewModel.albumName
        self.artistName.text = viewModel.artistName
        
        if let imageURL = viewModel.albumArtURL {
            //dispatch lazy load of image
            
            task = session.downloadTask(with: imageURL, completionHandler: { (location, response, error) in
                if let _location = location {
                    do {
                        let data = try Data(contentsOf: _location)
                        DispatchQueue.main.async {
                            let img = UIImage(data: data)
                            self.albumArtwork.image = img
                        }
                    } catch {
                        NSLog("error:\(error.localizedDescription)")
                        self.albumArtwork.image = UIImage(named: "album-unknown")
                    }
                } else {
                    NSLog("could not download album artwork?")
                    self.albumArtwork.image = UIImage(named: "album-unknown")
                }
            })
            task.resume()
        } else {
            self.albumArtwork.image = UIImage(named: "album-unknown")
        }
    }
    
}
