//
//  TableSection.swift
//  OSXTableKit
//
//  Created by Georgiy Malyukov on 22/02/2019.
//

import Foundation

public class TableSection: NSObject {
    
    public var headerView: TableSectionView?
    public fileprivate(set) var rows = [Row]()
    
    public var isEmpty: Bool {
        return rows.isEmpty
    }
    
    public init(headerView: TableSectionView? = nil, rows: [Row]? = nil) {
        self.headerView = headerView
        if let initialRows = rows {
            self.rows.append(contentsOf: initialRows)
        }
    }
    
}

extension TableSection {
    
    public func clear() {
        rows.removeAll()
    }
    
    public func append(row: Row) {
        append(rows: [row])
    }
    
    public func append(rows: [Row]) {
        self.rows.append(contentsOf: rows)
    }
    
    public func insert(row: Row, at index: Int) {
        rows.insert(row, at: index)
    }
    
    public func insert(rows: [Row], at index: Int) {
        self.rows.insert(contentsOf: rows, at: index)
    }
    
    public func replace(rowAt index: Int, with row: Row) {
        rows[index] = row
    }
    
    public func swap(from: Int, to: Int) {
        rows.swapAt(from, to)
    }
    
    public func delete(rowAt index: Int) {
        rows.remove(at: index)
    }
    
    public func remove(rowAt index: Int) {
        rows.remove(at: index)
    }
    
}
