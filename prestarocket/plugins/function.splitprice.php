
<?php
/*
 * Smarty plugin
 * -------------------------------------------------------------
 * File:     function.splitprice.php
 * Type:     function
 * Name:     splitprice
 * Purpose:  split currency and amount from a string
 * -------------------------------------------------------------
 */
function smarty_function_splitprice($params, &$smarty)
{
    $price = $params['price'];
    if($smarty->tpl_vars['currency']->value['iso_code'] !== "EUR"){
        return $price;
    }

    $currencySign = $smarty->tpl_vars['currency']->value['sign'];


    $priceSplit = priceToFloat($price,$currencySign);


    return $priceSplit;
}

function priceToFloat($price,$currencySign)
{
    $delimiter = ',';
    $price = str_replace($currencySign, '', $price);
    $price = explode($delimiter,$price);
    $priceUnit = $price[0];
    $priceDecimal = '';
    if(isset($price[1]) && (int)$price[1] > 0){
        $priceDecimal = trim($price[1], " \t\n\r\0\x0B\xC2\xA0");
    }

    return '<span class="price-unit">'.$priceUnit.'</span><sup><span class="price-currency">'.$currencySign.'</span><span class="price-decimal">'.$priceDecimal.'</span></sup>';
}