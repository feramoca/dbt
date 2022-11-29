{{
  config(
    materialized='view'
  )
}}

WITH src_tiempo AS (
    SELECT * 
    FROM {{ source('ab_schema', 'tiempo3') }}
    ),

tiempo AS (
    SELECT
          estacion
        , magnitud
        , punto_muestreo
        , hora
        , temperatura
        
  
        
    FROM src_tiempo
    unpivot(temperatura for hora in (h01, h02, h03, h04, h05, h06, h07, h08, h09, h10, h11, h12, h13, h14, h15, h16, h17, h18, h19, h20, h21, h22, h23, h24))
    where magnitud = 83
    )

SELECT * FROM tiempo
 