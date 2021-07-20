require 'yaml'
require 'json'

# We created our French SSN pattern with Rubular
# We have wrapped our match groups in parantheses so they are easy to access
# Feel free to make it more robust!
PATTERN = /^(?<gender>(1|2)) (?<year>\d{2}) (?<month>\d{2}) (?<department>\d{2})( \d{3}){2} \d{2}/

# We create a simple Months hash (only adding the ones we are using for our tests for brevity's sake)
MONTHS = {
  '01' => 'January',
  '02' => 'February',
  '12' => 'December'
}

# We define our method (same one checked by Rake!)
# It expects one argument, ssn
def french_ssn_info(ssn)
  if ssn == '' # If ssn is an empty string, we return 'The number is invalid'
    return 'The number is invalid'
  else # otherwise..
    file = YAML.load_file('data/french_departments.yml') # we load up the .yml file containing all the French districts - it is loaded in as a hash automatically
    gender = ssn.match(PATTERN)[1] # We retrieve match group 1 - gender
    year = ssn.match(PATTERN)[2] # We retrieve match group 2 - year
    month = ssn.match(PATTERN)[3] # We retrieve match group 3 - month
    department = ssn.match(PATTERN)[4] # We retrieve match group 4 - department

    # We return a string interpolating in our variable above
    # If gender is 1, we interpolate man, otherwise woman
    # We access the MONTHS hash using the month key MONTHS['12'] => 'December'
    # We access the yml file hash, and use the department variable as they key
    return "a #{gender == '1' ? 'man' : 'woman'}, born in #{MONTHS[month]}, 19#{year} in #{file[department]}."
  end
end
