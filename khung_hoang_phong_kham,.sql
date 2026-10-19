create database if not exists healthysync_db;
use healthysync_db;

create table Patients(
patient_id int auto_increment primary key,
full_name varchar(100) not null,
phone varchar(15) not null
);

create table Doctors(
doctor_id int auto_increment primary key,
full_name varchar(100) not null,
specialty varchar(50)
);

create table Appoinntments(
appointment_id int auto_increment primary key,
patient_id int,
doctor_id int,
appointment_date datetime not null,
is_active boolean default true,

foreign key(patient_id) references Patients(patient_id),
foreign key (doctor_id) references Doctors(doctor_id)
);

drop table if exists Appointments;

create table Appointments(
appointment_id int auto_increment primary key,
patient_id int not null,
doctor_id int not null,
appointment_date datetime not null,

status enum('Pending','Confirmed','In-progress','Completed','Cancelled')default 'Pending',
deposit_amount decimal(10,2) default 0.00,
penalty_fee decimal(10,2)default 0.00,
cancel_reason varchar(255) default null,

foreign key(patient_id) references Patients(patient_id),
foreign key(doctor_id)references Doctors(doctor_id)
);
create table Prescriptions(
prescription_id int auto_increment primary key,
appointment_id int unique not null,
medication_details text not null,
issued_date datetime default current_timestamp,
foreign key(appointment_id) references Appointments(appointment_id)
);

