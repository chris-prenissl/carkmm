/*
See LICENSE folder for this sample’s licensing information.

Abstract:
`LoggerViewController` displays a read-only log on the phone screen of the events the app records.
*/

import UIKit
import StoreKit

/**
 `LoggerViewController` displays a read-only log, on the phone screen, of the events
 being recorded by Hoagies.
 */
class LoggerViewController: UITableViewController {
    
    private let cellIdentifier = "cell"
    private static var formatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm:ss.SSS"
        return formatter
    }
    private var datasource: UITableViewDiffableDataSource<Int, Event>!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Hoagies Events"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        tableView.allowsSelection = false
        
        datasource = UITableViewDiffableDataSource<Int, Event>(tableView: tableView) { (table, index, event) -> UITableViewCell? in
            let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: self.cellIdentifier)
            var config = cell.defaultContentConfiguration()
            config.text = event.text
            config.secondaryText = self.dateToString(event.date)
            cell.contentConfiguration = config
            return cell
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        applyLatest()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        let previousInterfaceStyleIsDark = previousTraitCollection?.userInterfaceStyle == .dark
        let newInterfaceStyleIsDark = traitCollection.userInterfaceStyle == .dark
        
        guard previousInterfaceStyleIsDark != newInterfaceStyleIsDark else { return }
        
        MemoryLogger.shared.appendEvent("Phone: Dark interface style changed from \(previousInterfaceStyleIsDark) to \(newInterfaceStyleIsDark)")
    }
    
    private func dateToString(_ date: Date) -> String {
        return LoggerViewController.formatter.string(from: date)
    }
    
    private func applyLatest() {
        var snap = NSDiffableDataSourceSnapshot<Int, Event>()
        snap.appendSections([0])
        snap.appendItems(MemoryLogger.shared.events)
        datasource.apply(snap, animatingDifferences: true)
    }
    
}

extension LoggerViewController: LoggerDelegate {
    
    func loggerDidAppendEvent() {
        applyLatest()
    }
    
}
