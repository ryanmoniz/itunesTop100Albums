//
//  AlbumListTableViewController.swift
//  TopAlbums
//
//  Created by Ryan Moniz on 5/18/19.
//  Copyright © 2019 Ryan Moniz. All rights reserved.
//

import UIKit

class AlbumListTableViewController: UITableViewController {

    fileprivate var viewModel = [AlbumsViewModel]()
    
    var session: URLSession!
    var task: URLSessionDownloadTask!
    var cache:NSCache<AnyObject, AnyObject> = NSCache()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        session = URLSession.shared
        task = URLSessionDownloadTask()
        cache = NSCache()

        let bundle = Bundle(for: type(of: self))
        guard let _jsonFilePath = bundle.url(forResource: "top100albums", withExtension: "json") else {
            print("Missing file: top100albums.json")
            return
        }
                
        do {            
            let jsonString = try String(contentsOf: _jsonFilePath)
            if let jsonData = jsonString.data(using: .utf8) {
                let decoder = JSONDecoder()
                
                
                let albumsFeed = try decoder.decode(Feed.self, from: jsonData)
                print(albumsFeed)
                
                setupViewModel(feed:albumsFeed)
            }
        } catch {
            print(error)
        }
        
        self.title = "Top 100 Albums"
    }
    
    func setupViewModel(feed:Feed) {
        if let results = feed.results {
            for result in results {
                var name = "Unknown", artistName = "Unknown", artworkName:String? = nil
                if let _name = result.name {
                    name = _name
                }
                if let _artist = result.artistName {
                    artistName = _artist
                }
                if let _artwork = result.artworkUrl100 {
                    artworkName = _artwork
                }
                let vm = AlbumsViewModel(withAlbumName: name, artist: artistName, albumArtURL: artworkName)
                self.viewModel.append(vm)
            }
        } else {
            NSLog("0 results in feed")
        }
    }

    func refreshTableViewWithAlbumArt() {
        
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AlbumIdentifierCell, for: indexPath) as? AlbumTableViewCell else {
            NSLog("error: could not instantiate AlbumTableviewCell")
            return UITableViewCell()
        }
        
        cell.configureCell(viewModel: viewModel[indexPath.row])
        
        if (self.cache.object(forKey: (indexPath as NSIndexPath).row as AnyObject) != nil) {
            //use the cache image
            cell.albumArtwork.image = self.cache.object(forKey: (indexPath as NSIndexPath).row as AnyObject) as? UIImage
        } else {
            if let _imageURL = viewModel[indexPath.row].albumArtURL {
                task = session.downloadTask(with: _imageURL, completionHandler: { (location, response, error) in
                    if let _location = location {
                        do {
                            let data = try Data(contentsOf: _location)
                            DispatchQueue.main.async {
                                if let img = UIImage(data: data) {
                                    cell.albumArtwork.image = img
                                    self.cache.setObject(img, forKey: (indexPath as NSIndexPath).row as AnyObject)
                                } else {
                                    NSLog("error could not decode image?")
                                    cell.albumArtwork.image = UIImage(named: "album-unknown")
                                }
                            }
                        } catch {
                            NSLog("error:\(error.localizedDescription)")
                            cell.albumArtwork.image = UIImage(named: "album-unknown")
                        }
                    } else {
                        NSLog("could not download album artwork?")
                        cell.albumArtwork.image = UIImage(named: "album-unknown")
                    }
                })
                task.resume()
            }
        }

        return cell
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
