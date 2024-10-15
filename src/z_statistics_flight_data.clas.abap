CLASS z_statistics_flight_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z_statistics_flight_data IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA: lv_country TYPE char10,
          lv_city    TYPE char20,
          lv_airport TYPE char10,
          lv_search_criteria TYPE char10,
          lt_flights TYPE TABLE OF z05_flight,
          lt_all_flights TYPE TABLE OF z05_flight,
          ls_flight  TYPE z05_flight,
          lt_ref_airports TYPE TABLE OF z05_airport_ref,
          ls_ref_airport TYPE z05_airport_ref,
          lt_result  TYPE TABLE OF string,
          lv_result  TYPE string,
          lv_departures TYPE string,
          lv_landings  TYPE string,
          lv_departures_count TYPE i,
          lv_landings_count  TYPE i.

    lv_search_criteria = 'CNT'.  " Example: Values can be 'CTY', 'CNT', 'CAP'

    CASE lv_search_criteria.
      WHEN 'CNT'. " Search by country
        lv_country = 'DE'.
        SELECT airport_code, country, city FROM z05_airport_ref
          WHERE country = @lv_country
          INTO TABLE @lt_ref_airports.

      WHEN 'CTY'. " Search by city
        lv_city = 'Berlin'.
        SELECT airport_code, country, city FROM z05_airport_ref
          WHERE city = @lv_city
          INTO TABLE @lt_ref_airports.

      WHEN 'CAP'. " Search by airport code
        lv_airport = 'TXL'.
        SELECT airport_code, country, city FROM z05_airport_ref
          WHERE airport_code = @lv_airport
          INTO TABLE @lt_ref_airports.

      WHEN OTHERS.
        out->write( 'Invalid search criteria' ).
        RETURN.
    ENDCASE.

    SORT lt_ref_airports BY airport_code.
    DELETE ADJACENT DUPLICATES FROM lt_ref_airports COMPARING airport_code.

    " Fetch all flights that match the dep/arr airports
    LOOP AT lt_ref_airports INTO ls_ref_airport.
      SELECT * FROM z05_flight
        WHERE dep_airport = @ls_ref_airport-airport_code OR arr_airport = @ls_ref_airport-airport_code
        INTO TABLE @lt_flights.

      " Append the results into a consolidated table
      APPEND LINES OF lt_flights TO lt_all_flights.
    ENDLOOP.

    SORT lt_all_flights BY carrid connection_id fldate.
    DELETE ADJACENT DUPLICATES FROM lt_all_flights COMPARING carrid connection_id fldate dep_airport arr_airport.

    LOOP AT lt_ref_airports INTO ls_ref_airport.
      CLEAR: lv_departures_count, lv_landings_count.

      lv_departures_count = REDUCE i( INIT x = 0 FOR flight IN lt_all_flights WHERE ( dep_airport = ls_ref_airport-airport_code ) NEXT x = x + 1 ).
      lv_landings_count   = REDUCE i( INIT x = 0 FOR flight IN lt_all_flights WHERE ( arr_airport = ls_ref_airport-airport_code ) NEXT x = x + 1 ).

      lv_departures = lv_departures_count.
      lv_landings   = lv_landings_count.

      CONCATENATE 'Departures from:  ' ls_ref_airport-airport_code ' (' ls_ref_airport-city ', ' ls_ref_airport-country '): ' lv_departures INTO lv_result.
      APPEND lv_result TO lt_result.

      CONCATENATE 'Landings at:  ' ls_ref_airport-airport_code ' (' ls_ref_airport-city ', ' ls_ref_airport-country '): ' lv_landings INTO lv_result.
      APPEND lv_result TO lt_result.

    ENDLOOP.

    LOOP AT lt_result INTO lv_result.
      out->write( lv_result ).
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
