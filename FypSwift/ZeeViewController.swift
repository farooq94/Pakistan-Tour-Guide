//
//  ViewController.swift
//  tour
//
//  Created by Nano Degree on 09/01/2017.
//  Copyright © 2017 HCD. All rights reserved.
//

import UIKit

class ZeeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var mycollectionview: UICollectionView!
    
    struct ceoObject {
        
        var vcbtn: String
        var myimageview: UIImage
        
        
    }
    var ceoArray: [ceoObject] = []
    

    
    //var arrCities = [Any]()
    var selectedCityID : Int = 0
    
    
    
    
//    @IBAction func btnTap(_ sender: AnyObject) {
//        
//        var btn : UIButton = sender as! UIButton
//        
//        selectedCityID = sender.tag
//        self.performSegue(withIdentifier: "GoToDetail", sender: self)
//        
//    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        ceoArray.append(ceoObject(vcbtn:"SINDH", myimageview: UIImage(named: "sindh1")!) )
        ceoArray.append(ceoObject(vcbtn:"PUNJAB", myimageview: UIImage(named: "punjab")!) )
        ceoArray.append(ceoObject(vcbtn:"BALOCHISTAN", myimageview: UIImage(named: "balochistan")!) )
        ceoArray.append(ceoObject(vcbtn:"KPK", myimageview: UIImage(named: "khyber pakhtunkhwa")!) )
        ceoArray.append(ceoObject(vcbtn:"GILGIT/BALTISTAN", myimageview: UIImage(named: "gilgit")!) )
        ceoArray.append(ceoObject(vcbtn:"KASHMIR", myimageview: UIImage(named: "kashmir2")!) )
        
        
        
        self.mycollectionview.delegate = self
        self.mycollectionview.dataSource = self
        
        //arrCities = ["SINDH","PUNJAB","BALOCHISTAN","KPK","GILGIT/BALTISTAN","KASHMIR"]
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ceoArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : galleryCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectioncell", for: indexPath) as! galleryCollectionViewCell
        
//       cell.vcbtn.setTitle(ceoArray[indexPath.row].vcbtn as String, for: .normal)
        
        cell.vcbtn.tag = indexPath.row
        
        cell.vcbtn.addTarget(self, action: #selector(gotoDetail(sender:)), for: .touchUpInside)
        
        cell.myimageview.image = ceoArray[indexPath.item].myimageview

        return cell
        
        
    }
        
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if segue.identifier == "GoToDetail"
        {
            let VCObj : secondViewController = segue.destination as! secondViewController
            
            VCObj.selectedCID = selectedCityID
            VCObj.CityTitle = ceoArray[selectedCityID].vcbtn
            
            let pre  = UserDefaults.standard
            
            pre.set(ceoArray[selectedCityID].vcbtn, forKey: "SelectedID")
        }
        
        
        
        
        
    }
    
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
//    {
//        return arrCities.count
//    }
//    
//    
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
//    {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        
//        
//        
//        cell.textLabel?.text =  "\(indexPath.row). " + String(describing: arrCities[indexPath.row] as! String)
//        
//    
//       // cell.textLabel?.textAlignment = NSTextAlignment.center
//        
//        if indexPath.row % 2 == 0
//        {
//            cell.textLabel?.backgroundColor = UIColor.brown
//            
//        }
//        else
//        {
//            cell.textLabel?.backgroundColor = UIColor.white
//            
//        }
//            
//        
//        
//        
//        return cell;
//    }
//    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        selectedCityID = indexPath.row
        
        self.performSegue(withIdentifier: "GoToDetail", sender: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.size.width, height: collectionView.bounds.size.height)
    }
    
    
    
    func gotoDetail(sender: AnyObject) {
        
        let btn = sender as! UIButton
        
        selectedCityID = btn.tag
        
        self.performSegue(withIdentifier: "GoToDetail", sender: self)
        
    }
    
    
}

