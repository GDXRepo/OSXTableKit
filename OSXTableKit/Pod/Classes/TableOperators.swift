//
//  TableOperators.swift
//  OSXTableKit
//
//  Created by Georgiy Malyukov on 24/02/2019.
//

import Foundation

func += (left: TableDirector, right: TableSection) {
    left.append(section: right)
}

func += (left: TableDirector, right: [TableSection]) {
    left.append(sections: right)
}

// --
func += (left: TableDirector, right: Row) {
    left.append(sections: [TableSection(rows: [right])])
}

func += (left: TableDirector, right: [Row]) {
    left.append(sections: [TableSection(rows: right)])
}

// --
func += (left: TableSection, right: Row) {
    left.append(row: right)
}

func += (left: TableSection, right: [Row]) {
    left.append(rows: right)
}
