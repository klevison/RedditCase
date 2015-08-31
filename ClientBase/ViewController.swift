//
//  ViewController.swift
//  ClientBase
//
//  Created by Klevison Matias on 8/31/15.
//  Copyright (c) 2015 Klevison Matias. All rights reserved.
//

import UIKit
import SwiftLoader
import ImageLoader

final class ViewController: UITableViewController {
    
    var postClient = PostRestClient()
    var posts = [Post]()
    var kind = PostKind.All

    override func viewDidLoad() {
        super.viewDidLoad()
        updatePosts()
    }
    
    @IBAction func segmentedControlValueChanged(sender: AnyObject) {
        let segmented = sender as! UISegmentedControl
        kind = PostKind(index: segmented.selectedSegmentIndex)!
        updatePosts()
    }
    
    private func updatePosts() {
        SwiftLoader.show(animated: true)
        postClient.getAllPosts(kind: kind) { (posts: [Post], error: NSError?) -> () in
            self.posts = posts
            self.tableView.reloadData()
            SwiftLoader.hide()
        }
    }
    
}

extension ViewController: UITableViewDataSource {
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.setupNumberOfRows(posts.count, inSection: section)
        return posts.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier("cellID", forIndexPath: indexPath) as! PostTableViewCell
        let post = posts[indexPath.row]
        cell.post = post
        cell.thumbImageView.load(NSURL(string: post.thumbnail!)!)

        return cell
    }
    
}