
ALTER TABLE ApplicationDeposit
ADD DatePaid datetime NULL, ReferenceNo varchar(max) NULL, PayFastPaymentId int NULL;


ALTER TABLE LeaseRentPaid
ADD PaymentSource varchar(50) NULL, ReferenceNo varchar(max) NULL, PayFastPaymentId int NULL;


ALTER TABLE LeaseRentPaid
ALTER COLUMN DatePaid datetime NULL;