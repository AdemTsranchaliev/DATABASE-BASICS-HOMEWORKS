CREATE FUNCTION ufn_CalculateFutureValue( @Sum DECIMAL(14,4),@YearlyInterestRate FLOAT,@Years INT)
RETURNS DECIMAL(14,4)
AS
 BEGIN
	DECLARE @Result DECIMAL(14,4) = @Sum*(POWER(1+@YearlyInterestRate,@Years));
	RETURN @Result
 END
 GO

-- SELECT dbo.ufn_CalculateFutureValue(100,0.1,5)