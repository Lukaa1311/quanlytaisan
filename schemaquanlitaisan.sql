CREATE TABLE `USER`(
    `user_id` INT NOT NULL,
    `username` VARCHAR(100) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `email` VARCHAR(100) NOT NULL,
    `role` VARCHAR(100) NOT NULL,
    PRIMARY KEY(`user_id`)
);
CREATE TABLE `ASSETS`(
    `assets_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `assets_name` VARCHAR(100) NOT NULL,
    `category` VARCHAR(100) NOT NULL,
    `value` DECIMAL(10, 2) NOT NULL,
    `status` VARCHAR(50) NOT NULL,
    `description` TEXT NOT NULL,
    `purchase_date` DATE NOT NULL
);
CREATE TABLE `MAINTENANCE HISTORY`(
    `maintenance_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `assets_id` INT NOT NULL,
    `maintenance_date` DATE NOT NULL,
    `description` TEXT NOT NULL,
    `cost` DECIMAL(10, 2) NOT NULL,
    `status` VARCHAR(50) NOT NULL
);
ALTER TABLE
    `MAINTENANCE HISTORY` ADD UNIQUE `maintenance history_assets_id_unique`(`assets_id`);
CREATE TABLE `ASSETS REPORT`(
    `report_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `assets_id` INT NOT NULL,
    `report_date` DATE NOT NULL,
    `report_type` VARCHAR(100) NOT NULL,
    `content` TEXT NOT NULL
);
ALTER TABLE
    `ASSETS REPORT` ADD UNIQUE `assets report_assets_id_unique`(`assets_id`);