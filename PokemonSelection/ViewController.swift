import UIKit

class ViewController: LifeCyclePrintingViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedPokemonStack.isHidden = true
    }
    
    @IBOutlet weak var selectYourPokemonButton: UIButton!
    
    @IBOutlet weak var showEmFirstButton: UIButton!
    
    @IBOutlet weak var selectedPokemonStack: UIStackView!
    
    @IBOutlet weak var selectedPokemonImageView: UIImageView!
    
    @IBOutlet weak var selectedPokemonLabel: UILabel!
    
    
    @IBAction func showEmFirstButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let tabBarController = storyboard.instantiateViewController(withIdentifier: "TabBarViewController")
        self.present(tabBarController, animated: true, completion: nil)

    }
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let selectionScreenViewController = storyboard.instantiateViewController(withIdentifier: "selectionScreenViewController") as! SelectionScreenViewController
        selectionScreenViewController.delegate = self
        self.present(selectionScreenViewController, animated: true, completion: nil)
    }
    
    @IBAction func changeMyMindButtonTapped(_ sender: UIButton) {
//        selectButtonTapped(selectYourPokemonButton)
        switchUI()
    }
    
    private func switchUI() {
        selectYourPokemonButton.isHidden = !selectYourPokemonButton.isHidden
        showEmFirstButton.isHidden = !showEmFirstButton.isHidden
        selectedPokemonStack.isHidden = !selectedPokemonStack.isHidden
    }
}



extension ViewController: SelectionScreenDelegate {
    
    func setImage(image: UIImageView, andLabel labelText: String) {
        selectedPokemonImageView.image = image.image
        selectedPokemonLabel.text = labelText
        switchUI()
    }
    
}
