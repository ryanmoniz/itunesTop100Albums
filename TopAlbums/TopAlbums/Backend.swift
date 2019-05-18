//
//  Backend.swift
//  TopAlbums
//
//  Created by Ryan Moniz on 5/18/19.
//  Copyright © 2019 Ryan Moniz. All rights reserved.
//

import Foundation

public protocol Backend {
    static func className() -> String
    
    func getTop100AlbumsRequest(callback: @escaping (NSError?, Feed?) -> Void) 
}

