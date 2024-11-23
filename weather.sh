#!/usr/bin/env bash
#using https://www.weatherapi.com/docs/
#free 1m api calls per month

line="==========================="

echo -n 'Please enter the Weather API key: '
read -sr WEATHER_API_KEY
echo -ne '\nPlease enter the location: '
read -r LOCATION
clear

LOCATION=${LOCATION// /%20}
response="$(curl -s "https://api.weatherapi.com/v1/current.json?key=${WEATHER_API_KEY}&q=${LOCATION}")"
temperature="$(echo "${response}" | jq -r '.current.temp_f')"
humidity="$(echo "${response}" | jq -r '.current.humidity')"

echo $line
echo "Temperature: ${temperature}°F"
echo "Humidity: ${humidity}%"
echo $line

