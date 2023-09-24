<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/order.css">
<title>Insert title here</title>
</head>
<body>
    <div id="page">
        <header class="nav_wrapper">
			<jsp:include page="/WEB-INF/views/include/nav.jsp" />
		</header>

        <main class="main">
            <section class="section">
                <div class="contents_inner">
                    <div class="inner_top" style="font-size: large; font-weight: bold;">
                        <p class="inner_top_title">주문/결제</p>
                    </div>
                    <div class="order_inner_payment">
                        <div class="payment_left">
                            <div class="delivery_info_area">
                                <div class="delivery_info_detail">
                                    <table class="detail_table">
                                        <colgroup class="colgroup">
                                            <col style="width:210px;">
                                            <col style="width:auto;">
                                        </colgroup>
                                        <tbody>
                                            <tr class="delivery_address">
                                                <th scope="row">배송지 정보</th>
                                                <td>
                                                    <div class="address_info_box">
                                                        <div class="address_and_name">
                                                            <span class="name">이름 : xxx</span>
                                                            <button class="default_delivery"><span class="text">기본배송지</span></button>
                                                        </div>
                                                        <div class="name_and_tel">
                                                            <span class="name">이름 : xxx</span>
                                                            <span class="gap">/</span>
                                                            <span class="tel">010-xxxx-xxxx</span>
                                                        </div>
                                                        <div class="address">
                                                            <span class="address_text">xx도 xx시 xx동 xx빌라 xxx호</span>
                                                            <a href="/주소변경창"><button class="address_change"><span>변경</span></button></a>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr class="delivery_message">
                                                <th scope="row">배송요청사항</th>
                                                <td>
                                                    <div class="message_btn_area">
                                                        <button class="message_btn">
                                                            <span>배송요청사항 메세지</span>
                                                        </button>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            
                            <div class="product_info_area">
                               
                                <div class="product_info_header">
                                   <div class="table_head_area">
                                    <table class="table_head">
                                        <colgroup class="colgroup">
                                            <col style="width: 210px;">
                                            <col style="width: auto;">
                                        </colgroup>
                                        <tbody>
                                            <tr>
                                                <th scope="row">주문상품</th>
                                                <td>
                                                    <div class="order_count">
                                                        <span class="label">총</span>
                                                        <span class="count">1 <span class="order_unit">개</span></span>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    </div>
                                </div>

                                <div class="product_info_middle">
                                    <table class="table_middle">
                                        <colgroup class="colgroup">
                                            <col>
                                            <col style="width: 150px;">
                                            <col style="width: 100px;">
                                            <col style="width: 148px;">
                                        </colgroup>
                                        <thead class="title">
                                            <tr>
                                                <th scope="col">상품정보</th>
                                                <th scope="col">배송방법</th>
                                                <th scope="col">수량</th>
                                                <th scope="col">금액</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td class="product">
                                                    <div class="product_area">
                                                        <div class="product_img">
                                                            이미지
                                                        </div>
                                                        <div class="product_title">
                                                            <span class="product_name">책 제목</span>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="product_td">
                                                    <div class="product_delivery_way"><span>PageFlow 배송</span></div>
                                                </td>
                                                <td class="product_td"><span class="product_num">x개</span></td>
                                                <td class="product_td">
                                                    <span class="product_price">
                                                        <span class="product_val">xxx</span>
                                                        <span class="unit">원</span>
                                                    </span>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="product_info_bottom">
                                    <ul class="delivery_info_list">
                                        <li class="delivery_info_item">
                                            <span class="delivery_label">
                                                <span class="delivery_label_text">교보문고배송</span>
                                            </span>
                                            <span class="delivery_text_body">
                                                <strong>주문 후 3일 뒤 도착예정</strong>
                                            </span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            
                            <div class="point_info_area">
                                <div class="point_info_header">
                                    <div class="point_header_text">포인트</div>
                                    <div class="point_retain">
                                        <span class="point_retain_label">보유</span>
                                        <span class="point_retain_amount">
                                            <span class="point">xxx</span>
                                            <span class="unit">원</span>
                                        </span>
                                    </div>
                                </div>
                                <div class="point_info_body">
                                    <div class="point_use_box">
                                        <table class="point_use_table">
                                            <colgroup class="colgroup">
                                                <col style="width: 146px;">
                                                <col style="width: 150px;">
                                                <col style="width: auto;">
                                            </colgroup>
                                            <tbody>
                                                <tr>
                                                    <th scope="row" class="has_point">
                                                        <label>통합포인트</label>
                                                    </th>
                                                    <td>
                                                        <div class="point_value_box">
                                                            <span class="point">xxx</span>
                                                            <span class="unit">원</span>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="point_input_btn">
                                                            <div class="point_input_box">
                                                                <input type="number">
                                                                <span class="unit">원</span>
                                                            </div>
                                                            <button>
                                                                <span class="point_text">전액사용</span>
                                                            </button>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            
                            
                            <div class="payment_way_area">
                                <div class="payment_info_header">
                                    <div class="payment_header_inner">
                                        <span class="payment_header_text">결제수단</span>
                                    </div>
                                </div>
                                <div class="payment_info_body">
                                    <div class="payment_row_list">
                                        <a href="/결제창"><button class="payment_list_btn"><span>xx카드</span></button></a>
                                        <a href="/결제창"><button class="payment_list_btn"><span>xx카드</span></button></a>
                                        <a href="/결제창"><button class="payment_list_btn"><span>xx카드</span></button></a>
                                        <a href="/결제창"><button class="payment_list_btn"><span>xx카드</span></button></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="payment_right">
                            <div class="payment_info_area">
                                <div class="payment_info_box">
                                    <ul style="list-style-type: none;">
                                        <li>
                                            <p class="label">상품금액</p>
                                            <div class="label_right">
                                                <span class="price">
                                                    <span>xxx</span>
                                                    <span class="unit">원</span>
                                                </span>
                                            </div>
                                        </li>
                                        <li>
                                            <p class="label">배송비</p>
                                            <div class="label_right">
                                                <span class="price">
                                                    <span>xxx</span>
                                                    <span class="unit">원</span>
                                                </span>
                                            </div>
                                        </li>
                                        <li>
                                            <p class="label">포인트 사용</p>
                                            <div class="label_right">
                                                <span class="price">
                                                    <span>xxx</span>
                                                    <span class="unit">원</span>
                                                </span>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <div class="payment_last_box">
                                    <ul style="list-style-type: none;">
                                        <li>
                                            <p class="label">최종결제금액</p>
                                            <div class="label_right">
                                                <span class="price">
                                                    <span>xxx</span>
                                                    <span class="unit">원</span>
                                                </span>
                                            </div>
                                        </li>
                                        <li>
                                            <p class="label">적립예정포인트</p>
                                            <div class="label_right">
                                                <span class="price">
                                                    <span>xxx</span>
                                                    <span class="unit"> P</span>
                                                </span>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <div class="payment_btn_area">
                                    <a href="/order_success_page"><button class="payment_btn"><span class="btn_text">결제하기</span></button></a>
                                </div>
                            </div>
                            <div class="payment_agree_text">
                                <span class="agree_text" style="font-size: small;">위 주문내용을 확인하였으며, 결제에 동의합니다.</span>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>
        <footer class="footer_wrapper">
            <jsp:include page="/WEB-INF/views/include/footer.jsp" />
        </footer>
    </div>
</body>
</html>