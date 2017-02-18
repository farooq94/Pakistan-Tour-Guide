//
//  SplashViewController.swift
//  FypSwift
//
//  Created by Nano Degree on 11/02/2017.
//  Copyright © 2017 Nano Degree. All rights reserved.
//

import UIKit

class SplashViewController: BaseClassViewController {

    @IBOutlet weak var logoImageView : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        _topBar.isHidden = true

        self.navigationController?.navigationBar.isHidden = true
        if logoImageView != nil {
            self.logoImageView.center = self.logoImageView.center
        }
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.0, options: [] , animations: {
            self.logoImageView.center = CGPoint(x: self.logoImageView.center.x-75, y: self.logoImageView.center.x-75)
        
            
            }, completion: nil)
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
