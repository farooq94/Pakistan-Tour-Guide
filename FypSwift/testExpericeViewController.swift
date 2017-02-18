//
//  testExpericeViewController.swift
//  FypSwift
//
//  Created by MBP on 15/02/2017.
//  Copyright © 2017 Nano Degree. All rights reserved.
//

import UIKit
import GoogleMaps

class testExpericeViewController: BaseClassViewController,OpalImagePickerControllerDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UITextViewDelegate,CustomHeaderdelegate {
    @IBOutlet weak var MyCollectionView: UICollectionView!
    @IBOutlet weak var text_view: UITextView!
    @IBOutlet weak var UploadBtn: UIButton!
    @IBOutlet weak var mycollectionview: UICollectionView!
    
    
    var marker = GMSMarker.init()
    
    var selectedImage = [UIImage]()
    
     let imagePicker = OpalImagePickerController()
   
    
    @IBAction func ClickMe(_ sender: AnyObject) {
       
        
        
        
        //Change color of selection overlay to white
        imagePicker.selectionTintColor = UIColor.white.withAlphaComponent(0.7)
        
        //Change color of image tint to black
        imagePicker.selectionImageTintColor = UIColor.black
        
        //Change image to X rather than checkmark
        imagePicker.selectionImage = #imageLiteral(resourceName: "checkmark")
        
        imagePicker.imagePickerDelegate = self
        present(imagePicker, animated: true, completion: nil)
        
        
    }
    @IBAction func btnClick(_ sender: Any) {
        
        
        
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        text_view.isHidden = true
        UploadBtn.isHidden = true
        MyCollectionView.isHidden = true
        
        imagePicker.imagePickerDelegate = self
        
        MyCollectionView.dataSource = self
        MyCollectionView.delegate = self
        
        _topBar.lblTtitle.text = "Experience"
        delegate = self
        
        UploadBtn.addTarget(self, action: #selector(self.btnClick(sender:)), for: .touchUpInside)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectedImage.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : myimagecell = collectionView.dequeueReusableCell(withReuseIdentifier: "mycell", for: indexPath) as! myimagecell
        
        
        cell.myimageview.image = selectedImage[indexPath.item] as UIImage
        
        return cell
        
        
    }
    
    
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        
    }
    
    
    func imagePicker(_ picker: OpalImagePickerController, didFinishPickingImages images: [UIImage])
    {
        
        text_view.isHidden = false
        UploadBtn.isHidden = false
        MyCollectionView.isHidden = false
        
        picker.dismiss(animated: true) { 
            
            self.selectedImage = images
            self.MyCollectionView.reloadData()
             }
    }
    public func textViewDidBeginEditing(_ textView: UITextView){
    
        if text_view.text == "Add Experiences here!!!"{
        
         text_view.text = ""
        }
        
    }
    
    public func textViewDidEndEditing(_ textView: UITextView){
    
        if text_view.text == ""
        {
            
            text_view.text = "Add Experiences here!!!"
        }
    }
    
    
    public func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text_view.text == "\n" {
        text_view.resignFirstResponder()
            return false
        }
        return true
        
    
    }

    
    
    
//    - (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
//    
//    if([text isEqualToString:@"\n"]) {
//    [textView resignFirstResponder];
//    return NO;
////    }
//    
//    return YES;
//    }
    
    
  
    
    func imagePickerDidCancel(_ picker: OpalImagePickerController)
    {
        print("Cancel Print")
        
    }
    
    
    func btnClick(sender: AnyObject)
    {
        let userINfo = marker.userData as! Dictionary<String,AnyObject>
        
        let pre = UserDefaults.standard
        
        let userID = pre.object(forKey: "userID") as! Int
        
        let markerTag = userINfo["Tag"] as! Int
        
        var imagePath = NSDate().description
        imagePath = imagePath.replacingOccurrences(of: " ", with: "")
        
        for image in selectedImage {
            
            saveImageDocumentDirectory(Image: image, withName: "Tag-\(markerTag)_" + "ID-\(userID)_" + "Date-\(imagePath)" + ".png")
            
        }
        
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let url = NSURL(fileURLWithPath: path)
        let filePath = url.path
        do {
            let files = try  FileManager.default.contentsOfDirectory(atPath: filePath!)
            

            for image in files{
                let data = FileManager.default.contents((atPath: (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appending("/\(image)")))
                let image = UIImage(data: data!)
                
                print("image size is \(image?.size)")
                
            }
            
            
        } catch  {
            print("test")
        }
        
        
       

        // Get user previous marker
   
        
        let tempImage = UIImage.init(named: userINfo["ImageName"] as! String)
        
        let customMarker = markerCC.init(name: marker.title! as NSString, withsnippit: marker.snippet!, withiconImage: marker.icon!, withimage: tempImage!, withlat: marker.position.latitude, withlong: marker.position.longitude, withuserInfo: marker.userData as! Dictionary<String, Any>)
        
        let userSpecifickey = "selectedArray" + "_\(userID)"
        
        if (pre.object(forKey: userSpecifickey) != nil)
        {
            if let data = pre.object(forKey: userSpecifickey) as? NSData
            {
                // Get Array from Data
                 var _mySavedList = NSKeyedUnarchiver.unarchiveObject(with: data as Data) as! [markerCC]
                _mySavedList.append(customMarker)
                
                //save back to data
                let updateddata = NSKeyedArchiver.archivedData(withRootObject: _mySavedList)
                pre.set(updateddata, forKey: userSpecifickey)
            }
        }
        else
        {
            var arraytemp = [markerCC]()
            arraytemp.append(customMarker)
            
    
            let data = NSKeyedArchiver.archivedData(withRootObject: arraytemp)
      
            pre.set(data, forKey: userSpecifickey)
            
        }
        
        self.performSegue(withIdentifier: "backToMap", sender: self)

    }
    
    func saveImageDocumentDirectory(Image : UIImage, withName name:String){
        let fileManager = FileManager.default
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(name)
        let image = Image
        print(paths)
        let imageData = UIImageJPEGRepresentation(image, 0.5)
        print("value Store \(fileManager.createFile(atPath: paths as String, contents: imageData, attributes: nil))")
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before avigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    

    
    func headerBackBtnClick() {
        
        self.performSegue(withIdentifier: "backToMap", sender: self)
    }


}


class markerCC: NSObject, NSCoding {
    
    let name: NSString
    let snippit: String
    let iconImage : UIImage
    let image : UIImage
    let lat : Double
    let long : Double
    let userInfo : Dictionary<String, Any>!
    
    
    init(name: NSString, withsnippit snippit: String, withiconImage iconImage: UIImage, withimage image: UIImage, withlat lat: Double, withlong long: Double, withuserInfo userInfo: Dictionary<String, Any>)
    {
        self.name = name
        self.snippit = snippit
        self.iconImage = iconImage
        self.image = image
        self.lat = lat
        self.long = long
        self.userInfo = userInfo
    }
    required init(coder decoder: NSCoder) {
        
        
        self.name = decoder.decodeObject(forKey: "name")  as! NSString? ?? ""
        self.snippit = decoder.decodeObject(forKey: "snippit") as? String ?? ""
        self.iconImage = (decoder.decodeObject(forKey: "iconImage") as? UIImage ?? nil)!
        self.image =  (decoder.decodeObject(forKey: "iconImage") as? UIImage ??  nil)!
        self.lat =  decoder.decodeDouble(forKey: "lat")
        self.long = decoder.decodeDouble(forKey: "long")
        self.userInfo = decoder.decodeObject(forKey: "userInfo") as? Dictionary<String, Any> ?? nil
        
        
        
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(snippit, forKey: "snippit")
        coder.encode(iconImage, forKey: "iconImage")
        coder.encode(image, forKey: "image")
        coder.encode(lat, forKey: "lat")
        coder.encode(long, forKey: "long")
        coder.encode(userInfo, forKey: "userInfo")
        
    }
    
    
}

