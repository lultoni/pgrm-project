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
          lt_flights TYPE TABLE OF z05_flight,
          ls_flight  TYPE z05_flight,
          lt_result  TYPE TABLE OF string,
          lv_result  TYPE string,
          lv_departures TYPE string,
          lv_landings  TYPE string,
          lv_departures_count TYPE i,
          lv_landings_count  TYPE i.

    lv_country = 'DE'.
    lv_city = 'Berlin'.
    lv_airport = 'TXL'.

    SELECT * FROM z05_flight

      WHERE carrid = @lv_country
        AND ( dep_airport = @lv_airport OR arr_airport = @lv_airport )
      INTO TABLE @lt_flights.

    lv_departures_count = REDUCE i( INIT x = 0 FOR flight IN lt_flights WHERE ( dep_airport = lv_airport ) NEXT x = x + 1 ).
    lv_landings_count   = REDUCE i( INIT x = 0 FOR flight IN lt_flights WHERE ( arr_airport = lv_airport ) NEXT x = x + 1 ).

    lv_departures = lv_departures_count.
    lv_landings   = lv_landings_count.

    CONCATENATE 'Departures from ' lv_airport ': ' lv_departures INTO lv_result.
    APPEND lv_result TO lt_result.

    CONCATENATE 'Landings at ' lv_airport ': ' lv_landings INTO lv_result.
    APPEND lv_result TO lt_result.

    LOOP AT lt_result INTO lv_result.
      out->write( lv_result ).
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
