//
//  SampleTableHeaderView.swift
//  Sample
//
//  Created by Georgiy Malyukov on 26/02/2019.
//  Copyright © 2019 Georgiy Malyukov. All rights reserved.
//

import AppKit
import Cartography

final class SampleTableHeaderView: TableSectionView {
    
    var title: String?
    
    private var titleLabel: NSTextField!
    
    override func make() {
        super.make()
        backgroundColor = .darkGray
        titleLabel = NSTextField(frame: .zero)
        titleLabel.font = NSFont.systemFont(ofSize: 14)
        titleLabel.alignment = .left
        titleLabel.isBordered = false
        titleLabel.backgroundColor = .clear
        addSubview(titleLabel)
    }
    
    override func updateConstraints() {
        constrain(titleLabel) { (make) in
            let superview = make.superview!
            
            make.left == superview.left + 16
            make.top == superview.top + 8
            make.right == superview.right - 16
            make.bottom == superview.bottom - 4
        }
        super.updateConstraints()
    }
    
    override func reloadData() {
        titleLabel.stringValue = title ?? ""
        super.reloadData()
    }
    
}
