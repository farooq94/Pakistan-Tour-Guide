//
//  BtnCustomClass.swift
//  FypSwift
//
//  Created by Nano Degree on 11/01/2017.
//  Copyright © 2017 Nano Degree. All rights reserved.
//

import UIKit

class BtnCustomClass: UIButton {
    
    
    @IBOutlet weak var lblHeader: UILabel!
    
    override func awakeFromNib() {
        self.backgroundColor = UIColor.gray
    }
}
