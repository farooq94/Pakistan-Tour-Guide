//
//  SignUpViewController.swift
//  FypSwift
//
//  Created by Nano Degree on 11/02/2017.
//  Copyright © 2017 Nano Degree. All rights reserved.
//

import UIKit

class SignUpViewController: BaseClassViewController {
    
    
    
    @IBOutlet var txtname : UITextField!
    @IBOutlet var txtPhone : UITextField!
    @IBOutlet var txtEmail : UITextField!
    @IBOutlet var txtPassword : UITextField!
    @IBOutlet var txtConPassword : UITextField!
    
    @IBOutlet var userImage : UIImageView!
    
    @IBOutlet var lblname : UILabel!
    @IBOutlet var lblPhone : UILabel!
    @IBOutlet var lblEmail : UILabel!
    @IBOutlet var lblPassword : UILabel!
    @IBOutlet var lblConPassword : UILabel!
    
    
    
    @IBOutlet var btnSignUp : UIButton!
    
    let pre = UserDefaults.standard

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        btnSignUp.addTarget(self, action:#selector(self.btnClick(sender:)) , for: .touchUpInside)
        
        topBar.isHidden = true
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func btnClick(sender: AnyObject)
    {
        if (validate() == true)
        {
            var dic = Dictionary<String, Any>()
            
            if pre.object(forKey: "appUsers") != nil
            {
                var arr : Array = pre.object(forKey: "appUsers") as! Array <Dictionary<String,AnyObject>>
                
                print(arr)
                
                let count = arr.filter{($0["Email"] != nil) && ($0["Email"] as? String == txtEmail.text)}
                
                
                if count.count > 0 {
                    
                    showAlertWithMessag(with: "Opps! Email already exsist", completionHandler: { 
                        return
                    })
                }
                else
                {
                    dic["UserName"] = txtname.text
                    dic["Email"] = txtEmail.text
                    dic["Phone"] = txtPhone.text
                    dic["Password"] = txtPassword.text
                    dic["userID"] = 1 + arr.count
                    
                    arr.append(dic as [String : AnyObject])
                    pre.set(arr, forKey: "appUsers") // Append in prvious array and save 
                    
                    createUser(dic: dic as NSDictionary)
                }
            }
            else
            {
                dic["UserName"] = txtname.text
                dic["Email"] = txtEmail.text
                dic["Phone"] =  txtPhone.text
                dic["Password"] = txtPassword.text
                dic["userID"] = 1
                
                let arr = [dic]
                pre.set(arr, forKey: "appUsers") // First Time set value
               
                
                createUser(dic: dic as NSDictionary)
            }
        }
    }
    
    func createUser(dic : NSDictionary )
    {
        pre.set(dic["userID"] as! Int, forKey:"userID")
        pre.set(dic, forKey: "UserData")
       
        
        self.performSegue(withIdentifier: "gotohomeaftersignup", sender: self)
    }
    
    
    func validate() -> Bool {
        
        
        if txtname.text == ""  {
            showAlertWithMessag(with: "Please enter User name", completionHandler: {
               
            })
             return false
        }
        else if txtEmail.text == ""  && isValidEmail(testStr: txtEmail.text!) {
            showAlertWithMessag(with: "Please enter valid Email", completionHandler: {
            })
            return false

        }
        else if txtPassword.text == ""  {
            showAlertWithMessag(with: "Please enter Password", completionHandler: {
            })
            return false
        }
        else if txtPassword.text != txtConPassword.text  {
            showAlertWithMessag(with: "Password and Confirm Password are not same", completionHandler: {
            })
            return false
        }
        else if (txtPhone.text! == "") && ((txtPhone.text?.characters.count)! > 11 && (txtPhone.text?.hasPrefix("03") )!) {
            showAlertWithMessag(with: "Please enter Phone Number", completionHandler: {
            })
            return false
            
        }
        return true
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
    
    
    func isValidEmail(testStr:String) -> Bool {
        // print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
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
