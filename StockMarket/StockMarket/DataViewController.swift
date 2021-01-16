import UIKit


class DataViewController: UIViewController {
    static var timer: Timer = Timer()
    static var name: String = ""
    let defaults = UserDefaults.standard

    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        Namelabel.frame = CGRect(x: -40 , y: -50, width: 300, height: 300)
        symobolLabel.frame = CGRect(x: 183 , y: -42, width: 225, height: 300)
        priceLabel.frame = CGRect(x: -60, y: 180, width: 300, height: 100)
        openLabel.frame = CGRect(x: view.frame.minX - 58, y: 250, width: 300, height: 100)
        lowLabel.frame = CGRect(x: view.frame.minX + 112, y: 250, width: 300, height: 100)
        preClose.frame = CGRect(x: priceLabel.frame.midX + 57 , y: 180, width: 300, height: 100)
        Change.frame = CGRect(x: view.frame.minX - 60 , y: 320, width: 300, height: 100)
        PerChange.frame = CGRect(x: view.frame.minX + 146  , y: 320, width: 300, height: 100)
        CEOLabel.frame = CGRect(x: 30, y: 400, width:  view.frame.size.width - 50, height: 150)
        summaryLabel.frame = CGRect(x: 30, y: CEOLabel.frame.minY + CEOLabel.frame.size.height, width:  view.frame.size.width - 50, height: 350)
        Add.frame = CGRect(x: view.frame.size.width - 105, y: 140, width: 60, height: 50)
        Add.addTarget(self, action: #selector(AddIt), for: .touchUpInside)
        

        view.addSubview(Namelabel)
        view.addSubview(symobolLabel)
        view.addSubview(highLabel)
        view.addSubview(priceLabel)
        view.addSubview(lowLabel)
        view.addSubview(openLabel)
        view.addSubview(preClose)
        view.addSubview(Change)
        view.addSubview(PerChange)
        view.addSubview(Backbutton)
        view.addSubview(CEOLabel)
        view.addSubview(summaryLabel)
        view.addSubview(Add)
        view.backgroundColor = .black

    }
    

    
    private var Namelabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "ArialMT", size: 45)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private var symobolLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.textAlignment = .center
        label.font = UIFont(name: "ArialMT", size: 25)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        return label
    }()
    
    
    private var highLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "ArialMT", size: 17)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping

        return label
    }()
    
    private var lowLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "ArialMT", size: 17)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping

        return label
    }()
    
    private var priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "ArialMT", size: 17)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    
    
    private var openLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "ArialMT", size: 17)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private var preClose: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "ArialMT", size: 17)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    
    
    private var Change: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "ArialMT", size: 17)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private var PerChange: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "ArialMT", size: 17)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private var Backbutton: UIButton = {
        let button = UIButton()
        button.setTitle("Back", for: .normal)
        button.setTitleColor(.link, for: .normal)
        button.frame = CGRect(x: 0, y: 20, width: 100, height: 60)
        button.addTarget(self, action: #selector(Back), for: .touchUpInside)
        return button
    }()
    
    private var CEOLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.layer.cornerRadius = 12
        label.textColor = .white
        label.font = UIFont(name: "ArialMT", size: 15)
        return label
    }()
    
    private var summaryLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.layer.cornerRadius = 12
        label.textColor = .white
        label.font = UIFont(name: "ArialMT", size: 12)
        return label
    }()
    
    private var Add: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "AddStock"), for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    @objc func AddIt() {
        ViewController.titles.append("\(Namelabel.text ?? "")")
        ViewController.subtitles.append("\(symobolLabel.text ?? "")")
        let alert = UIAlertController(title: "Added!", message: "Your Stock has been added to your Watchlist", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
        defaults.set(ViewController.titles, forKey: "SavedTitlesArray")
        defaults.set(ViewController.subtitles, forKey: "SavedSubtitlesArray")
        print(defaults.stringArray(forKey: "SavedTitlesArray") ?? [String]())
        print(defaults.stringArray(forKey: "SavedSubtitlesArray") ?? [String]())
    }
    
    @objc func Back() {
        let VC = ViewController()
        VC.modalTransitionStyle = .flipHorizontal
        VC.modalPresentationStyle = .fullScreen
        DataViewController.timer.invalidate()
        present(VC, animated: true, completion: nil)
    }
    func createTimer(symbol: String) {
        
        DataViewController.timer = Timer.scheduledTimer(withTimeInterval: 5,
                                         repeats: true)
                                    {  timer in
            self.API(sybmol: symbol)
            self.Summary(sybmol: symbol)

        }
    
    }
    func API(sybmol: String) {
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
                let changePerFMT = changePer?["fmt"]
                let dayHigh = price2?["regularMarketDayHigh"] as? [String:Any]
                let highFMT = dayHigh?["fmt"]
                let dayLow = price2?["regularMarketDayLow"] as? [String:Any]
                let lowFMT = dayLow?["fmt"]
                let open = price2?["regularMarketOpen"] as? [String:Any]
                let openFMT = open?["fmt"]
                let previousClose = price2?["regularMarketPreviousClose"] as? [String:Any]
                let closeFMT = previousClose?["fmt"]
                let longName = price2?["longName"]
                let exchangeName = price2?["exchangeName"]
                let symbols = price2?["symbol"]
                DataViewController.name = longName as? String ?? ""
                DispatchQueue.main.async {
                    symobolLabel.text = "\(DataViewController.name)"
                    Namelabel .text = "\(symbols ?? "")"
                    highLabel.text = "High: $\(highFMT ?? "")"
                    lowLabel.text = "Low: $\(lowFMT ?? "")"
                    priceLabel.text = "Price: $\(priceFMT ?? "")"
                    openLabel.text = "Open: $\(openFMT ?? "")"
                    preClose.text = "Previous Close: \(closeFMT ?? "")"
                    Change.text = "Change: \(changeFMT ?? "")"
                    PerChange.text = "Change Percentage: \(changePerFMT ?? "")"
                    
                    

                }

            }
            
            catch let error {
                print("Error: \(error)")
            }
            
        }
        task.resume()
    }
    

    
        
    func Summary(sybmol: String) {
        let url = URL(string: "https://query1.finance.yahoo.com/v10/finance/quoteSummary/\(sybmol)?modules=assetProfile")
        let task = URLSession.shared.dataTask(with: ((url ?? URL(string: "https://query1.finance.yahoo.com/v10/finance/quoteSummary/AAPL?modules=assetProfile"))!)) { [self] (data, response, error) in
            
            do {
                let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: [])
                print(jsonResponse)
                guard let newValue = jsonResponse as? [String:Any] else {
                      print("invalid format")
                      return
                 }

                let summary = newValue["quoteSummary"] as? [String:Any]
                let result = summary?["result"] as? Array<Any>
                let result2 = result?[0] as? [String:Any]
                let assetProfile = result2?["assetProfile"] as? [String:Any]
                let address = assetProfile?["address1"]
                let city = assetProfile?["city"]
                let zip = assetProfile?["zip"]
                let state = assetProfile?["state"]
                let country = assetProfile?["country"]
                let phone = assetProfile?["phone"]
                let website = assetProfile?["website"]
                let longSummary = assetProfile?["longBusinessSummary"]
                let Officer = assetProfile?["companyOfficers"] as? Array<Any>
                let CEO = Officer?[exist: 0] as? [String:Any]
                let CEOName = CEO?["name"]
                let CEOAge = CEO?["age"]
                let CEOTitle = CEO?["name"]
                let CEOBorn = CEO?["yearBorn"]
                let CEOPay = CEO?["totalPay"] as? [String:Any]
                let CEOPayFMT = CEOPay?["fmt"]

                
                print(CEOName)
                print(assetProfile)
                print(city)
                print(zip)
                print(state)
                print(country)
                print(phone)
                print(website)
                
                

                if address != nil {
                    if country as! String == "United States"  {
                        DispatchQueue.main.async {
                            CEOLabel.text = "The CEO of \(DataViewController.name) is \(CEOName ?? "a") and is \(CEOAge ?? "a") years old. The total pay for this CEO is $\(CEOPayFMT ?? ""). The Head Quarter's address is \(address ?? "") in \(city ?? ""), \(state ?? ""), \(country ?? ""). The company's phone number is \(phone ?? "") and you can visit their website at \(website ?? "")"
                            
                            summaryLabel.text = "Summary: \(longSummary ?? "")"

                        }
                    }
                    if CEOPayFMT == nil && country as! String == "United States" {
                        DispatchQueue.main.async {
                            CEOLabel.text = "The CEO of \(DataViewController.name) is \(CEOName ?? "a") and is \(CEOAge ?? "a") years old. The Head Quarter's address is \(address ?? "") in \(city ?? ""), \(state ?? ""), \(country ?? ""). The company's phone number is \(phone ?? "") and you can visit their website at \(website ?? "")"
                            
                            summaryLabel.text = "Summary: \(longSummary ?? "")"

                        }
                    
                    }
                    else if country as! String != "United States" {
                        DispatchQueue.main.async {
                            CEOLabel.text = "The CEO of \(DataViewController.name) is \(CEOName ?? "a") and is \(CEOAge ?? "a") years old. The Head Quarter's address is \(address ?? "") in \(city ?? ""), \(country ?? ""). The company's phone number is \(phone ?? "") and you can visit their website at \(website ?? "")"
                            
                            summaryLabel.text = "Summary: \(longSummary ?? "")"

                        }
                    }
                    else if CEOPay == nil {
                        DispatchQueue.main.async {
                            CEOLabel.text = "The CEO of \(DataViewController.name) is \(CEOName ?? "a") and is \(CEOAge ?? "a") years old. The Head Quarter's address is \(address ?? "") in \(city ?? ""), \(country ?? ""). The company's phone number is \(phone ?? "") and you can visit their website at \(website ?? "")"
                            
                            summaryLabel.text = "Summary: \(longSummary ?? "")"

                        }
                    }
                    
                }
                else {
                
                    DispatchQueue.main.async {
                        summaryLabel.frame = CEOLabel.frame
                        summaryLabel.text = "Summary: \(longSummary ?? "")"
                    }
                    
                }
                
                

                if ViewController.titles.contains("\(sybmol)") == true {
                    DispatchQueue.main.async {
                        Add.isHidden = true
                    }
                    
                }
                else {
                    DispatchQueue.main.async {
                        Add.isHidden = false
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

