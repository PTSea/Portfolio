# Cateogry table
INSERT INTO Category (category_name) VALUES ('Reuse'), ('Repair');

# Subcategory table
INSERT INTO Subcategory (subcategory_name) VALUES
('Appliances, Large'),
('Appliances, Small'),
('Art Supplies'),
('Bedding/Bath'),
('Bikes/Exercise/Sporting/Camping'),
('Books'),
('Brown Paper/Large Shopping Bags'),
('Building Materials/Home Improvement'),
('CDs, DVDs, LPs, Video Games, etc'),
('Cell Phones'),
("Children's Goods/Clothing"),
('Clothing/Accessories'),
('Computer Paper'),
('Computers/Monitors'),
('Egg Cartons'),
('Eyeglasses'),
('Fabric'),
('Firewood'),
('Food (unopened, pre-expired)'),
('Food (surplus garden produce)'),
('Food Containers (clean glass/plastic w/lids)'),
('Furniture'),
('Garden/Farm/Landscaping'),
('Garden Pots'),
('Home Electronics'),
('Household Goods'),
('Medical Equipment/Supplies'),
('Office Equipment'),
('Office Supplies'),
('Packing Materials'),
('Pet Supplies/Food'),
('Printer Cartridge Refilling'),
('School Supplies'),
('Toiletries'),
('Vehicles/Parts'),
('Lawn Equipment'),
('Reel Mowers'),
('Sandals'),
('Screen Repair'),
('Shoes, Boots'),
('Upholstery, Furniture');



# REUSE DIRECTORY
#Albany-Corvallis ReUseIt (free items:  groups.yahoo.com)
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), 'Albany-Corvallis ReUseIt (free items:  groups.yahoo.com)', NULL, NULL, NULL, NULL, 'https://groups.yahoo.com/neo/groups/albanycorvallisReUseIt/info');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Appliances, Large'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Appliances, Small'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Art Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Bedding/Bath'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Bikes/Exercise/Sporting/Camping'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Books'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Brown Paper/Large Shopping Bags'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Building Materials/Home Improvement'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'CDs, DVDs, LPs, Video Games, etc'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Cell Phones'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = "Children's Goods/Clothing"));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Clothing/Accessories'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Computer Paper'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Computers/Monitors'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Egg Cartons'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Eyeglasses'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Fabric'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Firewood'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Food (unopened, pre-expired)'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Food (surplus garden produce)'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Food Containers (clean glass/plastic w/lids)'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Furniture'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Garden/Farm/Landscaping'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Garden Pots'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Home Electronics'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Household Goods'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Medical Equipment/Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Office Equipment'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Office Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Packing Materials'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Pet Supplies/Food'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'School Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Toiletries'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Vehicles/Parts'));

#Arc Thrift Store
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('928', 'NW Beca Ave', 'Corvallis', 'OR', '97330', '44.5779770:-123.2615670');
INSERT INTO Hours (hours_entry) VALUES ('Mon 10AM-5:30PM, Tue 10AM-5:30PM, Wed 10AM-5:30PM, Thu 10AM-5:30PM, Fri 10AM-5:30PM, Sat 10AM-5:30PM, Sun 12PM-5:30PM');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), 'Arc Thrift Store', (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 754-9011', NULL, (SELECT hours_id FROM Hours ORDER BY hours_id DESC LIMIT 1), 'http://www.arcbenton.org/');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Appliances, Small'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Art Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Bedding/Bath'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Bikes/Exercise/Sporting/Camping'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Books'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Brown Paper/Large Shopping Bags'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'CDs, DVDs, LPs, Video Games, etc'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = "Children's Goods/Clothing"));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Clothing/Accessories'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Computers/Monitors'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Fabric'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Furniture'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Garden/Farm/Landscaping'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Garden Pots'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Home Electronics'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Household Goods'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Medical Equipment/Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Office Equipment'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Office Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Pet Supplies/Food'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Printer Cartridge Refilling'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'School Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Vehicles/Parts'));

#Arc Thrift Store philomath
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('936', 'Main St', 'Philomath', 'OR', '97370', '44.5398990:-123.3727890');
INSERT INTO Hours (hours_entry) VALUES ('Mon 10AM-5:30PM, Tue 10AM-5:30PM, Wed 10AM-5:30PM, Thu 10AM-5:30PM, Fri 10AM-5:30PM, Sat 10AM-5:30PM, Sun 12PM-5:30PM');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), 'Arc Thrift Store', (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 929-3946', NULL, (SELECT hours_id FROM Hours ORDER BY hours_id DESC LIMIT 1), 'http://www.arcbenton.org/');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Appliances, Small'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Art Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Bedding/Bath'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Bikes/Exercise/Sporting/Camping'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Books'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Brown Paper/Large Shopping Bags'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'CDs, DVDs, LPs, Video Games, etc'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = "Children's Goods/Clothing"));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Clothing/Accessories'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Computers/Monitors'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Fabric'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Furniture'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Garden/Farm/Landscaping'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Garden Pots'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Home Electronics'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Household Goods'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Medical Equipment/Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Office Equipment'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Office Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Pet Supplies/Food'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Printer Cartridge Refilling'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'School Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Vehicles/Parts'));

#Beekman Place Antique Mall 
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('601', 'SW Western Blvd', 'Corvallis', 'OR', '97330', '44.5602590:-123.2666830');
INSERT INTO Hours (hours_entry) VALUES ('Mon Closed, Tue 11AM-5PM, Wed 11AM-5PM, Thu 11AM-5PM, Fri 11AM-5PM, Sat 11AM-5PM, Sun 12PM-5PM');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), 'Beekman Place Antique Mall', (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 753-8250', NULL, (SELECT hours_id FROM Hours ORDER BY hours_id DESC LIMIT 1), 'https://www.antiquemalls.com/or/corvallis/97333/16882');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Furniture'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Household Goods'));

#Benton County Extension / 4-H  Activities
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('1849', 'NW 9th St', 'Corvallis', 'OR', '97330', '44.5859090:-123.2565050');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), 'Benton County Extension/4-H  Activities', (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 766-6750', NULL, NULL, 'http://extension.oregonstate.edu/benton/');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Art Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Fabric'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'School Supplies'));

#Benton County Master Gardeners
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('1849', 'NW 9th St', 'Corvallis', 'OR', '97330', '44.5859090:-123.2565050');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), 'Benton County Master Gardeners', (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 766-6750', NULL, NULL, 'http://extension.oregonstate.edu/benton/horticulture/mg');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Books'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Garden/Farm/Landscaping'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Garden Pots'));

#Book Bin
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('215', 'SW 4th St', 'Corvallis', 'OR', '97333', '44.5632720:-123.2624060');
INSERT INTO Hours (hours_entry) VALUES ('Mon 8:30AM-9PM, Tue 8:30AM-9PM, Wed 8:30AM-9PM, Thu 8:30AM-9PM, Fri 8:30AM-9PM, Sat 8:30AM-9PM, Sun 9AM-7PM');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), 'Book Bin', (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 752-0040', NULL, (SELECT hours_id FROM Hours ORDER BY hours_id DESC LIMIT 1), 'http://bookbin.com/');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Books'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'CDs, DVDs, LPs, Video Games, etc'));

#Browser's Bookstore
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('121', 'NW 4th St', 'Corvallis', 'OR', '97330', '44.5649870:-123.2614510');
INSERT INTO Hours (hours_entry) VALUES ('Mon 9:30AM-6PM, Tue 9:30AM-6PM, Wed 9:30AM-6PM, Thu 9:30AM-6PM, Fri 9:30AM-6PM, Sat 9:30AM-6PM, Sun Closed');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), "Browser's Bookstore", (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(888) 758-1121', NULL, (SELECT hours_id FROM Hours ORDER BY hours_id DESC LIMIT 1), 'http://www.browsersbookstore.com/');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Books'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'CDs, DVDs, LPs, Video Games, etc'));

#Boys & Girls Club / STARS (after school programs)
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('1112', 'NW Circle Blvd', 'Corvallis', 'OR', '97330', '44.5887140:-123.2639010');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), 'Boys & Girls Club/STARS (after school programs)', (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 757-1909', NULL, NULL, 'http://www.bgccorvallis.org/');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Art Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Brown Paper/Large Shopping Bags'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'CDs, DVDs, LPs, Video Games, etc'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Computer Paper'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Egg Cartons'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Fabric'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Garden/Farm/Landscaping'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Garden Pots'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Office Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'School Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Toiletries'));

#Buckingham Palace
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('600', 'SW 3rd St', 'Corvallis', 'OR', '97333', '44.5593320:-123.2638190');
INSERT INTO Hours (hours_entry) VALUES ('Mon Closed, Tue Closed, Wed Closed, Thu Closed, Fri Open, Sat Closed, Sun Open');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), 'Buckingham Palace', (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 752-7980', NULL, (SELECT hours_id FROM Hours ORDER BY hours_id DESC LIMIT 1), NULL);

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Art Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Bikes/Exercise/Sporting/Camping'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Books'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Brown Paper/Large Shopping Bags'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'CDs, DVDs, LPs, Video Games, etc'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Fabric'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Furniture'));

#CARDV (Center Against Rape/Domestic Violence)
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('4786', 'SW Philomath Blvd', 'Corvallis', 'OR', '97333', '44.5528650:-123.3049680');
INSERT INTO Hours (hours_entry) VALUES ('Mon 9AM-5PM, Tue 9AM-5PM, Wed 9AM-5PM, Thu 9AM-5PM, Fri 9AM-5PM, Sat Closed, Sun Closed');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), 'CARDV (Center Against Rape/Domestic Violence)', (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 758-0219', NULL, (SELECT hours_id FROM Hours ORDER BY hours_id DESC LIMIT 1), 'http://cardv.org/');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Appliances, Small'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Books'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'CDs, DVDs, LPs, Video Games, etc'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Cell Phones'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Firewood'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Food (unopened, pre-expired)'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Food (surplus garden produce)'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Home Electronics'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Household Goods'));

#Career Closet for Women
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('942', 'NW 9th St, Ste.A', 'Corvallis', 'OR', '97330', '44.5743780:-123.2632970');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), 'Career Closet for Women', (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 754-6979', NULL, NULL, 'https://sicorvallis.wordpress.com/');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Clothing/Accessories'));

#Cat's Meow Humane Society Thrift Shop
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('411', 'SW 3rd St', 'Corvallis', 'OR', '97333', '44.5610050:-123.2622430');
INSERT INTO Hours (hours_entry) VALUES ('Mon 10AM-5PM, Tue 10AM-5PM, Wed 10AM-5PM, Thu 10AM-5PM, Fri 10AM-5PM, Sat 10AM-5PM, Sun Closed');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), "Cat's Meow Humane Society Thrift Shop", (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 757-0573', NULL, (SELECT hours_id FROM Hours ORDER BY hours_id DESC LIMIT 1), 'http://www.heartlandhumane.org/');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Appliances, Small'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Art Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Bedding/Bath'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Bikes/Exercise/Sporting/Camping'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Books'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Brown Paper/Large Shopping Bags'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'CDs, DVDs, LPs, Video Games, etc'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Cell Phones'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = "Children's Goods/Clothing"));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Clothing/Accessories'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Eyeglasses'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Fabric'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Furniture'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Garden/Farm/Landscaping'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Home Electronics'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Household Goods'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Medical Equipment/Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Office Equipment'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Office Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Pet Supplies/Food'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'School Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Toiletries'));

#Children's Farm Home
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('4455', 'NE Hwy 20', 'Corvallis', 'OR', '97330', '44.6084370:-123.2144370');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), "Children's Farm Home", (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 757-1852', NULL, NULL, 'http://www.trilliumfamily.org/');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Appliances, Small'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Art Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Bikes/Exercise/Sporting/Camping'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Building Materials/Home Improvement'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'CDs, DVDs, LPs, Video Games, etc'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = "Children's Goods/Clothing"));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Clothing/Accessories'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Furniture'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Garden/Farm/Landscaping'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Home Electronics'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Office Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'School Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Toiletries'));

#Chintimini Wildlife Rehabilitation Ctr
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('311', 'NW Lewisburg Ave', 'Corvallis', 'OR', '97330', '44.6290230:-123.2471050');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), 'Chintimini Wildlife Rehabilitation Center', (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 745-5324', NULL, NULL, 'http://www.chintiminiwildlife.org/');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Bedding/Bath'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Building Materials/Home Improvement'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Food (surplus garden produce)'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Garden/Farm/Landscaping'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Medical Equipment/Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Pet Supplies/Food'));

#Community Outreach (homeless shelter)
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('865', 'NW Reiman Ave', 'Corvallis', 'OR', '97330', '44.5732410:-123.2622370');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), 'Community Outreach (homeless shelter)', (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 758-3000', NULL, NULL, 'http://www.communityoutreachinc.org/services/emergency-shelter-program/family-shelter/');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Art Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Bedding/Bath'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Food (unopened, pre-expired)'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Food (surplus garden produce)'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'School Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Toiletries'));

#Corvallis Environmental Center
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('214', 'SW Monroe Ave', 'Corvallis', 'OR', '97333', '44.5642370:-123.2604800');
INSERT INTO Hours (hours_entry) VALUES ('Mon 9AM-5PM, Tue 9AM-5PM, Wed 9AM-5PM, Thu 9AM-5PM, Fri 9AM-5PM, Sat Closed, Sun Closed');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), 'Corvallis Environmental Center', (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 753-9211', NULL, (SELECT hours_id FROM Hours ORDER BY hours_id DESC LIMIT 1), 'http://www.corvallisenvironmentalcenter.org/');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Art Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Computer Paper'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Garden Pots'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Office Equipment'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'School Supplies'));

#Corvallis Bicycle Collective
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('33900', 'SE Roche Ln Unit B', 'Corvallis', 'OR', '97333', '44.5634720:-123.2511560');
INSERT INTO Hours (hours_entry) VALUES ('Mon Closed, Tue 12PM-4PM, Wed 12PM-4PM, Thu 12PM-4PM, Fri 12PM-4PM, Sat 12PM-4PM, Sun 12PM-4PM');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), 'Corvallis Bicycle Collective', (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 224-6885', NULL, (SELECT hours_id FROM Hours ORDER BY hours_id DESC LIMIT 1), 'http://corvallisbikes.org/');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Bikes/Exercise/Sporting/Camping'));

#Corvallis Furniture
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('1810', 'SW 3rd St', 'Corvallis', 'OR', '97333', '44.5474760:-123.2656600');
INSERT INTO Hours (hours_entry) VALUES ('Mon 10AM-3PM, Tue 10AM-6PM, Wed 10AM-6PM, Thu 10AM-6PM, Fri 10AM-6PM, Sat 10AM-3PM, Sun 10AM-3PM');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), 'Corvallis Furniture', (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 286-4658', NULL, (SELECT hours_id FROM Hours ORDER BY hours_id DESC LIMIT 1), 'http://corvallisfurniture.com/');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Bikes/Exercise/Sporting/Camping'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Furniture'));

#Corvallis-Uzhhorod Sister Cities/The TOUCH Project
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), 'Corvallis-Uzhhorod Sister Cities/The TOUCH Project', NULL, '(541) 753-5170', NULL, NULL, 'http://www.sistercities.corvallis.or.us/uzhhorod');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Medical Equipment/Supplies'));

#Cosmic Chameleon
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('138', 'SW 2nd St', 'Corvallis', 'OR', '97333', '44.5634530:-123.2605640');
INSERT INTO Hours (hours_entry) VALUES ('Mon 12PM-6PM, Tue 11PM-6PM, Wed 11PM-6PM, Thu 11PM-6PM, Fri 11PM-6PM, Sat 10PM-6PM, Sun Closed');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), "Cosmic Chameleon", (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 752-9001', NULL, (SELECT hours_id FROM Hours ORDER BY hours_id DESC LIMIT 1), NULL);

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Brown Paper/Large Shopping Bags'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = "Children's Goods/Clothing"));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Clothing/Accessories'));

#Craigslist (corvallis.craigslist.org and Freecycle.org)
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), "Craigslist (corvallis.craigslist.org and Freecycle.org)", NULL, NULL, NULL, NULL, 'https://corvallis.craigslist.org/');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Appliances, Large'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Appliances, Small'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Art Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Bedding/Bath'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Bikes/Exercise/Sporting/Camping'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Books'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Brown Paper/Large Shopping Bags'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Building Materials/Home Improvement'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'CDs, DVDs, LPs, Video Games, etc'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Cell Phones'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = "Children's Goods/Clothing"));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Clothing/Accessories'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Computer Paper'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Computers/Monitors'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Egg Cartons'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Eyeglasses'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Fabric'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Firewood'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Food (unopened, pre-expired)'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Food (surplus garden produce)'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Food Containers (clean glass/plastic w/lids)'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Furniture'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Garden/Farm/Landscaping'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Garden Pots'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Home Electronics'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Household Goods'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Medical Equipment/Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Office Equipment'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Office Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Packing Materials'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Pet Supplies/Food'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'School Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Toiletries'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Vehicles/Parts'));

#First Alternative Co-op Recycling Center
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('1007', 'SE 3rd St', 'Corvallis', 'OR', '97333', '44.5538160:-123.2645310');
INSERT INTO Hours (hours_entry) VALUES ('Mon 7AM-10PM, Tue 7AM-10PM, Wed 7AM-10PM, Thu 7AM-10PM, Fri 7AM-10PM, Sat 7AM-10PM, Sun 7AM-10PM');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), "First Alternative Co-op Recycling Center", (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 753-3115', NULL, (SELECT hours_id FROM Hours ORDER BY hours_id DESC LIMIT 1), 'http://firstalt.coop/');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Appliances, Large'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Appliances, Small'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Garden Pots'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Packing Materials'));

#First Alternative Co-op Store (South store)
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('1007', 'SE 3rd St', 'Corvallis', 'OR', '97333', '44.5538160:-123.2645310');
INSERT INTO Hours (hours_entry) VALUES ('Mon 7AM-10PM, Tue 7AM-10PM, Wed 7AM-10PM, Thu 7AM-10PM, Fri 7AM-10PM, Sat 7AM-10PM, Sun 7AM-10PM');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), "First Alternative Co-op Store (South store)", (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 753-3115', NULL, (SELECT hours_id FROM Hours ORDER BY hours_id DESC LIMIT 1), 'http://firstalt.coop/');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Brown Paper/Large Shopping Bags'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Egg Cartons'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Eyeglasses'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Food (unopened, pre-expired)'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Food Containers (clean glass/plastic w/lids)'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Printer Cartridge Refilling'));

#First Alternative Co-op Store (North store)
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('2855', 'NW Grant Ave', 'Corvallis', 'OR', '97330', '44.5789680:-123.2823050');
INSERT INTO Hours (hours_entry) VALUES ('Mon 7AM-10PM, Tue 7AM-10PM, Wed 7AM-10PM, Thu 7AM-10PM, Fri 7AM-10PM, Sat 7AM-10PM, Sun 7AM-10PM');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), "First Alternative Co-op Store (South store)", (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 452-3115', NULL, (SELECT hours_id FROM Hours ORDER BY hours_id DESC LIMIT 1), 'http://firstalt.coop/');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Brown Paper/Large Shopping Bags'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Egg Cartons'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Eyeglasses'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Food (unopened, pre-expired)'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Food Containers (clean glass/plastic w/lids)'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Printer Cartridge Refilling'));

#Furniture Exchange
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('210', 'NW 2nd St', 'Corvallis', 'OR', '97330', '44.5654430:-123.2593310');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), "Furniture Exchange", (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 833-0183', NULL, NULL, 'http://www.furnitureexchange-usa.com/');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Furniture'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Household Goods'));

#Furniture Share
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('155', 'SE Lilly Ave', 'Corvallis', 'OR', '97333', '44.5484570:-123.2646100');
INSERT INTO Hours (hours_entry) VALUES ('Mon Closed, Tue 9AM-4PM, Wed 9AM-4PM, Thu 9AM-4PM, Fri 9AM-4PM, Sat Closed, Sun Closed');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), "Furniture Share", (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 754-9511', NULL, (SELECT hours_id FROM Hours ORDER BY hours_id DESC LIMIT 1), 'http://furnitureshare.org/');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Appliances, Large'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Appliances, Small'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Bedding/Bath'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Furniture'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Home Electronics'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Household Goods'));

#Garland Nursery
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('5470', 'NE Hwy 20', 'Corvallis', 'OR', '97330', '44.6175360:-123.2126060');
INSERT INTO Hours (hours_entry) VALUES ('Mon 9AM-5PM, Tue 9AM-5PM, Wed 9AM-5PM, Thu 9AM-5PM, Fri 9AM-5PM, Sat 9AM-5PM, Sun 10AM-5PM');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), "Garland Nursery", (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 753-6601', NULL, (SELECT hours_id FROM Hours ORDER BY hours_id DESC LIMIT 1), 'http://www.garlandnursery.com/');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Garden Pots'));

#Goodwill Industries 
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('1325', 'NW 9th St', 'Corvallis', 'OR', '97330', '44.5783760:-123.2596360');
INSERT INTO Hours (hours_entry) VALUES ('Mon 9AM-9PM, Tue 9AM-9PM, Wed 9AM-9PM, Thu 9AM-9PM, Fri 9AM-9PM, Sat 9AM-9PM, Sun 10AM-8PM');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), "Goodwill Industries", (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 752-8278', NULL, (SELECT hours_id FROM Hours ORDER BY hours_id DESC LIMIT 1), 'http://www.goodwill.org/');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Appliances, Large'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Appliances, Small'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Art Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Bedding/Bath'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Bikes/Exercise/Sporting/Camping'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Books'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Building Materials/Home Improvement'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'CDs, DVDs, LPs, Video Games, etc'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = "Children's Goods/Clothing"));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Clothing/Accessories'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Computers/Monitors'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Eyeglasses'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Fabric'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Furniture'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Garden/Farm/Landscaping'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Garden Pots'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Home Electronics'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Household Goods'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Medical Equipment/Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Office Equipment'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Office Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Pet Supplies/Food'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'School Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Toiletries'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Vehicles/Parts'));

#Habitat for Humanity
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('4840', 'SW Philomath Blvd', 'Corvallis', 'OR', '97333', '44.5521550:-123.3059120');
INSERT INTO Hours (hours_entry) VALUES ('Mon 9AM-6PM, Tue 9AM-6PM, Wed 9AM-6PM, Thu 9AM-6PM, Fri 9AM-6PM, Sat 9AM-6PM, Sun Closed');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), "Habitat for Humanity", (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 752-6637', NULL, (SELECT hours_id FROM Hours ORDER BY hours_id DESC LIMIT 1), 'http://www.habitat.org/local');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Appliances, Large'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Appliances, Small'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Art Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Bikes/Exercise/Sporting/Camping'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Brown Paper/Large Shopping Bags'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Building Materials/Home Improvement'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'CDs, DVDs, LPs, Video Games, etc'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Computers/Monitors'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Firewood'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Furniture'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Garden/Farm/Landscaping'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Garden Pots'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Home Electronics'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Household Goods'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Medical Equipment/Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Office Equipment'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Office Supplies'));

#Happy Trails Records
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('100', 'SW 3rd St', 'Corvallis', 'OR', '97333', '44.5642900:-123.2612950');
INSERT INTO Hours (hours_entry) VALUES ('Mon 10:30AM-7PM, Tue 10:30AM-7PM, Wed 10:30AM-7PM, Thu 10:30AM-7PM, Fri 10:30AM-9PM, Sat 10:30AM-9PM, Sun 12PM-6PM');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), "Happy Trails Records", (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 752-9032', NULL, (SELECT hours_id FROM Hours ORDER BY hours_id DESC LIMIT 1), 'http://www.corvallisbusiness.com/happytrails.html');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'CDs, DVDs, LPs, Video Games, etc'));

#Heartland Humane Society
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('398', 'SW Twin Oaks Cir', 'Corvallis', 'OR', '97333', '44.5529330:-123.2689050');
INSERT INTO Hours (hours_entry) VALUES ('Mon Closed, Tue 12PM-6PM, Wed 12PM-6PM, Thu Closed, Fri 12PM-6PM, Sat 12PM-5PM, Sun 12PM-5PM');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), "Heartland Humane Society", (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 757-9000', NULL, (SELECT hours_id FROM Hours ORDER BY hours_id DESC LIMIT 1), 'http://www.heartlandhumane.org/');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Bedding/Bath'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Pet Supplies/Food'));

#Home Life Inc
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('2068', 'NW Fillmore Ave', 'Corvallis', 'OR', '97330', '44.5754610:-123.2754240');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), "Home Life Inc", (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 753-9015', NULL, NULL, 'http://homelifeinc.org/');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Art Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Bedding/Bath'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Books'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'CDs, DVDs, LPs, Video Games, etc'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Clothing/Accessories'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Furniture'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Garden/Farm/Landscaping'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Garden Pots'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Home Electronics'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Household Goods'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Office Equipment'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Office Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Toiletries'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Vehicles/Parts'));

#Jackson Street Youth Shelter
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('555', 'NW Jackson Ave', 'Corvallis', 'OR', '97330', '44.5662620:-123.2630350');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), "Jackson Street Youth Shelter", (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 754-2404', NULL, NULL, 'http://www.jsysi.org/');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Art Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Bedding/Bath'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Bikes/Exercise/Sporting/Camping'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Building Materials/Home Improvement'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'CDs, DVDs, LPs, Video Games, etc'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Food (surplus garden produce)'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Garden/Farm/Landscaping'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Office Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'School Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Toiletries'));

#Linn Benton Food Share
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('545', 'SW 2nd St', 'Corvallis', 'OR', '97333', '44.5592720:-123.2619470');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), "Linn Benton Food Share", (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 752-1010', NULL, NULL, 'http://communityservices.us/nutrition/detail/category/linn-benton-food-share/');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Food (unopened, pre-expired)'));

#Lions Club (box inside Elks Lodge)
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('1400', 'NW 9th St', 'Corvallis', 'OR', '97330', '44.5800800:-123.2605510');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), "Lions Club (box inside Elks Lodge)", (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 758-0222', NULL, NULL, 'https://www.elks.org/lodges/home.cfm?LodgeNumber=1413');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Eyeglasses'));

#Love INC of Benton County
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('2330', 'NW Professional Dr #102', 'Corvallis', 'OR', '97330', '44.5898520:-123.2779630');
INSERT INTO Hours (hours_entry) VALUES ('Mon 9:30AM-3:30PM, Tue 9:30AM-3:30PM, Wed 9:30AM-3:30PM, Thu 9:30AM-3:30PM, Fri Closed, Sat Closed, Sun Closed');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), "Love INC of Benton County", (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 757-8111', NULL, (SELECT hours_id FROM Hours ORDER BY hours_id DESC LIMIT 1), 'http://www.yourloveinc.org/');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Appliances, Large'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Appliances, Small'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Art Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Bedding/Bath'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Bikes/Exercise/Sporting/Camping'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Cell Phones'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = "Children's Goods/Clothing"));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Computers/Monitors'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Eyeglasses'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Fabric'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Firewood'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Food (unopened, pre-expired)'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Furniture'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Garden/Farm/Landscaping'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Home Electronics'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Household Goods'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Medical Equipment/Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Office Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Pet Supplies/Food'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'School Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Toiletries'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Vehicles/Parts'));

#Mario Pastega House
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('3505', 'NW Samaritan Dr', 'Corvallis', 'OR', '97330', '44.6005640:-123.2493510');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), "Mario Pastega House", (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 768-4650', NULL, NULL, NULL);

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Books'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'CDs, DVDs, LPs, Video Games, etc'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Food (unopened, pre-expired)'));

#Mary's River Gleaners
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('', 'PO Box 2309', 'Corvallis', 'OR', '97339', '44.5619720:-123.2608570');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), "Mary's River Gleaners", (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 752-1010', NULL, NULL, NULL);

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Appliances, Large'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Appliances, Small'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Art Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Bedding/Bath'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Bikes/Exercise/Sporting/Camping'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Books'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Brown Paper/Large Shopping Bags'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'CDs, DVDs, LPs, Video Games, etc'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Cell Phones'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = "Children's Goods/Clothing"));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Clothing/Accessories'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Fabric'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Firewood'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Food (unopened, pre-expired)'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Food (surplus garden produce)'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Furniture'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Garden/Farm/Landscaping'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Garden Pots'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Home Electronics'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Household Goods'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Medical Equipment/Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Office Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Pet Supplies/Food'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'School Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Toiletries'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Vehicles/Parts'));

#Midway Farms
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('6980', 'US-20', 'Albany', 'OR', '97321', '44.6368690:-123.1781750');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), "Midway Farms", (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 740-6141', NULL, NULL, NULL);

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Brown Paper/Large Shopping Bags'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Egg Cartons'));

#Neighbor to Neighbor (food pantry)
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('1123', 'SW Philomath Blvd', 'Philomath', 'OR', '97370', '44.5403030:-123.3699440');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), "Neighbor to Neighbor (food pantry)", (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 929-6614', NULL, NULL, NULL);

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Food (unopened, pre-expired)'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Food (surplus garden produce)'));

#Osborn Aquatic Center
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('1940', 'NW Highland Dr', 'Corvallis', 'OR', '97330', '44.5877880:-123.2632360');
INSERT INTO Hours (hours_entry) VALUES ('Mon 5:30AM-7:30PM, Tue 5:30AM-7:30PM, Wed 5:30AM-9PM, Thu 5:30AM-7:30PM, Fri 5:30AM-1PM, Sat 10:30AM-4PM, Sun 1AM-4PM');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), "Osborn Aquatic Center", (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 766-7946', NULL, (SELECT hours_id FROM Hours ORDER BY hours_id DESC LIMIT 1), 'http://www.corvallisoregon.gov/index.aspx?page=57');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Appliances, Large'));

#OSU Emergency Food Pantry
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('2150', 'SW Jefferson Way', 'Corvallis', 'OR', '97331', '44.5639680:-123.2764150');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), "OSU Emergency Food Pantry", (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 737-3473', NULL, NULL, NULL);

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Food (unopened, pre-expired)'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Food (surplus garden produce)'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Toiletries'));

#OSU Folk Club Thrift Shop
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('144', 'NW 2nd St', 'Corvallis', 'OR', '97330', '44.5649900:-123.2597590');
INSERT INTO Hours (hours_entry) VALUES ('Mon Closed, Tue 9:30AM-5PM, Wed 9:30AM-5PM, Thu 9:30AM-5PM, Fri 9:30AM-2:30PM, Sat 10AM-12PM, Sun Closed');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), "OSU Folk Club Thrift Shop", (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 752-4733', NULL, (SELECT hours_id FROM Hours ORDER BY hours_id DESC LIMIT 1), 'http://oregonstate.edu/osufolk/thrift-shop');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Appliances, Small'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Art Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Bedding/Bath'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Bikes/Exercise/Sporting/Camping'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Books'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Brown Paper/Large Shopping Bags'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'CDs, DVDs, LPs, Video Games, etc'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = "Children's Goods/Clothing"));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Clothing/Accessories'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Eyeglasses'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Fabric'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Garden/Farm/Landscaping'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Garden Pots'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Household Goods'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Medical Equipment/Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Office Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Pet Supplies/Food'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'School Supplies'));

#OSU Organic Growers Club (Crop & Soil Science Department)
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), "OSU Organic Growers Club (Crop & Soil Science Department)", NULL, '(541) 737-6810', NULL, NULL, 'http://cropandsoil.oregonstate.edu/organic_grower
');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Garden/Farm/Landscaping'));

#Pak Mail (Timberhill Shopping Ctr)
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('2397', 'NW Kings Blvd', 'Corvallis', 'OR', '97330', '44.5912890:-123.2728850');
INSERT INTO Hours (hours_entry) VALUES ('Mon 9AM-5:30PM, Tue 9AM-5:30PM, Wed 9AM-5:30PM, Thu 9AM-5:30PM, Fri 9AM-5:30PM, Sat 9AM-4PM, Sun Closed');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), "Pak Mail (Timberhill Shopping Ctr)", (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 754-8411', NULL, (SELECT hours_id FROM Hours ORDER BY hours_id DESC LIMIT 1), 'http://www.pakmail.com/stores/pak-mail-corvallis/');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Packing Materials'));

#Parent Enhancement Program
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('421', 'NW 4th St', 'Corvallis', 'OR', '97330', '44.5679390:-123.2599890');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), "Parent Enhancement Program", (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 758-8292', NULL, NULL, NULL);

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Art Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Bikes/Exercise/Sporting/Camping'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Books'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Brown Paper/Large Shopping Bags'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = "Children's Goods/Clothing"));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Clothing/Accessories'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Fabric'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Food (unopened, pre-expired)'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Office Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'School Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Toiletries'));

#Pastors for Peace-Caravan to Cuba (Mike Beilstein)
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), "Pastors for Peace-Caravan to Cuba (Mike Beilstein)", NULL, '(541) 754-1858', NULL, NULL, 'http://www.ccds.org');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Bikes/Exercise/Sporting/Camping'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Computers/Monitors'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Medical Equipment/Supplies'));

#Philomath Community Garden (Chris Shonnard)
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), "Philomath Community Garden (Chris Shonnard)", NULL, '(541) 929-3524', NULL, NULL, 'http://philomathcommunityservices.org/');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Garden/Farm/Landscaping'));

#Philomath Community Services (food & kids stuff)
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('360', 'S 9th St', 'Philomath', 'OR', '97370', '44.5356620:-123.3743180');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), "Philomath Community Services (food & kids stuff)", (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 929-2499', NULL, NULL, 'http://philomathcommunityservices.org/');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Books'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Brown Paper/Large Shopping Bags'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = "Children's Goods/Clothing"));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Firewood'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Food (unopened, pre-expired)'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Food (surplus garden produce)'));

#Play It Again Sports
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('1422', 'NW 9th St', 'Corvallis', 'OR', '97330', '44.5807360:-123.2600900');
INSERT INTO Hours (hours_entry) VALUES ('Mon 9AM-7PM, Tue 9AM-7PM, Wed 9AM-7PM, Thu 9AM-7PM, Fri 9AM-7PM, Sat 9AM-6PM, Sun 10AM-5PM');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), "Play It Again Sports", (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 754-7529', NULL, (SELECT hours_id FROM Hours ORDER BY hours_id DESC LIMIT 1), 'http://www.playitagainsports.com/');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Bikes/Exercise/Sporting/Camping'));

#Presbyterian Piecemakers (cotton quilts)
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('114', 'SW 8th St', 'Corvallis', 'OR', '97333', '44.5653910:-123.2667050');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), "Presbyterian Piecemakers (cotton quilts)", (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 753-7516', NULL, NULL, NULL);

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Fabric'));

#Public Library Corvallis, Friends of
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('645', 'NW Monroe Ave', 'Corvallis', 'OR', '97330', '44.5657020:-123.2644000');
INSERT INTO Hours (hours_entry) VALUES ('Mon 10AM-8PM, Tue 10AM-8PM, Wed 10AM-8PM, Thu 10AM-8PM, Fri 10AM-6PM, Sat 10AM-6PM, Sun 1PM-5PM');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), "Public Library Corvallis, Friends of", (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 766-6928', NULL, (SELECT hours_id FROM Hours ORDER BY hours_id DESC LIMIT 1), 'http://cbcpubliclibrary.net/');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Books'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'CDs, DVDs, LPs, Video Games, etc'));

#Quilts From Caring Hands (cotton quilts)
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('1495', 'NW 20th St', 'Corvallis', 'OR', '97330', '44.5812040:-123.2727590');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), "Quilts From Caring Hands (cotton quilts)", (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 758-8161', NULL, NULL, 'http://www.quiltsfromcaringhands.com/');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Fabric'));

#Rapid Refill Ink
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('254', 'SW Madison Ave', 'Corvallis', 'OR', '97333', '44.5631330:-123.2612920');
INSERT INTO Hours (hours_entry) VALUES ('Mon 9AM-5:30PM, Tue 9AM-5:30PM, Wed 9AM-5:30PM, Thu 9AM-5:30PM, Fri 9AM-5:30PM, Sat 10AM-3PM, Sun Closed');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), "Rapid Refill Ink", (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 758-8444', NULL, (SELECT hours_id FROM Hours ORDER BY hours_id DESC LIMIT 1), 'http://www.rapidinkandtoner.com/');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Printer Cartridge Refilling'));

#OfficeMax
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('1834', 'NW 9th St', 'Corvallis', 'OR', '97330', '44.5858510:-123.2565760');
INSERT INTO Hours (hours_entry) VALUES ('Mon 8AM-9PM, Tue 8AM-9PM, Wed 8AM-9PM, Thu 8AM-9PM, Fri 8AM-9PM, Sat 9AM-7PM, Sun 10AM-6PM');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), "OfficeMax", (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 738-0990', NULL, (SELECT hours_id FROM Hours ORDER BY hours_id DESC LIMIT 1), 'http://www.officedepot.com/');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Printer Cartridge Refilling'));

#re•volve
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('103', 'SW 2nd St', 'Corvallis', 'OR', '97333', '44.5638230:-123.2594590');
INSERT INTO Hours (hours_entry) VALUES ('Mon 11AM-6PM, Tue 11AM-6PM, Wed 11AM-6PM, Thu 11AM-6PM, Fri 11AM-6PM, Sat 10AM-6PM, Sun 12PM-4PM');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), "revolve", (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 754-1154', NULL, (SELECT hours_id FROM Hours ORDER BY hours_id DESC LIMIT 1), 'http://www.revolveresale.com/');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Brown Paper/Large Shopping Bags'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Clothing/Accessories'));

#Schools--Public, Private, Charter 
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), "Schools--Public, Private, Charter", NULL, NULL, NULL, NULL, NULL);

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Art Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Books'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Office Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'School Supplies'));

#Second Glance
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('312', 'SW 3rd St', 'Corvallis', 'OR', '97333', '44.5621240:-123.2623530');
INSERT INTO Hours (hours_entry) VALUES ('Mon 10AM-6PM, Tue 10AM-6PM, Wed 10AM-6PM, Thu 10AM-6PM, Fri 10AM-6PM, Sat 10AM-6PM, Sun 12PM-5PM');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), "Second Glance", (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 753-8011', NULL, (SELECT hours_id FROM Hours ORDER BY hours_id DESC LIMIT 1), 'http://www.glanceagain.com/');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Brown Paper/Large Shopping Bags'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Clothing/Accessories'));

#Second Glance Annex
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('214', 'SW Jefferson Ave', 'Corvallis', 'OR', '97333', '44.5620460:-123.2614530');
INSERT INTO Hours (hours_entry) VALUES ('Mon 11AM-6PM, Tue 11AM-6PM, Wed 11AM-6PM, Thu 11AM-6PM, Fri 11AM-6PM, Sat 11AM-6PM, Sun 12PM-5PM');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), "Second Glance Annex", (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 758-9099', NULL, (SELECT hours_id FROM Hours ORDER BY hours_id DESC LIMIT 1), 'http://www.glanceagain.com/');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Brown Paper/Large Shopping Bags'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Clothing/Accessories'));

#The Alley
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('312', 'SW Jefferson Ave', 'Corvallis', 'OR', '97333', '44.5623030:-123.2623760');
INSERT INTO Hours (hours_entry) VALUES ('Mon 11AM-6PM, Tue 11AM-6PM, Wed 11AM-6PM, Thu 11AM-6PM, Fri 11AM-6PM, Sat 11AM-6PM, Sun 12PM-5PM');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), "The Alley", (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 753-4069', NULL, (SELECT hours_id FROM Hours ORDER BY hours_id DESC LIMIT 1), 'http://www.thealleystyle.com/');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Brown Paper/Large Shopping Bags'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Clothing/Accessories'));

#Senior Center of Corvallis
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('2601', 'NW Tyler Ave', 'Corvallis', 'OR', '97330', '44.5730550:-123.2804570');
INSERT INTO Hours (hours_entry) VALUES ('Mon 8AM-4PM, Tue 8AM-4PM, Wed 8AM-4PM, Thu 8AM-4PM, Fri 8AM-4PM, Sat Closed, Sun Closed');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), "Senior Center of Corvallis", (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 766-6959', NULL, (SELECT hours_id FROM Hours ORDER BY hours_id DESC LIMIT 1), 'http://www.corvallisoregon.gov/index.aspx?page=257');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'CDs, DVDs, LPs, Video Games, etc'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Cell Phones'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Eyeglasses'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Food (surplus garden produce)'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Medical Equipment/Supplies'));

#South Corvallis Food Bank
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('1800', 'SW 3rd St #11', 'Corvallis', 'OR', '97333', '44.5466940:-123.2671730');
INSERT INTO Hours (hours_entry) VALUES ('Mon 1PM-3PM, Tue Closed, Wed 1PM-3PM, Thu 5PM-7PM, Fri Closed, Sat 10AM-12PM, Sun Closed');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), "South Corvallis Food Bank", (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 753-4263', NULL, (SELECT hours_id FROM Hours ORDER BY hours_id DESC LIMIT 1), 'http://www.southcorvallisfoodbank.org/');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Food (unopened, pre-expired)'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Food (surplus garden produce)'));

#St. Vincent de Paul Food Bank
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('501', 'NW 25th St', 'Corvallis', 'OR', '97330', '44.5729760:-123.2784570');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), "St. Vincent de Paul Food Bank", (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 757-1988', NULL, NULL, NULL);

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Appliances, Small'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Art Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Brown Paper/Large Shopping Bags'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'CDs, DVDs, LPs, Video Games, etc'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = "Children's Goods/Clothing"));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Clothing/Accessories'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Food (unopened, pre-expired)'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Food (surplus garden produce)'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Household Goods'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Office Equipment'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Pet Supplies/Food'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'School Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Toiletries'));

#Stone Soup (St Mary's Church)
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('501', 'NW 25th St', 'Corvallis', 'OR', '97330', '44.5729760:-123.2784570');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), "Stone Soup (St Mary's Church)", (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 757-1988', NULL, NULL, 'http://www.stmarycorvallis.org/');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Appliances, Small'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Art Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Brown Paper/Large Shopping Bags'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'CDs, DVDs, LPs, Video Games, etc'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = "Children's Goods/Clothing"));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Clothing/Accessories'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Food (unopened, pre-expired)'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Food (surplus garden produce)'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Household Goods'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Office Equipment'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Pet Supplies/Food'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'School Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Toiletries'));

#The UPS Store
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('5060', 'SW Philomath Blvd', 'Corvallis', 'OR', '97333', '44.5520060:-123.3075580');
INSERT INTO Hours (hours_entry) VALUES ('Mon 7:30AM-6PM, Tue 7:30AM-6PM, Wed 7:30AM-6PM, Thu 7:30AM-6PM, Fri 7:30AM-6PM, Sat 9:30AM-3PM, Sun Closed');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), "The UPS Store", (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 752-1830', NULL, (SELECT hours_id FROM Hours ORDER BY hours_id DESC LIMIT 1), 'https://corvallis-or-5088.theupsstorelocal.com/');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Packing Materials'));

#The UPS Store
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('922', 'NW Circle Blvd #160', 'Corvallis', 'OR', '97330', '44.5880760:-123.2573170');
INSERT INTO Hours (hours_entry) VALUES ('Mon 8:30AM-6PM, Tue 8:30AM-6PM, Wed 8:30AM-6PM, Thu 8:30AM-6PM, Fri 8:30AM-6PM, Sat 10AM-5PM, Sun Closed');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), "The UPS Store", (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 752-0056', NULL, (SELECT hours_id FROM Hours ORDER BY hours_id DESC LIMIT 1), 'https://corvallis-or-2610.theupsstorelocal.com/');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Packing Materials'));

#Vina Moses Center
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('968', 'NW Garfield Ave', 'Corvallis', 'OR', '97330', '44.5829280:-123.2605110');
INSERT INTO Hours (hours_entry) VALUES ('Mon 9AM-4PM, Tue 9AM-4PM, Wed 9AM-4PM, Thu 9AM-4PM, Fri 9AM-4PM, Sat Closed, Sun Closed');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), "Vina Moses Center", (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 753-1420', NULL, (SELECT hours_id FROM Hours ORDER BY hours_id DESC LIMIT 1), 'http://www.vinamoses.org/');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Appliances, Small'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Art Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Bedding/Bath'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Bikes/Exercise/Sporting/Camping'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Books'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Brown Paper/Large Shopping Bags'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'CDs, DVDs, LPs, Video Games, etc'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = "Children's Goods/Clothing"));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Clothing/Accessories'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Eyeglasses'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Fabric'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Food (unopened, pre-expired)'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Food (surplus garden produce)'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Garden/Farm/Landscaping'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Garden Pots'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Home Electronics'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Household Goods'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Office Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Pet Supplies/Food'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'School Supplies'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Toiletries'));

#Spaeth Heritage House
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('137', 'N 13th St', 'Philomath', 'OR', '97370', '44.5408740:-123.3675060');
INSERT INTO Hours (hours_entry) VALUES ('Mon 8AM-4PM, Tue 8AM-4PM, Wed 8AM-4PM, Thu 8AM-4PM, Fri 8AM-4PM, Sat 8AM-4PM, Sun Closed');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Reuse'), "Spaeth Heritage House", (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 307-0349', NULL, (SELECT hours_id FROM Hours ORDER BY hours_id DESC LIMIT 1), 'http://www.spaethlumber.com/main/home/main.aspx');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Building Materials/Home Improvement'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Furniture'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Garden/Farm/Landscaping'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Garden Pots'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Household Goods'));


# REPAIR DIRECTORY
#B & J Bookbinding
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('108', 'SW 3rd St', 'Corvallis', 'OR', '97333', '44.5642060:-123.2613380');
INSERT INTO Hours (hours_entry) VALUES ('Mon 9AM-5PM, Tue 9AM-5PM, Wed 9AM-5PM, 9AM-5PM, Fri 9AM-5PM, Sat Closed, Sun Closed');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Repair'), 'B & J Bookbinding', (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 757-9861', NULL, (SELECT hours_id FROM Hours ORDER BY hours_id DESC LIMIT 1), 'http://www.cornerstoneassociates.com/bj-bookbinding-about-us.html');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Books'));

#Cell Phone Sick Bay
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('252', 'SW Madison Ave #110', 'Corvallis', 'OR', '97333', '44.5632190:-123.2608650');
INSERT INTO Hours (hours_entry) VALUES ('Mon 10AM-6PM, Tue 10AM-6PM, Wed 10AM-6PM, Thu 10AM-6PM, Fri 10AM-6PM, Sat 11AM-4PM, Sun Closed');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Repair'), 'Cell Phone Sick Bay', (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 230-1785', NULL, (SELECT hours_id FROM Hours ORDER BY hours_id DESC LIMIT 1), 'http://www.cellsickbay.com/index.html');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Cell Phones'));

#Geeks 'N' Nerds
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('950', 'SE Geary St', 'Corvallis', 'OR', '97322', '44.6326580:-123.0839750');
INSERT INTO Hours (hours_entry) VALUES ('Mon 10AM-5PM, Tue 10AM-5PM, Wed 10AM-5PM, Thu 10AM-5PM, Fri 10AM-5PM, Sat 10AM-2PM, Sun Closed');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Repair'), "Geeks 'N' Nerds", (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 753-0018', NULL, (SELECT hours_id FROM Hours ORDER BY hours_id DESC LIMIT 1), 'http://www.computergeeksnnerds.com/');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Cell Phones'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Computers/Monitors'));

#Specialty Sewing By Leslie
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('225', 'SW Madison Ave # 201', 'Corvallis', 'OR', '97333', '44.5633470:-123.2607020');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Repair'), 'Specialty Sewing By Leslie', (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 758-4556', NULL, NULL, 'http://www.specialtysewing.com/Leslie_Seamstress/Welcome.html');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Clothing/Accessories'));

#Covallis Technical
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('964', 'NW Circle Blvd', 'Corvallis', 'OR', '97330', '44.5887300:-123.2576870');
INSERT INTO Hours (hours_entry) VALUES ('Mon 9AM-5PM, Tue 9AM-5PM, Wed 9AM-5PM, Thu 9AM-5PM, Fri 9AM-5PM, Sat Closed, Sun Closed');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Repair'), 'Covallis Technical', (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 704-7009', NULL, (SELECT hours_id FROM Hours ORDER BY hours_id DESC LIMIT 1), 'http://www.corvallistechnical.com/');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Computers/Monitors'));

#Bellevue Computers
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('1865', 'NW 9th St', 'Corvallis', 'OR', '97330', '44.5861660:-123.2550850');
INSERT INTO Hours (hours_entry) VALUES ('Mon 9AM-6PM, Tue 9AM-6PM, Wed 9AM-6PM, Thu 9AM-6PM, Fri 9AM-6PM, Sat 10AM-5PM, Sun Closed');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Repair'), 'Bellevue Computers', (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 757-3487', NULL, (SELECT hours_id FROM Hours ORDER BY hours_id DESC LIMIT 1), 'http://www.bellevuepc.com/');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Clothing/Accessories'));

#OSU Repair Fair
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('644', 'SW 13th St', 'Corvallis', 'OR', '97333', '44.5613780:-123.2726020');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Repair'), 'OSU Repair Fair', (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 737-5398', NULL, NULL, 'http://fa.oregonstate.edu/surplus');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Appliances, Small'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Computers/Monitors'));

#P.K Furniture Repair & Refinishing 
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('5270', 'Corvallis-Newport Hwy', 'Corvallis', 'OR', '97333', '44.5507110:-123.3124530');
INSERT INTO Hours (hours_entry) VALUES ('Mon 10AM-6PM, Tue 10AM-6PM, Wed 10AM-6PM, Thu 10AM-6PM, Fri 10AM-6PM, Sat Closed, Sun Closed');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Repair'), 'P.K Furniture Repair & Refinishing', (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 230-1727', NULL, (SELECT hours_id FROM Hours ORDER BY hours_id DESC LIMIT 1), 'http://www.pkfurniturerefinishing.net/');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Furniture'));

#Furniture Restoration Center
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('1321', 'Main St', 'Philomath', 'OR', '97370', '44.5400870:-123.3671230');
INSERT INTO Hours (hours_entry) VALUES ('Mon 9AM-5PM, Tue 9AM-5PM, Wed 9AM-5PM, Thu 9AM-5PM, Fri 11AM-3PM, Sat Closed, Sun Closed');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Repair'), 'Furniture Restoration Center', (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 929-6681', NULL, (SELECT hours_id FROM Hours ORDER BY hours_id DESC LIMIT 1), 'http://restorationsupplies.com/');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Furniture'));

#Corvallis Power Equipment
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('713', 'NE Circle Blvd', 'Corvallis', 'OR', '97330', '44.5892660:-123.2502330');
INSERT INTO Hours (hours_entry) VALUES ('Mon 8AM-5PM, Tue 8AM-5PM, Wed 8AM-5PM, Thu 8AM-5PM, Fri 8AM-5PM, Sat 8:30AM-12PM, Sun Closed');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Repair'), 'Corvallis Power Equipment', (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 757-8075', NULL, (SELECT hours_id FROM Hours ORDER BY hours_id DESC LIMIT 1), 'https://corvallispowerequipment.stihldealer.net/');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Lawn Equipment'));

#Robnett's Hardware
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('400', 'SW 2nd St', 'Corvallis', 'OR', '97333', '44.5610110:-123.2617870');
INSERT INTO Hours (hours_entry) VALUES ('Mon 7:30AM-6PM, Tue 7:30AM-6PM, Wed 7:30AM-6PM, Thu 7:30AM-6PM, Fri 7:30AM-6PM, Sat 8:30AM-5:30PM, Sun 10AM-4PM');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Repair'), "Robnett's Hardware", (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 753-5531', NULL, (SELECT hours_id FROM Hours ORDER BY hours_id DESC LIMIT 1), 'http://ww3.truevalue.com/robnetts/Home.aspx');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Reel Mowers'));
INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Screen Repair'));

#Footwise 
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('301', 'SW Madison Ave #100', 'Corvallis', 'OR', '97333', '44.5636530:-123.2615680');
INSERT INTO Hours (hours_entry) VALUES ('Mon 10AM-6PM, Tue 10AM-6PM, Wed 10AM-6PM, Thu 10AM-6PM, Fri 10AM-6PM, Sat 10AM-6PM, Sun 11AM-5PM');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Repair'), 'Footwise', (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 757-0875', NULL, (SELECT hours_id FROM Hours ORDER BY hours_id DESC LIMIT 1), 'http://footwise.com/');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Sandals'));

#Sedlak's Boots and Shoes
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('225', 'SW 2nd St', 'Corvallis', 'OR', '97333', '44.5633130:-123.2605900');
INSERT INTO Hours (hours_entry) VALUES ('Mon 9:30AM-6PM, Tue 9:30AM-6PM, Wed 9:30AM-6PM, Thu 9:30AM-6PM, Fri 9:30AM-6PM, Sat 9:30AM-5PM, Sun 12PM-4PM');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Repair'), "Sedlak's Boots and Shoes", (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 752-1498', NULL, (SELECT hours_id FROM Hours ORDER BY hours_id DESC LIMIT 1), 'http://www.sedlaksshoes.net/');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Shoes, Boots'));

#Foam Man
INSERT INTO Address (street_number, street_name, city, state, zip, geolocation) VALUES ('2511', 'NW 9th St', 'Corvallis', 'OR', '97330', '44.5932530:-123.2517410');
INSERT INTO Hours (hours_entry) VALUES ('Mon Closed, Tue 11AM-5PM, Wed 11AM-5PM, Thu 11AM-5PM, Fri 11AM-5PM, Sat Closed, Sun Closed');
INSERT INTO Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website) VALUES ((SELECT category_id FROM Category WHERE category_name = 'Repair'), 'Foam Man', (SELECT address_id FROM Address ORDER BY address_id DESC LIMIT 1), '(541) 754-9378', NULL, (SELECT hours_id FROM Hours ORDER BY hours_id DESC LIMIT 1), 'http://www.thefoammancorvallis.com/');

INSERT INTO Business_Subcategory (fk_business_id, fk_subcategory_id) VALUES ((SELECT business_id FROM Business ORDER BY business_id DESC LIMIT 1), (SELECT subcategory_id FROM Subcategory WHERE subcategory_name = 'Upholstery, Furniture'));

