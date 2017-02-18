//
//  HeaderView.swift
//  FypSwift
//
//  Created by MBP on 18/02/2017.
//  Copyright © 2017 Nano Degree. All rights reserved.
//

import UIKit

class HeaderView: UIView {

    @IBOutlet weak var bgBack: UIView!
    @IBOutlet weak var btnBack: UIButton!
    
    @IBOutlet weak var btnLogOut: UIButton!
    @IBOutlet weak var lblTtitle: UILabel!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    override func awakeFromNib() {
        
        self.backgroundColor = UIColor.clear
        bgBack.backgroundColor = UIColor.white.withAlphaComponent(0.2)
    
        btnLogOut.isHidden = true
        
    }
}
