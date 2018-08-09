import UIKit

class PokemonTabsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        tabBarController?.dismiss(animated: true, completion: nil)
    }

}
