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
{* not big fan of this code but it's is the only way to do it without module *}
{if isset($listing.pagination) && $listing.pagination.should_be_displayed}
    {assign page_nb 1}
    {if isset($smarty.get.page)}
        {assign page_nb $smarty.get.page|intval}
    {/if}

        {assign var="prev" value=false}
        {assign var="next" value=false}

        {foreach from=$listing.pagination.pages item="page"}
            {if $page.page == ($page_nb - 1) && $page.type == "page"}
                {assign prev $page.url}
                {if ($page_nb - 1) == 1}
                    {assign prev $prev|replace:'?page=1':''|replace:'&page=1':''}
                {/if}
            {/if}
            {if $page.page == ($page_nb + 1) && $page.type == "page"}
                {assign next $page.url}
                {break}
            {/if}
        {/foreach}

        {if $prev}
            <link rel="prev" href="{$prev}">
        {/if}
        {if $next}
            <link rel="next" href="{$next}">
        {/if}
{/if}