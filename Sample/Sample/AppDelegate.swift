//
//  AppDelegate.swift
//  Sample
//
//  Created by Georgiy Malyukov on 26/02/2019.
//  Copyright © 2019 Georgiy Malyukov. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var tableView: NSTableView!
    
    private var director: TableDirector!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        tableView.backgroundColor = .darkGray
        director = TableDirector(with: tableView)
        director.clear()
        let sections = [
            [0, 1, 2, 3].map { "Row \($0)" },
            [0, 1, 2, 3, 4, 5].map { "Row \($0)" },
            [0, 1].map { "Row \($0)" }
        ]
        for (i, item) in sections.enumerated() {
            let view = SampleTableHeaderView()
            view.title = "Section \(i)"
            let section = TableSection(headerView: view)
            for subitem in item {
                section += TableRow<SampleTableCell>(with: subitem).on(.click) {
                    print("clicked \($0.cell!)")
                }
            }
            director += section
        }
        director.reload()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

