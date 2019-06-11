//
//  DemoCell.swift
//  VFLPractice
//
//  Created by Mario Juni on 11/06/2019.
//  Copyright © 2019 VeritasPay Inc. All rights reserved.
//

import Foundation
import FoldingCell
import UIKit
import IBAnimatable

class DemoCell: FoldingCell {
    
    @IBOutlet weak var UppergroundView: AnimatableView!
    var number: Int = 0 {
        didSet {
       
        }
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//      ///self.setNeedsLayout()
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
       /// self.layoutIfNeeded()
        UppergroundView.concaveCornerUpper(depth: 10)
        foregroundView.concaveCornerLower(depth: 10.0)
        ///foregroundView.layer.masksToBounds = false
       ///self.foregroundView.layoutIfNeeded()
       /// self.UppergroundView.layoutIfNeeded()
        
     
    }
    
 
    override func animationDuration(_ itemIndex: NSInteger, type _: FoldingCell.AnimationType) -> TimeInterval {
        let durations = [0.26, 0.2, 0.2]
        return durations[itemIndex]
    }
}

// MARK: - Actions ⚡️

extension DemoCell {

}
