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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bgImage.frame = self.view.frame
        bgImage.image = #imageLiteral(resourceName: "bg (14)")
        self.view.insertSubview(bgImage, at: 0)
    

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
