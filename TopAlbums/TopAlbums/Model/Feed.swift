//
//  Feed.swift
//  TopAlbums
//
//  Created by Ryan Moniz on 5/18/19.
//  Copyright © 2019 Ryan Moniz. All rights reserved.
//

import Foundation

public struct Feed : Codable {

	let author : Author?
	let copyright : String?
	let country : String?
	let icon : String?
	let id : String?
	let links : [Link]?
	let results : [Album]?
	let title : String?
	let updated : String?


	enum CodingKeys: String, CodingKey {
		case author
		case copyright = "copyright"
		case country = "country"
		case icon = "icon"
		case id = "id"
		case links = "links"
		case results = "results"
		case title = "title"
		case updated = "updated"
	}
	
    public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		author = try Author(from: decoder)
		copyright = try values.decodeIfPresent(String.self, forKey: .copyright)
		country = try values.decodeIfPresent(String.self, forKey: .country)
		icon = try values.decodeIfPresent(String.self, forKey: .icon)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		links = try values.decodeIfPresent([Link].self, forKey: .links)
		results = try values.decodeIfPresent([Album].self, forKey: .results)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		updated = try values.decodeIfPresent(String.self, forKey: .updated)
	}


}
