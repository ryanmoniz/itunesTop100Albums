//
//  TopAlbumsTests.swift
//  TopAlbumsTests
//
//  Created by Ryan Moniz on 5/18/19.
//  Copyright © 2019 Ryan Moniz. All rights reserved.
//

import XCTest
@testable import TopAlbums

class TopAlbumsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testJsonParser() {
        
        let bundle = Bundle(for: type(of: self))
        guard let _jsonFile = bundle.url(forResource: "top100albums", withExtension: "json") else {
            XCTFail("Missing file: top100albums.json")
            return
        }

        do {
            let jsonData = try Data(contentsOf: _jsonFile)
            let albumsFeed = try JSONDecoder().decode(RootClass.self, from: jsonData)
            XCTAssertTrue(albumsFeed.feed?.title == "Top Albums")
            
        } catch {
            XCTFail("error loading contents of json file.\(error.localizedDescription)")
        }
    }
}
