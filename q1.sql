
copy (
	select xmlelement(
		name warehouses,
		xmlagg(query1)
	) 
    from (
        select xmlelement(
            name warehouse,
            xmlforest(
                w.w_id as id,
                w.w_name as name,
                xmlforest(
                w.w_street as street,
                w.w_city as city,
                w.w_country as country
                ) as address
            ),
            xmlelement(
                name items,
                xmlagg(
                    xmlelement(name item,
                        xmlforest(
                            i.i_id as id,
                            i.i_im_id as im_id,
                            i.i_name as name,
                            i.i_price as price,
                            s.s_qty as qty
                        )
                    ) order by i.i_id
                )
            )
        ) as query1 from stock s inner join warehouse w on w.w_id = s.w_id inner join item i on s.i_id = i.i_id group by w.w_id order by w.w_id
    ) mywarehouses
) to '/tmp/q1.xml';