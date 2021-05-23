#if canImport(UIKit)
import Foundation
import UIKit

extension UITableView {
    
    public func register<CellType: UITableViewCell & Cellable>(cell: CellType.Type,
                                                               delegate: UITableViewDelegate? = nil,
                                                               dataSource: UITableViewDataSource? = nil,
                                                               prefetchDataSource: UITableViewDataSourcePrefetching? = nil)
    {
        self.register(cell.loadXIB(), forCellReuseIdentifier: cell.forCellReuseIdentifier)
        self.delegate = delegate
        self.dataSource = dataSource
        self.prefetchDataSource = prefetchDataSource
    }
    
    public func registerHeaderFooter<CellType: UITableViewHeaderFooterView & Cellable>(cell: CellType.Type,
                                                                                       delegate: UITableViewDelegate? = nil,
                                                                                       dataSource: UITableViewDataSource? = nil,
                                                                                       prefetchDataSource: UITableViewDataSourcePrefetching? = nil)
    {
        self.register(cell.loadXIB(), forHeaderFooterViewReuseIdentifier: cell.forCellReuseIdentifier)
        self.delegate = delegate
        self.dataSource = dataSource
        self.prefetchDataSource = prefetchDataSource
    }
    
    @available(iOS 11, *)
    public func register<CellType: UITableViewCell & Cellable>(cell: CellType.Type,
                                                               delegate: UITableViewDelegate? = nil,
                                                               dataSource: UITableViewDataSource? = nil,
                                                               prefetchDataSource: UITableViewDataSourcePrefetching? = nil,
                                                               dragDelegate: UITableViewDragDelegate,
                                                               dropDelegate: UITableViewDropDelegate)
    {
        self.register(cell.loadXIB(), forCellReuseIdentifier: cell.forCellReuseIdentifier)
        self.delegate = delegate
        self.dataSource = dataSource
        self.prefetchDataSource = prefetchDataSource
        self.dragDelegate = dragDelegate
        self.dropDelegate = dropDelegate
    }
    
    @available(iOS 11, *)
    public func registerHeaderFooter<CellType: UITableViewHeaderFooterView & Cellable>(cell: CellType.Type,
                                                                                       delegate: UITableViewDelegate? = nil,
                                                                                       dataSource: UITableViewDataSource? = nil,
                                                                                       prefetchDataSource: UITableViewDataSourcePrefetching? = nil,
                                                                                       dragDelegate: UITableViewDragDelegate,
                                                                                       dropDelegate: UITableViewDropDelegate)
    {
        self.register(cell.loadXIB(), forHeaderFooterViewReuseIdentifier: cell.forCellReuseIdentifier)
        self.delegate = delegate
        self.dataSource = dataSource
        self.prefetchDataSource = prefetchDataSource
        self.dragDelegate = dragDelegate
        self.dropDelegate = dropDelegate
    }
    
    public func dequeueReusableCell<Element: Cellable>(indexPath: IndexPath) -> Element {
        self.dequeueReusableCell(withIdentifier: Element.forCellReuseIdentifier, for: indexPath) as! Element
    }
    
    public func dequeueReusableHeaderFooterView<Element: Cellable>() -> Element {
        self.dequeueReusableHeaderFooterView(withIdentifier: Element.forCellReuseIdentifier) as! Element
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
#endif
