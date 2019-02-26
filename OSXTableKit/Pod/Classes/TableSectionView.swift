//
//  TableSectionView.swift
//  OSXTableKit
//
//  Created by Georgiy Malyukov on 26/02/2019.
//

import AppKit

class TableSectionView: NSTableCellView {
    
    var backgroundColor: NSColor = .clear {
        didSet {
            layer!.backgroundColor = backgroundColor.cgColor
        }
    }
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        wantsLayer = true
        make()
        bind()
        localize()
    }
    
    required init?(coder decoder: NSCoder) {
        fatalError()
    }
    
    func make() {
        // empty
    }
    
    override func updateConstraints() {
        super.updateConstraints()
    }
    
    func bind() {
        // empty
    }
    
    func localize() {
        // empty
    }
    
    func reloadData() {
        needsLayout = true
    }
    
}
