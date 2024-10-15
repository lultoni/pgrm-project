CLASS z_flight_miles_sync DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z_flight_miles_sync IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA: lv_sync_status TYPE string,
          lt_flights TYPE TABLE OF z05_flight,
          lt_miles TYPE TABLE OF z05_miles_data,
          ls_flight TYPE z05_flight,
          ls_miles TYPE z05_miles_data.

    SELECT *
      FROM z05_flight
      WHERE carrid = 'LH'
      INTO TABLE @lt_flights.

    SELECT *
      FROM z05_miles_data
      WHERE carrid = 'LH'
      INTO TABLE @lt_miles.

    IF sy-subrc = 0 AND lt_miles IS NOT INITIAL.
      LOOP AT lt_flights INTO ls_flight.
        READ TABLE lt_miles INTO ls_miles WITH KEY carrid = ls_flight-carrid.
        IF sy-subrc = 0.
          lv_sync_status = 'Flight data synchronized with Miles & More.'.
        ELSE.
          lv_sync_status = 'Miles & More data not found.'.
        ENDIF.
        out->write( lv_sync_status ).
      ENDLOOP.
    ELSE.
      out->write( 'Flight or Miles & More data not found.' ).
    ENDIF.
  ENDMETHOD.

ENDCLASS.
