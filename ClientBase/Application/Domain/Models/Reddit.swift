//
//  Reddit.swift
//  ClientBase
//
//  Created by Klevison Matias on 8/31/15.
//  Copyright (c) 2015 Klevison Matias. All rights reserved.
//

import Foundation
import ObjectMapper

private struct RedditAPIField {
    
    static let subreddit = "data"
    static let kind = "kind"
    
}

final class Reddit: Mappable {
    
    var kind: String?
    var subreddit: Subreddit?
    
    class func newInstance(map: Map) -> Mappable? {
        return Reddit()
    }
    
    func mapping(map: Map) {
        subreddit <- map[RedditAPIField.subreddit]
        kind <- map[RedditAPIField.kind]
    }
    
}