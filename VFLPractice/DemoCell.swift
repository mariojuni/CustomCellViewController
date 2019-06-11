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

class DemoCell: FoldingCell {
    

    
    var number: Int = 0 {
        didSet {
       
        }
    }
    
    override func awakeFromNib() {
        foregroundView.layer.cornerRadius = 10
        foregroundView.layer.masksToBounds = true
        super.awakeFromNib()
    }
    
    override func animationDuration(_ itemIndex: NSInteger, type _: FoldingCell.AnimationType) -> TimeInterval {
        let durations = [0.26, 0.2, 0.2]
        return durations[itemIndex]
    }
}

// MARK: - Actions ⚡️

extension DemoCell {

}
