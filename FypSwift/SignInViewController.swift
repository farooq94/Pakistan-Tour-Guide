//
//  SignInViewController.swift
//  FypSwift
//
//  Created by Nano Degree on 11/02/2017.
//  Copyright © 2017 Nano Degree. All rights reserved.
//

import UIKit

class SignInViewController: BaseClassViewController {

    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var lblPakistan: UILabel!
    @IBOutlet weak var lblOr: UILabel!
    @IBOutlet weak var lblMessage: UILabel!
    
    @IBOutlet weak var btnAbout: BtnCustomClass!
    
    @IBOutlet weak var btnSignUp: BtnCustomClass!
    
    let pre = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
//         txtFirstName.text = "aaa@gmail.com"
//        txtPassword.text = "123456"
        
        
        
        txtFirstName.alpha = 0.0
        txtPassword.alpha = 0.0
        btnLogin.alpha = 0.0
        lblPakistan.alpha = 0.0
        lblOr.alpha = 0.0
        lblMessage.alpha = 0.0
        btnAbout.alpha = 0.0
        btnSignUp.alpha = 0.0
        


        
        btnLogin.addTarget(self, action:#selector(self.btnClick(sender:)) , for: .touchUpInside)
        
        _topBar.isHidden = true

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func btnClick(sender: AnyObject)
    {
        if pre.object(forKey: "appUsers") != nil
        {
            let arr : Array = pre.object(forKey: "appUsers") as! Array <Dictionary<String,AnyObject>>
            
            print(arr)
            
            let count = arr.filter{(($0["Email"] != nil) && ($0["Email"] as? String == txtFirstName.text)) && (($0["Password"] != nil) && ($0["Password"] as? String == txtPassword.text))}
            
            if count.count > 0 {
                let dic = count[0] as Dictionary<String,AnyObject>
                pre.set(dic, forKey: "UserData")
                pre.set(dic["userID"] as! Int, forKey:"userID")
                
                performSegue(withIdentifier: "gotohomeafterlogin", sender: self)
            }
            else
            {
                showAlertWithMessag(with: "Invalid Username or Password", completionHandler: {
                    return
                })
            }
            
        }
        else
        {
            showAlertWithMessag(with: "Invalid Username or Password", completionHandler: {
                return
            })
        }
    }
    
    func showAlertWithMessag(with message: String, completionHandler: @escaping () -> Swift.Void){
        
        // create the alert
        let alert = UIAlertController(title: "Message", message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (void) in
            
            completionHandler()
        }))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        Animate.animateWithALpha(view: lblPakistan, Duration: 0.3)
        Animate.animateWithALpha(view: txtFirstName, Duration: 0.5)
        Animate.animateWithALpha(view: txtPassword, Duration: 0.7)
        Animate.animateWithALpha(view: btnLogin, Duration: 0.9)
        Animate.animateWithALpha(view: lblOr, Duration: 1)
        Animate.animateWithALpha(view: btnSignUp, Duration: 1.2)
        Animate.animateWithALpha(view: lblMessage, Duration: 1.3)
        Animate.animateWithALpha(view: btnAbout, Duration: 1.5)
        
  
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
