//
//  TableRowAction.swift
//  OSXTableKit
//
//  Created by Georgiy Malyukov on 24/02/2019.
//

import AppKit

public class TableRowActionOptions<CellType: CellConfigurable> where CellType: NSTableCellView {
    
    public let item: CellType.CellData
    public let cell: CellType?
    public let indexPath: IndexPath
    public let userInfo: [AnyHashable: Any]?
    
    public init(item: CellType.CellData, cell: CellType?, path: IndexPath, userInfo: [AnyHashable: Any]?) {
        self.item = item
        self.cell = cell
        self.indexPath = path
        self.userInfo = userInfo
    }
    
}

private enum TableRowActionHandler<CellType: CellConfigurable> where CellType: NSTableCellView {
    
    case voidAction((TableRowActionOptions<CellType>) -> Void)
    case action((TableRowActionOptions<CellType>) -> Any?)
    
    func invoke(withOptions options: TableRowActionOptions<CellType>) -> Any? {
        switch self {
        case .voidAction(let handler):
            return handler(options)
        case .action(let handler):
            return handler(options)
        }
    }
    
}

public class TableRowAction<CellType: CellConfigurable> where CellType: NSTableCellView {
    
    public var id: String?
    public let type: TableRowActionType
    private let handler: TableRowActionHandler<CellType>
    
    public init(_ type: TableRowActionType, handler: @escaping (_ options: TableRowActionOptions<CellType>) -> Void) {
        self.type = type
        self.handler = .voidAction(handler)
    }
    
    public init(_ key: String, handler: @escaping (_ options: TableRowActionOptions<CellType>) -> Void) {
        type = .custom(key)
        self.handler = .voidAction(handler)
    }
    
    public init<T>(_ type: TableRowActionType, handler: @escaping (_ options: TableRowActionOptions<CellType>) -> T) {
        self.type = type
        self.handler = .action(handler)
    }
    
    public func invokeActionOn(cell: NSTableCellView?, item: CellType.CellData, path: IndexPath, userInfo: [AnyHashable: Any]?) -> Any? {
        return handler.invoke(withOptions: TableRowActionOptions(item: item, cell: cell as? CellType, path: path, userInfo: userInfo))
    }
    
}
