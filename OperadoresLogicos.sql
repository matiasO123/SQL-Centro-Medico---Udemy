declare @num1 decimal(9,2) = 20;
declare @num2 decimal(9,2) = 30;
declare @result decimal(9,2);

--
if @num1 > @num2
		print 'num1 es mayor a num2'
else
		print 'num2 es mayor que num1'

if @num1 <> @num2
		print 'num1 es diferente a num2'
else
		print 'num2 es igual que num1'

		if @num1 = @num2
		print 'num1 es igual a num2'
else
		print 'num2 es diferente que num1'