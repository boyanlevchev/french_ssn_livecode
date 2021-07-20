require_relative '../french_ssn' # We must import the file we want to test

describe '#french_ssn_info' do # We tell the test what method to look for within '../french_ssn'
  it "returns 'The number is invalid' when passed an empty string" do # We specify the task that rake will tell us - it will be red if unsolved and go green once it passes!
    actual = french_ssn_info('') # We run the actual method, giving it an empty string, and store the value in actual
    expected = 'The number is invalid' # We tell our test what the expected value of the method should be if the string is empty
    expect(actual).to eq(expected) # We check to see if the expected and actual values match - if they do, our task goes green!
  end

  it "returns 'a man, born in December, 1984 in Seine-Maritime.' when passed '1 84 12 76 451 089 46'" do
    actual = french_ssn_info("1 84 12 76 451 089 46")
    expected = "a man, born in December, 1984 in Seine-Maritime."
    expect(actual).to eq(expected)
  end
end
