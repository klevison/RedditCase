//
//  Subreddit.swift
//  ClientBase
//
//  Created by Klevison Matias on 8/31/15.
//  Copyright (c) 2015 Klevison Matias. All rights reserved.
//

import Foundation
import ObjectMapper

private struct SubredditAPIField {
    
    static let posts = "children"
    
}

final class Subreddit: Mappable {
    
    var posts: [Post]?
    
    class func newInstance(map: Map) -> Mappable? {
        return Subreddit()
    }
    
    func mapping(map: Map) {
        posts <- map[SubredditAPIField.posts]
    }
    
}