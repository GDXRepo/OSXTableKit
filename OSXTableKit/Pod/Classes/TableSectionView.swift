//
//  TableSectionView.swift
//  OSXTableKit
//
//  Created by Georgiy Malyukov on 26/02/2019.
//

import AppKit

open class TableSectionView: NSTableCellView {
    
    public var backgroundColor: NSColor = .clear {
        didSet {
            layer!.backgroundColor = backgroundColor.cgColor
        }
    }
    
    public override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        wantsLayer = true
        make()
        bind()
        localize()
    }
    
    public required init?(coder decoder: NSCoder) {
        fatalError()
    }
    
    open func make() {
        // empty
    }
    
    open override func updateConstraints() {
        super.updateConstraints()
    }
    
    open func bind() {
        // empty
    }
    
    open func localize() {
        // empty
    }
    
    open func reloadData() {
        needsLayout = true
    }
    
}
