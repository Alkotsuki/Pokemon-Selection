import UIKit

class LifeCyclePrintingViewController: UIViewController {
    
    override func viewDidLoad() {
        print("viewDidLoad called by \(self.className)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWIllAppear called by \(self.className)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear called by \(self.className)")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWIllDisappear called by \(self.className)")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear called by \(self.className)")
    }
    
}



extension UIViewController {
    var className: String {
        return NSStringFromClass(self.classForCoder).components(separatedBy: ".").last!
    }
}
