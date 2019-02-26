//
//  SampleTableCell.swift
//  Sample
//
//  Created by Georgiy Malyukov on 26/02/2019.
//  Copyright © 2019 Georgiy Malyukov. All rights reserved.
//

import AppKit
import Cartography

final class SampleTableCell: TableCell<String> {
    
    private var titleLabel: NSTextField!
    
    override func make() {
        super.make()
        backgroundColor = .white
        titleLabel = NSTextField(frame: .zero)
        titleLabel.font = NSFont.systemFont(ofSize: 20)
        titleLabel.alignment = .center
        titleLabel.isBordered = false
        titleLabel.backgroundColor = .clear
        titleLabel.textColor = .black
        addSubview(titleLabel)
    }
    
    override func updateConstraints() {
        constrain(titleLabel) { (make) in
            let superview = make.superview!
            
            make.left == superview.left + 10
            make.top == superview.top + 10
            make.right == superview.right - 10
            make.bottom == superview.bottom - 10
        }
        super.updateConstraints()
    }
    
    override func configure(with data: String) {
        titleLabel.stringValue = data
        super.configure(with: data)
    }
    
}
