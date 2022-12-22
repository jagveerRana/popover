//
//  ViewController.swift
//  PopoverDemo
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
    }

    @IBAction func popoverAction(_ sender: UIButton) {
        
        let storybd = UIStoryboard(name: "Main", bundle: nil)
        if let info = storybd.instantiateViewController(withIdentifier: "OptionsVC") as? OptionsVC{
            info.delegate = self
            info.modalPresentationStyle = .popover
            info.popoverPresentationController?.sourceView = sender
            info.popoverPresentationController?.permittedArrowDirections = .up
            info.popoverPresentationController?.delegate = self
            self.present(info, animated: true, completion: nil)

        }
    }
    
}

extension ViewController:ShareProtocol{
    
    func selectedValue(option: PdfShareOption) {
        
    }
    
}
extension UIViewController: UIPopoverPresentationControllerDelegate {
    public func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
}
