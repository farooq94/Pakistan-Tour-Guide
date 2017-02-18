//
//  ProfileViewController.swift
//  FypSwift
//
//  Created by Nano Degree on 11/02/2017.
//  Copyright © 2017 Nano Degree. All rights reserved.
//

import UIKit

class ProfileViewController: BaseClassViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak var fourthimage: UIImageView!
    @IBOutlet weak var thirdimage: UIImageView!
    @IBOutlet weak var secondimage: UIImageView!
    @IBOutlet weak var firstimage: UIImageView!
    @IBOutlet weak var profileimage: UIImageView!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var number: UITextField!
    
     @IBOutlet weak var btnClick: UIButton!
    @IBOutlet weak var btnImagePicker: UIButton!
    
     let imagePicker = UIImagePickerController()
    
    var pre = UserDefaults.standard
    
    var dic = Dictionary<String,AnyObject>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Condition check which form is load
        
        if firstimage != nil {
            
            
            firstimage.image = #imageLiteral(resourceName: "farooq")
            secondimage.image = #imageLiteral(resourceName: "zee")
            thirdimage.image = #imageLiteral(resourceName: "baig")
            fourthimage.image = #imageLiteral(resourceName: "ustaad")
        }
        else
        {
            // Edit profile page is appear on screen
            
            
            imagePicker.delegate = self
            imagePicker.allowsEditing = false
            imagePicker.sourceType = .photoLibrary
            
            btnClick.addTarget(self, action: #selector(self.btnClick(sender:)), for: .touchUpInside)
            dic = pre.object(forKey:"UserData") as! Dictionary<String, AnyObject>
            
            
            btnImagePicker.addTarget(self, action: #selector(selectProfile(sender:)), for: .touchUpInside)
        }
        
       
        
        
        
        //name.isUserInteractionEnabled = false
        //number.isUserInteractionEnabled = false
        //  email.isUserInteractionEnabled = false
        //password.isUserInteractionEnabled = false
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if name != nil  {
            
            email.isUserInteractionEnabled = false
            email.alpha = 0.7
            
            name.text = dic["UserName"] as? String
            email.text = dic["Email"] as? String
            number.text = dic["Phone"] as? String
            
            loadImage(name: "ProfilePic_\(dic["userID"] as! Int)")
            
        }
        
    }
    
    func btnClick(sender: AnyObject)
    {
        
        var diclocal = Dictionary<String, Any>()
        
        diclocal["UserName"] = name.text
        diclocal["Phone"] = number.text
        
        if password.text == "" {
            diclocal["Password"] = dic["Password"] as? String
        }
        else
        {
            diclocal["Password"] = password.text
        }
        
        
        diclocal["Email"] =  dic["Email"]
        diclocal["userID"] =  dic["userID"]
        
        dic = diclocal as Dictionary<String, AnyObject>
        
        
        pre.set(dic, forKey:"UserData")
        
        print("user object is \( pre.object(forKey:"UserData"))")
        
        
        var arr : Array = pre.object(forKey: "appUsers") as! Array <Dictionary<String,AnyObject>>
        
        let index = arr.index{ $0["userID"] as! Int ==  diclocal["userID"] as! Int }
        
        
        
        
        if  index != nil {
            arr.remove(at: index!)
            arr.append(dic)
            pre.set(arr, forKey: "appUsers")
            
            showAlertWithMessag(with: "Profile update Successfully", completionHandler: {
                
            })
            
        }
        
    }
    
   
    
    @IBOutlet var profileView: UIView!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    // MARK: - UIImagePickerControllerDelegate Methods
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            profileimage.contentMode = .scaleAspectFit
            profileimage.image = pickedImage
            
            let userID = "ProfilePic_" + "\(dic["userID"] as! Int)"
            saveImageDocumentDirectory(Image: pickedImage, withName: userID)
        }
         dismiss(animated: true, completion: nil)
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }

    func selectProfile(sender: AnyObject) {
        
         present(imagePicker, animated: true, completion: nil)
        
    }
    
    
    
    func saveImageDocumentDirectory(Image : UIImage, withName name:String){
        let fileManager = FileManager.default
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(name)
        let image = Image
        print(paths)
        let imageData = UIImageJPEGRepresentation(image, 0.5)
        print("value Store \(fileManager.createFile(atPath: paths as String, contents: imageData, attributes: nil))")
    }
    
    
    func loadImage(name : String)
    {
        let data = FileManager.default.contents((atPath: (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appending("/\(name)")))
        
        if data != nil
        {
          profileimage.image = UIImage(data: data!)
        }
        else
        {
          //  profileimage.image = profile
        }
        
        
    
        
        
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
