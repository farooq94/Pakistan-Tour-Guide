import UIKit

class ImageViewCustom: UIImageView {
    
    
   // @IBOutlet weak var lblHeader: UILabel!
    
    override func awakeFromNib() {
        //    self.titleLabel.textColor = UIColor.()
     
        
       // var image: UIImage = UIImage(named: "imageName")
        self.layer.borderWidth = 1.0
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.cornerRadius = self.frame.size.width/2
        self.clipsToBounds = true
        
        
        //self.backgroundColor = UIColor.gray
    }
    
    
    
}
