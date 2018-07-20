{**
 * 2007-2017 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2017 PrestaShop SA
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}

<meta property="og:title" content="{$page.meta.title}"/>
<meta property="og:description" content="{$page.meta.description}"/>
<meta property="og:type" content="website"/>
<meta property="og:url" content="{$urls.current_url}"/>
<meta property="og:site_name" content="{$shop.name}"/>
<meta property="og:image" content="{$urls.shop_domain_url}{$shop.logo}"/>

<script type="application/ld+json">
{
    "@context" : "http://schema.org",
    "@type" : "Organization",
    "name" : "{$shop.name}",
    "url" : "{$urls.pages.index}",
    "logo" : {
        "@type":"ImageObject",
        "url":"{$urls.shop_domain_url}{$shop.logo}"
    }
}
</script>
<script type="application/ld+json">
{
    "@context":"http://schema.org",
    "@type":"WebPage",
    "isPartOf": {
        "@type":"WebSite",
        "url":  "{$urls.pages.index}",
        "name": "{$shop.name}"
    },
    "name": "{$page.meta.title}",
    "url":  "{$urls.current_url}"
}
</script>
{if $page.page_name =='index'}
<script	type="application/ld+json">
{
	"@context":	"http://schema.org",
	"@type": "WebSite",
    "url" : "{$urls.pages.index}",
	"image": {
	"@type": "ImageObject",
    "url":"{$urls.shop_domain_url}{$shop.logo}"
	},
    "potentialAction": {
    "@type": "SearchAction",
    "target": "{'--search_term_string--'|str_replace:'{search_term_string}':$link->getPageLink('search',true,null,['search_query'=>'--search_term_string--'])}",
     "query-input": "required name=search_term_string"
	 }
}
</script>
{/if}
{if $page.page_name == 'product'}
    <script type="application/ld+json">
    {
    "@context": "http://schema.org/",
    "@type": "Product",
    "name": "{$product.name}",
    "description": "{$page.meta.description}",
	{if $product.reference}"mpn": "{$product.id}",{/if}
    {if $product_manufacturer->name}"brand": {
        "@type": "Thing",
        "name": "{$product_manufacturer->name|escape:'html':'UTF-8'}"
    },{/if}
    {if isset($nbComments) && $nbComments && $ratings.avg}"aggregateRating": {
        "@type": "AggregateRating",
        "ratingValue": "{$ratings.avg|round:1|escape:'html':'UTF-8'}",
        "reviewCount": "{$nbComments|escape:'html':'UTF-8'}"
    },{/if}
    {if isset($product.weight) && ($product.weight != 0)}
    "weight": {
        "@context": "https://schema.org",
        "@type": "QuantitativeValue",
        "value": "{$product.weight}",
        "unitCode": "{$product.weight_unit}"
    },{/if}
    {*{if empty($combinations)}*}
    "offers": {
        "@type": "Offer",
        "priceCurrency": "{$currency.iso_code}",
        "name": "{$product.name|strip_tags:false}",
        "price": "{$product.price_amount}",
        {if $product.images|count > 0}
        "image": {strip}[
        {foreach from=$product.images item=p_img name="p_img_list"}
        "{$p_img.large.url}"{if not $smarty.foreach.p_img_list.last},{/if}
        {/foreach}
        ]{/strip},
        {/if}
        {if $product.ean13}
        "gtin13": "{$product.ean13}",
        {else if $product.upc}
        "gtin13": "0{$product.upc}",
        {/if}
        "sku": "{$product.reference}",
        {if $product.condition == 'new'}"itemCondition": "http://schema.org/NewCondition",{/if}
        {if $product.show_condition > 0}
            {if $product.condition == 'used'}"itemCondition": "http://schema.org/UsedCondition",{/if}
            {if $product.condition == 'refurbished'}"itemCondition": "http://schema.org/RefurbishedCondition",{/if}
        {/if}
        "availability":{if $product.quantity > 0 || $product.allow_oosp > 0} "http://schema.org/InStock"{else} "http://schema.org/OutOfStock"{/if},
        "seller": {
            "@type": "Organization",
            "name": "{$shop.name}"
        }
    }

}
</script>
{/if}