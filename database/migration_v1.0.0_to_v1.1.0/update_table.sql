-- Table: public.reservation

-- DROP TABLE public.reservation;

CREATE TABLE public.reservation
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    avalaibility_date date,
    notification_is_sent boolean NOT NULL,
    "position" integer NOT NULL,
    book_id integer,
    library_id integer,
    registered_user_id integer,
    CONSTRAINT reservation_pkey PRIMARY KEY (id),
    CONSTRAINT fk5d74ihv3dtabadl6hnk60q6ip FOREIGN KEY (registered_user_id)
        REFERENCES public.registered_user (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fkp377u47igi9fw9amplrxsepe FOREIGN KEY (book_id, library_id)
        REFERENCES public.available_copie (book_id, library_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.reservation
    OWNER to postgres;

-- Table: public.available_copie

-- ALTER TABLE public.available_copie;

ALTER TABLE public.available_copie
ADD book_can_be_reserved boolean NOT NULL DEFAULT true,
ADD nearest_return_date date,
ADD reservation_count integer NOT NULL DEFAULT 0;



