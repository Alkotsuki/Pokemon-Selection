import UIKit

class MasterSplitViewController: UITableViewController {
    
    var pokemons = ["Pikachu", "Charmander", "Mewtwo"]
    var delegate: SplitViewSelectionDelegate?
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonCell", for: indexPath)
        cell.textLabel?.text = pokemons[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedPokemon = pokemons[indexPath.row]
        delegate?.pokemonSelected(newPokemon: selectedPokemon)
    }


}
