<section class="reasonandrecom">
    <div class="container">
        <h2 class="reasonsbook">The reasons you should book with us </h2>
        <div class="row justify-content-center text-center">
            {section name=i loop=$listWhy}
            <div class="col-lg-4 col-md-4 col-sm-4">
                <div class="white-box">
                    <img src="{$listWhy[i].image}" alt="{$listWhy[i].title}">
                    <h3>{$listWhy[i].title}</h3>
                    <p>{$listWhy[i].intro|html_entity_decode}</p>
                </div>
            </div>
            {/section}
            <h2 class="txtfamous">The famous travel guide books recommended us</h2>
            <div class="img-guidebook">
                <div class="row">
                    {section name=i loop=$listPartner}
                    <div class="linkbooktour">
                        <a href="{$listPartner[i].url}" title="{$listPartner[i].title}">
                            <img src="{$listPartner[i].image}" alt="{$listPartner[i].slug}" class="img-fluid"
                                 width="138" height="66">
                        </a>
                    </div>
                    {/section}
                </div>
            </div>
        </div>
    </div>
</section>