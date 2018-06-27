{assign var=_counter value=0}
{function name="menu" nodes=[] depth=0 parent=null}
    {if $nodes|count}
      <ul {if $depth == 0}class="menu-top m-0"  id="top-menu" role="navigation"{else} class="menu-sub__list"{/if} data-depth="{$depth}">
        {foreach from=$nodes item=node}
            {if $node.children|count}
            {assign var=_expand_id value=10|mt_rand:100000}
            {/if}

            <li class="{$node.type} menu__item {if $depth == 0}menu__item--top{else}menu__item--sub{/if}{if $node.current} current {/if}" id="{$node.page_identifier}" {if $node.children|count}aria-haspopup="true" aria-expanded="false" aria-owns="top_sub_menu_{$_expand_id}" aria-controls="top_sub_menu_{$_expand_id}"{/if}>
            {assign var=_counter value=$_counter+1}
              <a
                class="{if $depth === 1}dropdown-submenu{/if}"
                href="{$node.url}" data-depth="{$depth}"
                {if $node.open_in_new_window} target="_blank" {/if}
              >
                {if $node.children|count}
                  {* Cannot use page identifier as we can have the same page several times *}
                  {assign var=_expand_id value=10|mt_rand:100000}
                  <span class="float-right d-md-none">
                    <span data-target="#top_sub_menu_{$_expand_id}" data-toggle="collapse" class="navbar-toggler collapse-icons">
                      <i class="material-icons add">&#xE313;</i>
                      <i class="material-icons remove">&#xE316;</i>
                    </span>
                  </span>
                {/if}
                {$node.label}
              </a>
              {if $node.children|count}
              <div class="menu-sub" id="top_sub_menu_{$_expand_id}" role="group" aria-labelledby="{$node.page_identifier}" aria-expanded="false" aria-hidden="true">
                  <div class="menu-sub__content container">
                {menu nodes=$node.children depth=$node.depth parent=$node}
                  </div>
              </div>
              {/if}
            </li>
        {/foreach}
      </ul>
    {/if}
{/function}

<div class="menu d-none d-md-block" id="_desktop_top_menu">
    {menu nodes=$menu.children}
</div>
