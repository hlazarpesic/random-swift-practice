import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    @IBOutlet weak var cityTextNameField: UITextField!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    
    fileprivate var db = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cityTextNameField.rx.controlEvent(.editingDidEndOnExit)
            .asObservable()
            .map({ self.cityTextNameField.text })
            .subscribe(onNext: { city in
                if let city = city {
                    if city.isEmpty {
                        self.temperatureLabel.text = "🙈"
                        self.humidityLabel.text = "😱"
                    } else {
                        self.fetchWeather(by: city)
                    }
                }
            }).disposed(by: db)
    }
    
    fileprivate func fetchWeather(by city: String) {
        guard let cityEncoded = city.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed),
            let url = URL.urlForWeatherAPI(city: cityEncoded) else {
                return
        }
        
        let resource = Resource<WeatherResult>(url: url)
        
        let search = URLRequest.load(resource: resource)
            .observeOn(MainScheduler.instance)
            .catchErrorJustReturn( WeatherResult.empty )
        
        search.map({ "\($0.main.temp) ℉" })
            .bind(to: self.temperatureLabel.rx.text )
            .disposed(by: db)
        
        search.map({ "\($0.main.humidity) 💦"})
            .bind(to: humidityLabel.rx.text)
            .disposed(by: db)
    }
}
