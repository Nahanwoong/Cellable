//
//  ViewController.swift
//  Cellable
//
//  Created by nibdevn@gmail.com on 10/11/2020.
//  Copyright (c) 2020 nibdevn@gmail.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - @IBOutlet
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    private lazy var collecionLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        let cellWidth = (UIScreen.main.bounds.width * 0.5) - layout.sectionInset.left - layout.sectionInset.right - layout.minimumInteritemSpacing
        let cellHeight = cellWidth
        let cellSize = CGSize(width: cellWidth, height: cellHeight)
        layout.itemSize = cellSize
        let headerWidth = (UIScreen.main.bounds.width) - layout.sectionInset.left - layout.sectionInset.right
        let headerHeight = headerWidth * 0.3
        let headerSize = CGSize(width: headerWidth, height: headerHeight)
        layout.headerReferenceSize = headerSize
        return layout
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerHeaderFooter(cell: TestTableViewHeaderFooterView.self)
        tableView.register(cell: TestTableViewCell.self, delegate: self, dataSource: self)
        collectionView.register(cell: TestCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader)
        collectionView.register(cell: TestCollectionViewCell.self, delegate: self, dataSource: self)
        collectionView.setCollectionViewLayout(collecionLayout, animated: true)
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section + 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header: TestTableViewHeaderFooterView = tableView.dequeueReusableHeaderFooterView()
        header.headerLabel.text = "\(section + 1) Header"
        return header
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TestTableViewCell = tableView.dequeueReusableCell(indexPath: indexPath)
        cell.numberLabel.text = "\(indexPath.section + 1) Section \(indexPath.row + 1) Row TableViewCell"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("TableViewCell Selected: \(indexPath.section + 1) Section \(indexPath.row + 1) Row Cell")
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: TestCollectionViewCell = collectionView.dequeueReusableCell(indexPath: indexPath)
        cell.numberLabel.text = "\(indexPath.item + 1) Cell"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header: TestCollectionReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, indexPath: indexPath)
        header.headerLabel.text = "\(indexPath.section + 1) Header"
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print("CollectionViewCell Selected: \(indexPath.section + 1) Section \(indexPath.item + 1) item Cell")
    }
}

