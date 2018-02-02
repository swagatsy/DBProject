insert into patient values('swagatsy','swagpassword','Swagat','Shankar','Yadawad','1997/08/20','A+','swagatsy@gmail.com',9987583324,0,1000);
insert into patient values('bittu','bittupassword','Bittu','Kumar','Chaudhary','1997/08/15','AB+','bittu.dakshana15@gmail.com',9987582933,0,2000);
insert into patient values('utkarshm','utkarshpassword','Utkarsh','Kumar','Mahawar','1997/01/09','A+','utkarshkumarmahawar@gmail.com',9082103483,0,3000);
insert into patient values('rathod','dineshpassword','Dinesh','','Rathod','1997/05/14','A+','7rathod7@gmail.com',7045800407,0,4000);


-- insert into doctor values('rossgeller','Ross','Jack','Geller',8187837918,'Paleantology',0,0);
-- insert into doctor values('karengreen','Karen','','Green',7829004025,'Neurology',0,0);


insert into hospital values('KEM','kempass','KEM','kemhosp@gmail.com',1234567890,0,1024,1024);
insert into hospital values('saro','saropass','Sarojini','sarohosp@gmail.com',1357924680,0,2097,10);
insert into hospital values('lila','lilapass','Lilavati','lilahosp@gmail.com',1092387456,0,4124,10243);
insert into hospital values('appolo','kempass','Appolo','appolohosp@gmail.com',1920378465,0,24,66654);


 update hospital set address = 'Rao Saheb Achutrao, Patwardhan Marg, Four Bunglows, Andheri West, Mumbai, Maharashtra 400053' where username='Kokilaben' ;
 update hospital set address = 'SI Corporation, ESI Hospital Complex, Andheri , MIDC, Marol, Mumbai, Maharashtra' where username='appolo' ;
 update hospital set address = 'Khetan Apartment, S. V. road, Opp. Telephone Exchange, Malad (W), Mumbai, Maharashtra 400064' where username='saro' ;
 update hospital set address = 'A-791, Bandra Reclamation, KC Road, Bandra West, Mumbai, Maharashtra 400050' where username='lila' ;

-- some more inserts will happen when we manually register doctors on the portal and add slots