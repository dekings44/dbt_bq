

{{ config(materialized='table') }}

with proptech as (

    select 
      s.orderdate, s.Channel, 
      s.Order_Quantity, s.Unit_Price, s.Line_Total, s.Total_Unit_Cost, 
      c.Customer_Names, p.Product_Name, r.Territory, r.City, 

    from dbt_project.sales s 
        join dbt_project.customers c on s.Customer_Name_Index = c.Customer_Index
        join dbt_project.products p on s.Product_Description_Index = p.Index
        join dbt_project.regions r on s.Delivery_Region_Index = r.Index

)

select *
from proptech
