# rpizwsolar

Solar Remote Monitor Based on Raspberry Pi Zero W

# Weather API

In order to predict when our solar device will run out of power, we need to have an understanding of what the future weather forecast will be, in particular, the cloud cover, and possibly snow and rain.

One interesting weather prediction API we found is the [Open Weather API](https://openweathermap.org/api).

## Getting the API Key & Executing Calls

There is a simple startup guide which can be found [here](https://openweathermap.org/appid#get).

Example call:

http://api.openweathermap.org/data/2.5/forecast?id=524901&APPID={APIKEY}

### Where You Can Execute Calls

There is a huge list of cities for which calls are available.  This does not necessarily mean that there is a weather station available at that city, however you can try your best to get the highest degree of accuracy by entering in the closest city or geographic location.

City locations by name can be found [here](http://bulk.openweathermap.org/sample/)

In our case, we used Afton, Minnesota which was listed as follows:

```
{
  "id": 5015924,
  "name": "Afton",
  "state": "MN",
  "country": "US",
  "coord": {
    "lon": -92.783539,
    "lat": 44.902748
  }
},
```

So from the example documentation, you put the city id within the call as follows:

```
Command line:

$ curl -v  https://api.openweathermap.org/data/2.5/forecast/hourly?id={5015924}&appid={your api key}
```

When we tried this, we get redirected toward a 401 error, which mentions that we need to wait a few hours for our API to be verified.

## Types of Forecasts Available

Specifically, they offer a couple different forecasting APIs for free:

* [The OpenWeatherMap Hourly Forecast](https://openweathermap.org/api/hourly-forecast)
* [The OpenWeatherMap 16 Day Forecast](https://openweathermap.org/forecast16)

We can start off by simply evaluating the Hourly Forecast.

## Hourly Forecast OpenWeather API

* Gives us the Cloudcover



### Example JSON API Response

```json
{
  "cod": "200",
  "message": 0.0179,
  "cnt": 96,
  "list": [
    {
      "dt": 1578412800,
      "main": {
        "temp": 284.43,
        "feels_like": 280.7,
        "temp_min": 284.24,
        "temp_max": 284.43,
        "pressure": 1019,
        "sea_level": 1019,
        "grnd_level": 1015,
        "humidity": 94,
        "temp_kf": 0.19
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01d"
        }
      ],
      "clouds": {
        "all": 0
      },
      "wind": {
        "speed": 4.75,
        "deg": 98.909
      },
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2020-01-07 13:00:00"
    },

    .....
        ],
  "city": {
    "id": 2643743,
    "name": "London",
    "coord": {
      "lat": 51.5085,
      "lon": -0.1258
    },
    "country": "GB",
    "population": 1000000,
    "timezone": 0,
    "sunrise": 1568958164,
    "sunset": 1569002733
  }
}
```
