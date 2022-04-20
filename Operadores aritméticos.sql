declare @num1 decimal(9,2) = 20;
declare @num2 decimal(9,2) = 30;
declare @result decimal(9,2);

--
-- + 
--
set @result = @num1 + @num2;
print 'suma';
print @result;
print '';


--
-- -
--
set @result =  @num1 - @num2;
print 'resta';
print @result;
print '';

--
-- *
--
set @result =  @num1 * @num2;
print 'mult';
print @result;
print '';


--
-- /
--
set @result =  @num1 / @num2;
print 'div';
print @result;
print '';


--
-- mod
--
set @result =  @num1 % @num2;
print 'mod';
print @result;
print '';