CLASS z_flight_info_2 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z_flight_info_2 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA: lt_flights TYPE TABLE OF z05_flight,
          ls_flight TYPE z05_flight,
          lv_flight_info TYPE string.

    " Flugnummer hart codiert (z.B., LH für Lufthansa Flug)
    SELECT *
      FROM z05_flight
      WHERE carrid = 'LH'
      INTO TABLE @lt_flights.

    IF sy-subrc = 0.
      LOOP AT lt_flights INTO ls_flight.
        CONCATENATE 'Flight: ' ls_flight-carrid
                    ' Date: ' ls_flight-fldate
                    INTO lv_flight_info SEPARATED BY space.
        out->write( lv_flight_info ).
      ENDLOOP.
    ELSE.
      out->write( 'Flight not found.' ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.
