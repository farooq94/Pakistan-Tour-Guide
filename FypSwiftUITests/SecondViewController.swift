//
//  SecondViewController.swift
//  FypSwift
//
//  Created by Nano Degree on 11/01/2017.
//  Copyright © 2017 Nano Degree. All rights reserved.
//

import UIKit


class SecondViewController: UIViewController {

    
     let bgImage : UIImageView! = UIImageView.init()
    
    @IBOutlet weak var lblHeader: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bgImage.frame = self.view.frame
        bgImage.image = #imageLiteral(resourceName: "f1")
        self.view.insertSubview(bgImage, at: 0)

        // Do any additional     setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    _topBar.lblTtitle.text = "ViewConntroller"
//    delegate = self
//    
//    func headerBackBtnClick() {
//        
//        self.performSegue(withIdentifier: "", sender: self)
//    }
//    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
