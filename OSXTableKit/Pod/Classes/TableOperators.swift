//
//  TableOperators.swift
//  OSXTableKit
//
//  Created by Georgiy Malyukov on 24/02/2019.
//

import Foundation

public func += (left: TableDirector, right: TableSection) {
    left.append(section: right)
}

public func += (left: TableDirector, right: [TableSection]) {
    left.append(sections: right)
}

// --
public func += (left: TableDirector, right: Row) {
    left.append(sections: [TableSection(rows: [right])])
}

public func += (left: TableDirector, right: [Row]) {
    left.append(sections: [TableSection(rows: right)])
}

// --
public func += (left: TableSection, right: Row) {
    left.append(row: right)
}

public func += (left: TableSection, right: [Row]) {
    left.append(rows: right)
}
