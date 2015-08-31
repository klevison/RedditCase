//
//  PostRestClient.swift
//  ClientBase
//
//  Created by Klevison Matias on 8/31/15.
//  Copyright (c) 2015 Klevison Matias. All rights reserved.
//

import Foundation
import Alamofire

typealias redditPostCompletion = ([Post], NSError?) -> ()

protocol PostService {
    
    func getAllPosts(#kind: PostKind, completion: redditPostCompletion)
    
}

enum PostKind: String {
    
    case All = ""
    case New = "new/"
    case Hot = "hot/"
    case Top = "top/"
    
    init?(index: Int) {
        switch index {
        case 0:
            self = .All
        case 1:
            self = .New
        case 2:
            self = .Hot
        case 3:
            self = .Top
        default:
            return nil
        }
    }
    
}

class PostRestClient: PostService {
    
    func getAllPosts(#kind: PostKind, completion: redditPostCompletion) {
        let url = "http://www.reddit.com/r/ios/\(kind.rawValue).json"
        Alamofire.request(.GET, url, parameters: nil)
            .responseObject { (response: Reddit?, error: NSError?) in
                if let posts = response?.subreddit?.posts {
                    completion(posts, error)
                } else {
                    completion([Post](), nil)
                }
            }
    }
    
}