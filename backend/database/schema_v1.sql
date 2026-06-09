CREATE DATABASE it_resource_manager;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE enterprise (
    id uuid PRIMARY KEY,
    name varchar(60) NOT NULL,
    cnpj varchar(14) NOT NULL UNIQUE, 
    cep varchar(9) NOT NULL,
    street varchar(60) NOT NULL,
    number varchar(8) NOT NULL,
    complement varchar(60),
    neighborhood varchar(60) NOT NULL 
);

CREATE TABLE person (
    id uuid PRIMARY KEY,
    enterprise_id uuid REFERENCES enterprise(id) ON DELETE CASCADE, 
    name varchar(60) NOT NULL,
    role varchar(60) NOT NULL,
    email varchar(60) NOT NULL UNIQUE, 
    created_at timestamp NOT NULL DEFAULT now() );

CREATE TABLE equipment (
    id uuid PRIMARY KEY,
    person_id uuid REFERENCES person(id) ON DELETE SET NULL, 
    type varchar(20) NOT NULL,
    brand varchar(60) NOT NULL,
    serial_number varchar(44) NOT NULL UNIQUE, 
    status varchar(20) NOT NULL DEFAULT 'available', 
    created_at timestamp NOT NULL DEFAULT now()
);