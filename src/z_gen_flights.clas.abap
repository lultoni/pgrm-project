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
    DATA: lt_flights TYPE TABLE OF z05_flight,
          ls_flight TYPE z05_flight,
          lv_flight_info TYPE string,
          ls_miles TYPE z05_miles_data,
          ls_last_minute TYPE z05_last_minute.

    CLEAR ls_flight.
    ls_flight-carrid = 'LH'.
    ls_flight-connection_id = '001'.
    ls_flight-fldate = '20231015'.
    INSERT INTO z05_flight VALUES @ls_flight.

    CLEAR ls_miles.
    ls_miles-carrid = 'LH'.
    ls_miles-connection_id = '001'.
    ls_miles-miles = 5000.
    INSERT INTO z05_miles_data VALUES @ls_miles.

    CLEAR ls_flight.
    ls_flight-carrid = 'LH'.
    ls_flight-connection_id = '002'.
    ls_flight-fldate = '20231016'.
    INSERT INTO z05_flight VALUES @ls_flight.

    CLEAR ls_miles.
    ls_miles-carrid = 'LH'.
    ls_miles-connection_id = '002'.
    ls_miles-miles = 6000.
    INSERT INTO z05_miles_data VALUES @ls_miles.

    CLEAR ls_last_minute.
    ls_last_minute-agency_id = 'AG100'.
    ls_last_minute-destination = 'New York'.
    ls_last_minute-flight_price = 2000.
    ls_last_minute-currency_code = 'USD'.
    ls_last_minute-flight_date = '20231015'.
    INSERT INTO z05_last_minute VALUES @ls_last_minute.

    CLEAR ls_last_minute.
    ls_last_minute-agency_id = 'AG100'.
    ls_last_minute-destination = 'Los Angeles'.
    ls_last_minute-flight_price = 2300.
    ls_last_minute-currency_code = 'USD'.
    ls_last_minute-flight_date = '20231016'.
    INSERT INTO z05_last_minute VALUES @ls_last_minute.

    lv_flight_info = 'Flight data, miles data, and last minute offers data have been generated.'.
    out->write( lv_flight_info ).

  ENDMETHOD.

ENDCLASS.
