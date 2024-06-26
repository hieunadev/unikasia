<div class="page_container">
	aaaa {$number}
	<div class="container">
		<div class="row">

			<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
			<!-- MY PHONE NUMBER -->
			<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
			<div class="col-sm-6">
				<div id="my-number-section" class="text-center">
					<div id="my-number">LOADING</div>
					<div id="my-number-title" class="hidden-sm hidden-xs">
						this is <strong>your phone number</strong>
					</div>
					<div id="my-number-permalink">
						<span class="glyphicon glyphicon-link"></span>
						call link:
						<a id="my-number-link" href="...">https://...</a>
					</div>
				</div>
				<div id="pubnub-chat-section" class="text-center">
					<input id="pubnub-chat-input" type="text" placeholder="chat here">
					<div id="pubnub-chat-output"><div></div></div>
				</div>
			</div>

			<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
			<!-- Video -->
			<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
			<div class="col-sm-6">
				<!-- DISPLAY -->
				<div class="row">
					<div class="col-xs-12 text-center">
						<div id="video-border">
							<div class="pubnub-relative">
								<div id="video-self"></div>
							</div>
							<div id="video-display">
								<span class="glyphicon glyphicon-flash"></span>
							</div>
						</div>
						<div id="pubnub-relative">
							<div id="video-thumbnail"></div>
							<div id="pubnub-logo">
								<div id="pubnub-logo-img"></div>
							</div>
						</div>
					</div>
				</div>

				<!-- DIAL CONTROLS -->
				<div class="row">
					<div class="col-sm-6 col-xs-7">
						<div class="form-group"><div class="input-group">
								<div class="input-group-addon">
									<span class="glyphicon glyphicon-th"></span>
								</div>
								<input id="number" class="form-control" type="number" placeholder="Type Recipient's #">
							</div></div>
					</div>
					<div class="col-sm-6 col-xs-5 dial-buttons">
						<button id="dial" class="btn btn-primary">
							<span class="glyphicon glyphicon-earphone"></span>
						</button>
						<button id="snap" class="btn btn-success">
							<span class="glyphicon glyphicon-camera"></span>
						</button>
						<button id="hangup" class="btn btn-danger">
							<span class="glyphicon glyphicon-ban-circle"></span>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="https://cdn.pubnub.com/pubnub.js"></script>

<script src="{$URL_JS}/webrtc-sdk-master/js/webrtc-v2.js?v={$upd_version}"></script>
<script src="{$URL_JS}/webrtc-sdk-master/js/sound.js?v={$upd_version}"></script>
{literal}
	<script>(function(){
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
// Generate Random Number if Needed
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
            var urlargs         = urlparams();
            var my_number       = PUBNUB.$('my-number');
            var my_link         = PUBNUB.$('my-number-link');
            var number          = urlargs.number || Math.floor(Math.random()*999+1);
            my_number.number    = number;
            my_number.innerHTML = ''+my_number.number;
            my_link.href        = location.href.split('?')[0] + '?call=' + number;
            my_link.innerHTML   = my_link.href;
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
// Update Location if Not Set
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
            if (!('number' in urlargs)) {
                urlargs.number = my_number.number;
                location.href = urlstring(urlargs);
                return;
            }
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
// Get URL Params
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
            function urlparams() {
                var params = {};
                if (location.href.indexOf('?') < 0) return params;
                PUBNUB.each(
                    location.href.split('?')[1].split('&'),
                    function(data) { var d = data.split('='); params[d[0]] = d[1]; }
                );
                return params;
            }
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
// Construct URL Param String
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
            function urlstring(params) {
                return location.href.split('?')[0] + '?' + PUBNUB.map(
                    params, function( key, val) { return key + '=' + val }
                ).join('&');
            }
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
// Calling & Answering Service
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
            var video_out = PUBNUB.$('video-display');
            var img_out   = PUBNUB.$('video-thumbnail');
            var img_self  = PUBNUB.$('video-self');
            var phone     = window.phone = PHONE({
                number        : my_number.number // listen on this line
                ,   media         : { video: { width:640, height:480 } } // <--- Set Camera Resolution
                ,   publish_key   : 'pub-c-561a7378-fa06-4c50-a331-5c0056d0163c'
                ,   subscribe_key : 'sub-c-17b7db8a-3915-11e4-9868-02ee2ddab7fe'
                ,   secure        : true, ssl: true
            });
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
// Video Session Connected
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
            function connected(session) {
                video_out.innerHTML = '';
                video_out.appendChild(session.video);
                PUBNUB.$('number').value = ''+session.number;
                sounds.play('sound/hi');
                console.log("Hi!");
            }
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
// Video Session Ended
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
            function ended(session) {
                clearInterval(thumbnail.ival);
                thumbnail.ival = 0;
                set_icon('facetime-video');
                img_out.innerHTML = '';
                sounds.play('sound/goodbye');
                console.log("Bye!");
            }
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
// Video Session Ended
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
            function set_icon(icon) {
                video_out.innerHTML = '<span class="glyphicon glyphicon-' +
                    icon + '"></span>';
            }
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
// Start Phone Call
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
            function dial(number) {
                // Hangup an old call
                phone.hangup();
                // Dial Number
                var session = phone.dial(number);
                // No Dupelicate Dialing Allowed
                if (!session) return;
                // Show Connecting Status
                set_icon('send');
            }
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
// Ready to Send or Receive Calls
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
            phone.ready(function(){
                // Ready To Call
                set_icon('facetime-video');
                // Auto Call
                if ('call' in urlargs) {
                    var number = urlargs['call'];
                    PUBNUB.$('number').value = number;
                    dial(number);
                }
                // Make a Phone Call
                PUBNUB.bind( 'mousedown,touchstart', PUBNUB.$('dial'), function(){
                    var number = PUBNUB.$('number').value;
                    if (!number) return;
                    dial(number);
                } );
                // Hanup Call
                PUBNUB.bind( 'mousedown,touchstart', PUBNUB.$('hangup'), function() {
                    phone.hangup();
                    set_icon('facetime-video');
                } );
                // Take Picture
                PUBNUB.bind( 'mousedown,touchstart', PUBNUB.$('snap'), function() {
                    var photo = phone.snap();
                    if (!(photo && photo.image))
                        return console.error(
                            '%c Connect your video with a partner first.',
                            'font-size:30px;background:#f00;color:#fff'
                        );
                    img_self.innerHTML = ' ';
                    img_self.appendChild(photo.image);
                    setTimeout( function() { img_self.innerHTML = ' ' }, 750 );
                } );
            });
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
// Received Call Thumbnail
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
            function thumbnail(session) {
                img_out.innerHTML = '';
                img_out.appendChild(session.image);
                img_out.appendChild(phone.snap().image);
            }
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
// Receiver for Calls
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
            phone.receive(function(session){
                session.message(message);
                session.thumbnail(thumbnail);
                session.connected(connected);
                session.ended(ended);
                if (!thumbnail.ival)
                    thumbnail.ival = setInterval( () => thumbnail(session), 400 );
            });
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
// Chat
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
            var chat_in  = PUBNUB.$('pubnub-chat-input');
            var chat_out = PUBNUB.$('pubnub-chat-output');
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
// Send Chat MSG and update UI for Sending Messages
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
            PUBNUB.bind( 'keydown', chat_in, function(e) {
                if ((e.keyCode || e.charCode) !== 13)     return true;
                if (!chat_in.value.replace( /\s+/g, '' )) return true;
                phone.send({ text : chat_in.value });
                add_chat( my_number.number + " (Me)", chat_in.value );
                chat_in.value = '';
            } )
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
// Update Local GUI
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
            function add_chat( number, text ) {
                if (!text.replace( /\s+/g, '' )) return true;
                var newchat       = document.createElement('div');
                newchat.innerHTML = PUBNUB.supplant(
                    '<strong>{number}: </strong> {message}', {
                        message : safetxt(text),
                        number  : safetxt(number)
                    } );
                chat_out.insertBefore( newchat, chat_out.firstChild );
            }
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
// WebRTC Message Callback
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
            function message( session, message ) {
                add_chat( session.number, message.text );
            }
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
// XSS Prevent
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
            function safetxt(text) {
                return (''+text).replace( /[<>]/g, '' );
            }
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
// Problem Occured During Init
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
            phone.unable(function(details){
                console.log("Alert! - Reload Page.");
                console.log(details);
                set_icon('remove');
            });
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
// Debug Output
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
            phone.debug(function(details){
                if (JSON.stringify(details).indexOf('FAIL') > 0) console.log(details);
            });
        })();</script>
{/literal}