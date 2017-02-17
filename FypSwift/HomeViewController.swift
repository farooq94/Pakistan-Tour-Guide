//
//  HomeViewController.swift
//  FypSwift
//
//  Created by Nano Degree on 11/02/2017.
//  Copyright © 2017 Nano Degree. All rights reserved.
//

import UIKit

class HomeViewController: BaseClassViewController {
    
    @IBOutlet var SegmentedControl: UIView!

    @IBAction func SegmentChanged(_ sender: AnyObject) {
        
        let segment = sender as! UISegmentedControl
        
        switch segment.selectedSegmentIndex {
        case 0:
            self.performSegue(withIdentifier: "Gotoprofile", sender: self)
            break
        case 1:
            self.performSegue(withIdentifier: "gotomap", sender: self)
            break
        case 2:
            self.performSegue(withIdentifier: "gotogallery", sender: self)
            break
        
        default:
            break
        }

    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
