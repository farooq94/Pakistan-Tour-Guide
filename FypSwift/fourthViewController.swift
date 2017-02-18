//
//  fourthViewController.swift
//  tour
//
//  Created by Nano Degree on 14/01/2017.
//  Copyright © 2017 HCD. All rights reserved.
//

import UIKit

class fourthViewController: BaseClassViewController,CustomHeaderdelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        _topBar.lblTtitle.text = "FourthView"
        delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func headerBackBtnClick() {
        
        self.performSegue(withIdentifier: "", sender: self)
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
