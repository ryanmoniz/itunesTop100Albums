//
//  RSSiTunesAPIClient.swift
//  TopAlbums
//
//  Created by Ryan Moniz on 5/18/19.
//  Copyright © 2019 Ryan Moniz. All rights reserved.
//

import Foundation

final class RSSiTunesAPIClient: Backend {
    static func className() -> String {
        return "RSSiTunesAPIClient"
    }
    
    func getTop100AlbumsRequest(callback: @escaping (NSError?, Feed?) -> Void) {
        let headers = ["cache-control": "no-cache"]
        //base url https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/100/explicit.json
        let urlString = "https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/100/explicit.json"
        let request = NSMutableURLRequest(url: URL(string: urlString)! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error!.localizedDescription)
            } else {
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    callback(nil, nil)
                    return
                }
                
                NSLog("received 200, decoding data and sending back")
                
            }
        })
        
        dataTask.resume()
    }
    
    
    
    
}
