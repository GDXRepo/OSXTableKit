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
    private var button: NSButton!
    
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
        
        button = NSButton(frame: .zero)
        button.title = "Custom action"
        button.target = self
        button.action = #selector(_callAction)
        addSubview(button)
    }
    
    override func updateConstraints() {
        constrain(self, titleLabel, button) { view, title, button in
            title.left == view.left + 10
            title.top == view.top + 10
            title.right == view.right - 10
            title.bottom == view.bottom - 10
            
            button.center == title.center
        }
        super.updateConstraints()
    }
    
    override func configure(with data: String) {
        titleLabel.stringValue = data
        super.configure(with: data)
    }
    
    @objc private func _callAction() {
        invokeCustomAction(key: "MyAction")
    }
    
}
