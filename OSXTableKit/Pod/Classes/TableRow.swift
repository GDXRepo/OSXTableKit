//
//  TableRow.swift
//  OSXTableKit
//
//  Created by Georgiy Malyukov on 22/02/2019.
//

import AppKit

public class TableRow<T: ConfigurableCell>: Row where T: NSTableCellView {
    
    let item: T.CellData
    
    public var reuseId: String {
        return T.reuseId
    }
    
    private lazy var actions = [String: [TableRowAction<T>]]()
    
    public init(with item: T.CellData, actions: [TableRowAction<T>]? = nil) {
        self.item = item
        actions?.forEach { on($0) }
    }
    
    public func invoke(action: TableRowActionType, cell: NSTableCellView?, path: IndexPath, userInfo: [AnyHashable: Any]? = nil) -> Any? {
        return actions[action.key]?.compactMap { $0.invokeActionOn(cell: cell, item: item, path: path, userInfo: userInfo) }.last
    }
    
    public func has(action: TableRowActionType) -> Bool {
        return actions[action.key] != nil
    }
    
}

extension TableRow {
    
    public func make() -> NSTableCellView {
        return T.init()
    }
    
    public func configure(cell: NSTableCellView) {
        (cell as? T)?.configure(with: item)
    }
    
}

extension TableRow {
    
    @discardableResult
    public func on(_ action: TableRowAction<T>) -> Self {
        if actions[action.type.key] == nil {
            actions[action.type.key] = [TableRowAction<T>]()
        }
        actions[action.type.key]?.append(action)
        return self
    }
    
    @discardableResult
    public func on<V>(_ type: TableRowActionType, handler: @escaping (_ options: TableRowActionOptions<T>) -> V) -> Self {
        return on(TableRowAction<T>(type, handler: handler))
    }
    
//    @discardableResult
//    func on(_ key: String, handler: @escaping (_ options: TableRowActionOptions<T>) -> ()) -> Self {
//        return on(TableRowAction<T>(.custom(key), handler: handler))
//    }
    
    public func removeAllActions() {
        actions.removeAll()
    }
    
    public func removeAction(forActionId actionId: String) {
        for (key, value) in actions {
            if let actionIndex = value.index(where: { $0.id == actionId }) {
                actions[key]?.remove(at: actionIndex)
            }
        }
    }
    
}
