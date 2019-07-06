//
//  PagingCollectionViewFlowLayout.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import UIKit

public class PagingCollectionViewFlowLayout: UICollectionViewFlowLayout {
    var pageWidth: CGFloat {
        get {
            return self.itemSize.width + self.minimumLineSpacing
        }
    }
    
    var flickVelocity: CGFloat {
        get {
            return 0.3
        }
    }
    
    override open func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        guard let collectionView = collectionView else { return proposedContentOffset }
        
        let rawPageValue:CGFloat = collectionView.contentOffset.x / self.pageWidth
        let currentPage:CGFloat = (velocity.x > 0.0) ? floor(rawPageValue) : ceil(rawPageValue)
        let nextPage:CGFloat = (velocity.x > 0.0) ? ceil(rawPageValue) : floor(rawPageValue)
        
        let pannedLessThanAPage:Bool = abs(1 + currentPage - rawPageValue) > 0.5
        let flicked:Bool = abs(velocity.x) > self.flickVelocity
        var retOffset = proposedContentOffset
        if pannedLessThanAPage && flicked {
            retOffset.x = nextPage * self.pageWidth
        } else {
            retOffset.x = round(rawPageValue) * self.pageWidth
        }
        
        return retOffset
    }
}
