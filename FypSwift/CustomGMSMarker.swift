//
//  CustomGMSMarker.swift
//  FypSwift
//
//  Created by MBP on 13/02/2017.
//  Copyright © 2017 Nano Degree. All rights reserved.
//

import UIKit

class CustomGMSMarker: UIView {

    @IBOutlet weak var imgPlace: UIImageView!
    @IBOutlet weak var lbltitle: UILabel!
    @IBOutlet weak var lblSnippet: UILabel!
    
    @IBOutlet weak var bgView: UIView!
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func awakeFromNib() {
        bgView.alpha = 0.5
    }

}
