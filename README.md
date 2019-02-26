# OSXTableKit
NSTableView wrapper for managing single-column tables. Supports macOS 10.10 or above.

Inspired by https://github.com/maxsokolov/TableKit/

# Overview
This library helps you to manage iOS-like tables in code. No XIBs, no storyboards, no pain. Pure code only. Simple example of creating table:
```swift
...
tableView.backgroundColor = .darkGray
let director = TableDirector(with: tableView)
director.clear()
let sections = [ // some sections with rows arrays inside
    [0, 1, 2, 3].map { "Row \($0)" },
    [0, 1, 2, 3, 4, 5].map { "Row \($0)" },
    [0, 1].map { "Row \($0)" }
]
// fill the table
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
```

# Installation
Can be installed via CocoaPods (or by manual dragging source code files to your project, of course).
## CocoaPods
`OSXTableKit` is available through CocoaPods. To install it simply add the following line to your Podfile:
```
pod 'OSXTableKit'
```
then run in Terminal the following command:
```
$ pod install
```

# Pros
* Displays single-column iOS-like style table view.
* Supports non-fixed sections.
* Strictly typed table sections, rows and actions. Completely safe table structure coding.
* Automatic sections and rows height calculation.

# What's not supported?
* Fixed sections.
* Sections with empty headers. Workaround: create a view with height equal to 1 with background color equal to table view's background color.
* Multiple columns like macOS native table views.
* For now supports only `click`, `select` and `deselect` table actions. Other actions may be added later.

# License
MIT
