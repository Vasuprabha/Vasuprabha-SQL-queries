select * from VASU_EBANKING_DB

alter procedure VASU_ADD_DATA 
@ACC_NO int,@ACC_HOLDER varchar(20),@BALANCE int,@BRANCH varchar(20)
as
begin
insert into VASU_EBANKING_DB (ACCOUNT_NUMBER,ACCOUNT_HOLDER_NAME,BALANCE_AMOUNT,BRANCH) values (@ACC_NO,@ACC_HOLDER,@BALANCE,@BRANCH)
end
exec VASU_ADD_DATA '45678','Karthi','10000','Kodambakkam'


select* from VASU_EBANKING_DB

alter procedure VASU_WITHDRAW_AMT
@ACCOUNT_NO int ,@AMOUNT int
as
begin
declare @BALANCE int
set @BALANCE= (select BALANCE_AMOUNT from VASU_EBANKING_DB where ACCOUNT_NUMBER=@ACCOUNT_NO) ;
if (@BALANCE>@AMOUNT)
 begin
  update VASU_EBANKING_DB set BALANCE_AMOUNT= (@BALANCE-@AMOUNT)
  where ACCOUNT_NUMBER=@ACCOUNT_NO
  print 'Amount Sucessfully Debited'
  end
else
 begin
     print 'Insufficient fund'
 end
end
exec VASU_WITHDRAW_AMT '12345','500'

select* from VASU_EBANKING_DB
