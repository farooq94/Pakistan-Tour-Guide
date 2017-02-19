//
//  thirdViewController.swift
//  tour
//
//  Created by Nano Degree on 10/01/2017.
//  Copyright © 2017 HCD. All rights reserved.
//

import UIKit

class thirdViewController: BaseClassViewController,CustomHeaderdelegate {
   
    @IBOutlet weak var hotels: UITextView!
   
    @IBOutlet weak var convnc: UITextView!
    @IBOutlet weak var desc: UITextView!
    @IBOutlet weak var imageview: UIImageView!
    
    @IBOutlet weak var lbltext: UILabel!
    
    @IBOutlet weak var btnViewDetail: UIButton!
    
    
    var pre  = UserDefaults.standard
    
    var lati : Float!
    var longi : Float!
    var image : UIImage!
    var hotelName : String!
    var hotelDesc : String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        btnViewDetail.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        convnc.alpha = 0.0
        desc.alpha = 0.0
        hotels.alpha = 0.0
        imageview.alpha = 0.0
        
        _topBar.lblTtitle.text = hotelName
        delegate = self
        
        if hotelDesc != nil {
            pre.set(hotelDesc, forKey: "hotelDesc")
       
        }
        else
        {
            hotelDesc = pre.object(forKey: "hotelDesc") as! String
        }
        
        
        
        
        
        btnViewDetail.addTarget(self, action:#selector(self.btnClick(sender:)) , for: .touchUpInside)
        
    //hotels.isUserInteractionEnabled = false
      //  convnc.isUserInteractionEnabled = false
        switch hotelName
        {
        case "KARACHI":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
                break;
        case "HYDERABAD":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "THATTA":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "GORAK HILLS":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "MINAR-E-PAKISTAN":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "BADSHAHI MOSQUE":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "WAGAH BORDER":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "MUREE":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "CHITRAL":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "MALAM JABBA":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "SAIF-UL-MALOOK":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "DAMAN-E-KOH":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
                break;
        case "GAWADER":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
                    break;
        case "HANNA LAKE":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "QUETTA":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "ZIARAT":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "DEOSAI":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "FAIRY MEADOWS":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "HUNZA":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "K2":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "KEL":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "MUZAFARABAD":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "SHARDAH":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "ASTOLA ISLAND":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "KUND MALEER":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "MOOLA CHOTOK":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "PATRIATA":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "ARANG KEL":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "CHITTA KATHA LAKE":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "JAGRAN":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "KASHMIR ABSHAAR":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "NOORI TOP":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "RATTI GALI LAKE":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "ANSO LAKE":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "AYUBIA":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "BABUSAR TOP":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "BAHRAIN":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "DUDIPATSAR LAKE":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "KAGHAN":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "NARAN":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "SHOGRAN":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "KIWAI":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "SIRI PAYE":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "MAKRA PEAK":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "WHITE PALACE":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "KALAM":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "LALAZAR":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "LULUSAR LAKE":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "MAHUDAND LAKE":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "MALIKA PARBAT":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "NATHIA GALI":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "SAJIKOT WATER FALL":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "ALTIT FORT":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "BALTIT FORT":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "KHAPLU FORT":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "SHIGAR FORT":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "SHIGAR VALLEY":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "KHUNJERA PASS":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "ATTABAD LAKE":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "NALTAR":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "ASTORE":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "RAMA LAKE":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "MANTHOKA WATERFALL":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "NANGA PARBAT":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "RAKAPOSHI":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "SATPARA LAKE":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "SHANDUR TOP":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "PASSU CONES":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "SHEOSER LAKE":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "SHANGRILA RESORT":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "UPPER KACHURA LAKE":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "SHIMSHAL":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
        case "SKARDU":
            hotels.text = "HOTEL: \n  Farooq  03463008534\n Zeeshan     03422703970"
            convnc.text = "TRANSPORT: \n  Farooq  03463008534\n Zeeshan     03422703970"
            break;
            
        default:
            print("")
        }
        imageview.image = image
        desc.text = hotelDesc

        
       //desc.isUserInteractionEnabled = false
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        Animate.animate(view: btnViewDetail, withLargeDuration: 0.5, withSmallDuration: 0.20)
        
        Animate.animateWithALpha(view: convnc, Duration: 0.5)
        Animate.animateWithALpha(view: hotels, Duration: 0.5)
        Animate.animateWithALpha(view: desc, Duration: 0.5)
        Animate.animateWithALpha(view: imageview, Duration: 0.5)
        
    }
    
    
    func btnClick(sender: AnyObject) {
        
        self.performSegue(withIdentifier: "gotoLocationDetail", sender: self)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    func headerBackBtnClick() {
        
        self.performSegue(withIdentifier: "backToProFromCity", sender: self)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "gotoLocationDetail" {
            
            let obj :  LocationCollectionViewCell = segue.destination as! LocationCollectionViewCell
            
            obj.lat = lati
            obj.long = longi
            obj.name = hotelName
            obj.Image = image
        }
        
        
        
    }
 

}
