Map<String,Decimal> currISOCodeAndExchangeRateMap = new Map<String,Decimal>();
currISOCodeAndExchangeRateMap.put('AUD',0.74);
currISOCodeAndExchangeRateMap.put('CAD',1.56);
currISOCodeAndExchangeRateMap.put('EUR',4.71);
currISOCodeAndExchangeRateMap.put('TRY',2.94);
currISOCodeAndExchangeRateMap.put('INR',0.014);
system.debug(currISOCodeAndExchangeRateMap);

Decimal inrToUsdCnvrsnRate = currISOCodeAndExchangeRateMap.get('INR');
system.debug('INR to USD Conversion Rate ' + inrToUsdCnvrsnRate);

Boolean isContainsSAD = currISOCodeAndExchangeRateMap.containsKey('SAD');
system.debug('Is Convertion rate for SAD available ' + isContainsSAD);

Set<String> moreThanOrEqualUSDValueCodesSet = new Set<String>();
Set<String> lessThanUSDValueCodesSet = new Set<String>();

for(String isoCode : currISOCodeAndExchangeRateMap.keySet()){
    if(currISOCodeAndExchangeRateMap.get(isoCode)>= 1){
        moreThanOrEqualUSDValueCodesSet.add(isoCode);
    }else{
        lessThanUSDValueCodesSet.add(isoCode);
    }
}
system.debug('All currency ISO codes which have higher than or egual USD ' + moreThanOrEqualUSDValueCodesSet);
system.debug('All currency ISO codes which have lower than or equal USD ' + lessThanUSDValueCodesSet);

