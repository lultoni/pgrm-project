CLASS z_gen_flights DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z_gen_flights IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA ls_flight      TYPE z05_flight.
    DATA lv_flight_info TYPE string.
    DATA ls_miles       TYPE z05_miles_data.
    DATA ls_last_minute TYPE z05_last_minute.
    DATA ls_ap_ref      TYPE z05_airport_ref.

    DELETE FROM z05_flight.
    DELETE FROM z05_miles_data.
    DELETE FROM z05_last_minute.
    DELETE FROM z05_airport_ref.

    CLEAR ls_flight.
    ls_flight-carrid        = 'LH'.
    ls_flight-connection_id = '001'.
    ls_flight-fldate        = '20231015'.
    ls_flight-dep_airport   = 'MUC'.
    ls_flight-arr_airport   = 'TXL'.
    ls_flight-flight_price  = 100.
    ls_flight-currency_code = 'EUR'.
    INSERT INTO z05_flight VALUES @ls_flight.

    CLEAR ls_miles.
    ls_miles-carrid        = 'LH'.
    ls_miles-connection_id = '001'.
    ls_miles-miles         = 5000.
    INSERT INTO z05_miles_data VALUES @ls_miles.

    CLEAR ls_flight.
    ls_flight-carrid        = 'LH'.
    ls_flight-connection_id = '002'.
    ls_flight-fldate        = '20231016'.
    ls_flight-dep_airport   = 'BER'.
    ls_flight-arr_airport   = 'HAM'.
    ls_flight-flight_price  = 100.
    ls_flight-currency_code = 'EUR'.
    INSERT INTO z05_flight VALUES @ls_flight.

    CLEAR ls_miles.
    ls_miles-carrid        = 'LH'.
    ls_miles-connection_id = '002'.
    ls_miles-miles         = 6000.
    INSERT INTO z05_miles_data VALUES @ls_miles.

    CLEAR ls_last_minute.
    ls_last_minute-agency_id     = 'AG100'.
    ls_last_minute-destination   = 'New York'.
    ls_last_minute-flight_price  = 2000.
    ls_last_minute-currency_code = 'USD'.
    ls_last_minute-flight_date   = '20231015'.
    INSERT INTO z05_last_minute VALUES @ls_last_minute.

    CLEAR ls_last_minute.
    ls_last_minute-agency_id     = 'AG100'.
    ls_last_minute-destination   = 'Los Angeles'.
    ls_last_minute-flight_price  = 2300.
    ls_last_minute-currency_code = 'USD'.
    ls_last_minute-flight_date   = '20231016'.
    INSERT INTO z05_last_minute VALUES @ls_last_minute.

    CLEAR ls_ap_ref.
    ls_ap_ref-airport_code = 'TXL'.
    ls_ap_ref-country      = 'DE'.
    ls_ap_ref-city         = 'Berlin'.
    INSERT INTO z05_airport_ref VALUES @ls_ap_ref.

    CLEAR ls_ap_ref.
    ls_ap_ref-airport_code = 'BER'.
    ls_ap_ref-country      = 'DE'.
    ls_ap_ref-city         = 'Berlin'.
    INSERT INTO z05_airport_ref VALUES @ls_ap_ref.

    CLEAR ls_ap_ref.
    ls_ap_ref-airport_code = 'FRA'.
    ls_ap_ref-country      = 'DE'.
    ls_ap_ref-city         = 'Frankfurt'.
    INSERT INTO z05_airport_ref VALUES @ls_ap_ref.

    CLEAR ls_ap_ref.
    ls_ap_ref-airport_code = 'MUC'.
    ls_ap_ref-country      = 'DE'.
    ls_ap_ref-city         = 'Munich'.
    INSERT INTO z05_airport_ref VALUES @ls_ap_ref.

    CLEAR ls_ap_ref.
    ls_ap_ref-airport_code = 'JFK'.
    ls_ap_ref-country      = 'US'.
    ls_ap_ref-city         = 'New York'.
    INSERT INTO z05_airport_ref VALUES @ls_ap_ref.

    CLEAR ls_ap_ref.
    ls_ap_ref-airport_code = 'LAX'.
    ls_ap_ref-country      = 'US'.
    ls_ap_ref-city         = 'Los Angeles'.
    INSERT INTO z05_airport_ref VALUES @ls_ap_ref.

    CLEAR ls_ap_ref.
    ls_ap_ref-airport_code = 'SFO'.
    ls_ap_ref-country      = 'US'.
    ls_ap_ref-city         = 'San Francisco'.
    INSERT INTO z05_airport_ref VALUES @ls_ap_ref.

    CLEAR ls_ap_ref.
    ls_ap_ref-airport_code = 'ORD'.
    ls_ap_ref-country      = 'US'.
    ls_ap_ref-city         = 'Chicago'.
    INSERT INTO z05_airport_ref VALUES @ls_ap_ref.

    CLEAR ls_ap_ref.
    ls_ap_ref-airport_code = 'DUS'.
    ls_ap_ref-country      = 'DE'.
    ls_ap_ref-city         = 'Dusseldorf'.
    INSERT INTO z05_airport_ref VALUES @ls_ap_ref.

    CLEAR ls_ap_ref.
    ls_ap_ref-airport_code = 'HAM'.
    ls_ap_ref-country      = 'DE'.
    ls_ap_ref-city         = 'Hamburg'.
    INSERT INTO z05_airport_ref VALUES @ls_ap_ref.

    CLEAR ls_ap_ref.
    ls_ap_ref-airport_code = 'PHL'.
    ls_ap_ref-country      = 'US'.
    ls_ap_ref-city         = 'Philadelphia'.
    INSERT INTO z05_airport_ref VALUES @ls_ap_ref.

    CLEAR ls_ap_ref.
    ls_ap_ref-airport_code = 'ATL'.
    ls_ap_ref-country      = 'US'.
    ls_ap_ref-city         = 'Atlanta'.
    INSERT INTO z05_airport_ref VALUES @ls_ap_ref.

    CLEAR ls_ap_ref.
    ls_ap_ref-airport_code = 'MIA'.
    ls_ap_ref-country      = 'US'.
    ls_ap_ref-city         = 'Miami'.
    INSERT INTO z05_airport_ref VALUES @ls_ap_ref.

    CLEAR ls_ap_ref.
    ls_ap_ref-airport_code = 'BCN'.
    ls_ap_ref-country      = 'ES'.
    ls_ap_ref-city         = 'Barcelona'.
    INSERT INTO z05_airport_ref VALUES @ls_ap_ref.

    CLEAR ls_ap_ref.
    ls_ap_ref-airport_code = 'MAD'.
    ls_ap_ref-country      = 'ES'.
    ls_ap_ref-city         = 'Madrid'.
    INSERT INTO z05_airport_ref VALUES @ls_ap_ref.

    CLEAR ls_ap_ref.
    ls_ap_ref-airport_code = 'CDG'.
    ls_ap_ref-country      = 'FR'.
    ls_ap_ref-city         = 'Paris'.
    INSERT INTO z05_airport_ref VALUES @ls_ap_ref.

    CLEAR ls_ap_ref.
    ls_ap_ref-airport_code = 'ORY'.
    ls_ap_ref-country      = 'FR'.
    ls_ap_ref-city         = 'Paris'.
    INSERT INTO z05_airport_ref VALUES @ls_ap_ref.

    CLEAR ls_ap_ref.
    ls_ap_ref-airport_code = 'LHR'.
    ls_ap_ref-country      = 'GB'.
    ls_ap_ref-city         = 'London'.
    INSERT INTO z05_airport_ref VALUES @ls_ap_ref.

    CLEAR ls_ap_ref.
    ls_ap_ref-airport_code = 'LGW'.
    ls_ap_ref-country      = 'GB'.
    ls_ap_ref-city         = 'London'.
    INSERT INTO z05_airport_ref VALUES @ls_ap_ref.

    CLEAR ls_ap_ref.
    ls_ap_ref-airport_code = 'AMS'.
    ls_ap_ref-country      = 'NL'.
    ls_ap_ref-city         = 'Amsterdam'.
    INSERT INTO z05_airport_ref VALUES @ls_ap_ref.

    CLEAR ls_ap_ref.
    ls_ap_ref-airport_code = 'FCO'.
    ls_ap_ref-country      = 'IT'.
    ls_ap_ref-city         = 'Rome'.
    INSERT INTO z05_airport_ref VALUES @ls_ap_ref.

    CLEAR ls_ap_ref.
    ls_ap_ref-airport_code = 'MXP'.
    ls_ap_ref-country      = 'IT'.
    ls_ap_ref-city         = 'Milan'.
    INSERT INTO z05_airport_ref VALUES @ls_ap_ref.

    CLEAR ls_ap_ref.
    ls_ap_ref-airport_code = 'NRT'.
    ls_ap_ref-country      = 'JP'.
    ls_ap_ref-city         = 'Tokyo'.
    INSERT INTO z05_airport_ref VALUES @ls_ap_ref.

    CLEAR ls_ap_ref.
    ls_ap_ref-airport_code = 'KIX'.
    ls_ap_ref-country      = 'JP'.
    ls_ap_ref-city         = 'Osaka'.
    INSERT INTO z05_airport_ref VALUES @ls_ap_ref.

    CLEAR ls_ap_ref.
    ls_ap_ref-airport_code = 'PEK'.
    ls_ap_ref-country      = 'CN'.
    ls_ap_ref-city         = 'Beijing'.
    INSERT INTO z05_airport_ref VALUES @ls_ap_ref.

    CLEAR ls_ap_ref.
    ls_ap_ref-airport_code = 'PVG'.
    ls_ap_ref-country      = 'CN'.
    ls_ap_ref-city         = 'Shanghai'.
    INSERT INTO z05_airport_ref VALUES @ls_ap_ref.

    lv_flight_info = 'Example data has been generated.'.
    out->write( lv_flight_info ).
  ENDMETHOD.

ENDCLASS.
