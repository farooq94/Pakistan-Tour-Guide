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
    @IBOutlet weak var lblPakistan : UILabel!
    @IBOutlet weak var lblMessage : UILabel!
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        _topBar.isHidden = true

        self.navigationController?.navigationBar.isHidden = true
        if logoImageView != nil {
            self.logoImageView.center = self.logoImageView.center
        }
        
        self.logoImageView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)

        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        
        UIView.animate(withDuration: 0.4,
                       animations: {
                        self.logoImageView.transform = CGAffineTransform(scaleX: 1.4, y: 1.4)
        },
                       completion: { _ in
                        UIView.animate(withDuration: 0.8) {
                            self.logoImageView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                        }
        })
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
