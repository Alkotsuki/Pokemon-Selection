import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var selectButton: UIButton!
    
    var delegate: SelectionScreenDelegate?
    
    var pokemon: String? {
        didSet {
            refreshUI()
        }
    }
    
    func refreshUI() {
        loadViewIfNeeded()
        if pokemon != nil {
            pokemonImageView.image = UIImage(named: pokemon!)
            selectButton.setTitle("Select \(pokemon!)", for: .normal)
        }
    }
    
    @IBAction func selectButtonTapped(_ sender: Any) {
        switch pokemon {
            
        case "Pikachu":
            delegate?.setImage(image: UIImage(named: pokemon!)!, andLabel: "You've chosen Pikachu!")
        case "Charmander":
            delegate?.setImage(image: UIImage(named: pokemon!)!, andLabel: "You've chosen Charmander!")
        case "Mewtwo":
            delegate?.setImage(image: UIImage(named: pokemon!)!, andLabel: "You've chosen Mewtwo!")
        default: break
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
}

extension DetailViewController: SplitViewSelectionDelegate {
    func pokemonSelected(newPokemon: String) {
        pokemon = newPokemon
    }
    
}
