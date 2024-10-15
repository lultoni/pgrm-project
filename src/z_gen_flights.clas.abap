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
          lv_flight_info TYPE string.

    CLEAR ls_flight.
    ls_flight-carrid = 'LH'.
    ls_flight-connection_id = '001'.
    ls_flight-fldate = '20231015'.
    INSERT INTO z05_flight VALUES @ls_flight.

    CLEAR ls_flight.
    ls_flight-carrid = 'LH'.
    ls_flight-connection_id = '002'.
    ls_flight-fldate = '20231016'.
    INSERT INTO z05_flight VALUES @ls_flight.

*    CONCATENATE 'Flight data has been generated.' INTO lv_flight_info SEPARATED BY space.
    lv_flight_info = 'Flight data has been generated.'.
    out->write( lv_flight_info ).

  ENDMETHOD.

ENDCLASS.
