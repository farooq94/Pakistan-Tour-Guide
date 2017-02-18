//
//  ProfileViewController.swift
//  FypSwift
//
//  Created by Nano Degree on 11/02/2017.
//  Copyright © 2017 Nano Degree. All rights reserved.
//

import UIKit

class ProfileViewController: BaseClassViewController {
    
    @IBOutlet weak var fourthimage: UIImageView!
    @IBOutlet weak var thirdimage: UIImageView!
    @IBOutlet weak var secondimage: UIImageView!
    @IBOutlet weak var firstimage: UIImageView!
    @IBOutlet weak var profileimage: UIImageView!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var number: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if firstimage != nil {
            firstimage.image = #imageLiteral(resourceName: "farooq")
            secondimage.image = #imageLiteral(resourceName: "zee")
            thirdimage.image = #imageLiteral(resourceName: "baig")
            fourthimage.image = #imageLiteral(resourceName: "ustaad")
        }
        
       
        
        
        
        //name.isUserInteractionEnabled = false
        //number.isUserInteractionEnabled = false
        //  email.isUserInteractionEnabled = false
        //password.isUserInteractionEnabled = false
        
        // Do any additional setup after loading the view.
    }
    
    
    
   
    
    @IBOutlet var profileView: UIView!
    
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
