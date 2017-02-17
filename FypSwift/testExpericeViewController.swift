//
//  testExpericeViewController.swift
//  FypSwift
//
//  Created by MBP on 15/02/2017.
//  Copyright © 2017 Nano Degree. All rights reserved.
//

import UIKit

class testExpericeViewController: UIViewController,OpalImagePickerControllerDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UITextViewDelegate {
    @IBOutlet weak var MyCollectionView: UICollectionView!
    @IBOutlet weak var text_view: UITextView!
    @IBOutlet weak var UploadBtn: UIButton!
    @IBOutlet weak var mycollectionview: UICollectionView!
    
    var selectedImage = [UIImage]()
    
     let imagePicker = OpalImagePickerController()
   
    
    @IBAction func ClickMe(_ sender: AnyObject) {
       
        
        
        
        //Change color of selection overlay to white
        imagePicker.selectionTintColor = UIColor.white.withAlphaComponent(0.7)
        
        //Change color of image tint to black
        imagePicker.selectionImageTintColor = UIColor.black
        
        //Change image to X rather than checkmark
        imagePicker.selectionImage = #imageLiteral(resourceName: "map-marker")
        
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
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before avigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


}
