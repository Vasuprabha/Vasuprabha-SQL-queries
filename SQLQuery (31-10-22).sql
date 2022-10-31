select * from EBANKING_DB
select * from EBANKING_USER 
create procedure ADD_DATA_TO_DB as
begin
insert into EBANKING_DB values (180501,'Anitha',10000,'Thousandlights')
insert into EBANKING_USER values (180501,6666,10000,6767)
end
exec ADD_DATA_TO_DB



  create procedure WITHDRAW 
  (@PIN_NO int =4321,@ACCOUNT_NO int =54321) as
  begin 
  select ED.ACCOUNT_HOLDER_NAME,ED.ACCOUNT_NUMBER,ED.BALANCE_AMOUNT,ED.BRANCH,EU.PIN_NUMBER,EU.UPI_NUMBER
  from EBANKING_DB as ED inner join EBANKING_USER as EU on 
  ED.ACCOUNT_NUMBER=EU.ACCOUNT_NUMBER
  end

  exec WITHDRAW




  create procedure WITHDRAW_PROCEDURE
  @PIN_NO int,
  @ACCOUNT_NO int,
  @AMOUNT int
  as
  begin
  declare @FINAL_BALANCE int
  set @FINAL_BALANCE=  select BALANCE_AMOUNT
  from EBANKING_DB as ED inner join EBANKING_USER as EU on 
  ED.ACCOUNT_NUMBER=EU.ACCOUNT_NUMBER
  where @ACCOUNT_NO=ED.ACCOUNT_NUMBER
  and @AMOUNT<=ED.BALANCE_AMOUNT
  --set @PIN_NO =4321
  --set @ACCOUNT_NO  =54321 
  End
  drop procedure WITHDRAW_PROCEDURE
  exec WITHDRAW_PROCEDURE 
  @PIN_NO =1111,
  @FINAL_BALANCE =30000,
  @ACCOUNT_NO =12345,
  @AMOUNT =1000;
