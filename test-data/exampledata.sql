\c takeondevdb;
SET search_path TO dev01,public;

--1st Manual Statement
INSERT INTO dev01.contributor(
	reference, period, survey, formid, status, receiptdate, lockedby, lockeddate, formtype, checkletter, frozensicoutdated, rusicoutdated, frozensic, rusic, frozenemployees, employees, frozenemployment, employment, frozenfteemployment, fteemployment, frozenturnover, turnover, enterprisereference, wowenterprisereference, cellnumber, currency, vatreference, payereference, companyregistrationnumber, numberlivelocalunits, numberlivevat, numberlivepaye, legalstatus, reportingunitmarker, region, birthdate, enterprisename, referencename, referenceaddress, referencepostcode, tradingstyle, contact, telephone, fax, selectiontype, inclusionexclusion, createdby, createddate, lastupdatedby, lastupdateddate)
	VALUES ('77700000001', '201803', '066', 4, 'Overridden', Now(), current_user, Now(), '0003', 'I', '56423', '56423', '56423', '56423', 146901, 146901, 146901, 146901, 63053.900, 63053.900, 146901, 146901, '9900712952', '783657710', 377, 'E', '123456789012', '1234567890123', '123456', 6724, 3494, 1840, '8', 'A', 'AA', 'test', 'An enterprise name', 'A reference name', 'A random reference address', 'AA9A9AA', 'A random trading style', 'Mr contact person', '01234567890', '+00441234567891', 'G', 'X', current_user, Now(), current_user, Now());

INSERT INTO dev01.response(
	reference, period, survey, questioncode, instance, response, createdby, createddate, lastupdatedby, lastupdateddate)
	VALUES ('77700000001', '201803', '066', '601', 0, '147', current_user, Now(), current_user, Now());
	
INSERT INTO dev01.response(
	reference, period, survey, questioncode, instance, response, createdby, createddate, lastupdatedby, lastupdateddate)
	VALUES ('77700000001', '201803', '066', '602', 0, '2059', current_user, Now(), current_user, Now());

INSERT INTO dev01.response(
	reference, period, survey, questioncode, instance, response, createdby, createddate, lastupdatedby, lastupdateddate)
	VALUES ('77700000001', '201803', '066', '700', 0, '147', current_user, Now(), current_user, Now());
	
INSERT INTO dev01.response(
	reference, period, survey, questioncode, instance, response, createdby, createddate, lastupdatedby, lastupdateddate)
	VALUES ('77700000001', '201803', '066', '701', 0, '2057', current_user, Now(), current_user, Now());	
	
--2nd Manual Statement

INSERT INTO dev01.contributor(
	reference, period, survey, formid, status, receiptdate, lockedby, lockeddate, formtype, checkletter, frozensicoutdated, rusicoutdated, frozensic, rusic, frozenemployees, employees, frozenemployment, employment, frozenfteemployment, fteemployment, frozenturnover, turnover, enterprisereference, wowenterprisereference, cellnumber, currency, vatreference, payereference, companyregistrationnumber, numberlivelocalunits, numberlivevat, numberlivepaye, legalstatus, reportingunitmarker, region, birthdate, enterprisename, referencename, referenceaddress, referencepostcode, tradingstyle, contact, telephone, fax, selectiontype, inclusionexclusion, createdby, createddate, lastupdatedby, lastupdateddate)
	VALUES ('77700000002', '201803', '066', 4, 'Overridden', Now(), current_user, Now(), '0003', 'I', '56423', '56423', '56423', '56423', 146901, 146901, 146901, 146901, 63053.900, 63053.900, 146901, 146901, '9900712952', '783657710', 377, 'E', '123456789012', '1234567890123', '123456', 6724, 3494, 1840, '8', 'A', 'AA', 'test', 'An enterprise name', 'A reference name', 'A random reference address', 'AA9A9AA', 'A random trading style', 'Mr contact person', '01234567890', '+00441234567891', 'G', 'X', current_user, Now(), current_user, Now());

INSERT INTO dev01.response(
	reference, period, survey, questioncode, instance, response, createdby, createddate, lastupdatedby, lastupdateddate)
	VALUES ('77700000002', '201803', '066', '601', 0, '149', current_user, Now(), current_user, Now());
	
INSERT INTO dev01.response(
	reference, period, survey, questioncode, instance, response, createdby, createddate, lastupdatedby, lastupdateddate)
	VALUES ('77700000002', '201803', '066', '602', 0, '2059', current_user, Now(), current_user, Now());

INSERT INTO dev01.response(
	reference, period, survey, questioncode, instance, response, createdby, createddate, lastupdatedby, lastupdateddate)
	VALUES ('77700000002', '201803', '066', '700', 0, '149', current_user, Now(), current_user, Now());
	
INSERT INTO dev01.response(
	reference, period, survey, questioncode, instance, response, createdby, createddate, lastupdatedby, lastupdateddate)
	VALUES ('77700000002', '201803', '066', '701', 0, '2057', current_user, Now(), current_user, Now());	
	

	
--3rd Manual Statement

INSERT INTO dev01.contributor(
	reference, period, survey, formid, status, receiptdate, lockedby, lockeddate, formtype, checkletter, frozensicoutdated, rusicoutdated, frozensic, rusic, frozenemployees, employees, frozenemployment, employment, frozenfteemployment, fteemployment, frozenturnover, turnover, enterprisereference, wowenterprisereference, cellnumber, currency, vatreference, payereference, companyregistrationnumber, numberlivelocalunits, numberlivevat, numberlivepaye, legalstatus, reportingunitmarker, region, birthdate, enterprisename, referencename, referenceaddress, referencepostcode, tradingstyle, contact, telephone, fax, selectiontype, inclusionexclusion, createdby, createddate, lastupdatedby, lastupdateddate)
	VALUES ('77700000003', '201803', '066', 4, 'Overridden', Now(), current_user, Now(), '0003', 'I', '56423', '56423', '56423', '56423', 146901, 146901, 146901, 146901, 63053.900, 63053.900, 146901, 146901, '9900712952', '783657710', 377, 'E', '123456789012', '1234567890123', '123456', 6724, 3494, 1840, '8', 'A', 'AA', 'test', 'An enterprise name', 'A reference name', 'A random reference address', 'AA9A9AA', 'A random trading style', 'Mr contact person', '01234567890', '+00441234567891', 'G', 'X', current_user, Now(), current_user, Now());

INSERT INTO dev01.response(
	reference, period, survey, questioncode, instance, response, createdby, createddate, lastupdatedby, lastupdateddate)
	VALUES ('77700000003', '201803', '066', '601', 0, '147', current_user, Now(), current_user, Now());
	
INSERT INTO dev01.response(
	reference, period, survey, questioncode, instance, response, createdby, createddate, lastupdatedby, lastupdateddate)
	VALUES ('77700000003', '201803', '066', '602', 0, '2057', current_user, Now(), current_user, Now());

INSERT INTO dev01.response(
	reference, period, survey, questioncode, instance, response, createdby, createddate, lastupdatedby, lastupdateddate)
	VALUES ('77700000003', '201803', '066', '700', 0, '149', current_user, Now(), current_user, Now());
	
INSERT INTO dev01.response(
	reference, period, survey, questioncode, instance, response, createdby, createddate, lastupdatedby, lastupdateddate)
	VALUES ('77700000003', '201803', '066', '701', 0, '2059', current_user, Now(), current_user, Now());	
	

	
--4th Manual Statement

INSERT INTO dev01.contributor(
	reference, period, survey, formid, status, receiptdate, lockedby, lockeddate, formtype, checkletter, frozensicoutdated, rusicoutdated, frozensic, rusic, frozenemployees, employees, frozenemployment, employment, frozenfteemployment, fteemployment, frozenturnover, turnover, enterprisereference, wowenterprisereference, cellnumber, currency, vatreference, payereference, companyregistrationnumber, numberlivelocalunits, numberlivevat, numberlivepaye, legalstatus, reportingunitmarker, region, birthdate, enterprisename, referencename, referenceaddress, referencepostcode, tradingstyle, contact, telephone, fax, selectiontype, inclusionexclusion, createdby, createddate, lastupdatedby, lastupdateddate)
	VALUES ('77700000004', '201803', '066', 4, 'Overridden', Now(), current_user, Now(), '0003', 'I', '56423', '56423', '56423', '56423', 146901, 146901, 146901, 146901, 63053.900, 63053.900, 146901, 146901, '9900712952', '783657710', 377, 'E', '123456789012', '1234567890123', '123456', 6724, 3494, 1840, '8', 'A', 'AA', 'test', 'An enterprise name', 'A reference name', 'A random reference address', 'AA9A9AA', 'A random trading style', 'Mr contact person', '01234567890', '+00441234567891', 'G', 'X', current_user, Now(), current_user, Now());

INSERT INTO dev01.response(
	reference, period, survey, questioncode, instance, response, createdby, createddate, lastupdatedby, lastupdateddate)
	VALUES ('77700000004', '201803', '066', '601', 0, '158', current_user, Now(), current_user, Now());
	
INSERT INTO dev01.response(
	reference, period, survey, questioncode, instance, response, createdby, createddate, lastupdatedby, lastupdateddate)
	VALUES ('77700000004', '201803', '066', '602', 0, '2059', current_user, Now(), current_user, Now());

INSERT INTO dev01.response(
	reference, period, survey, questioncode, instance, response, createdby, createddate, lastupdatedby, lastupdateddate)
	VALUES ('77700000004', '201803', '066', '700', 0, '158', current_user, Now(), current_user, Now());
	
INSERT INTO dev01.response(
	reference, period, survey, questioncode, instance, response, createdby, createddate, lastupdatedby, lastupdateddate)
	VALUES ('77700000004', '201803', '066', '701', 0, '2059', current_user, Now(), current_user, Now());	
	

	
--5th Manual Statement

INSERT INTO dev01.contributor(
	reference, period, survey, formid, status, receiptdate, lockedby, lockeddate, formtype, checkletter, frozensicoutdated, rusicoutdated, frozensic, rusic, frozenemployees, employees, frozenemployment, employment, frozenfteemployment, fteemployment, frozenturnover, turnover, enterprisereference, wowenterprisereference, cellnumber, currency, vatreference, payereference, companyregistrationnumber, numberlivelocalunits, numberlivevat, numberlivepaye, legalstatus, reportingunitmarker, region, birthdate, enterprisename, referencename, referenceaddress, referencepostcode, tradingstyle, contact, telephone, fax, selectiontype, inclusionexclusion, createdby, createddate, lastupdatedby, lastupdateddate)
	VALUES ('77700000005', '201803', '066', 4, 'Overridden', Now(), current_user, Now(), '0003', 'I', '56423', '56423', '56423', '56423', 146901, 146901, 146901, 146901, 63053.900, 63053.900, 146901, 146901, '9900712952', '783657710', 377, 'E', '123456789012', '1234567890123', '123456', 6724, 3494, 1840, '8', 'A', 'AA', 'test', 'An enterprise name', 'A reference name', 'A random reference address', 'AA9A9AA', 'A random trading style', 'Mr contact person', '01234567890', '+00441234567891', 'G', 'X', current_user, Now(), current_user, Now());

INSERT INTO dev01.response(
	reference, period, survey, questioncode, instance, response, createdby, createddate, lastupdatedby, lastupdateddate)
	VALUES ('77700000005', '201803', '066', '601', 0, '168', current_user, Now(), current_user, Now());
	
INSERT INTO dev01.response(
	reference, period, survey, questioncode, instance, response, createdby, createddate, lastupdatedby, lastupdateddate)
	VALUES ('77700000005', '201803', '066', '602', 0, '2059', current_user, Now(), current_user, Now());

INSERT INTO dev01.response(
	reference, period, survey, questioncode, instance, response, createdby, createddate, lastupdatedby, lastupdateddate)
	VALUES ('77700000005', '201803', '066', '700', 0, '168', current_user, Now(), current_user, Now());
	
INSERT INTO dev01.response(
	reference, period, survey, questioncode, instance, response, createdby, createddate, lastupdatedby, lastupdateddate)
	VALUES ('77700000005', '201803', '066', '701', 0, '2059', current_user, Now(), current_user, Now());	
	

	
--6th Manual Statement

INSERT INTO dev01.contributor(
	reference, period, survey, formid, status, receiptdate, lockedby, lockeddate, formtype, checkletter, frozensicoutdated, rusicoutdated, frozensic, rusic, frozenemployees, employees, frozenemployment, employment, frozenfteemployment, fteemployment, frozenturnover, turnover, enterprisereference, wowenterprisereference, cellnumber, currency, vatreference, payereference, companyregistrationnumber, numberlivelocalunits, numberlivevat, numberlivepaye, legalstatus, reportingunitmarker, region, birthdate, enterprisename, referencename, referenceaddress, referencepostcode, tradingstyle, contact, telephone, fax, selectiontype, inclusionexclusion, createdby, createddate, lastupdatedby, lastupdateddate)
	VALUES ('77700000001', '201712', '066', 4, 'Overridden', Now(), current_user, Now(), '0003', 'I', '56423', '56423', '56423', '56423', 146901, 146901, 146901, 146901, 63053.900, 63053.900, 146901, 146901, '9900712952', '783657710', 377, 'E', '123456789012', '1234567890123', '123456', 6724, 3494, 1840, '8', 'A', 'AA', 'test', 'An enterprise name', 'A reference name', 'A random reference address', 'AA9A9AA', 'A random trading style', 'Mr contact person', '01234567890', '+00441234567891', 'G', 'X', current_user, Now(), current_user, Now());

INSERT INTO dev01.response(
	reference, period, survey, questioncode, instance, response, createdby, createddate, lastupdatedby, lastupdateddate)
	VALUES ('77700000001', '201712', '066', '601', 0, '949', current_user, Now(), current_user, Now());

INSERT INTO dev01.response(
	reference, period, survey, questioncode, instance, response, createdby, createddate, lastupdatedby, lastupdateddate)
	VALUES ('77700000001', '201712', '066', '602', 0, '2059', current_user, Now(), current_user, Now());

INSERT INTO dev01.response(
	reference, period, survey, questioncode, instance, response, createdby, createddate, lastupdatedby, lastupdateddate)
	VALUES ('77700000001', '201712', '066', '700', 0, '949', current_user, Now(), current_user, Now());
	
INSERT INTO dev01.response(
	reference, period, survey, questioncode, instance, response, createdby, createddate, lastupdatedby, lastupdateddate)
	VALUES ('77700000001', '201712', '066', '701', 0, '2059', current_user, Now(), current_user, Now());	
	

	
--7th Manual Statement

INSERT INTO dev01.contributor(
	reference, period, survey, formid, status, receiptdate, lockedby, lockeddate, formtype, checkletter, frozensicoutdated, rusicoutdated, frozensic, rusic, frozenemployees, employees, frozenemployment, employment, frozenfteemployment, fteemployment, frozenturnover, turnover, enterprisereference, wowenterprisereference, cellnumber, currency, vatreference, payereference, companyregistrationnumber, numberlivelocalunits, numberlivevat, numberlivepaye, legalstatus, reportingunitmarker, region, birthdate, enterprisename, referencename, referenceaddress, referencepostcode, tradingstyle, contact, telephone, fax, selectiontype, inclusionexclusion, createdby, createddate, lastupdatedby, lastupdateddate)
	VALUES ('77700000001', '201803', '076', 4, 'Overridden', Now(), current_user, Now(), '0003', 'I', '56423', '56423', '56423', '56423', 146901, 146901, 146901, 146901, 63053.900, 63053.900, 146901, 146901, '9900712952', '783657710', 377, 'E', '123456789012', '1234567890123', '123456', 6724, 3494, 1840, '8', 'A', 'AA', 'test', 'An enterprise name', 'A reference name', 'A random reference address', 'AA9A9AA', 'A random trading style', 'Mr contact person', '01234567890', '+00441234567891', 'G', 'X', current_user, Now(), current_user, Now());

INSERT INTO dev01.response(
	reference, period, survey, questioncode, instance, response, createdby, createddate, lastupdatedby, lastupdateddate)
	VALUES ('77700000001', '201803', '076', '601', 0, '1049', current_user, Now(), current_user, Now());	

INSERT INTO dev01.response(
	reference, period, survey, questioncode, instance, response, createdby, createddate, lastupdatedby, lastupdateddate)
	VALUES ('77700000001', '201803', '076', '602', 0, '2057', current_user, Now(), current_user, Now());

INSERT INTO dev01.response(
	reference, period, survey, questioncode, instance, response, createdby, createddate, lastupdatedby, lastupdateddate)
	VALUES ('77700000001', '201803', '076', '700', 0, '1049', current_user, Now(), current_user, Now());
	
INSERT INTO dev01.response(
	reference, period, survey, questioncode, instance, response, createdby, createddate, lastupdatedby, lastupdateddate)
	VALUES ('77700000001', '201803', '076', '701', 0, '2057', current_user, Now(), current_user, Now());	
	
-------End