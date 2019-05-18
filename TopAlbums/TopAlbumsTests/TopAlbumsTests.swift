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
    
    var albumFeed: Feed?
    
    override func setUp() {
        super.setUp()
        
        let bundle = Bundle(for: type(of: self))
        guard let _jsonFilePath = bundle.url(forResource: "top100albums", withExtension: "json") else {
            XCTFail("Missing file: top100albums.json")
            return
        }
        
        do {
            let jsonString = try String(contentsOf: _jsonFilePath)
            if let jsonData = jsonString.data(using: .utf8) {
                let decoder = JSONDecoder()
                
                
                self.albumFeed = try decoder.decode(Feed.self, from: jsonData)
            }
        } catch {
            XCTFail("error loading contents of json file.\(error.localizedDescription)")
        }
            
    }

    override func tearDown() {
        super.tearDown()
    }

    func testAlbumCount() {
        //check if 100 records
        if let _albumFeed = self.albumFeed {
            XCTAssertTrue(_albumFeed.results?.count == 100)
            
            XCTAssertFalse(_albumFeed.results?.count == 5)
        }
    }
    
    func testJsonParser() {
        if let _albumFeed = self.albumFeed {
            XCTAssertTrue(_albumFeed.title == "Top Albums")
        }
    }
}
