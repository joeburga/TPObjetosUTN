
object fender
{
	method valor()
	{
		return 10
	}
	
	method rota()
	{
		
	}
}

object gibson
{
	var sanita = true
	
	method rota()
	{
		sanita = false
	}
	
	method valor()
	{
		if(sanita)
		{
			return 15
		}
		else
		{
			return 5
		}
	}
}