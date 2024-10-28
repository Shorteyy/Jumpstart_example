
view: sql_runner_query_test {
  derived_table: {
    sql: select * from `customer-data-platform-319611.thelook_ecommerce.distribution_centers` dc
      join `customer-data-platform-319611.thelook_ecommerce.products` p
      on dc.id = p.distribution_center_id ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: id_1 {
    type: number
    sql: ${TABLE}.id_1 ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: name_1 {
    type: string
    sql: ${TABLE}.name_1 ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: retail_price {
    type: number
    sql: ${TABLE}.retail_price ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  dimension: distribution_center_id {
    type: number
    sql: ${TABLE}.distribution_center_id ;;
  }

  dimension: location {
    type: location
    sql_latitude: ${TABLE}.latitude ;;
    sql_longitude: ${TABLE}.longitude ;;
  }
  set: detail {
    fields: [
        id,
	name,
	latitude,
	longitude,
	id_1,
	cost,
	category,
	name_1,
	brand,
	retail_price,
	department,
	sku,
	distribution_center_id,
	location
    ]
  }
}
