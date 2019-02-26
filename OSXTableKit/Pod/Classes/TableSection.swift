//
//  TableSection.swift
//  OSXTableKit
//
//  Created by Georgiy Malyukov on 22/02/2019.
//

import Foundation

class TableSection: NSObject {
    
    var headerView: TableSectionView?
    fileprivate(set) var rows = [Row]()
    
    var numberOfRows: Int {
        return rows.count
    }
    
    var isEmpty: Bool {
        return rows.isEmpty
    }
    
    init(headerView: TableSectionView? = nil, rows: [Row]? = nil) {
        self.headerView = headerView
        if let initialRows = rows {
            self.rows.append(contentsOf: initialRows)
        }
    }
    
}

extension TableSection {
    
    func clear() {
        rows.removeAll()
    }
    
    func append(row: Row) {
        append(rows: [row])
    }
    
    func append(rows: [Row]) {
        self.rows.append(contentsOf: rows)
    }
    
    func insert(row: Row, at index: Int) {
        rows.insert(row, at: index)
    }
    
    func insert(rows: [Row], at index: Int) {
        self.rows.insert(contentsOf: rows, at: index)
    }
    
    func replace(rowAt index: Int, with row: Row) {
        rows[index] = row
    }
    
    func swap(from: Int, to: Int) {
        rows.swapAt(from, to)
    }
    
    func delete(rowAt index: Int) {
        rows.remove(at: index)
    }
    
    func remove(rowAt index: Int) {
        rows.remove(at: index)
    }
    
}
