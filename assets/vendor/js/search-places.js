// var places = require('places.js');

(function() {
  var placesAutocomplete = places({
    container: document.querySelector('#address-autocomplete'),
    type: 'address',
    templates: {
      value: function(suggestion) {
        return suggestion.name;
      }
    }
  });

placesAutocomplete.on('change', function resultSelected(e) {
    /* console.dir(e)*/
    var address = parseAddress(e.suggestion.name || '')
    /* console.log(address[1])
    * console.log(address[0])*/
    document.querySelector('#real_estate_street').value = address[1] || '';
    document.querySelector('#real_estate_street_number').value = address[0] || '';
    // e.rawAnswer.hits[0].administrative[1]
    wojewodztwo = parseWojewodztwo(e.suggestion.administrative) || '';
    document.querySelector('#real_estate_administrative_area_level_1').value = wojewodztwo
    document.querySelector('#real_estate_administrative_area_level_2').value = e.suggestion.county  || '';
    document.querySelector('#real_estate_administrative_area_level_3').value = e.suggestion.city || '';
    document.querySelector('#real_estate_administrative_area_level_4').value = e.suggestion.suburb|| '';
    document.querySelector('#real_estate_postal_code').value = e.suggestion.postcode || '';
    document.querySelector('#real_estate_country').value = e.suggestion.country || '';
  });
})();

var streetNumberRegex = /\d+$/
function parseAddress(address) {
  var result = ['', '']
  var matches = address.match(streetNumberRegex);
  if (matches) {
    result[0] = matches[0];
  }
  result[1] = address.substring(0, address.indexOf(result[0])).trim();
  return result
}
var wojewodztwoRegex = /(województwo)./
function parseWojewodztwo(wojewodztwo) {
  var matches = wojewodztwo.match(wojewodztwoRegex);
  if (matches) {
    toDiscard = matches[0];
    result = toTitleCase(wojewodztwo.substring(11).trim());
    return result
  }
  return wojewodztwo
}
var splitRegex = /(?:[A-zĄĆĘŁŃÓŚŹŻąćęłńóśźż])+(?:[A-zĄĆĘŁŃÓŚŹŻąćęłńóśźż])+/g
function toTitleCase(str) {
  console.log("str: " + str)
  return str.replace(splitRegex, function(text){
    console.log(text.charAt(0) + " - - " + text.substr(1))
    return text.charAt(0).toUpperCase() + text.substr(1).toLowerCase();
  });
}
