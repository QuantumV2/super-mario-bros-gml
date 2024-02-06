function approach(a,b,amount)
{
	print(a,b,amount)
    if(a<b){
		print(min(a+amount,b))
        return min(a+amount,b);
    }else{
		print(max(a+amount,b))
        return max(a-amount,b);
    }
}