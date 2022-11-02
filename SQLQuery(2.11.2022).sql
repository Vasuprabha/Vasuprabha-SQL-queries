select * from EBANKING_DB
select * from EBANKING_USER 
create procedure ADD_DATA_TO_DB as
begin
insert into EBANKING_DB values (180501,'Anitha',10000,'Thousandlights')
insert into EBANKING_USER values (180501,6666,10000,6767)
end
exec ADD_DATA_TO_DB

select * from EBANKING_DB
select * from EBANKING_USER 

select * from EBANKING_DB
update EBANKING_DB set BALANCE_AMOUNT= (BALANCE_AMOUNT-1000)
where ACCOUNT_NUMBER = 12345 and BALANCE_AMOUNT >= 1000

create procedure VASU_WITHDRAW
@ACCOUNT_NO int ,@AMOUNT int
as

begin
select * from EBANKING_DB
update EBANKING_DB set BALANCE_AMOUNT= (BALANCE_AMOUNT-@AMOUNT)
where ACCOUNT_NUMBER = @ACCOUNT_NO and BALANCE_AMOUNT >= @AMOUNT
end

exec VASU_WITHDRAW '12345','1000'
 