CREATE TABLE DOCTOR
(
	doc_physicianidnumber int,
	doc_firstname varchar(50),
	doc_lastname varchar(50),
	PRIMARY KEY (doc_physicianidnumber)
);
CREATE TABLE PATIENT
(
	pat_idnumber int,
	pat_firstname varchar(50),
	pat_lastname varchar(50),
	pat_address varchar(50),
	pat_city varchar(50),
	pat_state varchar(50),
    PRIMARY KEY (pat_idnumber)
);

CREATE TABLE APPOINTMENT
(
	app_date DATE,
	app_time TIME(0),
	app_duration TIME(0),
	app_reason varchar(50),
    doc_physicianidnumber int,
    pat_idnumber int,
    bill_number int,
	PRIMARY KEY (app_date, app_time),
	FOREIGN KEY (doc_physicianidnumber) REFERENCES DOCTOR(doc_physicianidnumber),
	FOREIGN KEY (pat_idnumber) REFERENCES PATIENT(pat_idnumber),
    FOREIGN KEY (bill_number) REFERENCES BILL(bill_number)
);
CREATE TABLE BILL
(
	bill_number int,
	bill_amountinsured FLOAT(2),
	bill_amountnotinsured FLOAT(2),
	bill_datesent DATE,
	bill_status varchar(50),
    pat_idnumber int,
    app_number int,
	PRIMARY KEY (bill_number),
    FOREIGN KEY (pat_idnumber) REFERENCES PATIENT(pat_idnumber)
);
CREATE TABLE PAYMENT
(
	pay_receiptnumber int,
	pay_amount FLOAT(2),
	pay_date DATE,
	pay_method varchar(50),
    pat_idnumber int,
    bill_number int,
    ins_name varchar(50),
	PRIMARY KEY (pay_receiptnumber),
	FOREIGN KEY (pat_idnumber) REFERENCES PATIENT(pat_idnumber),
	FOREIGN KEY (bill_number) REFERENCES BILL(bill_number),
	FOREIGN KEY (ins_name) REFERENCES INSURANCECOMPANY(ins_name)
);
CREATE TABLE INSURANCECOMPANY
(
    ins_name varchar(50),
	ins_benefitscontact varchar(50),
	ins_phonenumber int,
	ins_claimsaddress varchar(50),
    pat_idnumber int,
	PRIMARY KEY (ins_name),
	FOREIGN KEY(pat_idnumber) REFERENCES PATIENT(pat_idnumber)
);
