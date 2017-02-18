//
//  budgetingViewController.swift
//  tour
//
//  Created by Nano Degree on 16/02/2017.
//  Copyright © 2017 HCD. All rights reserved.
//

import UIKit

class budgetingViewController: BaseClassViewController,UITableViewDataSource,UITableViewDelegate {
////////////////
    @IBOutlet weak var TranspView: UIView!
    @IBOutlet weak var bgtableview: UITableView!
    @IBOutlet weak var bgbtn: UIButton!
    @IBOutlet weak var totalexplbl: UILabel!
    @IBOutlet weak var foodlbl: UILabel!
    @IBOutlet weak var conlbl: UILabel!
    @IBOutlet weak var hotellbl: UILabel!
    
    
    var totalWetg : Int = 0
    
    struct tableobj {
        
        var pointname: String
        var wetg: Int
        
        
        
    }
    var tableArray: [tableobj] = []
    
    
    var selectedIndex : NSMutableArray = []
    
    
    var total : Float = 0
    var w : Int = 0
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        animateTable()
    }
    
    func animateTable() {
        bgtableview.reloadData()
        
        let cells = bgtableview.visibleCells
        let tableHeight: CGFloat = bgtableview.bounds.size.height
        
        for i in cells {
            let cell: UITableViewCell = i as UITableViewCell
            cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
        }
        
        var index = 0
        
        for a in cells {
            let cell: UITableViewCell = a as UITableViewCell
            UIView.animate(withDuration: 1.5, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0);
                }, completion: nil)
            
            index += 1
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        bgbtn.addTarget(self, action: #selector(self.btnClick(sender:)), for: .touchUpInside)
        

        tableArray.append(tableobj(pointname: "Karachi", wetg: 5000) )
        tableArray.append(tableobj(pointname: "Hyderabad", wetg: 6000) )
        tableArray.append(tableobj(pointname: "Thatta", wetg: 5000) )
        tableArray.append(tableobj(pointname: "Gorak Hills", wetg: 15000) )
        tableArray.append(tableobj(pointname: "Lahore", wetg: 5000) )
        tableArray.append(tableobj(pointname: "Muree", wetg: 8000) )
        tableArray.append(tableobj(pointname: "Islamabad", wetg: 6000) )
        tableArray.append(tableobj(pointname: "shardah", wetg: 8000) )
        tableArray.append(tableobj(pointname: "muzafarabad", wetg: 3000) )
        tableArray.append(tableobj(pointname: "Chitta Katha Lake", wetg: 9000) )
        tableArray.append(tableobj(pointname: "Kashmir Abshaar,Neelum Point", wetg: 2000) )
        tableArray.append(tableobj(pointname: "kutton", wetg: 5000) )
        tableArray.append(tableobj(pointname: "Ratti Gali Lake", wetg: 5000) )
        tableArray.append(tableobj(pointname: "Nori Top", wetg: 5000) )
        tableArray.append(tableobj(pointname: "Neelum Valley", wetg: 2000) )
        tableArray.append(tableobj(pointname: "Astola Island", wetg: 8000) )
        tableArray.append(tableobj(pointname: "Hanna Lake", wetg: 4000) )
        tableArray.append(tableobj(pointname: "Quetta", wetg: 10000) )
        tableArray.append(tableobj(pointname: "Moola Chatook", wetg: 3000) )
        tableArray.append(tableobj(pointname: "Ziarat", wetg: 5000) )
        tableArray.append(tableobj(pointname: "Kund Maleer", wetg: 10000) )
        tableArray.append(tableobj(pointname: "Gawader", wetg: 13000) )
        tableArray.append(tableobj(pointname: "Hunza", wetg: 2000) )
        tableArray.append(tableobj(pointname: "Khunjerab Pass", wetg: 3000) )
        tableArray.append(tableobj(pointname: "Naltar Valley", wetg: 8000) )
        tableArray.append(tableobj(pointname: "Skardu", wetg: 10000) )
        tableArray.append(tableobj(pointname: "Shigar Valley,Shigar Fort", wetg: 2000) )
        tableArray.append(tableobj(pointname: "Manthoka Water Fall", wetg: 2000) )
        tableArray.append(tableobj(pointname: "Khaplu Fort", wetg: 2000) )
        tableArray.append(tableobj(pointname: "Deosai,Sheoser Lake", wetg: 6000) )
        tableArray.append(tableobj(pointname: "Astore Valley", wetg: 2000) )
        tableArray.append(tableobj(pointname: "Rama Lake", wetg: 3000) )
        tableArray.append(tableobj(pointname: "Attabad Lake,Passu cones", wetg: 2000) )
        tableArray.append(tableobj(pointname: "K2", wetg: 150000) )
        tableArray.append(tableobj(pointname: "Fairy Meadows,Nanga Parbat", wetg: 15000) )
        tableArray.append(tableobj(pointname: "Raka Poshi", wetg: 2000) )
        tableArray.append(tableobj(pointname: "Satpara Lake", wetg: 2000) )
        tableArray.append(tableobj(pointname: "Shangrila Resort,upper kachura", wetg: 5000) )
        tableArray.append(tableobj(pointname: "Ayubia,Nathia Gali", wetg: 2000) )
        tableArray.append(tableobj(pointname: "Balakot", wetg: 5000))
        tableArray.append(tableobj(pointname: "Kaghan,Kiwai", wetg: 3000) )
        tableArray.append(tableobj(pointname: "Naran", wetg: 2000) )
        tableArray.append(tableobj(pointname: "Shogran,Siri paye", wetg: 5000) )
        tableArray.append(tableobj(pointname: "Babusar Top", wetg: 7000) )
        tableArray.append(tableobj(pointname: "Sawat", wetg: 10000) )
        tableArray.append(tableobj(pointname: "White Palace", wetg: 1000) )
        tableArray.append(tableobj(pointname: "Bahrain", wetg: 2000) )
        tableArray.append(tableobj(pointname: "Malam Jabba", wetg: 3000) )
        tableArray.append(tableobj(pointname: "Kalam", wetg: 3000) )
        tableArray.append(tableobj(pointname: "Lalazar", wetg: 2000) )
        tableArray.append(tableobj(pointname: "Lulusar Lake", wetg: 3000) )
        tableArray.append(tableobj(pointname: "Mahudand Lake", wetg: 2000) )
        tableArray.append(tableobj(pointname: "Sajikot Waterfall", wetg: 2000) )
        tableArray.append(tableobj(pointname: "Malika Parbat", wetg: 3000) )
        tableArray.append(tableobj(pointname: "Saiful Malook", wetg: 5000) )
        
        
        
        
        
        
//        switch bgtextfield.text! as String {
//        
//        case "karachi":
//            w = 4000
//            total = total + w
//            break;
//            
//        case "hyderabad":
//            w = 4000
//            total = total + w
//            break;
//            
//        case "thatta":
//            w = 4000
//            total = total + w
//            break;
//            
//        case "gorak hills":
//            w = 4000
//            total = total + w
//            break;
//            
//        case "minare pakistan":
//            w = 4000
//            total = total + w
//            break;
//            
//        case "badshahi mosque":
//            w = 4000
//            total = total + w
//            break;
//            
//        case "muree":
//            w = 4000
//            total = total + w
//            break;
//            
//        case "patriata":
//            w = 4000
//            total = total + w
//            break;
//        case "wagah border":
//            w = 4000
//            total = total + w
//            break;
//            
//        default:
//              print("wrong place")
//        }
//        
//        
//        hotellbl.text = "/((total * 30)/100)"
//        
//        conlbl.text = "/((total * 50)/100)"
//        
//        foodlbl.text = "/((total * 20)/100)"
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func btnClick(sender: AnyObject) {
        
        
               total = callCulated()
        
        print("The value of total is \(total)")
        
        
        
                hotellbl.text = "\((total * 0.2))"
        
                conlbl.text = "\((total * 0.5))"
        
                foodlbl.text = "\((total * 0.3))"
        
                totalexplbl.text = "\(total)"
    }
    
    
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
     
        
        if tableView.cellForRow(at: indexPath)?.accessoryType != .checkmark  {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            
            selectedIndex.add(indexPath.row)
            
        }
        else
        {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
            
     
            
            selectedIndex.remove(indexPath.row)
        }
        
        
        
        
        
        
        return indexPath
    }
    
    
    

    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
        {
            return tableArray.count
        }
    
    
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "tablecell", for: indexPath)
    
    
    
            cell.textLabel?.text =  "\(indexPath.row). " + String(describing: tableArray[indexPath.row].pointname)
    
    
           // cell.textLabel?.textAlignment = NSTextAlignment.center
    //            if indexPath.row % 2 == 0
//            {
//                cell.textLabel?.backgroundColor = UIColor.brown
//    
//            }
//            else
//            {
//                cell.textLabel?.backgroundColor = UIColor.white
//    
//            }
            
            
            return cell;
        }
    
    
    func callCulated() -> Float {
        
        totalWetg = 0
        
        
        for temp in selectedIndex {
            
            let obj = tableArray[temp as! Int]
            
            totalWetg = totalWetg + obj.wetg
        }
        
        return Float(totalWetg)
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
