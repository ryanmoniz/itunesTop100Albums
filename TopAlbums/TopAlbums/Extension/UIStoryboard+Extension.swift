//
//  UIStoryboard+Extension.swift
//  TopAlbums
//
//  Created by Ryan Moniz on 5/18/19.
//  Copyright © 2019 Ryan Moniz. All rights reserved.
//

import UIKit

extension UIStoryboard {
    class func AlbumListStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "AlbumListStoryboard", bundle: nil)
    }
    
    class func AlbumDetailStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "AlbumDetailStoryboard", bundle: nil)
    }
}
