<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/include/address_popup_add.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
    
</script>
<body>
	<!-- 배송지 추가 -->
        <div class="ui-dialog ui-widget ui-widget-content ui-front" aria-describedby="popDeliveryAddressDetail" aria-labelledby="ui-id-57" style="height: auto;">
            <div id="popDeliveryAddressDetail" class="dialog_wrap has_btn ui-dialog-content ui-widget-content initialized" style="width: auto; min-height: 0px; max-height: none; height: auto;">
                <button type="button" class="btn_dialog_close" id="address_popup_add_close"><span class="ico_dialog_close"></span><span class="hidden">닫기</span></button>
                <div class="dialog_header">
                    <h1 class="dialog_title" data-pop-delivery-detail="title">배송지 추가</h1>
                </div>
            	<form action="/delivery/add" method="post">
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
		                                                            <label for="shippingAdd01-1" class="form_label">배송지명</label>
		                                                        </div>
		                                                        <div class="form_cont">
		                                                            <input type="text" name="deliveryName" id="shippingAdd01-1" class="form_ip" placeholder="최대 7글자까지 자유롭게 수정가능"  maxlength="7">
		                                                        </div>
		                                                    </div>
		                                                    <div class="form_box">
															    <div class="form_title has_btn">
															        <label for="shippingAdd02-1" class="form_label">받는 분</label>
															    </div>
															    <div class="form_cont">
															        <div class="form_col_group">
															            <div class="col_box">
															                <input type="text" name="receiverName" id="shippingAdd02-1" class="form_ip" placeholder="이름을 입력해 주세요." maxlength="20">
															            </div>
															            <div class="col_box">
															                <input type="tel" class="form_ip" name="receiverTel" placeholder="휴대폰번호를 - 없이 입력해 주세요." title="휴대폰 번호 입력" maxlength="11">
															            </div>
															        </div>
															    </div>
															</div>
															<script type="text/javascript">
															    window.onload = function() {
															        var receiverTelInput = document.querySelector('input[name="receiverTel"]');
															        receiverTelInput.addEventListener('input', function(e) {
															            this.value = this.value.replace(/[^0-9]/g, '');
															        });
															    };
															
															    var receiverTelSpan = document.querySelector('.phone_number');
															    var receiverTel = receiverTelSpan.textContent;
															    receiverTelSpan.textContent = receiverTel.replace(/[^0-9]/g, '').replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
															</script>

			                                                <div class="form_box">
											                    <div class="form_title has_btn">
											                        <span class="form_label">주소</span>
											                        <div class="right_area">
											                            <button type="button" class="btn_ip btn_line_gray" onclick="execDaumPostcode()">
											                                <span class="ico_search"></span><span class="text">주소 찾기</span>
											                            </button>
											                        </div>
											                    </div>
											                    <div class="form_cont">
											                        <div class="form_col_group">
											                            <div class="col_box">
											                            	<input type="text" id="postcode" name="zipCode"placeholder="우편번호" class="form_ip" readonly="">
											                                <input type="text" class="form_ip" name="deliveryAddress" title="기본 주소" readonly="" id="address">
											                            </div>
											                            <div class="col_box">
											                                <input type="text" id="extraAddress" name="deliveryAddress" placeholder="참고항목" class="form_ip" readonly="">
											                                <input type="text" class="form_ip mark" name="deliveryAddress" title="상세 주소" placeholder="상세 주소를 입력해 주세요." id="detailAddress" maxlength="50">
											                            </div>
											                        </div>
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