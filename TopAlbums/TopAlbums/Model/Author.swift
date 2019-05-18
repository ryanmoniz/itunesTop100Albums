//
//  Author.swift
//  TopAlbums
//
//  Created by Ryan Moniz on 5/18/19.
//  Copyright © 2019 Ryan Moniz. All rights reserved.
//

import Foundation

public struct Author : Codable {

	let name : String?
	let uri : String?


	enum CodingKeys: String, CodingKey {
		case name = "name"
		case uri = "uri"
	}
    
	public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		uri = try values.decodeIfPresent(String.self, forKey: .uri)
	}


}
