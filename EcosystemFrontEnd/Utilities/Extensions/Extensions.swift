//
//  Helpers.swift
//  EcosystemFrontEnd
//
//  Created by Noah Pikielny on 11/12/19.
//  Copyright © 2019 Christopher Lee. All rights reserved.
//

import Cocoa

extension NSView {
    func addConstraintsWithFormat(format: String, views: NSView...){
        var viewsDictionary = [String: NSView]()
        for (index, view) in views.enumerated(){
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
    }
}
