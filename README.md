# rpizwsolar

Solar Remote Monitor Based on Raspberry Pi Zero W

# Weather API

In order to predict when our solar device will run out of power, we need to have an understanding of what the future weather forecast will be, in particular, the cloud cover, and possibly snow and rain.

There are several Weather APIs which allow for drawing forecasting data which we evaluated:

*   [Open Weather API](https://openweathermap.org/api).
*   [Climacell](https://www.climacell.co/weather-api/pricing/)
*   [Storm Glass](https://stormglass.io/pricing/)
*   [Yahoo Weather](https://developer.yahoo.com/weather/)


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

$ curl -v  https://api.openweathermap.org/data/2.5/forecast/hourly?id=5015924&appid={your api key}
```

The GPS Coordinates of Afton, Minnesota are: 44.9027° N, 92.7835° W

## Types of Forecasts Available

Specifically, they offer a couple different forecasting APIs for free:

*   [The OpenWeatherMap Hourly Forecast](https://openweathermap.org/api/hourly-forecast)
*   [The OpenWeatherMap 16 Day Forecast](https://openweathermap.org/forecast16)
   *   This requires a pro account, so we can't use it.

### Hourly Forecast OpenWeather API

We can start off by simply evaluating the Hourly Forecast for free.  We did so in the above section, leading to this [result in JSON](https://github.com/pwdel/rpizwsolar/blob/master/testresult.json).

From there, we notice that we have several interesting data columns that we can work with:

*   ```list__dt``` which lists the time in postfix time
*   ```list__weather__main``` which lists out whether it's clear or cloudy
*   ```list__clouds__all``` which lists clouds as a numerical percentage of cover
*   wind speeds and directions
*   time in readible ISO format
*   ```list__dt_txt```
*   sunrise and sunset for the location, listed in GPS coordinates.

# Storing JSON Data

https://medium.com/quiq-blog/store-json-logs-on-s3-for-search-and-analytics-using-amazon-athena-b5bb7dbe377f
