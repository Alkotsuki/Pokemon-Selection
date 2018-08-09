import UIKit

class SelectionScreenViewController: LifeCyclePrintingViewController {
    
    var delegate: SelectionScreenDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pikachuTapGestureRecogniser = UITapGestureRecognizer(target: self,
                                                                 action: #selector(imageTapped(tapGestureRecogniser:)))
        pikachuImageView.addGestureRecognizer(pikachuTapGestureRecogniser)
        pikachuImageView.isUserInteractionEnabled = true
        
        let charmanderTapGestureRecogniser = UITapGestureRecognizer(target: self,
                                                                    action: #selector(imageTapped(tapGestureRecogniser:)))
        charmanderImageView.addGestureRecognizer(charmanderTapGestureRecogniser)
        charmanderImageView.isUserInteractionEnabled = true
        
        let mewtwoTapGestureRecogniser = UITapGestureRecognizer(target: self,
                                                                action: #selector(imageTapped(tapGestureRecogniser:)))
        mewtwoImageView.addGestureRecognizer(mewtwoTapGestureRecogniser)
        mewtwoImageView.isUserInteractionEnabled = true
    }
    
    @IBOutlet weak var pikachuImageView: UIImageView!
    @IBOutlet weak var charmanderImageView: UIImageView!
    @IBOutlet weak var mewtwoImageView: UIImageView!
    
    
    @objc func imageTapped(tapGestureRecogniser: UITapGestureRecognizer) {
        
        let tappedImage = tapGestureRecogniser.view as! UIImageView
        
        switch tappedImage.image {
            
        case UIImage(named: "Pikachu"):
        delegate?.setImage(image: tappedImage, andLabel: "You've chosen Pikachu!")
        case UIImage(named: "Charmander"):
        delegate?.setImage(image: tappedImage, andLabel: "You've chosen Charmander!")
        case UIImage(named: "Mewtwo"):
        delegate?.setImage(image: tappedImage, andLabel: "You've chosen Mewtwo!")
        default: break
            
        }

        self.dismiss(animated: true, completion: nil)
        
    }
    
    deinit {
                print("Second view controller deinited")
    }

}
