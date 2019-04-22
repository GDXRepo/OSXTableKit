//
//  TableProtocols.swift
//  OSXTableKit
//
//  Created by Georgiy Malyukov on 22/02/2019.
//

import AppKit

public enum TableRowActionType {
    
    case click
//    case clickDelete
    case select
    case deselect
//    case willSelect
//    case willDisplay
//    case didEndDisplaying
//    case shouldHighlight
//    case height
//    case canEdit
    case configure
//    case canDelete
//    case canMove
//    case canMoveTo
//    case move
    case custom(String)
    
    public var key: String {
        switch self {
        case .custom(let key):
            return key
        default:
            return "_\(self)"
        }
    }
    
}

public protocol CellConfigurable {
    
    associatedtype CellData
    
    static var reuseId: String { get }
    
    func configure(with data: CellData)
    
}

extension CellConfigurable where Self: NSTableCellView {
    
    public static var reuseId: String {
        return String(describing: self)
    }
    
}

public protocol Row {
    
    var reuseId: String { get }
    
    func make() -> NSTableCellView
    func configure(cell: NSTableCellView)
    func invoke(action: TableRowActionType,
                cell: NSTableCellView?,
                path: IndexPath,
                userInfo: [AnyHashable: Any]?) -> Any?
    func has(action: TableRowActionType) -> Bool
    
}
