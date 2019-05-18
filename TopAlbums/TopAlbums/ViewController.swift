//
//  ViewController.swift
//  TopAlbums
//
//  Created by Ryan Moniz on 5/18/19.
//  Copyright © 2019 Ryan Moniz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
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
    }


}

