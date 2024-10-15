CLASS z_last_minute_offers DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z_last_minute_offers IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA: lv_offers TYPE string,
          lt_offers TYPE TABLE OF z05_last_minute,
          ls_offer TYPE z05_last_minute.

    SELECT *
      FROM z05_last_minute
      WHERE agency_id = 'AG100'
      INTO TABLE @lt_offers.

    IF sy-subrc = 0.
      LOOP AT lt_offers INTO ls_offer.
        CONCATENATE 'Destination:' ls_offer-destination
                    'Date:' ls_offer-flight_date
                    INTO lv_offers SEPARATED BY space.
        out->write( lv_offers ).
      ENDLOOP.
    ELSE.
      out->write( 'No offers available for this agency.' ).
    ENDIF.
  ENDMETHOD.

ENDCLASS.
