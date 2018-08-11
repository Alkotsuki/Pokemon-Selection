import UIKit

class FirstViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedPokemonStack.isHidden = true
    }
    
    @IBOutlet weak var selectYourPokemonButton: UIButton!
    
    @IBOutlet weak var selectViaSplitViewButton: UIButton!
    
    @IBOutlet weak var selectedPokemonStack: UIStackView!
    
    @IBOutlet weak var selectedPokemonImageView: UIImageView!
    
    @IBOutlet weak var selectedPokemonLabel: UILabel!

    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let selectionScreenViewController = storyboard.instantiateViewController(withIdentifier: "SelectionScreenViewController") as! SelectionScreenViewController
        selectionScreenViewController.delegate = self
        self.present(selectionScreenViewController, animated: true, completion: nil)
    }
    
    @IBAction func selectViaSplitView(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let splitViewController = storyboard.instantiateViewController(withIdentifier: "SplitViewController") as? UISplitViewController,
        let navigationController = splitViewController.viewControllers.first as? UINavigationController,
        let masterViewController = navigationController.topViewController as? MasterSplitViewController,
        let detailViewController = splitViewController.viewControllers.last as? DetailViewController

        else {fatalError()}
        
        masterViewController.delegate = detailViewController
        
        detailViewController.delegate = self
        detailViewController.pokemon = "Pikachu"
        self.present(splitViewController, animated: true, completion: nil)
    }
    
    @IBAction func changeMyMindButtonTapped(_ sender: UIButton) {
        //        selectButtonTapped(selectYourPokemonButton)
        switchUI()
    }
    
    private func switchUI() {
        selectYourPokemonButton.isHidden = !selectYourPokemonButton.isHidden
        selectViaSplitViewButton.isHidden = !selectViaSplitViewButton.isHidden
        selectedPokemonStack.isHidden = !selectedPokemonStack.isHidden
    }
}



extension FirstViewController: SelectionScreenDelegate {
 
    func setImage(image: UIImage, andLabel labelText: String) {
        selectedPokemonImageView.image = image
        selectedPokemonLabel.text = labelText
        switchUI()
    }
    
}
