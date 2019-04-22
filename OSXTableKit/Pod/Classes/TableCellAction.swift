//
//  TableCellAction.swift
//  Sample
//
//  Created by Georgiy Malyukov on 22/04/2019.
//  Copyright © 2019 Georgiy Malyukov. All rights reserved.
//

import AppKit

open class TableCellAction {
    
    /// The cell that triggers an action.
    public let cell: NSTableCellView
    
    /// The action unique key.
    public let key: String
    
    /// The custom user info.
    public let userInfo: [AnyHashable: Any]?
    
    public init(key: String, sender: NSTableCellView, userInfo: [AnyHashable: Any]? = nil) {
        self.key = key
        self.cell = sender
        self.userInfo = userInfo
    }
    
    open func invoke() {
        NotificationCenter.default.post(name: Notification.Name(rawValue: TableDirector.CellActionNotification),
                                        object: self,
                                        userInfo: userInfo)
    }
    
}
