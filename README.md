# Sneezr

Sneezr allows the user to submit and store daily allergy symptom reports and then see their symptoms tracked over time in relation to local allergen levels such as pollen, mold, and dust. It uses a React.js frontend with Foundation styling elements and a Ruby on Rails/PostgreSQL backend. In order to limit daily API calls, this implementation is currently limited to a group of ZIP codes in the Boston area.

Current version: https://la-sneezr.herokuapp.com/

### To Run
To run locally, run 
`rails s`
in the command line and 
`yarn run dev:client`
in a separate tab, and navigate to localhost:3000

### Feature to be added
- More and better visualizations of the data
- Enhanced user ability to alter and delete symptom reports
- Allow multiple symptom reports per day.
- Include links to useful information about allergies

### Contributions and Use Guidelines
Feel free to contact me if you would like to contribute. If your area is not covered by the current implementation, you may with proper attribution run a local version (subject to AccuWeather's terms of use).

### API
https://developer.accuweather.com/apis
