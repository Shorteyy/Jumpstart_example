view: provinces_be {
  derived_table: {
    sql: SELECT *
      FROM UNNEST([
        STRUCT('BEVWV' AS id, 'West Flanders' AS name, 800000 as inhabitants),
        STRUCT('BEVOV' AS id, 'East Flanders' AS name, 850000 as inhabitants),
        STRUCT('BEVAN' AS id, 'Antwerp' AS name, 1000000 as inhabitants),
        STRUCT('BEVLI' AS id, 'Limburg' AS name, 700000 as inhabitants),
        STRUCT('BEVBR' AS id, 'Flemish Brabant' AS name, 600000 as inhabitants),
        STRUCT('BEBRU' AS id, 'Brussels' AS name, 2000000 as inhabitants),
        STRUCT('BEWBR' AS id, 'Walloon Brabant' AS name, 500000 as inhabitants),
        STRUCT('BEWHT' AS id, 'Hainaut' AS name, 650000 as inhabitants),
        STRUCT('BEWNA' AS id, 'Namur' AS name, 660000 as inhabitants),
        STRUCT('BEWLG' AS id, 'Liege' AS name, 800000 as inhabitants),
        STRUCT('BEWLX' AS id, 'Luxembourg' AS name, 900000 as inhabitants)
      ]) ;;
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
    map_layer_name: belgian_provinces
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
    map_layer_name: belgian_provinces
  }

  dimension: inhabitants {
    type: number
    sql: ${TABLE}.inhabitants ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: total_inhabitants {
    type: sum
    sql: ${inhabitants} ;;
  }

  set: detail {
    fields: [
        id,
        name,
        inhabitants
    ]
  }
}
