//
//  Link.swift
//  TopAlbums
//
//  Created by Ryan Moniz on 5/18/19.
//  Copyright © 2019 Ryan Moniz. All rights reserved.
//

import Foundation

public struct Link : Codable {

	let alternate : String?
	let linkSelf : String?


	enum CodingKeys: String, CodingKey {
		case alternate = "alternate"
		case linkSelf = "self"
	}
    
	public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		alternate = try values.decodeIfPresent(String.self, forKey: .alternate)
		linkSelf = try values.decodeIfPresent(String.self, forKey: .linkSelf)
	}


}
