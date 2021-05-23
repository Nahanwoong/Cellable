import Foundation
import UIKit

extension UICollectionView {
    
    public func register<CellType: UICollectionViewCell & Cellable>(cell: CellType.Type,
                                                                    delegate: UICollectionViewDelegate? = nil,
                                                                    dataSource: UICollectionViewDataSource? = nil,
                                                                    prefetchDataSource: UICollectionViewDataSourcePrefetching? = nil)
    {
        self.register(cell.loadXIB(), forCellWithReuseIdentifier: cell.forCellReuseIdentifier)
        self.delegate = delegate
        self.dataSource = dataSource
        self.prefetchDataSource = prefetchDataSource
    }
    
    public func register<CellType: UICollectionReusableView & Cellable>(cell: CellType.Type,
                                                                        forSupplementaryViewOfKind: String,
                                                                        delegate: UICollectionViewDelegate? = nil,
                                                                        dataSource: UICollectionViewDataSource? = nil,
                                                                        prefetchDataSource: UICollectionViewDataSourcePrefetching? = nil)
    {
        self.register(cell.loadXIB(), forSupplementaryViewOfKind: forSupplementaryViewOfKind, withReuseIdentifier: cell.forCellReuseIdentifier)
        self.delegate = delegate
        self.dataSource = dataSource
        self.prefetchDataSource = prefetchDataSource
    }
    
    @available(iOS 11, *)
    public func register<CellType: UICollectionViewCell & Cellable>(cell: CellType.Type,
                                                                    delegate: UICollectionViewDelegate? = nil,
                                                                    dataSource: UICollectionViewDataSource? = nil,
                                                                    prefetchDataSource: UICollectionViewDataSourcePrefetching? = nil,
                                                                    dragDelegate: UICollectionViewDragDelegate,
                                                                    dropDelegate: UICollectionViewDropDelegate)
    {
        self.register(cell.loadXIB(), forCellWithReuseIdentifier: cell.forCellReuseIdentifier)
        self.delegate = delegate
        self.dataSource = dataSource
        self.prefetchDataSource = prefetchDataSource
        self.dragDelegate = dragDelegate
        self.dropDelegate = dropDelegate
    }
    
    @available(iOS 11, *)
    public func register<CellType: UICollectionReusableView & Cellable>(cell: CellType.Type,
                                                                        forSupplementaryViewOfKind: String,
                                                                        delegate: UICollectionViewDelegate? = nil,
                                                                        dataSource: UICollectionViewDataSource? = nil,
                                                                        prefetchDataSource: UICollectionViewDataSourcePrefetching? = nil,
                                                                        dragDelegate: UICollectionViewDragDelegate,
                                                                        dropDelegate: UICollectionViewDropDelegate)
    {
        self.register(cell.loadXIB(), forSupplementaryViewOfKind: forSupplementaryViewOfKind, withReuseIdentifier: cell.forCellReuseIdentifier)
        self.delegate = delegate
        self.dataSource = dataSource
        self.prefetchDataSource = prefetchDataSource
        self.dragDelegate = dragDelegate
        self.dropDelegate = dropDelegate
    }
    
    public func dequeueReusableCell<Element: Cellable>(indexPath: IndexPath) -> Element {
        self.dequeueReusableCell(withReuseIdentifier: Element.forCellReuseIdentifier, for: indexPath) as! Element
    }
    
    public func dequeueReusableSupplementaryView<Element: Cellable>(ofKind: String, indexPath: IndexPath) -> Element {
        switch ofKind {
        case UICollectionView.elementKindSectionHeader:
            return self.dequeueReusableSupplementaryView(ofKind: ofKind, withReuseIdentifier: Element.forCellReuseIdentifier, for: indexPath) as! Element
        case UICollectionView.elementKindSectionFooter:
            return self.dequeueReusableSupplementaryView(ofKind: ofKind, withReuseIdentifier: Element.forCellReuseIdentifier, for: indexPath) as! Element
        default:
            return self.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Element.forCellReuseIdentifier, for: indexPath) as! Element
        }
    }
    
    public func cellForItem<Element: Cellable>(at: IndexPath) -> Element? {
        self.cellForItem(at: at) as? Element
    }
    
    public func supplementaryView<Element: Cellable>(forElementKind: String, at: IndexPath) -> Element? {
        switch forElementKind {
        case UICollectionView.elementKindSectionHeader:
            return self.supplementaryView(forElementKind: forElementKind, at: at) as? Element
        case UICollectionView.elementKindSectionFooter:
            return self.supplementaryView(forElementKind: forElementKind, at: at) as? Element
        default:
            return self.supplementaryView(forElementKind: UICollectionView.elementKindSectionHeader, at: at) as? Element
        }
    }
}
