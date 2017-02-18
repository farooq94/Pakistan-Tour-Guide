//
//  UserPhotosViewController.swift
//  FypSwift
//
//  Created by Nano Degree on 18/02/2017.
//  Copyright © 2017 Nano Degree. All rights reserved.
//

import UIKit

class UserPhotosViewController: BaseClassViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var colView: UICollectionView!
 
    var pre = UserDefaults.standard
    
    
    var userImages = [UIImage]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colView.delegate = self
        colView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        var userID = pre.object(forKey:"userID") as! Int
        
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let url = NSURL(fileURLWithPath: path)
        let filePath = url.path
        do {
            let files = try  FileManager.default.contentsOfDirectory(atPath: filePath!)
            
            
            //  ""
            
            
            for image in files{
                
                if image.contains("ID-\(userID)_") {
                    
                    let data = FileManager.default.contents((atPath: (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appending("/\(image)")))
                    let image = UIImage(data: data!)
                    
                    userImages.append(image!)
                    print("image size is \(image?.size)")
                }
            }
            
            if  userImages.count > 0{
                colView.reloadData()
            }
            
            
        } catch  {
            print("test")
        }
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  userImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = colView.dequeueReusableCell(withReuseIdentifier: "upCell", for: indexPath) as! myimagecell
        //cell.username.text = ceoArray[indexPath.item].username
        cell.myimageview.image = userImages[indexPath.row] 
        
        return cell
    }

    
    
    // Do any additional setup after loading the view.
}



    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


