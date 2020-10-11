import Foundation
import UIKit

extension UITableView {
    
    public func register<CellType: UITableViewCell & Cellable>(_ cell: CellType.Type) {
        self.register(cell.loadXIB(), forCellReuseIdentifier: cell.Identifier)
    }
    
    public func register<CellType: UITableViewCell & Cellable>(cell: CellType.Type, delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        self.register(cell)
        self.delegate = delegate
        self.dataSource = dataSource
    }
    
    public func registerHeaderFooter<CellType: UITableViewHeaderFooterView & Cellable>(_ cell: CellType.Type) {
        self.register(cell.loadXIB(), forHeaderFooterViewReuseIdentifier: cell.Identifier)
    }
    
    public func registerHeaderFooter<CellType: UITableViewHeaderFooterView & Cellable>(cell: CellType.Type, delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        self.registerHeaderFooter(cell)
        self.delegate = delegate
        self.dataSource = dataSource
    }
    
    public func dequeueReusableCell<Element: Cellable>(indexPath: IndexPath) -> Element {
        self.dequeueReusableCell(withIdentifier: Element.Identifier, for: indexPath) as! Element
    }
    
    public func dequeueReusableHeaderFooterView<Element: Cellable>() -> Element {
        self.dequeueReusableHeaderFooterView(withIdentifier: Element.Identifier) as! Element
    }
    
    public func cellForRow<Element: Cellable>(at: IndexPath) -> Element? {
        self.cellForRow(at: at) as? Element
    }
    
    public func headerView<Element: Cellable>(forSection: Int) -> Element? {
        self.headerView(forSection: forSection) as? Element
    }
    
    public func footerView<Element: Cellable>(forSection: Int) -> Element? {
        self.footerView(forSection: forSection) as? Element
    }
}
