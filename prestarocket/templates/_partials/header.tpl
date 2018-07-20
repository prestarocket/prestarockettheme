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
{block name='header_banner'}
  <div class="header-banner">
      {hook h='displayBanner'}
  </div>
{/block}

{block name='header_nav'}
  <nav class="header-nav border-bottom">
    <div class="container">
      <div class="row d-none d-md-flex align-items-center">
        <div class="col-md-4">
            {hook h='displayNav1'}
        </div>
        <div class="col-md-8 d-flex align-items-center justify-content-end right-nav">
            {hook h='displayNav2'}
        </div>
      </div>
      <div class="d-md-none d-flex justify-content-between align-items-center w-100 mobile no-gutters">
        <button id="menu-icon" class="btn" data-toggle="modal" data-target="#mobile_top_menu_wrapper">
          <i class="material-icons d-inline">&#xE5D2;</i>
        </button>
        <div class="flex-grow-1 top-logo text-center" id="_mobile_logo"></div>
        <div class="col d-flex align-items-center justify-content-end right-nav">
          <div id="_mobile_user_info"></div>
          <div id="_mobile_cart" class="mobile-cart"></div>
        </div>
      </div>
    </div>
  </nav>
{/block}

{block name='header_top'}
  <div class="header-top py-3 border-bottom">
    <div class="container">
      <div class="row align-items-center">
        <div class="col-md-2 d-none d-md-block" id="_desktop_logo">
          {if $page.page_name == 'index'}
            <h1>
              <a href="{$urls.base_url}">
                <img class="logo img-responsive" src="{$shop.logo}" alt="{$shop.name}">
              </a>
            </h1>
          {else}
            <a href="{$urls.base_url}">
              <img class="logo img-responsive" src="{$shop.logo}" alt="{$shop.name}">
            </a>
          {/if}
        </div>
        <div class="col-md-10 col-sm-12 d-flex align-items-center justify-content-between position-static">
            {hook h='displayTop'}
        </div>
      </div>
    </div>
  </div>
    {hook h='displayNavFullWidth'}
{/block}
