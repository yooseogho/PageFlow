<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/include/address_popup_add.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>

<script>
	const v = '${delivery}';
	console.log(v);	
</script>
<body>
	<!-- 배송 메세지 -->
        <div class="ui-dialog ui-widget ui-widget-content ui-front" aria-describedby="popDeliveryAddressDetail" aria-labelledby="ui-id-57" style="height: auto;">
            <div id="popDeliveryAddressDetail" class="dialog_wrap has_btn ui-dialog-content ui-widget-content initialized" style="width: auto; min-height: 0px; max-height: none; height: auto;">
                <button type="button" class="btn_dialog_close" id="address_popup_add_close"><span class="ico_dialog_close"></span><span class="hidden">닫기</span></button>
                <div class="dialog_header">
                    <h1 class="dialog_title" data-pop-delivery-detail="title">배송 메세지 변경</h1>
                </div>
            	<form action="/order/delivery/message/${delivery.dno}" method="post">
	                <div class="dialog_contents">
	                    <div class="custom_scroll_wrap" data-simplebar="init">
	                        <div class="simplebar-wrapper" style="margin: 0px;">
	                            <div class="simplebar-mask">
	                                <div class="simplebar-offset" style="right: 0px; bottom: 0px;">
	                                    <div class="simplebar-content-wrapper" style="height: auto; overflow: hidden;">
	                                        <div class="simplebar-content" style="padding: 0px;">
		                                            <div class="custom_scroll_inner" tabindex="0">
		                                                <div class="form_wrap type_lg">
		                                                    <div class="form_box" data-pop-delivery-detail="address-name-area">
		                                                        <div class="form_title">
		                                                            <label for="shippingAdd01-1" class="form_label">택배기사님께</label>
		                                                        </div>
		                                                        <div class="form_cont">
		                                                            <input type="text" name="deliveryRequest" value="${delivery.deliveryRequest}" 
		                                                            id="shippingAdd01-1" class="form_ip" placeholder="최대 100글자 이내 작성 가능합니다." maxlength="100">
		                                                        </div>
		                                                    </div>
		                                                    
		                                                </div>
		                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="simplebar-placeholder" style="width: auto; height: 800px;"></div>
	                        </div>
	                    </div>
	                </div>
	                <div class="dialog_footer">
	                    <button class="btn_md btn_primary"><span class="text">저장</span></button>
	                </div>
	            </form>    
            </div>
        </div>
        <div class="ui-widget-overlay ui-front" style="z-index: 99;"></div>
</body>
</html>