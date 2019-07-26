//
//  UITableView.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

extension UITableView{
    
    func sizeHeaderToFit() {
        if let headerView = self.tableHeaderView {
            let height = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
            
            var newFrame = headerView.frame
            newFrame.size.height = height
            headerView.frame = newFrame
            
            headerView.layoutIfNeeded()
        }
    }
}
