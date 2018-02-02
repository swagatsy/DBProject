drop table if exists doctor_hospital;
drop table if exists slots ;
drop table if exists appointments ;
drop table if exists docratings ;
drop table if exists hospratings ;
drop table if exists patratings ;
drop table if exists patient ;
drop table if exists doctor ;
drop table if exists doctype ;
drop table if exists hospital ;
drop table if exists notifications ;
drop table if exists doc_hosp_slots ;
drop sequence if exists slotidseq;
drop sequence if exists appointmentidseq;

create sequence if not exists slotidseq start 1;
create sequence if not exists appointmentidseq start 1;


create table patient (
username varchar(20) ,
password varchar(20) not null, 
first_name varchar(20) not null, 
middle_name varchar(20) , 
last_name varchar(20) ,
DOB date not null, 
B_grp varchar(3) not null, 
email varchar(35) not null, 
phone numeric(12) not null,
gender numeric(1) not null,
balance int ,
primary key (username) 
);

create table patratings (
PatientID varchar(20) ,
hospitalsRated numeric(10) ,
PresRating real ,
foreign key(PatientID) references patient(username) on delete cascade on update cascade 
);

create table hospital (
username varchar(20) ,
password varchar(20) not null,
name varchar(25) not null,
email varchar(25) not null ,
phone numeric(12) not null,
rating real ,
primary key(username)
);


create table doctype (
type varchar(20) ,
discription varchar(40),
primary key(type)
);

create table doctor (
username varchar(20) ,
first_name varchar(20) not null, 
middle_name varchar(20) , 
last_name varchar(20) ,
phone numeric(12) ,
type varchar(20) ,
gender numeric(1) not null ,
rating real ,
primary key (username) , 
foreign key(type) references doctype(type) on delete cascade on update cascade 
);

create table doctor_hospital(
docuid varchar(20),
hospuid varchar(20),
fees int ,
foreign key(docuid) references doctor(username) on delete cascade on update cascade,
foreign key(hospuid) references hospital(username) on delete cascade on update cascade
);


create table slots (
slotid int primary key default nextval('slotidseq'),
Slotday varchar(10) ,
StTime time ,
EndTime time ,
check (Slotday in ('Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday'))
);

create table doc_hosp_slots (
slotid int ,
DocID varchar(20),
HospID varchar(20) ,
Fees int ,
primary key(slotid,DocID) ,
foreign key(slotid) references slots(slotid) on delete cascade on update cascade ,
foreign key(DocID) references doctor(username) on delete cascade on update cascade,
foreign key(HospID) references hospital(username) on delete cascade on update cascade
);

create table appointments (
slotid int ,
Slotdate date ,
PatientID varchar(20) ,
DocID varchar(20) ,
HospID varchar(20) ,
Fees int ,
patientRating numeric(2) ,
patientFeedback text ,
patientFeedbackGiven numeric(1),

doctorRating numeric(2) ,
doctorFeedback text ,
doctorFeedbackGiven numeric(1),

hospitalRating numeric(2) ,
hospitalFeedback text ,
hospitalFeedbackGiven numeric(1),

Isfinished numeric(1) ,
primary key (slotid,docid,slotdate) ,
foreign key (slotid) references slots(slotid) on delete cascade on update cascade ,
foreign key (PatientID) references patient(username) on delete cascade on update cascade ,
foreign key(DocID) references doctor(username) on delete cascade on update cascade ,
foreign key(HospID) references hospital(username) on delete cascade on update cascade 
);


create table docratings (
DoctorID varchar(20) ,
usersRated numeric(10) ,
PresRating real ,
primary key (DoctorID),
foreign key(DoctorID) references doctor(username) on delete cascade on update cascade 
);

create table hospratings (
HospID varchar(20) ,
usersRated numeric(10) ,
PresRating real,
primary key(HospID),
foreign key(HospID) references hospital(username) on delete cascade on update cascade 
);

create table notifications (
HospID varchar(20) ,
UserID varchar(20) ,
Message text ,
seen   numeric(1) ,
foreign key(HospID) references hospital(username) on delete cascade on update cascade ,
foreign key(UserID) references patient(username) on delete cascade on update cascade 

);