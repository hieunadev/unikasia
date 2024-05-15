jQuery(function($){
	$('#calendar_check_in,#calendar_check_out').datepicker({
		dateFormat:"mm/dd/yy",
		minDate: new Date()
	});
	var HotelCalendar = function(container){
		var self = this;
		this.container = container;
		this.calendar= null;
		this.form_container = null;
		
		this.init = function(){
			self.container = container;
			self.calendar = $('.calendar-content', self.container);
			self.form_container = $('.calendar-form', self.container);
			setCheckInOut('', '', self.form_container);
			self.initCalendar();
		}
		this.initCalendar = function(){
			self.calendar.fullCalendar({
				firstDay: 1,
                lang:st_params.locale,
                timezone: st_timezone.timezone_string,
				customButtons: {
			        reloadButton: {
                        text: st_params.text_refresh,
			            click: function() {
			                self.calendar.fullCalendar( 'refetchEvents' );
			            }
			        }
			    },
				header : {
				    left:   'today,reloadButton',
                    center: 'title',
                    right:  'prev, next'
				},
				selectable: true,
				select : function(start, end, jsEvent, view){
					var start_date = new Date(start._d).toString("MM");
					var end_date = new Date(end._d).toString("MM");
					var start_year = new Date(start._d).toString("yyyy");
					var end_year = new Date(end._d).toString("yyyy");
					var today = new Date().toString("MM");
					var today_year = new Date().toString("yyyy");
					if((start_date < today && start_year <= today_year) || (end_date < today && end_year <= today_year)){
						self.calendar.fullCalendar('unselect');
						setCheckInOut('', '', self.form_container);
					}else{
						var zone = moment(start._d).format('Z');
							zone = zone.split(':');
							zone = "" + parseInt(zone[0]) + ":00";
						var check_in = moment(start._d).utcOffset(zone).format("MM/DD/YYYY");
						var	check_out = moment(end._d).utcOffset(zone).subtract(1, 'day').format("MM/DD/YYYY");
						setCheckInOut(check_in, check_out, self.form_container);
					}
				},
				events:function(start, end, timezone, callback) {
                    $.ajax({
                        url: path_ajax_script+'/index.php?mod=cruise&act=OpenAvailbility',
                        type:'POST',
						dataType: 'html',
                        data: {
                            tp:'L',
							type:'_CABIN',
                            target_id:self.container.data('cruise_itinerary_id'),
							cruise_cabin_id:self.container.data('cruise_cabin_id'),
                            start: start.unix(),
                            end: end.unix()
                        },
						success: function(html){
							var doc = jQuery.parseJSON(html);
                        	if(typeof doc == 'object'){
                            	callback(doc);
                        	}
                        }
                    });
                },
				eventClick: function(event, element, view){
                    setCheckInOut(event.start.format('MM/DD/YYYY'),event.start.format('MM/DD/YYYY'),self.form_container);
					 $('#cruise_cabin_id', self.form_container).val(event.cruise_cabin_id);
                    $('#calendar_price', self.form_container).val(event.price);
                    $('#calendar_number', self.form_container).val(event.number);
                    $('#calendar_status', self.form_container).val(event.status);
					if(typeof event.allotement == 'undefined')
						$('#calendar_allotement', self.form_container).val(0);
					else
						$('#calendar_allotement', self.form_container).val(event.allotement);
					if(event.request_price==1)
						$('#calendar_request_price', self.form_container).prop('checked',true);
					if(typeof event.request_price == 'undefined' || event.request_price != 1){
						$('#calendar_request_price', self.form_container).prop('checked',false);	
					}
				},
				eventRender: function(event, element, view){
					var html = '';
					if(event.status == 'available'){
						html += '<div class="price">Giá: '+event.price+'</div>';
					}
					if(typeof event.status == 'undefined' || event.status != 'available'){
						html += '<div class="not_available">Not Available</div>';
					}
					$('.fc-content', element).html(html);
				},
                loading: function(isLoading, view){
                    if(isLoading){
                    	vietiso_loading(1);
                    }else{
                    	vietiso_loading(0);
                    }
                }
			});
		}
	};
	function setCheckInOut(check_in, check_out, form_container){
		$('#calendar_check_in', form_container).val(check_in);
		$('#calendar_check_out', form_container).val(check_out);
	}
	function resetForm(form_container){
		$('#cruise_cabin_id', form_container).val('');
		$('#calendar_check_in', form_container).val('');
		$('#calendar_check_out', form_container).val('');
		$('#calendar_price', form_container).val('');
		$('#calendar_priority', form_container).val('');
		$('#calendar_number', form_container).val('');
		$('#calendar_allotement', form_container).val(0);
		$('#calendar_request_price', form_container).prop('checked',false);
	}
	$(function() {
		$('.calendar-wrapper').each(function(index, el) {
			var t = $(this);
			var hotel = new HotelCalendar(t);
			hotel.init();
			/**/
			var flag_submit = false;
			$('#calendar_submit', t).click(function(event) {
				var $_adata = $('input, select', '.calendar-form').serializeArray();
				vietiso_loading(1);
				 $.ajax({
					url: path_ajax_script+'/index.php?mod=cruise&act=OpenAvailbility',
					type:'POST',
					dataType: 'html',
					data: $_adata,
					success: function(html){
						vietiso_loading(0);
						if(html.indexOf('_invalid_date_empty') >= 0){
							alertify.error('Check in or check out field is not empty.');
							return false;
						}
						else if(html.indexOf('_invalid_date_less') >= 0){
							alertify.error('The check out is later than the check in field.');
							return false;
						}
						else if(html.indexOf('_invalid_price') >= 0){
							alertify.error('The price field is not a number.');
							return false;
						}
						else{
							resetForm(t);
							$('.calendar-content', t).fullCalendar('refetchEvents');
						}
					}
				});
				return false;
			});
			$(document).on('click','.tabchildcol a[href="#setting_availability_tab"]',function(){
				$('.fc-today-button').trigger('click');
                hotel.calendar.fullCalendar( 'refetchEvents' );
            });
			 $(document).on('change','select[name=iso-default_state]',function(){
                hotel.calendar.fullCalendar( 'refetchEvents' );
            });
			$(document).on('change','select[name=cruise_cabin_id]',function(){
				var $_this = $(this);
				$_this.closest('.calendar-wrapper').data('cruise_cabin_id',$_this.val());
                hotel.calendar.fullCalendar( 'refetchEvents' );
            });
		});
	});
});
