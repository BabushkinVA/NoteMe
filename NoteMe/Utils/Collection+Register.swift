//
//  Collection+Register.swift
//  NoteMe
//
//  Created by Vadim on 3.02.24.
//

import UIKit

extension UITableView {
    
    func register<CellType: UITableViewCell>(_ type: CellType.Type) {
        self.register(CellType.self, forCellReuseIdentifier: "\(CellType.self)")
    }
    
    func dequeue<CellType: UITableViewCell>(at indexPath: IndexPath) -> CellType {
        return self.dequeueReusableCell(withIdentifier: "\(CellType.self)",
                                        for: indexPath) as! CellType
    }
    
}

extension UICollectionView {
    
    func register<CellType: UICollectionViewCell>(_ type: CellType.Type) {
        self.register(CellType.self, forCellWithReuseIdentifier: "\(CellType.self)")
    }
    
    func dequeue<CellType: UICollectionViewCell>(at indexPath: IndexPath) -> CellType {
        return self.dequeueReusableCell(withReuseIdentifier: "\(CellType.self)",
                                        for: indexPath) as! CellType
    }
    
}
