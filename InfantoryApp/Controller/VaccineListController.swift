//
//  VaccineListController.swift
//  InfantoryApp
//
//  Created by Gilbert Nicholas on 05/04/21.
//

import UIKit
import CoreData

class VaccineListController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let months: [Month] = Month.generateAllMonth()
    var selectedMonth = Month()
    var activeBaby = Baby()

    @IBOutlet weak var vaccineListTableView: UITableView!
    @IBOutlet weak var activeProfilePicture: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        vaccineListTableView.dataSource = self
        vaccineListTableView.delegate  = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        fetchActiveBaby()
//        setProfileImage()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return months.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "vaccineListTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! VaccineListTableViewCell
        let currMonth = months[indexPath.row]
        cell.iconMonth.image = UIImage(named: currMonth.icon)
        cell.monthTitle.text = currMonth.name
        cell.vaccineList.text = getVaccines(vaccineList: currMonth.vaccineList)
        cell.overdueLabel.text = ""
        //TODO: Create function to get completed & overdue status
        if(indexPath.row == 1){
            cell.overdueLabel.text = "!"
        }
        //TODO: Create function to sync with baby age to get colored icon
//        if(month.isCurrent){
//            cell.iconMonth.tintColor = UIColor.primary
//        }
        return cell
    }
    
    func getVaccines(vaccineList: [Vaccine]) -> String{
        var vaccines: String = ""
        if(vaccineList.count <= 0){
            return "No Vaccine"
        }
        for vaccine in vaccineList {
            if vaccines == "" {
                vaccines = vaccine.name
            }
            else{
                vaccines = vaccines + ", " + vaccine.name
            }
        }
        return vaccines
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedMonth = months[indexPath.row]
        self.performSegue(withIdentifier: "VaccineListMonthSegue", sender: self)
        
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "VaccineListMonthSegue"){
            let destinationVC = segue.destination as? VaccineListMonthController
            destinationVC?.month = selectedMonth
        }
    }
    
    func fetchActiveBaby(){
        do {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let fetchRequest = Baby.fetchRequest() as NSFetchRequest<Baby>
            fetchRequest.predicate = NSPredicate(format: "isActive == true")
            let babies = try context.fetch(fetchRequest)
            if(babies.count > 0){
                self.activeBaby = babies[0]
                setProfileImage()
            }
        } catch {
            
        }
    }
    
    func setProfileImage(){
        let img: UIImage = UIImage.init(named: "\(activeBaby.babyPhoto)") ?? UIImage.init(systemName: "person.fill") as! UIImage
        let imgView: UIImageView = makeImageRound()
        imgView.image = img
        imgView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        let rightBtn: UIBarButtonItem = UIBarButtonItem.init(customView: imgView)
        self.navigationItem.rightBarButtonItem = rightBtn;
    }
    
    func makeImageRound() -> UIImageView{
        let view = UIImageView.init(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        view.layer.masksToBounds = true;
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.cornerRadius = view.frame.height/2
        view.clipsToBounds = true
        return view
    }
}
