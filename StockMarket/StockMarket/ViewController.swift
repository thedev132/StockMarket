import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource, UISearchBarDelegate {

   
    
    static var titles: Array = ["AAPL","CSCO","CGOL","TTD","QQQ","GLD","PFE","SNOW"]
    static var subtitles: Array = ["Apple Inc.","Cisco Systems","Contact Gold Corp","The Trade Desk","QQQ Trust", "SPDR Gold Trust","Pfizer Inc.","Snowflake Inc."]
    let defaults = UserDefaults.standard
    let Subarray = UserDefaults.standard.stringArray(forKey: "SavedSubtitlesArray") ?? [String]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaults.set(ViewController.titles, forKey: "SavedTitlesArray")
        defaults.set(ViewController.subtitles, forKey: "SavedSubtitlesArray")
        print(Subarray)
        view.backgroundColor = .black
        tableView.frame = CGRect(x: 0, y: SearchBar.frame.maxY + 250, width: view.frame.size.width, height: view.frame.size.height - 300)
        button.frame = CGRect(x: view.frame.size.width - 100, y: 20, width: 100, height: 60)
        SearchBar.frame = CGRect(x: 10, y: Datelabel.frame.midY + 30, width: view.frame.size.width - 50, height: 50)
        addButton.frame = CGRect(x: view.frame.size.width - 80, y: view.frame.size.height - 50, width: 60, height: 35)
        self.tableView.tableFooterView = UIView()
        self.tableView.tableFooterView?.isHidden = true
        tableView.backgroundColor = .black
        tableView.separatorColor = .gray
        SearchBar.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        view.addSubview(button)
        view.addSubview(Namelabel)
        view.addSubview(Datelabel)
        view.addSubview(SearchBar)
        view.addSubview(addButton)


    }
    
    
    private var SearchBar: UISearchBar = {
        let search = UISearchBar()
        search.placeholder = "Search"
        search.layer.cornerRadius = 12
        search.barTintColor = UIColor.clear
        search.backgroundColor = UIColor.clear
        search.isTranslucent = true
        search.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        search.searchTextField.textColor = .white
        return search
    }()

  
    
    private var addButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Add"), for: .normal)
        button.isHidden = true
        button.addTarget(self, action: #selector(Add), for: .touchUpInside)
        return button
    }()
    
    private let tableView: UITableView = {
        let table = UITableView()

        return table
    }()

    private var button: UIButton = {
        let button = UIButton()
        button.setTitle("Edit", for: .normal)
        button.setTitleColor(.link, for: .normal)
        button.addTarget(self, action: #selector(Edit), for: .touchUpInside)
        button.titleLabel?.font = UIFont(name: "ArialMT", size: 20)
        return button
    }()
    
    private var Namelabel: UILabel = {
        let label = UILabel()
        label.text = "Stocks"
        label.frame = CGRect(x: 20, y: 50, width: 250, height: 100)
        label.textColor = .white
        label.layer.cornerRadius = 12
        label.font = UIFont(name: "AvenirNext-Bold", size: 50)

        return label
    }()
    
    private var Datelabel: UILabel = {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale.current
        
        let label = UILabel()
        label.text = "\(dateFormatter.string(from: Date()))"
        label.frame = CGRect(x: 20, y: 100, width: 400, height: 100)
        label.textColor = .gray
        label.layer.cornerRadius = 12
        label.font = UIFont(name: "AvenirNext-Bold", size: 35)
        return label
    }()
    
    @objc func Edit() {
        
        if tableView.isEditing{
                //listTableView.editing = false;
                button.setTitle("Edit", for: .normal)
                tableView.setEditing(false, animated: false);
                addButton.isHidden = true
                
                //listTableView.reloadData();
            }
            else{
                //listTableView.editing = true;
                
                tableView.setEditing(true, animated: true)
                button.setTitle("Done", for: .normal)
                addButton.isHidden = false

            }
        
    }
    
    func createTimer(symbol: String, label: UILabel, priceLabel: UILabel) {
        
        DataViewController.timer = Timer.scheduledTimer(withTimeInterval: 5,
                                         repeats: true)
                                    {  timer in
            self.API(sybmol: symbol, label: label, priceLabel: priceLabel)
        }
    
    }
    
    @objc func Add() {
        let searchVC = SearchViewController()
        searchVC.modalPresentationStyle = .fullScreen
        searchVC.modalTransitionStyle = .flipHorizontal
        present(searchVC, animated: true, completion: nil)
        
    }
    
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let array = defaults.stringArray(forKey: "SavedTitlesArray") ?? [String]()
        let Subarray = UserDefaults.standard.stringArray(forKey: "SavedSubtitlesArray") ?? [String]()
        print(array)
        print(Subarray)
        return array.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        cell = UITableViewCell(style: UITableViewCell.CellStyle.value2, reuseIdentifier: "cellId")
        cell.backgroundColor = .black

        
        
        
        let symbol = UILabel()
        symbol.font = UIFont(name: "ArialMT", size: 20)
        symbol.textColor = .white
        symbol.lineBreakMode = .byWordWrapping
        symbol.numberOfLines = 0
        symbol.frame = CGRect(x: 58, y: -10, width: view.frame.size.width, height: 100)
        let array = defaults.stringArray(forKey: "SavedTitlesArray") ?? [String]()
        symbol.text = "\(array[indexPath.row])"
        cell.addSubview(symbol)
        
        let title = UILabel()
            title.textColor = .white
            title.frame = CGRect(x: 58, y: 15, width: view.frame.size.width, height: 100)
            title.text = "\n\(Subarray[indexPath.row])"
            title.lineBreakMode = .byWordWrapping
            title.numberOfLines = 0
            title.font = UIFont(name: "ArialMT", size: 15)
            cell.addSubview(title)
        
        let price = UILabel()
            price.textColor = .white
            price.frame = CGRect(x: view.frame.size.width - 122, y: 17, width: 70, height: 35)
            price.layer.masksToBounds = true
            price.layer.cornerRadius = 9
            price.lineBreakMode = .byWordWrapping
            price.numberOfLines = 0
            price.textAlignment = .center
            price.font = UIFont(name: "ArialMT", size: 22)
            cell.addSubview(price)
        
        let change = UILabel()
            change.textColor = .white
            change.frame = CGRect(x: view.frame.size.width - 130, y: 50, width: 85, height: 35)
            change.layer.masksToBounds = true
            change.layer.cornerRadius = 6
            change.lineBreakMode = .byWordWrapping
            change.numberOfLines = 0
            change.textAlignment = .center
            change.font = UIFont(name: "ArialMT", size: 20)
            cell.addSubview(change)
    
        API(sybmol: "\(array[indexPath.row])", label: change, priceLabel: price)
        createTimer(symbol: "\(array[indexPath.row])", label: change, priceLabel: price)
        return cell;
    
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let DataVC = DataViewController()
        let array = defaults.stringArray(forKey: "SavedTitlesArray") ?? [String]()
        DataVC.modalTransitionStyle = .flipHorizontal
        DataVC.modalPresentationStyle = .fullScreen
        DataVC.API(sybmol: String(array[indexPath.row].byWords.first ?? "AAPL"))
        DataVC.Summary(sybmol: String(ViewController.titles[indexPath.row].byWords.first ?? "AAPL"))
        DataVC.createTimer(symbol: String(ViewController.titles[indexPath.row].byWords.first ?? "AAPL"))
        present(DataVC, animated: true, completion: nil)
    }
    
    private func tableView(tableView: UITableView!, canMoveRowAtIndexPath indexPath: NSIndexPath!) -> Bool{
              return true;
          }

    private func tableView(tableView: UITableView!, moveRowAtIndexPath sourceIndexPath: NSIndexPath!, toIndexPath destinationIndexPath: NSIndexPath!)
          {
        var array = defaults.stringArray(forKey: "SavedTitlesArray") ?? [String]()
        let item : String = ViewController.titles[sourceIndexPath.row]
        array.remove(at: sourceIndexPath.row)
        array.insert(item, at: destinationIndexPath.row)
        defaults.set(array, forKey: "SavedTitlesArray")
    }
        
    private func tableView(tableView: UITableView!, editingStyleForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell.EditingStyle
            {
        let array = defaults.stringArray(forKey: "SavedTitlesArray") ?? [String]()
        if (false == self.isEditing && (indexPath == nil)){
            return UITableViewCell.EditingStyle.none;
                }

        if (self.isEditing && indexPath.row == array.count){
            return UITableViewCell.EditingStyle.insert;
                }
        
        return UITableViewCell.EditingStyle.none
        
            }
       

  
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        var array = defaults.stringArray(forKey: "SavedTitlesArray") ?? [String]()
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            array.remove(at: indexPath.row)
            self.defaults.set(array, forKey: "SavedTitlesArray")
            tableView.deleteRows(at: [indexPath], with: .fade)
            print(array)
        }
        delete.backgroundColor = .red
        return [delete]
    }
     func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: IndexPath) {
        var array = defaults.stringArray(forKey: "SavedTitlesArray") ?? [String]()
        let rowToMove = array[fromIndexPath.row]
        array.remove(at: fromIndexPath.row)
        array.insert(rowToMove, at: toIndexPath.row)
        defaults.setValue(array, forKey: "SavedTitlesArray")
    }


         

         func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
            if tableView.isEditing {
                    return true
                }
            return false
        }


    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                var array = defaults.stringArray(forKey: "SavedTitlesArray") ?? [String]()
                array.remove(at: indexPath.row)
                tableView.reloadData()
            }
        }

         func tableView(_ tableView: UITableView, moveRowAt indexPath: IndexPath, to: IndexPath) {
            var array = defaults.stringArray(forKey: "SavedTitlesArray") ?? [String]()
            let itemToMove = array[indexPath.row]
            array.remove(at: indexPath.row)
            array.insert(itemToMove, at: indexPath.row)
            defaults.set(array, forKey: "SavedTitlesArray")

           
        }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 100
    }

    override func setEditing(_ editing: Bool, animated: Bool) {
            super.setEditing(editing, animated: animated)

            if(self.isEditing) {

            }
        }

         func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
            return true
        }
        
   
    func API(sybmol: String, label: UILabel, priceLabel: UILabel) {
        let url = URL(string: "https://query1.finance.yahoo.com/v10/finance/quoteSummary/\(sybmol)?modules=price")
        let task = URLSession.shared.dataTask(with: ((url ?? URL(string: "https://query1.finance.yahoo.com/v10/finance/quoteSummary/AAPL?modules=price"))!)) { [self] (data, response, error) in
            
            do {
                let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: [])
                print(jsonResponse)
                guard let newValue = jsonResponse as? [String:Any] else {
                      print("invalid format")
                      return
                 }

                let summary = newValue["quoteSummary"] as? [String:Any]
                let result = summary?["result"] as? Array<Any>
                let price1 = result?[0] as? [String:Any]
                let price2 = price1?["price"] as? [String:Any]
                let price = price2?["regularMarketPrice"] as? [String:Any]
                let priceFMT = price?["fmt"]
                let change = price2?["regularMarketChange"] as? [String:Any]
                let changeFMT = change?["fmt"]
                let changePer = price2?["regularMarketChangePercent"] as? [String:Any]
                _ = changePer?["fmt"]
                let dayHigh = price2?["regularMarketDayHigh"] as? [String:Any]
                _ = dayHigh?["fmt"]
                let dayLow = price2?["regularMarketDayLow"] as? [String:Any]
                _ = dayLow?["fmt"]
                let open = price2?["regularMarketOpen"] as? [String:Any]
                _ = open?["fmt"]
                let previousClose = price2?["regularMarketPreviousClose"] as? [String:Any]
                _ = previousClose?["fmt"]
                _ = price2?["longName"]
                _ = price2?["exchangeName"]
                DispatchQueue.main.async {
                    priceLabel.text = "\(priceFMT ?? ["":(Any).self])"
                    label.text = "\(changeFMT ?? ["":(Any).self])"
                    
                }
                
                guard let changes = changeFMT as? String else {
                    return
                }
                let changeCheck = Double(changes)
                
                
                
                if changeCheck ?? 0 < 0 {
                    DispatchQueue.main.async {
                        label.backgroundColor = .red
                    }
                }
                else if changeCheck ?? 0 > 0 {
                    DispatchQueue.main.async {
                        label.backgroundColor = .init(red: 61/255, green: 173/255, blue: 70/255, alpha: 1)
                        label.text = "+\(changeFMT ?? ["":(Any).self])"
                    }
                    
                }
                else {
                    DispatchQueue.main.async {
                        label.backgroundColor = .gray
                    }

                }
                
            }
            
            catch let error {
                print("Error\(error)")
            }
            
        }
        task.resume()
    }

    
    


}
