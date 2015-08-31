//
//  Post.swift
//  ClientBase
//
//  Created by Klevison Matias on 8/31/15.
//  Copyright (c) 2015 Klevison Matias. All rights reserved.
//

import Foundation
import ObjectMapper

private struct PostAPIField {
    
    static let titleKey = "data.title"
    static let authorKey = "data.author"
    static let thumbnailKey = "data.thumbnail"
    
}

final class Post: Mappable {
    
    var title: String?
    var author: String?
    var thumbnail: String?
    
    class func newInstance(map: Map) -> Mappable? {
        return Post()
    }
    
    func mapping(map: Map) {
        title <- map[PostAPIField.titleKey]
        author <- map[PostAPIField.authorKey]
        thumbnail <- map[PostAPIField.thumbnailKey]
    }
    
}