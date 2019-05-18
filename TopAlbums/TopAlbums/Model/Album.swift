//
//  Album.swift
//  TopAlbums
//
//  Created by Ryan Moniz on 5/18/19.
//  Copyright © 2019 Ryan Moniz. All rights reserved.
//

import Foundation

public struct Album : Codable {

	let artistId : String?
	let artistName : String?
	let artistUrl : String?
	let artworkUrl100 : String?
	let contentAdvisoryRating : String?
	let copyright : String?
	let genres : [Genre]?
	let id : String?
	let kind : String?
	let name : String?
	let releaseDate : String?
	let url : String?


	enum CodingKeys: String, CodingKey {
		case artistId = "artistId"
		case artistName = "artistName"
		case artistUrl = "artistUrl"
		case artworkUrl100 = "artworkUrl100"
		case contentAdvisoryRating = "contentAdvisoryRating"
		case copyright = "copyright"
		case genres = "genres"
		case id = "id"
		case kind = "kind"
		case name = "name"
		case releaseDate = "releaseDate"
		case url = "url"
	}
    
	public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		artistId = try values.decodeIfPresent(String.self, forKey: .artistId)
		artistName = try values.decodeIfPresent(String.self, forKey: .artistName)
		artistUrl = try values.decodeIfPresent(String.self, forKey: .artistUrl)
		artworkUrl100 = try values.decodeIfPresent(String.self, forKey: .artworkUrl100)
		contentAdvisoryRating = try values.decodeIfPresent(String.self, forKey: .contentAdvisoryRating)
		copyright = try values.decodeIfPresent(String.self, forKey: .copyright)
		genres = try values.decodeIfPresent([Genre].self, forKey: .genres)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		kind = try values.decodeIfPresent(String.self, forKey: .kind)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		releaseDate = try values.decodeIfPresent(String.self, forKey: .releaseDate)
		url = try values.decodeIfPresent(String.self, forKey: .url)
	}


}
