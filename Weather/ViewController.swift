    //
    //  ViewController.swift
    //  Weather
    //
    //  Created by Kirill Tarasko on 05.01.2025.
    //

    import UIKit


class ViewController: UIViewController {
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var getWeatherButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getWeatherButton.addTarget(self, action: #selector(getWeather), for: .touchUpInside)
    }
    
    @objc func getWeather() {
        let urlString = "https://api.open-meteo.com/v1/forecast?latitude=54.70&longitude=20.51&current=temperature_2m,wind_speed_10m&hourly=temperature_2m,relative_humidity_2m,wind_speed_10m"
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data, let weather = try? JSONDecoder().decode(Weather.self, from: data) {
                DispatchQueue.main.async {
                    self.weatherLabel.text = "Kaliningrad temperature is \(weather.current.temperature2M)"
                }
                
            } else {
                print("Error")
            }
        }
            
            task.resume()
        }
    }
    

