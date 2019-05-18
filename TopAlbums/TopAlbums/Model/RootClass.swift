//
//  RootClass.swift
//  TopAlbums
//
//  Created by Ryan Moniz on 5/18/19.
//  Copyright © 2019 Ryan Moniz. All rights reserved.
//

import Foundation

public struct RootClass : Codable {

	let feed : Feed?


	enum CodingKeys: String, CodingKey {
		case feed
	}
    
	public init(from decoder: Decoder) throws {
        _ = try decoder.container(keyedBy: CodingKeys.self)
		feed = try Feed(from: decoder)
	}


}
