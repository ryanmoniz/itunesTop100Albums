//
//  Feed.swift
//  TopAlbums
//
//  Created by Ryan Moniz on 5/18/19.
//  Copyright © 2019 Ryan Moniz. All rights reserved.
//

import Foundation

public struct Feed : Codable {

    //Feed
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
        case feed
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
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let response = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .feed)

        author = try Author(from: decoder)
        copyright = try response.decodeIfPresent(String.self, forKey: .copyright)
        country = try response.decodeIfPresent(String.self, forKey: .country)
        icon = try response.decodeIfPresent(String.self, forKey: .icon)
        id = try response.decodeIfPresent(String.self, forKey: .id)
        links = try response.decodeIfPresent([Link].self, forKey: .links)
        results = try response.decodeIfPresent([Album].self, forKey: .results)
        title = try response.decodeIfPresent(String.self, forKey: .title)
        updated = try response.decodeIfPresent(String.self, forKey: .updated)
	}

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        var response = container.nestedContainer(keyedBy: CodingKeys.self, forKey: .feed)
        try response.encode(self.author, forKey: .author)
        try response.encode(self.copyright, forKey: .copyright)
        try response.encode(self.country, forKey: .country)
        try response.encode(self.id, forKey: .id)
        try response.encode(self.links, forKey: .links)
        try response.encode(self.results, forKey: .results)
        try response.encode(self.title, forKey: .title)
        try response.encode(self.updated, forKey: .updated)
    }
}
