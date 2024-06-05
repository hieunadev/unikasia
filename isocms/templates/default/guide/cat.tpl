<section class="page_container trvg_page_container">
	{$core->getBlock('des_nav_breadcrumb')}
	{$core->getBlock('des_tailor_made_travel')}
	<div class="des_tailor_detail_travel_guide">
		<div class="container">
			<div class="row">
				<div class="col-12 col-sm-12 col-md-9">
					<div class="des_travel_guide_list">
						{if $trvg_intro}
						<div class="des_tailor_detail_travel_guide_description">
							{$trvg_intro}
						</div>
						{/if}
						<div class="row">
							{if $listGuide}
							{foreach from=$listGuide key=key item=item}
							{assign var="guide_id" value=$item.guide_id}
							<div class="col-12 col-sm-12 col-md-6 col-lg-4">
								<div class="des_travel_guide_item">
									<div class="des_travel_guide_image">
										<img src="{$clsGuide->getImage($guide_id, 292, 219)}" alt="{$clsGuide->getTitle($guide_id)}" width="292" height="219">
										<a href="#" class="des_travel_guide_link" title="{$clsGuide->getTitle($guide_id)}">SEE DETAILS</a>
									</div>
									<div class="des_travel_guide_intro">
										<div class="des_travel_guide_title">
											<h3><a href="#" title="{$clsGuide->getTitle($guide_id)}">{$clsGuide->getTitle($guide_id)}</a></h3>
										</div>
										<div class="des_travel_guide_place">
											<i class="fa-sharp fa-light fa-location-dot"></i> Da Nang, Vietnam
										</div>
										<div class="des_travel_guide_description">
											{$clsGuide->getIntro($guide_id)}
										</div>
									</div>
								</div>
							</div>
							{/foreach}
							{/if}
						</div>
					</div>
					{if $page_view}
					<div class="des_travel_guide_paginate">
						{$page_view}
					</div>
					{/if}

					<div class="des_travel_guide_recent_view">
						<div class="des_travel_guide_recent_view_title">
							<h2>{$core->get_Lang('Recently viewed')}</h2>
						</div>
						<div class="des_travel_guide_recent_view_content">
							<div class="row">
								<div class="col-12 col-sm-12 col-md-6 col-lg-4">
									<div class="des_travel_guide_item">
										<div class="des_travel_guide_image">
											<img src="https://images.unsplash.com/photo-1441974231531-c6227db76b6e?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fG5hdHVyZXxlbnwwfHwwfHx8MA%3D%3D" alt="Cau Vang, Da Nang" width="292" height="219">
											<a href="#" class="des_travel_guide_link" title="Cau Vang, Da Nang">SEE DETAILS</a>
										</div>
										<div class="des_travel_guide_intro">
											<div class="des_travel_guide_title">
												<h3><a href="#" title="Cau Vang, Da Nang">Cau Vang, Da Nang</a></h3>
											</div>
											<div class="des_travel_guide_place">
												<i class="fa-sharp fa-light fa-location-dot"></i> Da Nang, Vietnam
											</div>
											<div class="des_travel_guide_description">
												Explore several breathtaking landscapes - Discover local daily lifestyles - Get closer to the...
											</div>
										</div>
									</div>
								</div>
								<div class="col-12 col-sm-12 col-md-6 col-lg-4">
									<div class="des_travel_guide_item">
										<div class="des_travel_guide_image">
											<img src="https://images.unsplash.com/photo-1441974231531-c6227db76b6e?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fG5hdHVyZXxlbnwwfHwwfHx8MA%3D%3D" alt="Cau Vang, Da Nang" width="292" height="219">
											<a href="#" class="des_travel_guide_link" title="Cau Vang, Da Nang">SEE DETAILS</a>
										</div>
										<div class="des_travel_guide_intro">
											<div class="des_travel_guide_title">
												<h3><a href="#" title="Cau Vang, Da Nang">Cau Vang, Da Nang</a></h3>
											</div>
											<div class="des_travel_guide_place">
												<i class="fa-sharp fa-light fa-location-dot"></i> Da Nang, Vietnam
											</div>
											<div class="des_travel_guide_description">
												Explore several breathtaking landscapes - Discover local daily lifestyles - Get closer to the...
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-12 col-sm-12 col-md-3">
					{$core->getBlock('des_travel_guide_side')}
				</div>
			</div>
		</div>
	</div>
	{$core->getBlock('why_choose_us')}
	{$core->getBlock('customer_review')}
	{$core->getBlock('also_like')}
</section>