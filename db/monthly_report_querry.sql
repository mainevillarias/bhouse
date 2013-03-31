SELECT
     lodger."last_name",
     lodger."middle_name",
     payment."amount_paid",
     payment."month_of_payment" ,
     payment."or_number",
     payment."payment_date" ,
     payment."payment_status" ,
     lodger."first_name" AS lodger_first_name
FROM
     "public"."lodger" lodger INNER JOIN "public"."payment" payment ON lodger."id" = payment."lodger_id"