CREATE DATABASE pizza_pie_restaurant;

CREATE TABLE `pizza_pie_restaurant`.`customer_info` (
  `customer_id` int NOT NULL,
  `customer_name` varchar(45) DEFAULT NULL,
  `phone_number` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `pizza_pie_restaurant`.`customer_info`
(`customer_id`,
`customer_name`,
`phone_number`)
VALUES
(1,
'Trevor Page',
'226-555-4982');

INSERT INTO `pizza_pie_restaurant`.`customer_info`
(`customer_id`,
`customer_name`,
`phone_number`)
VALUES
(2,
'John Doe',
'555-555-9498');

CREATE TABLE `pizza_pie_restaurant`.`orderdetails` (
  `orderDetail_id` int NOT NULL,
  `order_name` varchar(45) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `order_id` varchar(45) DEFAULT NULL,
  `pizza_id` varchar(45) DEFAULT NULL,
  `quantity` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`orderDetail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `pizza_pie_restaurant`.`orderdetails`
(`orderDetail_id`,
`order_name`,
`date_time`,
`order_id`,
`pizza_id`,
`quantity`)
VALUES
(1,
'Trevor Page',
'2014-09-10 09:47:00',
1,
1,
1);

INSERT INTO `pizza_pie_restaurant`.`orderdetails`
(`orderDetail_id`,
`order_name`,
`date_time`,
`order_id`,
`pizza_id`,
`quantity`)
VALUES
(2,
'Trevor Page',
'2014-09-10 09:47:00',
1,
3,
1);

INSERT INTO `pizza_pie_restaurant`.`orderdetails`
(`orderDetail_id`,
`order_name`,
`date_time`,
`order_id`,
`pizza_id`,
`quantity`)
VALUES
(3,
'John Doe',
'2014-09-10 13:20:00',
2,
2,
1);

INSERT INTO `pizza_pie_restaurant`.`orderdetails`
(`orderDetail_id`,
`order_name`,
`date_time`,
`order_id`,
`pizza_id`,
`quantity`)
VALUES
(4,
'John Doe',
'2014-09-10 13:20:00',
2,
3,
2);


INSERT INTO `pizza_pie_restaurant`.`orderdetails`
(`orderDetail_id`,
`order_name`,
`date_time`,
`order_id`,
`pizza_id`,
`quantity`)
VALUES
(5,
'Trevor Page',
'2014-09-10 09:47:00',
3,
3,
1);

INSERT INTO `pizza_pie_restaurant`.`orderdetails`
(`orderDetail_id`,
`order_name`,
`date_time`,
`order_id`,
`pizza_id`,
`quantity`)
VALUES
(6,
'Trevor Page',
'2014-09-10 09:47:00',
3,
4,
1);

CREATE TABLE `pizza_pie_restaurant`.`pizza_info` (
  `pizza_id` int NOT NULL,
  `pizza_name` varchar(45) DEFAULT NULL,
  `pizza_price` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`pizza_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `pizza_pie_restaurant`.`pizza_info`
(`pizza_id`,
`pizza_name`,
`pizza_price`)
VALUES
(1,
'pepperoni and cheese',
7.99);


INSERT INTO `pizza_pie_restaurant`.`pizza_info`
(`pizza_id`,
`pizza_name`,
`pizza_price`)
VALUES
(2,
'vegetarian',
9.99);


INSERT INTO `pizza_pie_restaurant`.`pizza_info`
(`pizza_id`,
`pizza_name`,
`pizza_price`)
VALUES
(3,
'Meat lovers',
14.99);


INSERT INTO `pizza_pie_restaurant`.`pizza_info`
(`pizza_id`,
`pizza_name`,
`pizza_price`)
VALUES
(4,
'hawaiian',
12.99);

CREATE TABLE `pizza_pie_restaurant`.`customer_to_orders` (
  `customer_id` int NOT NULL,
  `orderDetail_id` int NOT NULL,
  KEY `customer_id` (`customer_id`),
  KEY `orderDetail_id` (`orderDetail_id`),
  CONSTRAINT `customer_to_orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer_info` (`customer_id`),
  CONSTRAINT `customer_to_orders_ibfk_2` FOREIGN KEY (`orderDetail_id`) REFERENCES `orderdetails` (`orderDetail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `pizza_pie_restaurant`.`customer_to_orders`
(`customer_id`,
`orderDetail_id`)
VALUES
(1, 1);

INSERT INTO `pizza_pie_restaurant`.`customer_to_orders`
(`customer_id`,
`orderDetail_id`)
VALUES
(1,
2);

INSERT INTO `pizza_pie_restaurant`.`customer_to_orders`
(`customer_id`,
`orderDetail_id`)
VALUES
(2,
3);

INSERT INTO `pizza_pie_restaurant`.`customer_to_orders`
(`customer_id`,
`orderDetail_id`)
VALUES
(2,
4);

INSERT INTO `pizza_pie_restaurant`.`customer_to_orders`
(`customer_id`,
`orderDetail_id`)
VALUES
(1,
5);

INSERT INTO `pizza_pie_restaurant`.`customer_to_orders`
(`customer_id`,
`orderDetail_id`)
VALUES
(1,
6);



CREATE TABLE `pizza_pie_restaurant`.`orders_to_pizza` (
  `orderDetail_id` int NOT NULL,
  `pizza_id` int NOT NULL,
  KEY `orderDetail_id` (`orderDetail_id`),
  KEY `pizza_id` (`pizza_id`),
  CONSTRAINT `orders_to_pizza_ibfk_1` FOREIGN KEY (`orderDetail_id`) REFERENCES `orderdetails` (`orderDetail_id`),
  CONSTRAINT `orders_to_pizza_ibfk_2` FOREIGN KEY (`pizza_id`) REFERENCES `pizza_info` (`pizza_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `pizza_pie_restaurant`.`orders_to_pizza`
(`orderDetail_id`,
`pizza_id`)
VALUES
(1,
1);

INSERT INTO `pizza_pie_restaurant`.`orders_to_pizza`
(`orderDetail_id`,
`pizza_id`)
VALUES
(2,
3);

INSERT INTO `pizza_pie_restaurant`.`orders_to_pizza`
(`orderDetail_id`,
`pizza_id`)
VALUES
(3,
2);

INSERT INTO `pizza_pie_restaurant`.`orders_to_pizza`
(`orderDetail_id`,
`pizza_id`)
VALUES
(4,
3);

INSERT INTO `pizza_pie_restaurant`.`orders_to_pizza`
(`orderDetail_id`,
`pizza_id`)
VALUES
(5,
3);

INSERT INTO `pizza_pie_restaurant`.`orders_to_pizza`
(`orderDetail_id`,
`pizza_id`)
VALUES
(6,
4);


select * from orderdetails;


-- MySQL query for individual customer---

-- How much each individual customer has spent at the pizza restaurant  
####
#4

select order_name, sum(quantity * (Select pizza_price from pizza_info where orderdetails.pizza_id = pizza_info.pizza_id)) as total_sales_each_customer
from orderdetails
left join pizza_info on orderdetails.orderDetail_id = pizza_info.pizza_id
group by order_name;

####

#5
select order_name, date(date_time ), sum(quantity * (Select pizza_price from pizza_info where orderdetails.pizza_id = pizza_info.pizza_id)) as  total_sales_each_customer
from orderdetails
left join pizza_info on orderdetails.orderDetail_id = pizza_info.pizza_id
group by date_time;


select order_name, date_time , sum(quantity * (Select pizza_price from pizza_info where orderdetails.pizza_id = pizza_info.pizza_id)) as total 
from orderdetails
left join pizza_info on orderdetails.orderDetail_id = pizza_info.pizza_id
group by order_name, date_time;


