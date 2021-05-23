#if canImport(UIKit)
import Foundation
import UIKit

/**
 # Cellable Protocol
    
 - Implement Properties
    - static var bundle: Bundle
        - This Property Cell Xib Bundle
    - static var forNibNameIdentifier: String
        - This Property Cell Xib UINib nibName
    - static var forCellReuseIdentifier: String
        - This Property Cell ReuseIdentifier
 
 - case CollectionView
 
    - public func register<CellType: UICollectionViewCell & Cellable>(cell: CellType.Type,
                                                                      delegate: UICollectionViewDelegate? = nil,
                                                                      dataSource: UICollectionViewDataSource? = nil,
                                                                      prefetchDataSource: UICollectionViewDataSourcePrefetching? = nil,
                                                                      dragDelegate: UICollectionViewDragDelegate,
                                                                      dropDelegate: UICollectionViewDropDelegate)
 
    - public func register<CellType: UICollectionReusableView & Cellable>(cell: CellType.Type,
                                                                          forSupplementaryViewOfKind: String,
                                                                          delegate: UICollectionViewDelegate? = nil,
                                                                          dataSource: UICollectionViewDataSource? = nil,
                                                                          prefetchDataSource: UICollectionViewDataSourcePrefetching? = nil,
                                                                          dragDelegate: UICollectionViewDragDelegate,
                                                                          dropDelegate: UICollectionViewDropDelegate)
 
    - public func dequeueReusableCell<Element: Cellable>(indexPath: IndexPath) -> Element
 
    - public func dequeueReusableSupplementaryView<Element: Cellable>(ofKind: String, indexPath: IndexPath) -> Element
 
    - public func cellForItem<Element: Cellable>(at: IndexPath) -> Element?
     
    - public func supplementaryView<Element: Cellable>(forElementKind: String, at: IndexPath) -> Element?
 
 - case TableView
 
    - public func register<CellType: UITableViewCell & Cellable>(cell: CellType.Type,
                                                                 delegate: UITableViewDelegate? = nil,
                                                                 dataSource: UITableViewDataSource? = nil,
                                                                 prefetchDataSource: UITableViewDataSourcePrefetching? = nil,
                                                                 dragDelegate: UITableViewDragDelegate,
                                                                 dropDelegate: UITableViewDropDelegate
 
    - public func registerHeaderFooter<CellType: UITableViewHeaderFooterView & Cellable>(cell: CellType.Type,
                                                                                         delegate: UITableViewDelegate? = nil,
                                                                                         dataSource: UITableViewDataSource? = nil,
                                                                                         prefetchDataSource: UITableViewDataSourcePrefetching? = nil,
                                                                                         dragDelegate: UITableViewDragDelegate,
                                                                                         dropDelegate: UITableViewDropDelegate)
 
    - public func dequeueReusableCell<Element: Cellable>(indexPath: IndexPath) -> Element
 
    - public func dequeueReusableHeaderFooterView<Element: Cellable>() -> Element
 
    - public func cellForRow<Element: Cellable>(at: IndexPath) -> Element?
 
    - public func headerView<Element: Cellable>(forSection: Int) -> Element?
 
    - public func footerView<Element: Cellable>(forSection: Int) -> Element?
 */

public protocol Cellable {
    static var bundle: Bundle? { get }
    static var forNibNameIdentifier: String { get }
    static var forCellReuseIdentifier: String { get }
}

extension Cellable {
    
    public static func loadXIB() -> UINib { UINib(nibName: forNibNameIdentifier, bundle: bundle) }
    
    public static var bundle: Bundle? { nil }
    
    public static var forNibNameIdentifier: String { String(describing: self) }
    
    public static var forCellReuseIdentifier: String { String(describing: self) }
}

#endif
