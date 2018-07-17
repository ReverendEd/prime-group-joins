Get all customers and their addresses.
SELECT * FROM "customers" 
JOIN "addresses" on "customers"."id" = "addresses"."customer_id";
Get all orders and their line items.
SELECT * FROM "orders" 
JOIN "line_items" on "orders"."id" = "line_items"."order_id";
Which warehouses have cheetos?
SELECT "warehouse" FROM "warehouse"
JOIN "warehouse_product" ON "warehouse"."id" = "warehouse_product"."warehouse_id"
JOIN "products" ON "warehouse_product"."product_id" = "products"."id"
WHERE "products"."description" = 'cheetos';
Which warehouses have diet pepsi?
SELECT "warehouse" FROM "warehouse"
JOIN "warehouse_product" ON "warehouse"."id" = "warehouse_product"."warehouse_id"
JOIN "products" ON "warehouse_product"."product_id" = "products"."id"
WHERE "products"."description" = 'diet pepsi';
Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT "customers".first_name, "customers".last_name, count("orders"."address_id") FROM "customers"
JOIN "addresses" ON "customers".id = "addresses".customer_id 
JOIN "orders" ON "addresses".id = "orders".address_id
GROUP BY "customers".first_name, "customers".last_name;
How many customers do we have?
SELECT count("customers".id) FROM "customers";
How many products do we carry?
SELECT count("products".id) FROM "products";
What is the total available on-hand quantity of diet pepsi?
SELECT sum("warehouse_product".on_hand) FROM "warehouse_product"
JOIN "products" ON "warehouse_product".product_id = "products".id
WHERE "products".description = 'diet pepsi';