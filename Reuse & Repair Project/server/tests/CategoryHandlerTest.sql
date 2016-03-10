-- test for getAll recursive query
select c.category_name as 'category',
s.subcategory_name as 'subcategory',
b.business_name as 'business',
a.street_number as 'streetNumber',
a.street_name as 'streetName',
a.city as 'city',
a.zip as 'zip',
a.state as 'state',
a.geolocation as 'geolocation',
b.website as 'website',
b.phone as 'phone',
h.hours_entry as 'hours' from Category c inner join Category_Subcategory cs
on c.category_id=cs.fk_category_id
inner join Subcategory s
on cs.fk_subcategory_id = s.subcategory_id
inner join Business_Subcategory bs on s.subcategory_id = bs.fk_subcategory_id
inner join Business b on bs.fk_business_id = b.business_id
inner join Hours h on b.fk_hours_id = h.hours_id inner join Address a on b.fk_address_id = a.address_id;