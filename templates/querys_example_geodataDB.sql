select ct.city_id, ct.title_ru, ct.area_ru, rg.region_id, rg.title_ru, cr.country_id, cr.title_ru
from _cities as ct
left join _countries as cr on cr.country_id = ct.country_id
left join _regions as rg on rg.country_id = ct.country_id
where ct.title_ru like "Москва" and cr.title_ru like "Росс%" and rg.title_ru like "Калинин%";



select rg.title_ru as region_name, ct.title_ru as city_name    
from _regions as rg
left join _cities as ct on rg.country_id = ct.country_id
where rg.title_ru like "Московская область";
