import Foundation
import UIKit

extension UICollectionView {
    
    public func register<CellType: UICollectionViewCell & Cellable>(_ cell: CellType.Type) {
        self.register(cell.loadXIB(), forCellWithReuseIdentifier: cell.Identifier)
    }
    
    public func register<CellType: UICollectionViewCell & Cellable>(cell: CellType.Type, delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource) {
        self.register(cell)
        self.delegate = delegate
        self.dataSource = dataSource
    }
    
    public func register<CellType: UICollectionReusableView & Cellable>(_ cell: CellType.Type, forSupplementaryViewOfKind: String) {
        self.register(cell.loadXIB(), forSupplementaryViewOfKind: forSupplementaryViewOfKind, withReuseIdentifier: cell.Identifier)
    }
    
    public func register<CellType: UICollectionReusableView & Cellable>(_ cell: CellType.Type, forSupplementaryViewOfKind: String, delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource) {
        self.register(cell, forSupplementaryViewOfKind: forSupplementaryViewOfKind)
        self.delegate = delegate
        self.dataSource = dataSource
    }
    
    public func dequeueReusableCell<Element: Cellable>(indexPath: IndexPath) -> Element {
        self.dequeueReusableCell(withReuseIdentifier: Element.Identifier, for: indexPath) as! Element
    }
    
    public func dequeueReusableSupplementaryView<Element: Cellable>(ofKind: String, indexPath: IndexPath) -> Element {
        switch ofKind {
        case UICollectionView.elementKindSectionHeader:
            return self.dequeueReusableSupplementaryView(ofKind: ofKind, withReuseIdentifier: Element.Identifier, for: indexPath) as! Element
        case UICollectionView.elementKindSectionFooter:
            return self.dequeueReusableSupplementaryView(ofKind: ofKind, withReuseIdentifier: Element.Identifier, for: indexPath) as! Element
        default:
            return self.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Element.Identifier, for: indexPath) as! Element
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
