function approach(a,b,amount)
{
    if(a<b){
        return min(a+amount,b);
    }else{
        return max(a-amount,b);
    }
}