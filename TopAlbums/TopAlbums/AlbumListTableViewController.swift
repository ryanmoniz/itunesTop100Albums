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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let bundle = Bundle(for: type(of: self))
        guard let _jsonFilePath = bundle.url(forResource: "top100albums", withExtension: "json") else {
            print("Missing file: top100albums.json")
            return
        }
                
        do {
            let jsonData = try Data(contentsOf: _jsonFilePath, options: .mappedIfSafe)
            
            let jsonString = try String(contentsOf: _jsonFilePath)
            if let jsonData = jsonString.data(using: .utf8) {
                let decoder = JSONDecoder()
                
                
                let albumsFeed = try decoder.decode(Feed.self, from: jsonData)
                print(albumsFeed)
            }
            
            
            if let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] {
                // try to read out a string array
                if let names = json["feed"] {
                    print(names)
                }
            }
        } catch {
            print(error)
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        self.title = "Top 100 Albums"
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        
        // Configure the cell...

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
