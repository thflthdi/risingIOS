//
//  IntrinsicTableView.swift
//  02lifecycle
//
//  Created by 황예진 on 2022/12/08.
//

import UIKit

class IntrinsicTableView: UITableView {
    override var intrinsicContentSize: CGSize {
        let number = numberOfRows(inSection: 0)
                var height: CGFloat = 0

                for i in 0..<number {
                    guard let cell = cellForRow(at: IndexPath(row: i, section: 0)) else {
                        continue
                    }
                    height += cell.bounds.height
                }
                return CGSize(width: contentSize.width, height: height)
    }
}
