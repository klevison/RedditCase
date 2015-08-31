//
//  UITableViewExtensions.swift
//  ClientBase
//
//  Created by Klevison Matias on 8/31/15.
//  Copyright (c) 2015 Klevison Matias. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
    func setupNumberOfRows(rows: Int, inSection section: Int) {
        
        var numOfSections = 0
        
        if rows > 0 {
            self.separatorStyle = .SingleLine
            numOfSections = rows
            self.backgroundView = nil
        } else {
            let noDataLabel = UILabel(frame: CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height))
            noDataLabel.text = "No data available"
            noDataLabel.font = UIFont.systemFontOfSize(13)
            noDataLabel.textAlignment = .Center
            self.backgroundView = noDataLabel
            self.separatorStyle = .None
        }
        
    }
    
}

