# App Verification Package Client

A Ruby client for consuming the Microbilt App Verification Package APIs.

For more about APIs You can see on [Microbilt Developer Portal](https://developer.microbilt.com/)

## APIs in this plan:
[AddressNameVerification](https://developer.microbilt.com/api/AddressNameVerification)

[ABAAcctVerification](https://developer.microbilt.com/api/AddressStandardization)

[DeathMasterFileValidation](https://developer.microbilt.com/api/DeathMasterFileValidation)

[DLVerify](https://developer.microbilt.com/api/DLVerify)

[EmailValidation](https://developer.microbilt.com/api/EmailValidation)

[IPAddressInfo](https://developer.microbilt.com/api/IPAddressInfo)

[OFACWatchlistSearch](https://developer.microbilt.com/api/OFACWatchlistSearch)

[PhoneAddressVerification](https://developer.microbilt.com/api/PhoneAddressVerification)

[PhoneNameVerification](https://developer.microbilt.com/api/PhoneNameVerification)

[SSNAddressVerification](https://developer.microbilt.com/api/SSNAddressVerification)

[SSNNameVerification](https://developer.microbilt.com/api/SSNNameVerification)

[SSNPhoneVerification](https://developer.microbilt.com/api/SSNPhoneVerification)

[SSNValidation](https://developer.microbilt.com/api/SSNValidation)

# Installation

`composer require Microbilt/App-Verification-Package-Ruby`

# Quick Start

```
app_verification_package_client = AppVerificationPackage::AppVerificationPackageClient.new("You_client_id", "You_client_secret")
```
# Configuration

`client_id` required

`client_secret` required

`EnvironmentType` optional (defaults to Production). Other option is Sandbox. 

# Usage
For usage you need create plan client with you credentials
All APIs implemented like property in ```AppVerificationPackageClient``` class 
```app_verification_package_client.address_name_verification_client.get_report("You request body in JSON format")```

## More usage with test call APIs from plan:

```
app_verification_package_client = AppVerificationPackage::AppVerificationPackageClient.new("You_client_id", "You_client_secret", EnvironmentType::Sandbox)

puts "AddressNameVerification API call:"
puts "GetReport:"

# Create a hash to represent the JSON structure
report_request = {
  Name: {
    FirstName: "ALBERT",
    MiddleName: "D",
    LastName: "ALTER"
  },
  Address: {
    Addr1: "7442 SPRING VILLAGE DR",
    City: "SPRINGFIELD",
    State: "VA",
    Zip: "22150"
  }
}

# Convert the hash to a JSON string
report_request_json = JSON.pretty_generate(report_request)

response = app_verification_package_client.address_name_verification_client.get_report(report_request_json)
puts response


puts "AddressStandardization API call:"
puts "GetReport:"

report_request = {
  "Address": {
    "Addr1": "1640 Airport Road #115",
    "City": "Kennesaw",
    "State": "GA",
    "Zip": "30144"
  }
}

report_request_json = JSON.pretty_generate(report_request)

response = app_verification_package_client.address_standardization_client.get_report(report_request_json)
puts response



puts "DeathMasterFileValidation API call:"
puts "GetReport:"

report_request = {
  SSN: "001-01-9101",
  DoB: "1902-09-28"
}

report_request_json = report_request.to_json

response = app_verification_package_client.death_master_file_validation_client.get_report(report_request_json)
puts response


puts "DLVerify API call:"
puts "GetReport:"

report_request = {
  PersonInfo: {
    PersonName: {
      FirstName: "John",
      LastName: "Smith"
    },
    DriversLicense: {
      LicenseNum: "1299011",
      StateProv: "AK"
    }
  }
}

report_request_json = report_request.to_json

response = app_verification_package_client.dl_verify_client.get_report(report_request_json)
puts response


puts "EmailValidation API call:"
puts "GetReport:"

report_request = {
  EmailAddr: "nakkyaattah@gmail.com"
}

report_request_json = report_request.to_json

response = app_verification_package_client.email_validation_client.get_report(report_request_json)
puts response

puts "GetArchiveReport:"

archive_id = "70A56A61-CC9A-4060-B713-48BCA98E2B8D"

archive_response = app_verification_package_client.email_validation_client.get_archive_report(archive_id)
puts archive_response


puts "IPAddressInfo API call:"
puts "GetReport:"

report_request = {
  IP: "172.217.11.4"
}

report_request_json = report_request.to_json

response = app_verification_package_client.ip_address_info_client.get_report(report_request_json)
puts response


puts "OFACWatchlistSearch API call:"
puts "GetReport:"

report_request = {
  PersonInfo: {
    PersonName: {
      LastName: "Miller",
      FirstName: "Jack"
    },
    ContactInfo: [
      {
        PostAddr: {
          Addr1: "478BrickellAve",
          City: "Miami",
          StateProv: "FL",
          PostalCode: "33131",
          Country: "USA"
        }
      }
    ],
    BirthDt: "1968-08-06"
  }
}

report_request_json = report_request.to_json

response = app_verification_package_client.ofac_watchlist_search_client.get_report(report_request_json)
puts response

puts "GetArchiveReport:"

archive_report_request = "{29D095F3-E4CC-4593-A430-0C348A69F0CE}"

archive_response = app_verification_package_client.ofac_watchlist_search_client.get_archive_report(archive_report_request)
puts archive_response


puts "PhoneAddressVerification API call:"
puts "GetReport:"

report_request = {
  PhoneNumber: "5055068223",
  Address: {
    Addr1: "55CHURCHST",
    City: "NEWPORT",
    State: "NH",
    Zip: "03773"
  }
}

report_request_json = report_request.to_json

response = app_verification_package_client.phone_address_verification_client.get_report(report_request_json)
puts response


puts "PhoneNameVerification API call:"
puts "GetReport:"

report_request = {
  Name: {
    FirstName: "MARGUERITE",
    MiddleName: "",
    LastName: "OUELLETTE"
  },
  PhoneNumber: "970-846-4831"
}

report_request_json = report_request.to_json

response = app_verification_package_client.phone_name_verification_client.get_report(report_request_json)
puts response


puts "SSNAddressVerification API call:"
puts "GetReport:"

report_request = {
  SSN: "001-16-6048",
  Address: {
    Addr1: "7442SPRINGVILLAGEDR",
    City: "SPRINGFIELD",
    State: "VA",
    Zip: "22150"
  }
}

report_request_json = report_request.to_json

response = app_verification_package_client.ssn_address_verification_client.get_report(report_request_json)
puts response


puts "SSNNameVerification API call:"
puts "GetReport:"

report_request = {
  SSN: "001-16-6050",
  Name: {
    FirstName: "Albert",
    MiddleName: "Alter",
    LastName: "D"
  }
}

report_request_json = report_request.to_json

response = app_verification_package_client.ssn_name_verification_client.get_report(report_request_json)
puts response


puts "SSNPhoneVerification API call:"
puts "GetReport:"

report_request = {
  SSN: "001-15-9916",
  PhoneNumber: "918-917-0963"
}

report_request_json = report_request.to_json

response = app_verification_package_client.ssn_phone_verification_client.get_report(report_request_json)
puts response


puts "SSNValidation API call:"
puts "GetReport:"

report_request = {
  SSN: "111-22-1212"
}

report_request_json = report_request.to_json

response = app_verification_package_client.ssn_validation_client.get_report(report_request_json)
puts response
```