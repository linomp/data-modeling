USE `mangata_gallo_exercise`;

-- Create the `orders_view` view
CREATE OR REPLACE VIEW `orders_view` AS
SELECT
    o.`OrderID`,
    o.`ClientID`,
    c.`FullName`,
    p.`ProductName`,
    o.`Quantity`,
    o.`TotalCost`, -- Use the existing `TotalCost` column
    d.`DeliveryStatus`,
    d.`DeliveryDate`,
    a.`Street`
FROM
    `Orders` AS o
JOIN
    `Clients` AS c ON o.`ClientID` = c.`ClientID`
JOIN
    `Products` AS p ON o.`ProductID` = p.`ProductID`
JOIN
    `Delivery` AS d ON o.`OrderID` = d.`OrderID`
JOIN
    `Address` AS a ON d.`AddressID` = a.`AddressID`;
