//
//  TableCell.swift
//  OSXTableKit
//
//  Created by Georgiy Malyukov on 24/02/2019.
//

import AppKit

class TableCell<T>: NSTableCellView, ConfigurableCell {
    
    typealias CellData = T
    
    var backgroundColor: NSColor = .clear {
        didSet {
            layer!.backgroundColor = backgroundColor.cgColor
        }
    }
    
    func configure(with data: T) {
        // empty
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
    
}
