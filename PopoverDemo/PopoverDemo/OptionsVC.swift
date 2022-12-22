
import UIKit

protocol ShareProtocol{
    
    func selectedValue(option:PdfShareOption)
    
}
class OptionsVC: UIViewController {
    var filesProperties : [PdfShareOption] = [.Email,.GoToPage,.ShowInfo,.Print,.Share]

    @IBOutlet var optionTableVw: UITableView!
    
    let cellHeight = 40.0
    var delegate : ShareProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.preferredContentSize = CGSize(width: 300, height: filesProperties.count * Int(cellHeight))

        let nib = UINib(nibName: "PdfOptionsTableViewCell", bundle: nil)
        optionTableVw.register(nib, forCellReuseIdentifier: "id")
        
        optionTableVw.delegate = self
        optionTableVw.dataSource = self
        
    }
    

}
extension OptionsVC:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filesProperties.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = filesProperties[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "id", for: indexPath) as! PdfOptionsTableViewCell
        cell.optionLbl.text = model.titleName.capitalized
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.dismiss(animated: true) {
            let model = self.filesProperties[indexPath.row]
            self.delegate?.selectedValue(option: model)

        }

        
    }
}
