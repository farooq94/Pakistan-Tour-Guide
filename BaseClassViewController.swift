//
//  BaseClassViewController.swift
//  FypSwift
//
//  Created by MBP on 17/02/2017.
//  Copyright © 2017 Nano Degree. All rights reserved.
//

import UIKit

class BaseClassViewController: UIViewController {

    let bgImage : UIImageView! = UIImageView.init()
    
    let topBar = UIView.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bgImage.frame = self.view.frame
        bgImage.image = #imageLiteral(resourceName: "bg (11)")
        self.view.insertSubview(bgImage, at: 0)
        
        topBar.frame = CGRect(x: 0, y: 0, width:self.view.frame.size.width , height: 56)
        
        topBar.backgroundColor = UIColor.gray
        
        self.view.addSubview(topBar)
        topBar.bringSubview(toFront: self.view)
    
////////////
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
