<div class="breadcrumb">
	<strong>{$core->get_Lang('You are here')}:</strong>
	<a href="{$PCMS_URL}" title="{$core->get_Lang('Home')}">{$core->get_Lang('Home')}</a>
    <a>&raquo;</a>
    <a href="{$PCMS_URL}/index.php?mod={$mod}" title="{$core->get_Lang('Languages')}">{$core->get_Lang('Languages')}</a>
    <a href="javascript:history.back();" class="back fr" style="width:50px;">{$core->get_Lang('Back')}</a>
</div>
<div class="container-fluid">
    <div class="page-title">
        <h2>/lang/{$langid}.php</h2>
    </div>
    <p>{$core->get_Lang('Edit Language Details')}</p>
    <!-- Trigger/Open The Modal -->
    {if $langid == "fr"}
    <button id="myBtn" class="px-2">+</button>
        {/if}
    <!-- The Modal -->
    <div id="myModal" class="modal">

        <!-- Modal content -->
        <div class="modal-content">
            <form action="" method="post">
                <span class="closetest">&times;</span>
                <textarea id="myTextarea" class="input" name="langs" rows="30" cols="100" style="resize:none;"></textarea>
                    <button type="submit" class="btn-translate">Submit</button>
            </form>
        </div>

    </div>
  {*  {if $lang_permission ne '0777'}
    <h2 style="color:red; text-align:center; border:1px dashed red; margin-bottom:20px; padding:10px;">File này chưa CMOD 777!</h2>
    {/if}*}
    <form method="post" action="">
    	<table class="tbl-grid" style="width:100%;">
            <tbody>
            <tr>
            	<td></td>
            	<td>
                	<input type="text" name="key[]" placeholder="key" style="width:98%;" />
                </td>
                <td width="20px">-></td>
            	<td></td>
            	<td>
                	<input type="text" name="value[]" placeholder="value" style="width:98%;" />
                </td>
            </tr>
            <tr>
            	<td></td>
            	<td>
                	<input type="text" name="key[]" placeholder="key" style="width:98%;" />
                </td>
                <td width="20px">-></td>
            	<td></td>
            	<td>
                	<input type="text" name="value[]" placeholder="value" style="width:98%;" />
                </td>
            </tr>
            <tr>
            	<td></td>
            	<td>
                	<input type="text" name="key[]" placeholder="key" style="width:98%;" />
                </td>
                <td width="20px">-></td>
            	<td></td>  
            	<td>
                	<input type="text" name="value[]" placeholder="value" style="width:98%;" />
                </td>
            </tr>
            {section name=i loop=$lstItem} 
            <tr class="trItem" style="background:#F0F0F0;">
                <td style="width:10px">{$smarty.section.i.index+1}</td>
            	<td width="30%">
                	<input type="text" name="key[]" value="{$lstItem[i].key}" placeholder="key" style="width:98%; color:red;" />
                </td>
                <td width="20px">-></td>
                <td style="width:10px">{$smarty.section.i.index+1}</td>
            	<td>
                	<input type="text" name="value[]" value="{$lstItem[i].value}" placeholder="value" style="width:98%; color:blue;" />
                </td>
            </tr>
            {/section}
            </tbody>
            <tfoot>

            </tfoot>
        </table>
        <div class="clearfix"><br /></div>

        <fieldset class="submit-buttons">
            {$saveBtn}
            <input value="Updatelang" name="submit" type="hidden">
        </fieldset>

        {literal}
        <script type="text/javascript">
			$(document).ready(function(){
				$("#addmore").click(function(){
					$('tbody').append('<tr><td></td><td><input type="text" name="key[]" placeholder="key" style="width:97%;" /></td><td>-></td><td></td><td><input type="text" name="value[]" placeholder="value" style="width:97%;" /></td></tr>');
					return false;
				});
				function replaceHtml( string_to_replace ) 
					{
						return string_to_replace.replace(/&nbsp;/g, ' ').replace(/<br.*?>/g, '\n');
					 }
				
				var str = $("#lang").val();
				
				$("#lang").val(replaceHtml(str));
			});
		</script>
        {/literal}
    </form>
</div>
{literal}
<style>
.searchmap{ background:#E9EFF3; padding:10px;}
.errorTxt{color:#c00000; display:block;margin:5px 0 0}
.trItem:hover td{background:#369 !important;}
.submit-buttons {
    position: fixed;
    right: calc(50% - 50px);
	left:calc(50% - 50px);
    bottom: 0;
}
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 10%;
    top: 0;
    width: 90%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
    background-color: #fefefe;
    margin: auto;
    padding: 20px;
    border: 1px solid #888;
    width: 80%;
}

/* The Close Button */
.closetest {
    color: #aaaaaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.closetest:hover,
.closetest:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}
</style>

    <script>
        // Get the modal
        var modal = document.getElementById("myModal");

        // Get the button that opens the modal
        var btn = document.getElementById("myBtn");

        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("closetest")[0];

        // When the user clicks the button, open the modal
        btn.onclick = function() {
            modal.style.display = "block";
        }

        // When the user clicks on <span> (x), close the modal
        span.onclick = function() {
            modal.style.display = "none";
        }

        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
        var urlParams = new URLSearchParams(window.location.search);
        var langId = urlParams.get('lang_id');
        $(".btn-translate").on('click', function(e) {
            let text = $(".input").val();
            let contentWithLineBreaks = text.replace(/\n/g, ', ');
            let postData = {
                'text': contentWithLineBreaks,
                'lang_id': langId
            };
            $.post(path_ajax_script+'/index.php?mod=lang_front&act=ajAddLang', postData)
                .done(function(res) {
                    console.log(res) })
        });
        $('#myTextarea').on('paste', function(event) {
            event.preventDefault();

            // Lấy nội dung clipboard
            var clipboardData = event.originalEvent.clipboardData || window.clipboardData;
            var pastedData = clipboardData.getData('Text');

            // Thêm xuống dòng mới vào cuối nội dung hiện tại
            var currentContent = $(this).val();
            $(this).val(currentContent + pastedData + '\n');
        });
    </script>
{/literal}