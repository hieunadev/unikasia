<!-- Bắt buộc không format code để tránh lỗi -->
<nav style="--bs-breadcrumb-divider: '>'" aria-label="breadcrumb">
    <div class="container d-flex">
        <span class="breadcrumb-item des_breadcrumb_title">You are here:</span>
        <ol class="breadcrumb des_breadcrumb">
            <li class="breadcrumb-item des_breadcrumb_link">
                <a href="/" title="{$core->get_Lang('Home')}">{$core->get_Lang('Home')}</a>
            </li>            
            {if $show eq 'SearchGuide'}
                <li class="breadcrumb-item des_breadcrumb_link">
                    <a href="javascript:void(0);" class="cancel_link">{$core->get_Lang($clsCountry->getTitle($country_id))}</a>
                </li>
                <li class="breadcrumb-item active des_breadcrumb_active" aria-current="page">{$keyword}</li>
            {elseif $show eq 'GuideTag'}
                <li class="breadcrumb-item des_breadcrumb_link">
                    <a href="javascript:void(0);" class="cancel_link">{$core->get_Lang('Travel Guide')}</a>
                </li>
                <li class="breadcrumb-item active des_breadcrumb_active" aria-current="page">#{$guidetag}</li>
            {elseif $show eq 'CruiseCatCountry'}
                <li class="breadcrumb-item des_breadcrumb_link">
                    <a href="{$clsISO->getLink('cruise')}" title="{$core->get_Lang('Cruise')}">{$core->get_Lang('Cruise')}</a>
                </li>
                {if $cruise_cat_id ne ''}
                    <li class="breadcrumb-item des_breadcrumb_link">
                        <a href="{$clsCruiseDestination->getLink($country_id)}" title="{$core->get_Lang($clsCountry->getTitle($country_id))} {$core->get_Lang('Cruise')}">{$core->get_Lang($clsCountry->getTitle($country_id))}</a>
                    </li>
                    <li class="breadcrumb-item active des_breadcrumb_active" aria-current="page">
                        {$core->get_Lang($clsCruiseCat->getTitle($cruise_cat_id))}
                    </li>
                {else}
                    <li class="breadcrumb-item active des_breadcrumb_active" aria-current="page">
                        {$core->get_Lang($clsCountry->getTitle($country_id))}
                    </li>
                {/if}
            {elseif $show eq 'CruiseCat'}
                <li class="breadcrumb-item active des_breadcrumb_active" aria-current="page">
                    {$core->get_Lang('Cruise')}
                </li>
            {else} 
                <li class="breadcrumb-item des_breadcrumb_link">
                    <a href="javascript:void(0);" class="cancel_link">{$core->get_Lang('Destinations')}</a>
                </li>
                {if $mod eq 'destination' && $act eq 'place'}
                    <li class="breadcrumb-item active des_breadcrumb_active" aria-current="page">
                        {$core->get_Lang($clsCountry->getTitle($country_id))}
                    </li>
                {elseif $mod eq 'destination' && $act eq 'travel_style' || $mod eq 'tour' && $act eq 'cat'}
                    <li class="breadcrumb-item des_breadcrumb_link">
                        <a href="{$clsCountry->getLink($country_id)}" title="{$core->get_Lang($clsCountry->getTitle($country_id))}">{$core->get_Lang($clsCountry->getTitle($country_id))}</a>
                    </li>
                    <li class="breadcrumb-item des_breadcrumb_link">
                        <a href="javascript:void(0);" class="cancel_link">{$core->get_Lang($clsCountry->getTitle($country_id))} tour</a>
                    </li>
                    <li class="breadcrumb-item active des_breadcrumb_active" aria-current="page">
                        {$core->get_Lang($clsTourCategory->getTitle($cat_id))} in {$core->get_Lang($clsCountry->getTitle($country_id))}
                    </li>
                {elseif ($mod eq 'destination' && $act eq 'travel_guide') || ($mod eq 'guide' && $act eq 'cat')}
                    <li class="breadcrumb-item des_breadcrumb_link">
                        <a href="javascript:void(0);" class="cancel_link">{$core->get_Lang($clsCountry->getTitle($country_id))}</a>
                    </li>
                    <li class="breadcrumb-item des_breadcrumb_link">
                        <a href="javascript:void(0);" class="cancel_link">{$core->get_Lang('Travel guide')}</a>
                    </li>
                    {if $guidecat_title}
                    <li class="breadcrumb-item active des_breadcrumb_active" aria-current="page">{$guidecat_title}</li>
                    {/if}
                {elseif ($mod eq 'destination' && $act eq 'travel_guide_detail') || ($mod eq 'guide' && $act eq 'detail')}
                    <li class="breadcrumb-item des_breadcrumb_link">
                        <a href="javascript:void(0);">{$core->get_Lang($guidecat_country_title)}</a>
                    </li>
                    <li class="breadcrumb-item des_breadcrumb_link">
                        <a href="javascript:void(0);">{$core->get_Lang($guidecat_guidecat_title)}</a>
                    </li>
                    <li class="breadcrumb-item active des_breadcrumb_active" aria-current="page">{$core->get_Lang($guide_title)}</li>
                {elseif $mod eq 'destination' && $act eq 'topattraction'}
                    <li class="breadcrumb-item des_breadcrumb_link">
                        <a href="javascript:void(0);" class="cancel_link">{$core->get_Lang($clsCountry->getTitle($country_id))}</a>
                    </li>
                    <li class="breadcrumb-item active des_breadcrumb_active" aria-current="page">
                        {$core->get_Lang('Top attraction')}
                    </li>
                {/if}
            {/if}
        </ol>
    </div>
</nav>