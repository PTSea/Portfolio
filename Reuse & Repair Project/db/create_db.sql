CREATE DATABASE IF NOT EXISTS reuse_and_repair_db;
USE reuse_and_repair_db;

CREATE TABLE IF NOT EXISTS Subcategory
(
	subcategory_id INT NOT NULL AUTO_INCREMENT,
	subcategory_name VARCHAR (255) NOT NULL,
	PRIMARY KEY (subcategory_id)

) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS Category
(
  category_id INT NOT NULL AUTO_INCREMENT,
  category_name VARCHAR (255) NOT NULL,
	PRIMARY KEY (category_id)
    
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS Address
(
	address_id INT NOT NULL AUTO_INCREMENT,
	street_number VARCHAR (255),
	street_name VARCHAR (255),
	city VARCHAR (255),
	state VARCHAR (255),
	zip VARCHAR (255),
	geolocation VARCHAR (255),
	PRIMARY KEY (address_id)
        	
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS Hours
(
	hours_id INT NOT NULL AUTO_INCREMENT,
	hours_entry VARCHAR (255),
	PRIMARY KEY (hours_id)
        	
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS Business
(
	business_id INT NOT NULL AUTO_INCREMENT,
	business_name VARCHAR (255) NOT NULL,
	fk_category_id INT,
	fk_address_id INT,
	phone VARCHAR (255),
	description VARCHAR (255),
	fk_hours_id INT,
	website VARCHAR (255),
	PRIMARY KEY (business_id),
	FOREIGN KEY (fk_category_id)
		REFERENCES Category (category_id)
		ON DELETE SET NULL 
        	ON UPDATE CASCADE,
	FOREIGN KEY (fk_address_id)
		REFERENCES Address (address_id)
		ON DELETE SET NULL 
        	ON UPDATE CASCADE,
	FOREIGN KEY (fk_hours_id)
		REFERENCES Hours (hours_id)
		ON DELETE SET NULL 
        	ON UPDATE CASCADE
        	
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS Business_Subcategory
(
	id INT NOT NULL AUTO_INCREMENT,
	fk_business_id INT NOT NULL,
	fk_subcategory_id INT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (fk_business_id)
		REFERENCES Business (business_id)
		ON DELETE CASCADE 
        	ON UPDATE CASCADE,
	FOREIGN KEY (fk_subcategory_id)
		REFERENCES Subcategory (subcategory_id)
		ON DELETE CASCADE 
        	ON UPDATE CASCADE

) ENGINE=INNODB;

/*CREATE TABLE IF NOT EXISTS Category_Subcategory
(
	id INT NOT NULL AUTO_INCREMENT,
	fk_category_id VARCHAR(255) NOT NULL,
	fk_subcategory_id VARCHAR (255) NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (fk_category_id)
		REFERENCES Category (category_id),
	FOREIGN KEY (fk_subcategory_id)
		REFERENCES Subcategory (subcategory_id)
		
) ENGINE=INNODB;*/

CREATE TABLE IF NOT EXISTS Role
(
	role_id INT NOT NULL AUTO_INCREMENT,
	role_name VARCHAR (255) NOT NULL,
	PRIMARY KEY (role_id)
	
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS Admin
(
	admin_id INT NOT NULL AUTO_INCREMENT,
	username VARCHAR (255) NOT NULL,
	password VARCHAR (255) NOT NULL,
	first_name VARCHAR (255),
	last_name VARCHAR (255),
	email VARCHAR (255),
	fk_role_id INT NOT NULL,
	PRIMARY KEY (admin_id),
	FOREIGN KEY (fk_role_id)
		REFERENCES Role (role_id)
		on delete no action 
		
) ENGINE=INNODB;