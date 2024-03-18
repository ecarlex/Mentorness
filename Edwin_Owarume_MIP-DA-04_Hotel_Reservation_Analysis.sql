select * 
from Hotel_Reservation.dbo.[Hotel Reservation Dataset]

--1. What is the total number of reservations in the dataset?
select count(Booking_ID) as num_of_reservations
from Hotel_Reservation.dbo.[Hotel Reservation Dataset]

--2. Which meal plan is the most popular among guests?
select type_of_meal_plan, count(type_of_meal_plan) as num_of_meal_plan
from Hotel_Reservation.dbo.[Hotel Reservation Dataset]
group by type_of_meal_plan

--3. What is the average price per room for reservations involving children?
select avg(avg_price_per_room) as avg_price
from Hotel_Reservation.dbo.[Hotel Reservation Dataset]
where no_of_children <> 0

--4. How many reservations were made for the year 20XX (replace XX with the desired year)?
select count(Booking_ID) as num_of_2018_bookings
from Hotel_Reservation.dbo.[Hotel Reservation Dataset]
where arrival_date like '2018%'

--5. What is the most commonly booked room type?
select room_type_reserved, count(room_type_reserved) as num_of_bookings
from Hotel_Reservation.dbo.[Hotel Reservation Dataset]
group by room_type_reserved

--6. How many reservations fall on a weekend (no_of_weekend_nights > 0)?
select count(Booking_ID) as num_of_weekend_bookings
from Hotel_Reservation.dbo.[Hotel Reservation Dataset]
where no_of_weekend_nights > 0

--7. What is the highest and lowest lead time for reservations?
select max(lead_time) as highest_lead_time, min(lead_time) as lowest_lead_time
from Hotel_Reservation.dbo.[Hotel Reservation Dataset]

--8. What is the most common market segment type for reservations?
select market_segment_type, count(market_segment_type) as num_of_segment_type
from Hotel_Reservation.dbo.[Hotel Reservation Dataset]
group by market_segment_type

--9. How many reservations have a booking status of "Confirmed"?
select count(booking_status) as num_of_confirmed_bookings
from Hotel_Reservation.dbo.[Hotel Reservation Dataset]
where booking_status <> 'Not_Canceled'

--10. What is the total number of adults and children across all reservations?
select sum(no_of_adults) as total_adults, sum(no_of_children) as total_children
from Hotel_Reservation.dbo.[Hotel Reservation Dataset]

--11. What is the average number of weekend nights for reservations involving children?
select avg(no_of_weekend_nights) as avg_no_of_weekends_with_children
from Hotel_Reservation.dbo.[Hotel Reservation Dataset]
where no_of_children > 0

--12. How many reservations were made in each month of the year?
select count(Booking_ID) as no_of_bookings_per_month, month(arrival_date) as months_in_2018
from Hotel_Reservation.dbo.[Hotel Reservation Dataset]
where year(arrival_date) = 2018
group by month(arrival_date)

--13. What is the average number of nights (both weekend and weekday) spent by guests for each room type?
select avg(no_of_weekend_nights + no_of_week_nights) as avg_no_of_nights, room_type_reserved
from Hotel_Reservation.dbo.[Hotel Reservation Dataset]
group by room_type_reserved

--14. For reservations involving children, what is the most common room type, and what is the average price for that room type?
select room_type_reserved, count(room_type_reserved) as no_of_room_type, avg(avg_price_per_room) as avg_price
from Hotel_Reservation.dbo.[Hotel Reservation Dataset]
where no_of_children > 0
group by room_type_reserved
order by no_of_room_type

--15. Find the market segment type that generates the highest average price per room.
select market_segment_type, count(market_segment_type) as no_of_segment_type, sum(avg_price_per_room) as total_avg_price_per_room
from Hotel_Reservation.dbo.[Hotel Reservation Dataset]
group by market_segment_type

select market_segment_type, max(avg_price_per_room) as highest_avg_price_per_room
from Hotel_Reservation.dbo.[Hotel Reservation Dataset]
group by market_segment_type