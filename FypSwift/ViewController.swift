//
//  ViewController.swift
//  FypSwift
//
//  Created by Nano Degree on 09/01/2017.
//  Copyright © 2017 Nano Degree. All rights reserved.
//

import UIKit

class ViewController: BaseClassViewController {
    
    @IBOutlet var segmentedcontrol : UISegmentedControl!
    
    @IBOutlet var Map : UISegmentedControl!
    @IBOutlet weak var Profile: UIView!
    @IBOutlet var Gallery : UISegmentedControl!
    
    var selectedBtn = 0

    override func viewDidLoad() {
       
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
    }
    
    @IBAction func segmentchanged (_ sender: AnyObject){
        
        }
    
    @IBAction func ChangePage(_ sender: AnyObject) {
        
        
        var btn = sender as! UIButton
        
        
         selectedBtn = btn.tag
        
        self.performSegue(withIdentifier: "Showdetail", sender: self)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
        // Dispose of any resources that can be recreated.
    }
    
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
       var obj = segue.destination
        
        switch selectedBtn {
        case 1:
            obj.lable.text = " map"

        default:
            break
        }*/
        
        
        
        
    }
    
    


