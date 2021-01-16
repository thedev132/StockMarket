import UIKit

class SearchViewController: UIViewController, UITableViewDelegate, UISearchBarDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = CGRect(x: 0, y: 225, width: view.frame.size.width, height: view.frame.size.height)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.isHidden = true
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        self.tableView.tableFooterView?.isHidden = true
        self.tableView.rowHeight = 100
        exitButton.frame = CGRect(x: view.frame.size.width - 70, y: 35 , width: 30, height: 30)
        SearchBar.delegate = self
        SearchBar.frame = CGRect(x: 30, y: 80, width: view.frame.size.width - 50, height: 60)
        
        view.backgroundColor = .black
        view.addSubview(tableView)
        view.addSubview(SearchBar)
        view.addSubview(exitButton)
        view.addSubview(label)
    }
    
    let tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .black
        table.separatorColor = UIColor.lightGray
        return table
    }()
    

  
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
    
    private var label: UILabel = {
        let label = UILabel()
        label.text = "Symbols"
        label.frame = CGRect(x: 50, y: 150, width: 250, height: 100)
        label.textColor = .white
        label.font = UIFont(name: "AvenirNext-Bold", size: 35)
        return label
    }()
    
    
    var number: Int = 0
    var tableArray: String? = nil
    var tableArray2:String? = nil
    var tableArray3:String? = nil
    var tableArray4:String? = nil
    var tableArray5:String? = nil
    var tableArray6:String? = nil
    var tableArray7:String? = nil
    var tableArray8:String? = nil
    var tableArray9:String? = nil
    var tableArray10:String? = nil
    var tableArray11:String? = nil
    var tableArray12:String? = nil


    private var exitButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Exit"), for: .normal)
        button.isHidden = false
        button.addTarget(self, action: #selector(Exit), for: .touchUpInside)
        return button
    }()
    
    
    
    @objc func Exit() {
        let VC = ViewController()
        VC.modalTransitionStyle = .flipHorizontal
        VC.modalPresentationStyle = .fullScreen
        present(VC, animated: true, completion: nil)
        
        
    }

    
    
    func API2(sybmol: String) {
        let url = URL(string: "https://ticker-2e1ica8b9.now.sh/keyword/\(sybmol)")
        let task = URLSession.shared.dataTask(with: ((url ?? URL(string: "https://ticker-2e1ica8b9.now.sh/keyword/"))!)) { [self] (data, response, error) in
            DispatchQueue.main.async {
                tableView.numberOfRows(inSection: 0)
            }

            do {
                let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: [])
                print(jsonResponse)
                guard let newValue = jsonResponse as? Array<Any> else {
                      print("invalid format")
                      return
                
                 }
                number = newValue.count
                if let One = newValue[exist: 0] as? [String:Any] {
                    let name = One["name"]
                    let symbol = One["symbol"]
                    let both = "\(symbol ?? "") - \(name ?? "")"
                    tableArray = "\(both)"
                    
                
                }
                else {
                    tableArray = nil
                }
                    
                
                
                if let Two = newValue[exist: 1] as? [String:Any] {
                    let name = Two["name"]
                    let symbol = Two["symbol"]
                    let both = "\(symbol ?? "") - \(name ?? "")"
                    tableArray2 = "\(both)"
                    

                    
                    }
                else {
                    tableArray2 = nil
                }
                if let Three = newValue[exist: 2] as? [String:Any] {
                    let name = Three["name"]
                    let symbol = Three["symbol"]
                    let both = "\(symbol ?? "") - \(name ?? "")"
                    tableArray3 = "\(both)"
                    
                    
                }
                else {
                    tableArray3 = nil
                }
                if let Four = newValue[exist: 3] as? [String:Any] {
                    let name = Four["name"]
                    let symbol = Four["symbol"]
                    let both = "\(symbol ?? "") - \(name ?? "")"
                    tableArray4 = "\(both)"
                    
                }
                else {
                    tableArray4 = nil
                }
                if let Five = newValue[exist: 4] as? [String:Any] {
                    let name = Five["name"]
                    let symbol = Five["symbol"]
                    let both = "\(symbol ?? "") - \(name ?? "")"
                    tableArray5 = "\(both)"
                    
                }
                else {
                    tableArray5 = nil
                }
                if let Six = newValue[exist: 5] as? [String:Any] {
                    let name = Six["name"]
                    let symbol = Six["symbol"]
                    let both = "\(symbol ?? "") - \(name ?? "")"
                    tableArray6 = "\(both)"

                }
                else {
                    tableArray6 = nil
                }
                if let Seven = newValue[exist: 6] as? [String:Any] {
                    let name = Seven["name"]
                    let symbol = Seven["symbol"]
                    let both = "\(symbol ?? "") - \(name ?? "")"
                    tableArray7 = "\(both)"
                    
                }
                else {
                    tableArray7 = nil
                }
                if let Eight = newValue[exist: 7] as? [String:Any] {
                    let name = Eight["name"]
                    let symbol = Eight["symbol"]
                    let both = "\(symbol ?? "") - \(name ?? "")"
                    tableArray8 = "\(both)"
               
                }
                else {
                    tableArray8 = nil
                }
                if let Nine = newValue[exist: 8] as? [String:Any] {
                    let name = Nine["name"]
                    let symbol = Nine["symbol"]
                    let both = "\(symbol ?? "") - \(name ?? "")"
                    
                    tableArray9 = "\(both)"
                    
                }
                else {
                    tableArray9 = nil
                }
                if let Ten = newValue[exist: 9] as? [String:Any] {
                    let name = Ten["name"]
                    let symbol = Ten["symbol"]
                    let both = "\(symbol ?? "") - \(name ?? "")"
                    tableArray10 = "\(both)"
                    

                }
                else {
                    tableArray10 = nil
                }
                if let Eleven = newValue[exist: 10] as? [String:Any] {
                    let name = Eleven["name"]
                    let symbol = Eleven["symbol"]
                    let both = "\(symbol ?? "") - \(name ?? "")"
                    tableArray11 = "\(both)"
                }
                else {
                    tableArray11 = nil
                }
                if let Tweleve = newValue[exist: 11] as? [String:Any] {
                    let name = Tweleve["name"]
                    let symbol = Tweleve["symbol"]
                    let both = "\(symbol ?? "") - \(name ?? "")"
                    tableArray12 = "\(both)"
                    
                    

                }
                else {
                    tableArray12 = nil
                }
                
               
            }
            
            catch let error {
                print("Error\(error)")
            }
            
            
        }
        task.resume()
        

    }


    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if SearchBar.text == "" {
            tableView.isHidden = true
        }
        
        
        else if tableView.visibleCells.isEmpty {
            tableView.isHidden = true
            tableView.reloadData()
            self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        }
        
        else {
            self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.isHidden = false
        API2(sybmol: SearchBar.text ?? "")
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            self.tableView.reloadData()
        }
        
    }
    }
    
   
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        didReturn()
       }
    
    func didReturn() {
        if SearchBar.text == "" {
            let alert = UIAlertController(title: "Oops!", message: "you forgot to type a stock in", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
            alert.addAction(alertAction)
            present(alert, animated: true, completion: nil)
            
        }
        else {
            
            let DataVC = DataViewController()
            DataVC.modalTransitionStyle = .flipHorizontal
            DataVC.modalPresentationStyle = .fullScreen
            DataVC.API(sybmol: SearchBar.text!)
            DataVC.createTimer(symbol: SearchBar.text!)
            present(DataVC, animated: true, completion: nil)
        }
        
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var titles: Array = [""]
        
        if tableArray != nil && tableArray!.count > 0 {
            titles = [tableArray!]
        }
        if tableArray2 != nil && tableArray2!.count > 0 {
            titles.append(tableArray2!)
        }
        if tableArray3 != nil && tableArray3!.count > 0 {
            titles.append(tableArray3!)
        }
        if tableArray4 != nil && tableArray4!.count > 0 {
            titles.append(tableArray4!)
        }
        if tableArray5 != nil && tableArray5!.count > 0 {
            titles.append(tableArray5!)
        }
        if tableArray6 != nil && tableArray6!.count > 0 {
            titles.append(tableArray6!)
        }
        if tableArray7 != nil && tableArray7!.count > 0 {
            titles.append(tableArray7!)
        }
        if tableArray8 != nil && tableArray8!.count > 0 {
            titles.append(tableArray8!)
        }
        if tableArray9 != nil && tableArray9!.count > 0 {
            titles.append(tableArray9!)
        }
        if tableArray10 != nil && tableArray10!.count > 0 {
            titles.append(tableArray10!)
        }
        if tableArray11 != nil && tableArray11!.count > 0 {
            titles.append(tableArray11!)
        }
        if tableArray12 != nil && tableArray12!.count > 0 {
            titles.append(tableArray12!)
        }
        else {
            
        }
        
        return titles.count
    }
    func API(sybmol: String, label2: UILabel, priceLabel: UILabel) {
        if sybmol != "" {
                
            
            let url = URL(string: "https://query1.finance.yahoo.com/v10/finance/quoteSummary/\(sybmol)?modules=price")
            let task = URLSession.shared.dataTask(with: ((url ?? URL(string: "https://query1.finance.yahoo.com/v10/finance/quoteSummary/cgol?modules=price"))!)) { [self] (data, response, error) in
            
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
                    let longName: Any = price2?["longName"]
                    _ = price2?["exchangeName"]
                    DispatchQueue.main.async {
                        priceLabel.text = "\(priceFMT ?? "")"
                        label2.text = "\(changeFMT ?? "")"
                    }
                    
                    guard let changes = changeFMT as? String else {
                        return
                    }
                    let changeCheck = Double(changes)
                                    
                    if changeCheck ?? 0 < 0 {
                        DispatchQueue.main.async {
                            label2.textColor = .red
                        }
                    }
                    else if changeCheck ?? 0 > 0 {
                        DispatchQueue.main.async {
                            label2.textColor = .init(red: 61/255, green: 173/255, blue: 70/255, alpha: 1)
                            label2.text = "+\(changeFMT ?? [""])"
                            
                        }
                        
                    }
                    else {
                        DispatchQueue.main.async {
                            label2.textColor = .gray
                            
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
    
}


extension Collection where Indices.Iterator.Element == Index {
    subscript (exist index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let snippet1 = tableArray?.components(separatedBy: "- ")[exist: 1]
        let snippet2 = tableArray2?.components(separatedBy: "- ")[exist: 1]
        let snippet3 = tableArray3?.components(separatedBy: "- ")[exist: 1]
        let snippet4 = tableArray4?.components(separatedBy: "- ")[exist: 1]
        let snippet5 = tableArray5?.components(separatedBy: "- ")[exist: 1]
        let snippet6 = tableArray6?.components(separatedBy: "- ")[exist: 1]
        let snippet7 = tableArray7?.components(separatedBy: "- ")[exist: 1]
        let snippet8 = tableArray8?.components(separatedBy: "- ")[exist: 1]
        let snippet9 = tableArray9?.components(separatedBy: "- ")[exist: 1]
        let snippet10 = tableArray10?.components(separatedBy: "- ")[exist: 1]
        let snippet11 = tableArray11?.components(separatedBy: "- ")[exist: 1]
        let snippet12 = tableArray12?.components(separatedBy: "- ")[exist: 1]

        
        let titles = [tableArray?.byWords.first, tableArray2?.byWords.first, tableArray3?.byWords.first, tableArray4?.byWords.first, tableArray5?.byWords.first, tableArray6?.byWords.first, tableArray7?.byWords.first, tableArray8?.byWords.first, tableArray9?.byWords.first, tableArray10?.byWords.first, tableArray11?.byWords.first, tableArray12?.byWords.first]

        let subtitles = [snippet1, snippet2, snippet3, snippet4, snippet5, snippet6, snippet7, snippet8, snippet9, snippet10, snippet11, snippet12]
        
       print(subtitles)
        
        var cell: UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell = UITableViewCell(style: UITableViewCell.CellStyle.value2, reuseIdentifier: "cellId")
        cell.backgroundColor = .black
        let symbol = UILabel()
        symbol.font = UIFont(name: "ArialMT", size: 20)
        symbol.textColor = .white
        symbol.lineBreakMode = .byWordWrapping
        symbol.numberOfLines = 0
        symbol.frame = CGRect(x: 58, y: -10, width: view.frame.size.width, height: 100)
        symbol.text = "\(titles[indexPath.row] ?? "")"
        cell.addSubview(symbol)
        
        let title = UILabel()
            title.textColor = .white
            title.frame = CGRect(x: 58, y: 15, width: view.frame.size.width - 100, height: 100)
            title.text = "\n\(subtitles[indexPath.row] ?? "")"
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
    
        API(sybmol: "\(titles[indexPath.row] ?? "")" , label2: change, priceLabel: price)
            return cell
    }
        // method to run when table view cell is tapped
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let array = [tableArray, tableArray2, tableArray3, tableArray4, tableArray5, tableArray6, tableArray7, tableArray8, tableArray9, tableArray10, tableArray11, tableArray12]
            
            print("\(array[indexPath.row]?.byWords.first).")
            let DataVC = DataViewController()
            DataVC.modalTransitionStyle = .flipHorizontal
            DataVC.modalPresentationStyle = .fullScreen
            DataVC.API(sybmol: String(array[indexPath.row]?.byWords.first ?? "AAPL"))
            DataVC.Summary(sybmol: String(array[indexPath.row]?.byWords.first ?? "AAPL"))
            DataVC.createTimer(symbol: String(array[indexPath.row]?.byWords.first ?? "AAPL"))
            present(DataVC, animated: true, completion: nil)
            
            
            
        }
    
   
    
}

extension StringProtocol {
    var byWords: [SubSequence] {
        var byWords: [SubSequence] = []
        enumerateSubstrings(in: startIndex..., options: .byWords) { _, range, _, _ in
            byWords.append(self[range])
        }
        return byWords
    }
}
