<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/nav.jsp"%>


<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" /> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 

<script src="http://propeller.in/components/range-slider/js/wNumb.js"></script>
<script src="http://propeller.in/components/range-slider/js/nouislider.js"></script>
<link rel="stylesheet" type="text/css" href="http://propeller.in/components/range-slider/css/nouislider.min.css">
<link rel="stylesheet" type="text/css" href="http://propeller.in/components/textfield/css/textfield.css">
<link rel="stylesheet" type="text/css" href="http://propeller.in/components/checkbox/css/checkbox.css">
<link rel="stylesheet" type="text/css" href="http://propeller.in/components/range-slider/css/range-slider.css">
<link rel="stylesheet" href="css/search.css" />

<style>
.ftco-navbar-light {
	top: 0px;
}
#map {
    height: 100%;
  }
</style> 

<div id="root">
	<div class="styled__Main-sc-36tku2-0 ePlFZY">

		<!-- 검색,필터 -->
		<div class="styled__Top-sc-36tku2-1 hJtKYy">
			<div class="styled__Header-sfs8fz-0 dWEBFj">
				<div class="styled__SearchForm-sc-1pc2wuh-0 byjidO">
					<input id="keyword1" type="text" class="styled__Input-sc-1pc2wuh-1 keOJyH"
						autocomplete="off" placeholder="" value="" />
					<svg onclick="search();"width="18" height="18" viewBox="0 0 18 18">
			              <g fill="none" fill-rule="evenodd" stroke="#222">
			                <circle cx="7.5" cy="7.5" r="6.5"></circle>
			                <path d="M13 12l5 5"></path>
			              </g>
			        </svg>
				</div>

				<div class="styled__FilterWrap-sfs8fz-1 fvkqQK">
					<div tabindex="0" class="styled__Wrap-sc-1a98puu-0 hWgOZv">
						<div class="styled__Btn-sc-1a98puu-1 fJNXpX">
							<span>원룸, 투·쓰리룸, 오피스텔</span> <i width="11" height="7"
								class="fas fa-angle-down search__btn1__icon"></i>
						</div>
						<!-- 상세 창1 -->
						<div class="styled__FilterBox-sc-1a98puu-2 fhfjff"
							style="display: none">
							<h1 class="styled__Title-sc-1a98puu-3 lmqlXb">
								방종류
								<p class="styled__Desc-sc-1a98puu-5 dUdesp">중복선택이 가능합니다.</p>
							</h1>
							<ul class="styled__Ul-sc-1eqdfqp-0 hpBewf">
								<li><label class="Checkbox__Label-ifp1yz-0 kAqGVi clearfix"
									size="22"> <input name="multi_room_type"
										type="checkbox" class="Checkbox__CheckboxStd-ifp1yz-1 PcMeW"
										value="1" checked="" /> <span class="CheckBox"></span> <span
										class="styled__Text-sc-1eqdfqp-2 kMvalg">원룸</span>
								</label></li>
								<li><label class="Checkbox__Label-ifp1yz-0 kAqGVi clearfix"
									size="22"> <input name="multi_room_type"
										type="checkbox" class="Checkbox__CheckboxStd-ifp1yz-1 PcMeW"
										value="2" checked="" /> <span class="CheckBox"></span> <span
										class="styled__Text-sc-1eqdfqp-2 kMvalg">투·쓰리룸</span>
								</label></li>

								<li><label class="Checkbox__Label-ifp1yz-0 kAqGVi clearfix"
									size="22"> <input name="multi_room_type"
										type="checkbox" class="Checkbox__CheckboxStd-ifp1yz-1 PcMeW"
										value="3" checked="" /> <span class="CheckBox"></span> <span
										class="styled__Text-sc-1eqdfqp-2 kMvalg">오피스텔</span>
								</label></li>
							</ul>
							<ul class="styled__Ul-sc-1eqdfqp-0 hpBewf">
								<li><label class="Checkbox__Label-ifp1yz-0 kAqGVi clearfix"
									size="22"> <input name="multi_room_type"
										type="checkbox" class="Checkbox__CheckboxStd-ifp1yz-1 PcMeW"
										value="4" /> <span class="CheckBox"></span> <span
										class="styled__Text-sc-1eqdfqp-2 kMvalg">아파트</span>
								</label>
									<div class="styled__DescBox-sc-1eqdfqp-1 kldrnH">
										<svg x="0" y="0" width="18" height="18" viewBox="0 0 27 27">
					                        <clipPath id="c1_1">
					                          <path
														d="M13.7,20.6c-.6,0,-1.1,-.5,-1.1,-1.1c0,-.7,.5,-1.2,1.1,-1.2c.7,0,1.2,.5,1.2,1.2c0,.6,-.5,1.1,-1.2,1.1Zm.1,-3.8c-1,0,-1.2,-8.3,-1.2,-9.2c0,-.8,.5,-1.5,1.2,-1.5c.6,0,1.1,.7,1.1,1.5c0,.9,-.2,9.2,-1.1,9.2Z">
					                          </path>
					                        </clipPath>
					                        <g>
					                          <circle cx="13.5" cy="13.5" r="13.5"
														fill="#E6E7EA"></circle>
					                          <path fill="#9C9EA3"
														d="M5,28.3H22.5V-1.4H5V28.3Z" clip-path="url(#c1_1)"></path>
					                        </g>
					                      </svg>
										<p class="styled__Desc-sc-1a98puu-5 dUdesp">다중 선택 시 아파트는
											포함할 수 없습니다.</p>
									</div></li>
							</ul>
						</div>
						<!-- 상세 창1 -->
					</div>
					<div tabindex="0" class="styled__Wrap-sc-1a98puu-0 hWgOZv">
						<div class="styled__Btn-sc-1a98puu-1 fJNXpX">
							<span>월세,전세,매매</span> <i width="11" height="7"
								class="fas fa-angle-down search__btn1__icon"></i>
						</div>
						<!-- 상세 창2 -->
						<div class="styled__FilterBox-sc-1a98puu-2 fhfjff"
							style="display: none">
							<h1 class="styled__Title-sc-1a98puu-3 lmqlXb">
								매물종류
								<p class="styled__Desc-sc-1a98puu-5 dUdesp">중복선택이 가능합니다.</p>
							</h1>
							<ul class="styled__Ul-sc-7qrnpy-0 eLjSYd">
								<li><label class="Checkbox__Label-ifp1yz-0 kAqGVi clearfix"
									size="22"> <input name="selling_type" type="checkbox"
										class="Checkbox__CheckboxStd-ifp1yz-1 PcMeW" value="월세"
										checked="" /> <span class="CheckBox"></span> <span
										class="styled__Text-sc-7qrnpy-1 nmQzi">월세 </span>
								</label></li>
								<li><label class="Checkbox__Label-ifp1yz-0 kAqGVi clearfix"
									size="22"> <input name="selling_type" type="checkbox"
										class="Checkbox__CheckboxStd-ifp1yz-1 PcMeW" value="전세"
										checked="" /> <span class="CheckBox"></span> <span
										class="styled__Text-sc-7qrnpy-1 nmQzi">전세 </span>
								</label></li>
								<li><label class="Checkbox__Label-ifp1yz-0 kAqGVi clearfix"
									size="22"> <input name="selling_type" type="checkbox"
										class="Checkbox__CheckboxStd-ifp1yz-1 PcMeW" value="매매"
										checked="" /> <span class="CheckBox"></span> <span
										class="styled__Text-sc-7qrnpy-1 nmQzi">매매 </span>
								</label></li>
							</ul>
						</div>
						<!-- 상세 창2 -->
					</div>
					<div tabindex="0" class="styled__Wrap-sc-1a98puu-0 hWgOZv">
						<div class="styled__Btn-sc-1a98puu-1 fUMVvC">
							<span>가격대</span> <i width="11" height="7"
								class="fas fa-angle-down search__btn1__icon"></i>
						</div>
						<!-- 상세 창3 -->
						<div class="styled__FilterBox-sc-1a98puu-2 fhfjff"
							style="display: none">
							<div class="styled__SliderWrap-sc-1a98puu-7 bGSvtn">
								<h1 class="styled__Title-sc-1a98puu-3 lmqlXb">
									보증금/전세가
									<p class="styled__Price-sc-1a98puu-4 eavwzc">무제한</p>
								</h1>
								<div class="styled__RangeSlider-sc-1wi5o59-0 jqwYlT">
								
									<div id="pmd-slider-value-range"  class="pmd-range-slider" min="0" max="99999"></div>	
									
								</div>
								<ul class="styled__Ruler-sc-1a98puu-8 iGsetp">
									<li>0</li>
									<li>1억 2000만 원</li>
									<li>무제한</li>
								</ul>
							</div>
							<div class="styled__SliderWrap-sc-1a98puu-7 bGSvtn">
								<h1 class="styled__Title-sc-1a98puu-3 lmqlXb">
									월세
									<p class="styled__Price-sc-1a98puu-4 eavwzc">무제한</p>
								</h1>
								<div class="styled__RangeSlider-sc-1wi5o59-0 jqwYlT">
									<div class="noUi-target noUi-ltr noUi-horizontal">
										<div class="noUi-base">
											<div class="noUi-connects">
												<div class="noUi-connect noUi-draggable"
													style="transform: translate(0%, 0px) scale(1, 1);"></div>
											</div>
											<div class="noUi-origin"
												style="transform: translate(-100%, 0px); z-index: 5;">
												<div class="noUi-handle noUi-handle-lower" data-handle="0"
													tabindex="0" role="slider" aria-orientation="horizontal"
													aria-valuemin="0.0" aria-valuemax="100.0"
													aria-valuenow="0.0" aria-valuetext="0.00"></div>
											</div>
											<div class="noUi-origin"
												style="transform: translate(0%, 0px); z-index: 4;">
												<div class="noUi-handle noUi-handle-upper" data-handle="1"
													tabindex="0" role="slider" aria-orientation="horizontal"
													aria-valuemin="0.0" aria-valuemax="100.0"
													aria-valuenow="100.0" aria-valuetext="999999.00"></div>
											</div>
										</div>
									</div>
								</div>
								<ul class="styled__Ruler-sc-1a98puu-8 iGsetp">
									<li>0</li>
									<li>60만 원</li>
									<li>무제한</li>
								</ul>
							</div>
							<div class="styled__SliderWrap-sc-1a98puu-7 bGSvtn">
								<h1 class="styled__Title-sc-1a98puu-3 lmqlXb">
									매매가
									<p class="styled__Price-sc-1a98puu-4 eavwzc">무제한</p>
								</h1>
								<div class="styled__RangeSlider-sc-1wi5o59-0 jqwYlT">
									<div class="noUi-target noUi-ltr noUi-horizontal">
										<div class="noUi-base">
											<div class="noUi-connects">
												<div class="noUi-connect noUi-draggable"
													style="transform: translate(0%, 0px) scale(1, 1);"></div>
											</div>
											<div class="noUi-origin"
												style="transform: translate(-100%, 0px); z-index: 5;">
												<div class="noUi-handle noUi-handle-lower" data-handle="0"
													tabindex="0" role="slider" aria-orientation="horizontal"
													aria-valuemin="0.0" aria-valuemax="100.0"
													aria-valuenow="0.0" aria-valuetext="0.00"></div>
											</div>
											<div class="noUi-origin"
												style="transform: translate(0%, 0px); z-index: 4;">
												<div class="noUi-handle noUi-handle-upper" data-handle="1"
													tabindex="0" role="slider" aria-orientation="horizontal"
													aria-valuemin="0.0" aria-valuemax="100.0"
													aria-valuenow="100.0" aria-valuetext="999999.00"></div>
											</div>
										</div>
									</div>
								</div>
								<ul class="styled__Ruler-sc-1a98puu-8 iGsetp">
									<li>0</li>
									<li>5억 원</li>
									<li>무제한</li>
								</ul>
							</div>
							<div class="styled__ResetWrap-sc-1a98puu-9 iMfuwZ">
								<button class="styled__ResetBtn-sc-1a98puu-10 XQoXj">
									<svg width="22" height="22" viewBox="0 0 22 22">
			                      <path fill="#000" fill-rule="evenodd"
											d="M15.344 10.344h-2L16 7.688l2.688 2.656h-2c0 .96-.245 1.856-.736 2.688-.47.81-1.11 1.45-1.92 1.92a5.201 5.201 0 0 1-2.688.736c-.512 0-1.01-.075-1.496-.224a5.476 5.476 0 0 1-1.352-.624l.976-.96c.565.31 1.19.464 1.872.464.725 0 1.395-.179 2.008-.536a3.972 3.972 0 0 0 1.456-1.456 3.918 3.918 0 0 0 .536-2.008zm-9.344 0c0-.96.245-1.856.736-2.688.47-.81 1.11-1.45 1.92-1.92A5.201 5.201 0 0 1 11.344 5c.512 0 1.013.072 1.504.216.49.144.939.355 1.344.632l-.976.96a3.835 3.835 0 0 0-1.872-.464c-.725 0-1.395.179-2.008.536A3.972 3.972 0 0 0 7.88 8.336a3.918 3.918 0 0 0-.536 2.008h2L6.688 13 4 10.344h2z">
			                      </path>
			                    </svg>
									조건삭제
								</button>
							</div>
						</div>
						<!-- 상세 창3 -->
					</div>
					<div tabindex="0" class="styled__Wrap-sc-1a98puu-0 hWgOZv">
						<div class="styled__Btn-sc-1a98puu-1 fUMVvC">
							<span>관리비</span> <i width="11" height="7"
								class="fas fa-angle-down search__btn1__icon"></i>
						</div>
						<!-- 상세 창4 -->
						<div class="styled__FilterBox-sc-1a98puu-2 fhfjff"
							style="left: 0px; display: none;">
							<div class="styled__SliderWrap-sc-1a98puu-7 bGSvtn">
								<h1 class="styled__Title-sc-1a98puu-3 lmqlXb">
									관리비
									<p class="styled__Price-sc-1a98puu-4 eavwzc">무제한</p>
								</h1>
								<div class="styled__RangeSlider-sc-1wi5o59-0 jqwYlT">
									<div class="noUi-target noUi-ltr noUi-horizontal">
										<div class="noUi-base">
											<div class="noUi-connects">
												<div class="noUi-connect noUi-draggable"
													style="transform: translate(0%, 0px) scale(1, 1);"></div>
											</div>
											<div class="noUi-origin"
												style="transform: translate(-100%, 0px); z-index: 5;">
												<div class="noUi-handle noUi-handle-lower" data-handle="0"
													tabindex="0" role="slider" aria-orientation="horizontal"
													aria-valuemin="0.0" aria-valuemax="100.0"
													aria-valuenow="0.0" aria-valuetext="0.00"></div>
											</div>
											<div class="noUi-origin"
												style="transform: translate(0%, 0px); z-index: 4;">
												<div class="noUi-handle noUi-handle-upper" data-handle="1"
													tabindex="0" role="slider" aria-orientation="horizontal"
													aria-valuemin="0.0" aria-valuemax="100.0"
													aria-valuenow="100.0" aria-valuetext="999999.00"></div>
											</div>
										</div>
									</div>
								</div>
								<ul class="styled__Ruler-sc-1a98puu-8 iGsetp"
									style="padding-bottom: 25px;">
									<li>0</li>
									<li>20만원</li>
									<li>무제한</li>
								</ul>
								<div class="styled__CheckWrap-c7ra09-0 bhrYii">
									<label class="Checkbox__Label-ifp1yz-0 kAqGVi clearfix"
										size="22"> <input name="include_maintenance_option1"
										type="checkbox" class="Checkbox__CheckboxStd-ifp1yz-1 PcMeW"
										value="" checked="" /> <span class="CheckBox"></span> <span
										class="styled__Text-sc-1a98puu-6 iZnMRe">협의가능 포함 </span>
									</label>
								</div>
							</div>
							<div class="styled__ResetWrap-sc-1a98puu-9 iMfuwZ">
								<button class="styled__ResetBtn-sc-1a98puu-10 XQoXj">
									<svg width="22" height="22" viewBox="0 0 22 22">
			                      <path fill="#000" fill-rule="evenodd"
											d="M15.344 10.344h-2L16 7.688l2.688 2.656h-2c0 .96-.245 1.856-.736 2.688-.47.81-1.11 1.45-1.92 1.92a5.201 5.201 0 0 1-2.688.736c-.512 0-1.01-.075-1.496-.224a5.476 5.476 0 0 1-1.352-.624l.976-.96c.565.31 1.19.464 1.872.464.725 0 1.395-.179 2.008-.536a3.972 3.972 0 0 0 1.456-1.456 3.918 3.918 0 0 0 .536-2.008zm-9.344 0c0-.96.245-1.856.736-2.688.47-.81 1.11-1.45 1.92-1.92A5.201 5.201 0 0 1 11.344 5c.512 0 1.013.072 1.504.216.49.144.939.355 1.344.632l-.976.96a3.835 3.835 0 0 0-1.872-.464c-.725 0-1.395.179-2.008.536A3.972 3.972 0 0 0 7.88 8.336a3.918 3.918 0 0 0-.536 2.008h2L6.688 13 4 10.344h2z">
			                      </path>
			                    </svg>
									조건삭제
								</button>
							</div>
						</div>
						<!-- 상세 창4 -->
					</div>
					<div tabindex="0" class="styled__Wrap-sc-1a98puu-0 hWgOZv">
						<div class="styled__Btn-sc-1a98puu-1 fUMVvC">
							<span>방크기</span> <i width="11" height="7"
								class="fas fa-angle-down search__btn1__icon"></i>
						</div>
						<!-- 상세 창5 -->
						<div class="styled__FilterBox-sc-1a98puu-2 fhfjff"
							style="right: 0px; display: none;">
							<div class="styled__SliderWrap-sc-1a98puu-7 bGSvtn">
								<h1 class="styled__Title-sc-1a98puu-3 lmqlXb">
									방크기
									<p class="styled__Price-sc-1a98puu-4 eavwzc">무제한</p>
								</h1>
								<div class="styled__RangeSlider-sc-1wi5o59-0 jqwYlT">
									<div class="noUi-target noUi-ltr noUi-horizontal">
										<div class="noUi-base">
											<div class="noUi-connects">
												<div class="noUi-connect noUi-draggable"
													style="transform: translate(0%, 0px) scale(1, 1);"></div>
											</div>
											<div class="noUi-origin"
												style="transform: translate(-100%, 0px); z-index: 5;">
												<div class="noUi-handle noUi-handle-lower" data-handle="0"
													tabindex="0" role="slider" aria-orientation="horizontal"
													aria-valuemin="0.0" aria-valuemax="100.0"
													aria-valuenow="0.0" aria-valuetext="0.00"></div>
											</div>
											<div class="noUi-origin"
												style="transform: translate(0%, 0px); z-index: 4;">
												<div class="noUi-handle noUi-handle-upper" data-handle="1"
													tabindex="0" role="slider" aria-orientation="horizontal"
													aria-valuemin="0.0" aria-valuemax="100.0"
													aria-valuenow="100.0" aria-valuetext="999999.00"></div>
											</div>
										</div>
									</div>
								</div>
								<ul class="styled__Ruler-sc-1a98puu-8 iGsetp">
									<li>0m²(0평)</li>
									<li>33m²(10평)</li>
									<li>무제한</li>
								</ul>
							</div>
							<div class="styled__ResetWrap-sc-1a98puu-9 iMfuwZ">
								<button class="styled__ResetBtn-sc-1a98puu-10 XQoXj">
									<svg width="22" height="22" viewBox="0 0 22 22">
			                      <path fill="#000" fill-rule="evenodd"
											d="M15.344 10.344h-2L16 7.688l2.688 2.656h-2c0 .96-.245 1.856-.736 2.688-.47.81-1.11 1.45-1.92 1.92a5.201 5.201 0 0 1-2.688.736c-.512 0-1.01-.075-1.496-.224a5.476 5.476 0 0 1-1.352-.624l.976-.96c.565.31 1.19.464 1.872.464.725 0 1.395-.179 2.008-.536a3.972 3.972 0 0 0 1.456-1.456 3.918 3.918 0 0 0 .536-2.008zm-9.344 0c0-.96.245-1.856.736-2.688.47-.81 1.11-1.45 1.92-1.92A5.201 5.201 0 0 1 11.344 5c.512 0 1.013.072 1.504.216.49.144.939.355 1.344.632l-.976.96a3.835 3.835 0 0 0-1.872-.464c-.725 0-1.395.179-2.008.536A3.972 3.972 0 0 0 7.88 8.336a3.918 3.918 0 0 0-.536 2.008h2L6.688 13 4 10.344h2z">
			                      </path>
			                    </svg>
									조건삭제
								</button>
							</div>
						</div>
						<!-- 상세 창5 -->
					</div>
					<!-- 준공년차 -->
					<!--<div tabindex="0" class="styled__Wrap-sc-1a98puu-0 hWgOZv">
						<div class="styled__Btn-sc-1a98puu-1 fUMVvC">
							<span>준공년차</span> <i width="11" height="7"
								class="fas fa-angle-down search__btn1__icon"></i>
						</div> -->
						<!-- 상세 창6 -->
						<!--<div class="styled__FilterBox-sc-1a98puu-2 fhfjff"
							style="right: 0px; display: none;">
							<h1 class="styled__Title-sc-1a98puu-3 lmqlXb">준공년차</h1>
							<ul class="styled__Ul-sc-19pabue-0 bZsIeN">
								<li><label class="Radio__Label-lgvo9c-0 eUbtsI clearfix"
									size="22"> <input name="enter_date_range" type="radio"
										class="Radio__RadioStd-lgvo9c-1 dvQVkh" value="" checked="" />
										<span class="Radio--circle"></span> <span
										class="styled__Text-sc-19pabue-1 hLYrBD">전체</span>
								</label></li>
								<li><label class="Radio__Label-lgvo9c-0 eUbtsI clearfix"
									size="22"> <input name="enter_date_range" type="radio"
										class="Radio__RadioStd-lgvo9c-1 dvQVkh" value="" /> <span
										class="Radio--circle"></span> <span
										class="styled__Text-sc-19pabue-1 hLYrBD">1년 이내</span>
								</label></li>
								<li><label class="Radio__Label-lgvo9c-0 eUbtsI clearfix"
									size="22"> <input name="enter_date_range" type="radio"
										class="Radio__RadioStd-lgvo9c-1 dvQVkh" value="" /> <span
										class="Radio--circle"></span> <span
										class="styled__Text-sc-19pabue-1 hLYrBD">5년 이내</span>
								</label></li>
								<li><label class="Radio__Label-lgvo9c-0 eUbtsI clearfix"
									size="22"> <input name="enter_date_range" type="radio"
										class="Radio__RadioStd-lgvo9c-1 dvQVkh" value="" /> <span
										class="Radio--circle"></span> <span
										class="styled__Text-sc-19pabue-1 hLYrBD">10년 이내</span>
								</label></li>
								<li><label class="Radio__Label-lgvo9c-0 eUbtsI clearfix"
									size="22"> <input name="enter_date_range" type="radio"
										class="Radio__RadioStd-lgvo9c-1 dvQVkh" value="" /> <span
										class="Radio--circle"></span> <span
										class="styled__Text-sc-19pabue-1 hLYrBD">15년 이내</span>
								</label></li>
								<li><label class="Radio__Label-lgvo9c-0 eUbtsI clearfix"
									size="22"> <input name="enter_date_range" type="radio"
										class="Radio__RadioStd-lgvo9c-1 dvQVkh" value="" /> <span
										class="Radio--circle"></span> <span
										class="styled__Text-sc-19pabue-1 hLYrBD">15년 이상</span>
								</label></li>
							</ul>
						</div>
						<!-- 상세 창6 -->
					<!--</div> -->
					<!-- 준공년차 -->
					<div tabindex="0" class="styled__Wrap-sc-1a98puu-0 hWgOZv">
						<div class="styled__Btn-jzhnoe-1 bAZEbe">
							추가필터 <i width="11" height="7"
								class="fas fa-angle-down search__btn1__icon"></i>
						</div>
						<!-- 상세 창7 -->
						<div class="styled__FilterBox-jzhnoe-2 dIVcAa"
							style="display: none;">
							<table class="styled__Table-jzhnoe-4 cgRTwE">
								<colgroup>
									<col width="240px" />
									<col width="240px" />
									<col width="240px" />
									<col width="240px" />
								</colgroup>
								<tbody>
									<tr style="height: 290px;">
										<td>
											<h1 class="styled__Title-jzhnoe-3 jpAxXq">
												층수 <font>중복선택이 가능합니다.</font>
											</h1>
											<ul class="styled__Ul-whabxg-0 gpNskk">
												<li class="styled__Li-whabxg-1 cHPNZJ"><label
													class="Checkbox__Label-ifp1yz-0 kAqGVi clearfix" size="22">
														<input name="room_floor_multi" type="checkbox"
														class="Checkbox__CheckboxStd-ifp1yz-1 PcMeW" value=""
														checked="" /> <span class="CheckBox"></span> <span
														class="styled__Text-jzhnoe-5 cmTDVA">전체</span>
												</label></li>
												<li class="styled__Li-whabxg-1 cHPNZJ"><label
													class="Checkbox__Label-ifp1yz-0 kAqGVi clearfix" size="22">
														<input name="room_floor_multi" type="checkbox"
														class="Checkbox__CheckboxStd-ifp1yz-1 PcMeW" value="" />
														<span class="CheckBox"></span> <span
														class="styled__Text-jzhnoe-5 cmTDVA">1층</span>
												</label></li>
												<li class="styled__Li-whabxg-1 cHPNZJ"><label
													class="Checkbox__Label-ifp1yz-0 kAqGVi clearfix" size="22">
														<input name="room_floor_multi" type="checkbox"
														class="Checkbox__CheckboxStd-ifp1yz-1 PcMeW" value="" />
														<span class="CheckBox"></span> <span
														class="styled__Text-jzhnoe-5 cmTDVA">2층</span>
												</label></li>
												<li class="styled__Li-whabxg-1 cHPNZJ"><label
													class="Checkbox__Label-ifp1yz-0 kAqGVi clearfix" size="22">
														<input name="room_floor_multi" type="checkbox"
														class="Checkbox__CheckboxStd-ifp1yz-1 PcMeW" value="" />
														<span class="CheckBox"></span> <span
														class="styled__Text-jzhnoe-5 cmTDVA">3층</span>
												</label></li>
												<li class="styled__Li-whabxg-1 cHPNZJ"><label
													class="Checkbox__Label-ifp1yz-0 kAqGVi clearfix" size="22">
														<input name="room_floor_multi" type="checkbox"
														class="Checkbox__CheckboxStd-ifp1yz-1 PcMeW" value="" />
														<span class="CheckBox"></span> <span
														class="styled__Text-jzhnoe-5 cmTDVA">4층</span>
												</label></li>
											</ul>
											<ul class="styled__Ul-whabxg-0 gpNskk">
												<li class="styled__Li-whabxg-1 cHPNZJ"><label
													class="Checkbox__Label-ifp1yz-0 kAqGVi clearfix" size="22">
														<input name="room_floor_multi" type="checkbox"
														class="Checkbox__CheckboxStd-ifp1yz-1 PcMeW" value="" />
														<span class="CheckBox"></span> <span
														class="styled__Text-jzhnoe-5 cmTDVA">5층</span>
												</label></li>
												<li class="styled__Li-whabxg-1 cHPNZJ"><label
													class="Checkbox__Label-ifp1yz-0 kAqGVi clearfix" size="22">
														<input name="room_floor_multi" type="checkbox"
														class="Checkbox__CheckboxStd-ifp1yz-1 PcMeW" value="" />
														<span class="CheckBox"></span> <span
														class="styled__Text-jzhnoe-5 cmTDVA">6층</span>
												</label></li>
												<li class="styled__Li-whabxg-1 cHPNZJ"><label
													class="Checkbox__Label-ifp1yz-0 kAqGVi clearfix" size="22">
														<input name="room_floor_multi" type="checkbox"
														class="Checkbox__CheckboxStd-ifp1yz-1 PcMeW" value="" />
														<span class="CheckBox"></span> <span
														class="styled__Text-jzhnoe-5 cmTDVA">7층 이상</span>
												</label></li>
												<li class="styled__Li-whabxg-1 cHPNZJ"><label
													class="Checkbox__Label-ifp1yz-0 kAqGVi clearfix" size="22">
														<input name="room_floor_multi" type="checkbox"
														class="Checkbox__CheckboxStd-ifp1yz-1 PcMeW" value="" />
														<span class="CheckBox"></span> <span
														class="styled__Text-jzhnoe-5 cmTDVA">반지층</span>
												</label></li>
												<li class="styled__Li-whabxg-1 cHPNZJ"><label
													class="Checkbox__Label-ifp1yz-0 kAqGVi clearfix" size="22">
														<input name="room_floor_multi" type="checkbox"
														class="Checkbox__CheckboxStd-ifp1yz-1 PcMeW" value="" />
														<span class="CheckBox"></span> <span
														class="styled__Text-jzhnoe-5 cmTDVA">옥탑방</span>
												</label></li>
											</ul>
										</td>
										<td>
											<h1 class="styled__Title-jzhnoe-3 jpAxXq">
												방구조 <font>중복선택이 가능합니다.</font>
											</h1>
											<ul>
												<li class="styled__Li-sc-3gkk3w-0 jaSpzl"><label
													class="Checkbox__Label-ifp1yz-0 bXGJoU clearfix" size="22">
														<input name="division" disabled="" type="checkbox"
														class="Checkbox__CheckboxStd-ifp1yz-1 PcMeW" value="" />
														<span class="CheckBox"></span> <span
														class="styled__Text-jzhnoe-5 cmTDVA">주방 분리형(1.5룸)</span>
												</label></li>
												<li class="styled__Li-sc-3gkk3w-0 jaSpzl"><label
													class="Checkbox__Label-ifp1yz-0 bXGJoU clearfix" size="22">
														<input name="duplex" disabled="" type="checkbox"
														class="Checkbox__CheckboxStd-ifp1yz-1 PcMeW" value="" />
														<span class="CheckBox"></span> <span
														class="styled__Text-jzhnoe-5 cmTDVA">복층</span>
												</label></li>
												<li class="styled__Li-sc-3gkk3w-0 bKVwEL"><label
													class="Checkbox__Label-ifp1yz-0 kAqGVi clearfix" size="22">
														<input name="room_type" type="checkbox"
														class="Checkbox__CheckboxStd-ifp1yz-1 PcMeW" value=""
														checked="" /> <span class="CheckBox"></span> <span
														class="styled__Text-jzhnoe-5 cmTDVA">투룸</span>
												</label></li>
												<li class="styled__Li-sc-3gkk3w-0 bKVwEL"><label
													class="Checkbox__Label-ifp1yz-0 kAqGVi clearfix" size="22">
														<input name="room_type" type="checkbox"
														class="Checkbox__CheckboxStd-ifp1yz-1 PcMeW" value=""
														checked="" /> <span class="CheckBox"></span> <span
														class="styled__Text-jzhnoe-5 cmTDVA">쓰리룸 이상</span>
												</label></li>
											</ul>
										</td>
										<td>
											<h1 class="styled__Title-jzhnoe-3 fyGYGd">세대수</h1>
											<ul>
												<li class="styled__Li-sc-1n2x58-0 khwmdi"><label
													class="Radio__Label-lgvo9c-0 fMyfaa clearfix" size="22">
														<input name="household_num_range" disabled="" type="radio"
														class="Radio__RadioStd-lgvo9c-1 dvQVkh" value=""
														checked="" /> <span class="Radio--circle"></span> <span
														class="styled__Text-jzhnoe-5 cmTDVA">전체</span>
												</label></li>
												<li class="styled__Li-sc-1n2x58-0 khwmdi"><label
													class="Radio__Label-lgvo9c-0 fMyfaa clearfix" size="22">
														<input name="household_num_range" disabled="" type="radio"
														class="Radio__RadioStd-lgvo9c-1 dvQVkh" value="" /> <span
														class="Radio--circle"></span> <span
														class="styled__Text-jzhnoe-5 cmTDVA">100세대 이하</span>
												</label></li>
												<li class="styled__Li-sc-1n2x58-0 khwmdi"><label
													class="Radio__Label-lgvo9c-0 fMyfaa clearfix" size="22">
														<input name="household_num_range" disabled="" type="radio"
														class="Radio__RadioStd-lgvo9c-1 dvQVkh" value="" /> <span
														class="Radio--circle"></span> <span
														class="styled__Text-jzhnoe-5 cmTDVA">100세대 이상</span>
												</label></li>
												<li class="styled__Li-sc-1n2x58-0 khwmdi"><label
													class="Radio__Label-lgvo9c-0 fMyfaa clearfix" size="22">
														<input name="household_num_range" disabled="" type="radio"
														class="Radio__RadioStd-lgvo9c-1 dvQVkh" value="" /> <span
														class="Radio--circle"></span> <span
														class="styled__Text-jzhnoe-5 cmTDVA">500세대 이상</span>
												</label></li>
												<li class="styled__Li-sc-1n2x58-0 khwmdi"><label
													class="Radio__Label-lgvo9c-0 fMyfaa clearfix" size="22">
														<input name="household_num_range" disabled="" type="radio"
														class="Radio__RadioStd-lgvo9c-1 dvQVkh" value="" /> <span
														class="Radio--circle"></span> <span
														class="styled__Text-jzhnoe-5 cmTDVA">1000세대 이상</span>
												</label></li>
											</ul>
										</td>
										<td>
											<h1 class="styled__Title-jzhnoe-3 jpAxXq">주차대수</h1>
											<ul class="styled__Ul-tzxp50-0 bChXEb">
												<li class="styled__Li-tzxp50-1 goQzXS"><label
													class="Radio__Label-lgvo9c-0 eUbtsI clearfix" size="22">
														<input name="parking_average_range" type="radio"
														class="Radio__RadioStd-lgvo9c-1 dvQVkh" value=""
														checked="" /> <span class="Radio--circle"></span> <span
														class="styled__Text-jzhnoe-5 cmTDVA">상관없음</span>
												</label></li>
												<li class="styled__Li-tzxp50-1 goQzXS"><label
													class="Radio__Label-lgvo9c-0 eUbtsI clearfix" size="22">
														<input name="parking_average_range" type="radio"
														class="Radio__RadioStd-lgvo9c-1 dvQVkh" value="" /> <span
														class="Radio--circle"></span> <span
														class="styled__Text-jzhnoe-5 cmTDVA">세대당 2대 이상</span>
												</label></li>
												<li class="styled__Li-tzxp50-1 goQzXS"><label
													class="Radio__Label-lgvo9c-0 eUbtsI clearfix" size="22">
														<input name="parking_average_range" type="radio"
														class="Radio__RadioStd-lgvo9c-1 dvQVkh" value="" /> <span
														class="Radio--circle"></span> <span
														class="styled__Text-jzhnoe-5 cmTDVA">세대당 1대 이상</span>
												</label></li>
											</ul>
										</td>
									</tr>
									<tr style="height: 237px;">
										<td>
											<h1 class="styled__Title-jzhnoe-3 jpAxXq">거래종류</h1>
											<ul class="styled__Ul-sc-73uc0o-0 fpKTCk">
												<li><label
													class="Radio__Label-lgvo9c-0 eUbtsI clearfix" size="22">
														<input name="deal_type" type="radio"
														class="Radio__RadioStd-lgvo9c-1 dvQVkh" value=""
														checked="" /> <span class="Radio--circle"></span> <span
														class="styled__Text-jzhnoe-5 cmTDVA">전체</span>
												</label></li>
												<li><label
													class="Radio__Label-lgvo9c-0 eUbtsI clearfix" size="22">
														<input name="deal_type" type="radio"
														class="Radio__RadioStd-lgvo9c-1 dvQVkh" value="" /> <span
														class="Radio--circle"></span> <span
														class="styled__Text-jzhnoe-5 cmTDVA">중개</span>
												</label></li>
												<li><label
													class="Radio__Label-lgvo9c-0 eUbtsI clearfix" size="22">
														<input name="deal_type" type="radio"
														class="Radio__RadioStd-lgvo9c-1 dvQVkh" value="" /> <span
														class="Radio--circle"></span> <span
														class="styled__Text-jzhnoe-5 cmTDVA">직거래</span>
												</label></li>
											</ul>
										</td>
										<td colspan="3">
											<h1 class="styled__Title-jzhnoe-3 jpAxXq"
												style="margin-bottom: 12px;">
												<span>추가 옵션</span> <font>중복선택이 가능합니다.</font>
											</h1>
											<ul class="styled__Ul-gzb3pm-0 geOCej">
												<li><label class="styled__Label-gzb3pm-1 jAoody">
														<input type="checkbox" />
														<p class="styled__BtnLike-gzb3pm-2 jhkKdW">주차가능</p>
												</label></li>
												<li><label class="styled__Label-gzb3pm-1 jAoody">
														<input type="checkbox" />
														<p class="styled__BtnLike-gzb3pm-2 jhkKdW">반려동물</p>
												</label></li>
												<li><label class="styled__Label-gzb3pm-1 jAoody">
														<input type="checkbox" />
														<p class="styled__BtnLike-gzb3pm-2 jhkKdW">단기임대</p>
												</label></li>
												<li><label class="styled__Label-gzb3pm-1 jAoody">
														<input type="checkbox" />
														<p class="styled__BtnLike-gzb3pm-2 jhkKdW">풀옵션</p>
												</label></li>
												<li><label class="styled__Label-gzb3pm-1 jAoody">
														<input type="checkbox" />
														<p class="styled__BtnLike-gzb3pm-2 jhkKdW">빌트인</p>
												</label></li>
												<li><label class="styled__Label-gzb3pm-1 jAoody">
														<input type="checkbox" />
														<p class="styled__BtnLike-gzb3pm-2 jhkKdW">엘리베이터</p>
												</label></li>
												<li><label class="styled__Label-gzb3pm-1 jAoody">
														<input type="checkbox" />
														<p class="styled__BtnLike-gzb3pm-2 jhkKdW">베란다/발코니</p>
												</label></li>
												<li><label class="styled__Label-gzb3pm-1 jAoody">
														<input type="checkbox" />
														<p class="styled__BtnLike-gzb3pm-2 jhkKdW">전세자금대출</p>
												</label></li>
												<li><label class="styled__Label-gzb3pm-1 jAoody">
														<input type="checkbox" />
														<p class="styled__BtnLike-gzb3pm-2 jhkKdW">보안/안전시설</p>
												</label></li>
												<li><label class="styled__Label-gzb3pm-1 jAoody">
														<input type="checkbox" />
														<p class="styled__BtnLike-gzb3pm-2 jhkKdW">360˚VR</p>
												</label></li>
											</ul>
											<div class="styled__DescBox-gzb3pm-3 bFZgGt">
												<svg x="0" y="0" width="18" height="18" viewBox="0 0 27 27">
							                        <clipPath id="c1_1">
							                          <path
																d="M13.7,20.6c-.6,0,-1.1,-.5,-1.1,-1.1c0,-.7,.5,-1.2,1.1,-1.2c.7,0,1.2,.5,1.2,1.2c0,.6,-.5,1.1,-1.2,1.1Zm.1,-3.8c-1,0,-1.2,-8.3,-1.2,-9.2c0,-.8,.5,-1.5,1.2,-1.5c.6,0,1.1,.7,1.1,1.5c0,.9,-.2,9.2,-1.1,9.2Z">
							                          </path>
							                        </clipPath>
							                        <g>
							                          <circle cx="13.5" cy="13.5" r="13.5"
																fill="#E6E7EA"></circle>
							                          <path fill="#9C9EA3"
																d="M5,28.3H22.5V-1.4H5V28.3Z" clip-path="url(#c1_1)"></path>
							                        </g>
							                      </svg>
												<p class="styled__Desc-gzb3pm-4 diBSwb">풀옵션 항목은 세탁기,
													냉장고, 에어컨, 가스레인지 또는 인덕션입니다.</p>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- 상세 창7 -->
					</div>
				</div>

				<div class="styled__BtnWrap-sfs8fz-2 iAUcYP">
					<!-- <button class="styled__Btn-sc-1p3e70q-0 bRnFtN">
						<svg width="22" height="19" viewBox="0 0 30 26">
			                <g fill="none" fill-rule="evenodd">
			                  <g class="Svg__group" fill-rule="nonzero">
			                    <path
								d="M8 13.75a2.75 2.75 0 1 1 0-5.5 2.75 2.75 0 0 1 0 5.5zm0-1.5a1.25 1.25 0 1 0 0-2.5 1.25 1.25 0 0 0 0 2.5zM22 11.75a2.75 2.75 0 1 1 0-5.5 2.75 2.75 0 0 1 0 5.5zm0-1.5a1.25 1.25 0 1 0 0-2.5 1.25 1.25 0 0 0 0 2.5zM15 19.75a2.75 2.75 0 1 1 0-5.5 2.75 2.75 0 0 1 0 5.5zm0-1.5a1.25 1.25 0 1 0 0-2.5 1.25 1.25 0 0 0 0 2.5z">
			                    </path>
			                    <path
								d="M8.75 8.417V4.25a.75.75 0 0 0-1.5 0v4.167a.75.75 0 0 0 1.5 0zM15.75 14.69V4.25a.75.75 0 1 0-1.5 0v10.44a.75.75 0 0 0 1.5 0zM22.75 6.5V4.25a.75.75 0 1 0-1.5 0V6.5a.75.75 0 1 0 1.5 0zM8.75 21.564V13.25a.75.75 0 0 0-1.5 0v8.314a.75.75 0 0 0 1.5 0zM22.75 21.561V11.49a.75.75 0 1 0-1.5 0v10.071a.75.75 0 1 0 1.5 0zM15.75 21.56v-1.88a.75.75 0 1 0-1.5 0v1.88a.75.75 0 1 0 1.5 0z">
			                    </path>
			                  </g>
			                </g>
			              </svg>
						전체필터
					</button> -->
					<button class="styled__Btn-sfs8fz-3 bfbsFm"
						style="padding-left: 36px;">
						<i width="22" height="22"
							class="fas fa-sync-alt search__btn3__icon" style="left: 14px;"></i>
						초기화
					</button>
				</div>
			</div>
		</div>
		<!-- 검색,필터 -->
		<!-- 방정보 시작 -->

		<div class="styled__Wrap-zfi8ji-0 gftUiJ">
			<div class="styled__ListWrap-zfi8ji-1 bcjswF">
				<div class="styled__Wrap-ityzo6-0 eXwtu">
					<div class="styled__Tabs-sc-1sk8lv8-0 jLBlsX">
						<a class="styled__Tab-sc-1sk8lv8-1 hXdylP">조건에 맞는 방 34022개</a> <a
							class="styled__Tab-sc-1sk8lv8-1 herjpP">단지 3074개</a>
					</div>
					<div class="styled__ListWrap-ityzo6-4 cDzGDZ">
						<ul class="styled__Ul-ityzo6-5 fxRDHg">

							<c:forEach var="room" items="${rooms}">

								<li class="styled__Li-sc-84urxt-0 hxpbDF">
									<div class="styled__Card-fi3k4t-0 OUJOU">
										<div class="styled__BtnWrap-sc-3yrk4m-0 gYMri">
											<div class="styled__Like-sc-3yrk4m-1 hjVNgq" value="${room.roomId}" style="background: url(/images/like.svg)"></div>
										</div>
										<a href="#" onclick="roomDetail(${room.roomId})" target="_blank" 
											rel="noopener noreferrer" class="styled__A-fi3k4t-1 kpKjGs">
											<div class="styled__RoomImg-fi3k4t-2 kfPGuF RoomImg"
												style="background: url(/media/${room.picName}) center center/cover no-repeat;"></div>
											<div class="styled__BadgeWrap-fi3k4t-3 gAdXIp">
												<svg viewBox="0 0 46 18" fill="none"
													class="styled__Svg-sc-1t9oqsb-0 hhLAzQ">
			                          			<rect width="46" height="18" rx="2"
														fill="#CDAF84"></rect>
			                          			<path
														d="M14.1586 9.39199V8.35799H5.30362V9.39199H14.1586ZM13.3336 13.825V12.769H7.67962V12.318H13.0366V9.94199H6.37062V10.954H11.7606V11.416H6.39262V13.825H13.3336ZM13.2456 7.89599V6.88399H11.8816L12.1346 5.75099L10.8916 5.57499L10.6826 6.88399H8.75762L8.60362 5.57499L7.34962 5.75099L7.54762 6.88399H6.18362V7.89599H13.2456ZM13.2676 5.29999V4.28799H6.15062V5.29999H13.2676Z"
														fill="white">
												</path>
			                          			<path
														d="M19.8212 11.361L19.6892 10.327C18.4132 10.569 16.8732 10.613 15.9602 10.613V8.57799H19.0072V4.90399H14.6622V5.92699H17.6982V7.55499H14.6732V11.669H15.7072C17.3682 11.669 18.7872 11.559 19.8212 11.361ZM22.4172 13.869V4.06799H21.1412V7.69799H19.6562V8.77599H21.1412V13.869H22.4172Z"
														fill="white">
												</path>
			                          			<path
														d="M32.1938 12.593V11.57H23.3388V12.593H32.1938ZM32.0068 8.57799C30.5108 8.32499 28.4428 7.03799 28.4428 5.31099V4.66199H27.1008V5.31099C27.1008 7.04899 25.1538 8.34699 23.5478 8.57799L24.1528 9.62299C25.5058 9.32599 27.2548 8.28099 27.7608 6.96099C28.3218 8.24799 30.0158 9.27099 31.3578 9.57899L32.0068 8.57799Z"
														fill="white">
												</path>
			                          			<path d="M38.5 5.5V12.5M35 9H42"
														stroke="white" stroke-width="1.2"></path>
			                        		</svg>
												<div class="styled__ConfirmBadge-fi3k4t-4 gekGFB">
													<span>확인매물</span> <font>20.02.14</font>
												</div>
											</div>
											<p
												class="styled__Text-fi3k4t-7 styled__RoomType-fi3k4t-8 iKMmNd">
												${room.roomType}   ${like.roomId}</p>
											<p
												class="styled__Text-fi3k4t-7 styled__Price-fi3k4t-9 bNBYTU">
												<span>${room.dealType} <c:choose>
														<c:when test="${0 ne room.yearRent}">${room.yearRent}</c:when>
														<c:when test="${0 ne room.monthRent}">${room.deposit}/${room.monthRent}</c:when>
														<c:otherwise>${room.dealRent}</c:otherwise>
													</c:choose>
												</span>
											</p>
											<p class="styled__Text-fi3k4t-7 jBkVAv">${room.floor}층,${room.areaP}m²,관리비
												${room.MCost} 만</p>
											<p class="styled__Text-fi3k4t-7 jBkVAv">${room.title}</p>
										</a>

									</div>
								</li>
							</c:forEach>

						</ul>
						<div class="styled__PageWrap-ityzo6-9 dzQBoq">
							<div class="styled__Wrap-sc-14n2m5h-0 hZjLUp">
								<div class="styled__Pagination-sc-14n2m5h-1 ijgAzA">
									<button
										class="styled__Btn-sc-14n2m5h-2 styled__PrevBtn-sc-14n2m5h-3 bAopv">
										<i width="12" height="12"
											class="fas fa-angle-left  wrap__page__prevBtn__icon"></i>
									</button>
									<ul class="styled__Items-sc-14n2m5h-5 gGZMTf">
										<li><a class="styled__Item-sc-14n2m5h-6 bbapQa">1</a></li>
										<li><a class="styled__Item-sc-14n2m5h-6 jZMeEh">2</a></li>
										<li><a class="styled__Item-sc-14n2m5h-6 jZMeEh">3</a></li>
										<li><a class="styled__Item-sc-14n2m5h-6 jZMeEh">4</a></li>
										<li><a class="styled__Item-sc-14n2m5h-6 jZMeEh">5</a></li>
										<li><a class="styled__Item-sc-14n2m5h-6 jZMeEh">6</a></li>
										<li><a class="styled__Item-sc-14n2m5h-6 jZMeEh">7</a></li>
									</ul>
									<button
										class="styled__Btn-sc-14n2m5h-2 styled__NextBtn-sc-14n2m5h-4 ffbDEJ">
										<i width="12" height="12"
											class="fas fa-angle-right wrap__page__nextBtn__icon"></i>
									</button>
								</div>
								<p class="styled__CopyRight-sc-14n2m5h-7 jdQaIx">Station3,
									Inc. All rights reserved.</p>
							</div>
						</div>
					</div>
				</div>
				<button class="styled__ExtendBtn-zfi8ji-2 cHCsIX">
					<i width="8" height="13"
						class="fas fa-angle-left wrap__page__prevBtn__icon"></i>
				</button>
			</div>
			<div id="mapContainer" class="styled__MapWrap-zfi8ji-3 gdoUVB">
				<div id="map" style="width: 950px; height: 900px;"></div>
			</div>
		</div>
		<!-- 방정보 끝-->

		<div id="toast">
			<div id="react-toast" class="styled__Wrap-sc-1run8ov-0 kqJPVO"></div>
		</div>
		<div id="fb-root" class="fb_reset">
			<div
				style="position: absolute; top: -10000px; width: 0px; height: 0px;">
				<div></div>
			</div>
		</div>
		<!-- 전체필터 상세창 시작 -->
	<%-- 	<div class="portal" style="display: none">
			<div class="styled__Wrap-sc-1p3e70q-1 cRQhXs">
				<div class="styled__Wrap-sc-17lr53x-0 RsiHx">
					<h1 class="styled__Title-sc-17lr53x-1 coyXRX">
						방종류
						<p class="styled__Desc-sc-17lr53x-5 jyZTzt">중복선택이 가능합니다.</p>
					</h1>
					<ul class="styled__Ul-khpb9s-0 gGseHL">
						<li><label class="Checkbox__Label-ifp1yz-0 kAqGVi clearfix"
							size="22"> <input name="multi_room_type" type="checkbox"
								class="Checkbox__CheckboxStd-ifp1yz-1 PcMeW" value="" checked="" />
								<span class="CheckBox"></span> <span
								class="styled__CheckText-sc-17lr53x-2 iMbsTF">원룸</span>
						</label></li>
						<li><label class="Checkbox__Label-ifp1yz-0 kAqGVi clearfix"
							size="22"> <input name="multi_room_type" type="checkbox"
								class="Checkbox__CheckboxStd-ifp1yz-1 PcMeW" value="" checked="" />
								<span class="CheckBox"></span> <span
								class="styled__CheckText-sc-17lr53x-2 iMbsTF">투•쓰리룸</span>
						</label></li>
						<li><label class="Checkbox__Label-ifp1yz-0 kAqGVi clearfix"
							size="22"> <input name="multi_room_type" type="checkbox"
								class="Checkbox__CheckboxStd-ifp1yz-1 PcMeW" value="" checked="" />
								<span class="CheckBox"></span> <span
								class="styled__CheckText-sc-17lr53x-2 iMbsTF">오피스텔</span>
						</label></li>
						<li>
							<div class="styled__CheckboxWrap-khpb9s-3 eczZTt">
								<label class="Checkbox__Label-ifp1yz-0 kAqGVi clearfix"
									size="22"> <input name="multi_room_type"
									type="checkbox" class="Checkbox__CheckboxStd-ifp1yz-1 PcMeW"
									value="" /> <span class="CheckBox"></span> <span
									class="styled__CheckText-sc-17lr53x-2 iMbsTF">아파트</span>
								</label>
							</div>
							<div class="styled__DescBox-khpb9s-1 lhPZGD">
								<svg x="0" y="0" width="18" height="18" viewBox="0 0 27 27">
					                        <clipPath id="c1_1">
					                          <path
														d="M13.7,20.6c-.6,0,-1.1,-.5,-1.1,-1.1c0,-.7,.5,-1.2,1.1,-1.2c.7,0,1.2,.5,1.2,1.2c0,.6,-.5,1.1,-1.2,1.1Zm.1,-3.8c-1,0,-1.2,-8.3,-1.2,-9.2c0,-.8,.5,-1.5,1.2,-1.5c.6,0,1.1,.7,1.1,1.5c0,.9,-.2,9.2,-1.1,9.2Z">
					                          </path>
					                        </clipPath>
					                        <g>
					                          <circle cx="13.5" cy="13.5" r="13.5"
														fill="#E6E7EA"></circle>
					                          <path fill="#9C9EA3"
														d="M5,28.3H22.5V-1.4H5V28.3Z" clip-path="url(#c1_1)"></path>
					                        </g>
					                      </svg>
								<p class="styled__Desc-sc-17lr53x-5 jyZTzt">다중 선택 시 아파트는 포함할
									수 없습니다.</p>
							</div>
						</li>
					</ul>
				</div>
				<div class="styled__Wrap-sc-17lr53x-0 RsiHx">
					<h1 class="styled__Title-sc-17lr53x-1 coyXRX">
						매물종류
						<p class="styled__Desc-sc-17lr53x-5 jyZTzt">중복선택이 가능합니다.</p>
					</h1>
					<ul class="styled__Ul-q4dzme-0 gTQnhe">
						<li><label class="Checkbox__Label-ifp1yz-0 kAqGVi clearfix"
							size="22"> <input name="selling_type" type="checkbox"
								class="Checkbox__CheckboxStd-ifp1yz-1 PcMeW" value="" checked="" />
								<span class="CheckBox"></span> <span
								class="styled__CheckText-sc-17lr53x-2 iMbsTF">월세</span>
						</label></li>
						<li><label class="Checkbox__Label-ifp1yz-0 kAqGVi clearfix"
							size="22"> <input name="selling_type" type="checkbox"
								class="Checkbox__CheckboxStd-ifp1yz-1 PcMeW" value="" checked="" />
								<span class="CheckBox"></span> <span
								class="styled__CheckText-sc-17lr53x-2 iMbsTF">전세</span>
						</label></li>
						<li><label class="Checkbox__Label-ifp1yz-0 kAqGVi clearfix"
							size="22"> <input name="selling_type" type="checkbox"
								class="Checkbox__CheckboxStd-ifp1yz-1 PcMeW" value="" checked="" />
								<span class="CheckBox"></span> <span
								class="styled__CheckText-sc-17lr53x-2 iMbsTF">매매</span>
						</label></li>
					</ul>
				</div>
				<div class="styled__Wrap-sc-17lr53x-0 RsiHx">
					<div class="styled__SliderWrap-sc-17lr53x-6 ddVIaP">
						<p class="styled__Header-sc-6anm03-0 eNkFFm">보증금/전세가</p>
						<div class="styled__Slider-sc-6anm03-1 gqIjiE">
							<p class="styled__Price-sc-17lr53x-4 egOvBg">무제한</p>
							<div class="styled__RangeSlider-sc-1wi5o59-0 jqwYlT">
								<div class="noUi-target noUi-ltr noUi-horizontal">
									<div class="noUi-base">
										<div class="noUi-connects">
											<div class="noUi-connect noUi-draggable"
												style="transform: translate(0%, 0px) scale(1, 1);"></div>
										</div>
										<div class="noUi-origin"
											style="transform: translate(-100%, 0px); z-index: 5;">
											<div class="noUi-handle noUi-handle-lower" data-handle="0"
												tabindex="0" role="slider" aria-orientation="horizontal"
												aria-valuemin="0.0" aria-valuemax="100.0"
												aria-valuenow="0.0" aria-valuetext="0.00"></div>
										</div>
										<div class="noUi-origin"
											style="transform: translate(0%, 0px); z-index: 4;">
											<div class="noUi-handle noUi-handle-upper" data-handle="1"
												tabindex="0" role="slider" aria-orientation="horizontal"
												aria-valuemin="0.0" aria-valuemax="100.0"
												aria-valuenow="100.0" aria-valuetext="999999.00"></div>
										</div>
									</div>
								</div>
							</div>
							<ul class="styled__Ruler-sc-17lr53x-7 gPFsAW">
								<li>0</li>
								<li>1억 2000만 원</li>
								<li>무제한</li>
							</ul>
						</div>
					</div>
					<div class="styled__SliderWrap-sc-17lr53x-6 ddVIaP">
						<p class="styled__Header-sc-6anm03-0 eNkFFm">월세</p>
						<div class="styled__Slider-sc-6anm03-1 gqIjiE">
							<p class="styled__Price-sc-17lr53x-4 egOvBg">무제한</p>
							<div class="styled__RangeSlider-sc-1wi5o59-0 jqwYlT">
								<div class="noUi-target noUi-ltr noUi-horizontal">
									<div class="noUi-base">
										<div class="noUi-connects">
											<div class="noUi-connect noUi-draggable"
												style="transform: translate(0%, 0px) scale(1, 1);"></div>
										</div>
										<div class="noUi-origin"
											style="transform: translate(-100%, 0px); z-index: 5;">
											<div class="noUi-handle noUi-handle-lower" data-handle="0"
												tabindex="0" role="slider" aria-orientation="horizontal"
												aria-valuemin="0.0" aria-valuemax="100.0"
												aria-valuenow="0.0" aria-valuetext="0.00"></div>
										</div>
										<div class="noUi-origin"
											style="transform: translate(0%, 0px); z-index: 4;">
											<div class="noUi-handle noUi-handle-upper" data-handle="1"
												tabindex="0" role="slider" aria-orientation="horizontal"
												aria-valuemin="0.0" aria-valuemax="100.0"
												aria-valuenow="100.0" aria-valuetext="999999.00"></div>
										</div>
									</div>
								</div>
							</div>
							<ul class="styled__Ruler-sc-17lr53x-7 gPFsAW">
								<li>0</li>
								<li>60만 원</li>
								<li>무제한</li>
							</ul>
						</div>
					</div>
					<div class="styled__SliderWrap-sc-17lr53x-6 ddVIaP">
						<p class="styled__Header-sc-6anm03-0 eNkFFm">매매가</p>
						<div class="styled__Slider-sc-6anm03-1 gqIjiE">
							<p class="styled__Price-sc-17lr53x-4 egOvBg">무제한</p>
							<div class="styled__RangeSlider-sc-1wi5o59-0 jqwYlT">
								<div class="noUi-target noUi-ltr noUi-horizontal">
									<div class="noUi-base">
										<div class="noUi-connects">
											<div class="noUi-connect noUi-draggable"
												style="transform: translate(0%, 0px) scale(1, 1);"></div>
										</div>
										<div class="noUi-origin"
											style="transform: translate(-100%, 0px); z-index: 5;">
											<div class="noUi-handle noUi-handle-lower" data-handle="0"
												tabindex="0" role="slider" aria-orientation="horizontal"
												aria-valuemin="0.0" aria-valuemax="100.0"
												aria-valuenow="0.0" aria-valuetext="0.00"></div>
										</div>
										<div class="noUi-origin"
											style="transform: translate(0%, 0px); z-index: 4;">
											<div class="noUi-handle noUi-handle-upper" data-handle="1"
												tabindex="0" role="slider" aria-orientation="horizontal"
												aria-valuemin="0.0" aria-valuemax="100.0"
												aria-valuenow="100.0" aria-valuetext="999999.00"></div>
										</div>
									</div>
								</div>
							</div>
							<ul class="styled__Ruler-sc-17lr53x-7 gPFsAW">
								<li>0</li>
								<li>5억 원</li>
								<li>무제한</li>
							</ul>
						</div>
					</div>
					<div class="styled__ResetWrap-sc-17lr53x-8 YsSTr">
						<button class="styled__ResetBtn-sc-17lr53x-9 iZFApe">
							<svg width="22" height="22" viewBox="0 0 22 22">
		              <path fill="#000" fill-rule="evenodd"
									d="M15.344 10.344h-2L16 7.688l2.688 2.656h-2c0 .96-.245 1.856-.736 2.688-.47.81-1.11 1.45-1.92 1.92a5.201 5.201 0 0 1-2.688.736c-.512 0-1.01-.075-1.496-.224a5.476 5.476 0 0 1-1.352-.624l.976-.96c.565.31 1.19.464 1.872.464.725 0 1.395-.179 2.008-.536a3.972 3.972 0 0 0 1.456-1.456 3.918 3.918 0 0 0 .536-2.008zm-9.344 0c0-.96.245-1.856.736-2.688.47-.81 1.11-1.45 1.92-1.92A5.201 5.201 0 0 1 11.344 5c.512 0 1.013.072 1.504.216.49.144.939.355 1.344.632l-.976.96a3.835 3.835 0 0 0-1.872-.464c-.725 0-1.395.179-2.008.536A3.972 3.972 0 0 0 7.88 8.336a3.918 3.918 0 0 0-.536 2.008h2L6.688 13 4 10.344h2z">
		              </path>
		            </svg>
							조건삭제
						</button>
					</div>
				</div>
				<div class="styled__Wrap-sc-17lr53x-0 RsiHx">
					<div class="styled__SliderWrap-sc-17lr53x-6 ddVIaP">
						<p class="styled__Header-sc-1czl93l-0 cXFsYv">방크기(전용면적)</p>
						<div class="styled__Slider-sc-1czl93l-1 dJrYB">
							<p class="styled__Price-sc-17lr53x-4 egOvBg">무제한</p>
							<div class="styled__RangeSlider-sc-1wi5o59-0 jqwYlT">
								<div class="noUi-target noUi-ltr noUi-horizontal">
									<div class="noUi-base">
										<div class="noUi-connects">
											<div class="noUi-connect noUi-draggable"
												style="transform: translate(0%, 0px) scale(1, 1);"></div>
										</div>
										<div class="noUi-origin"
											style="transform: translate(-100%, 0px); z-index: 5;">
											<div class="noUi-handle noUi-handle-lower" data-handle="0"
												tabindex="0" role="slider" aria-orientation="horizontal"
												aria-valuemin="0.0" aria-valuemax="100.0"
												aria-valuenow="0.0" aria-valuetext="0.00"></div>
										</div>
										<div class="noUi-origin"
											style="transform: translate(0%, 0px); z-index: 4;">
											<div class="noUi-handle noUi-handle-upper" data-handle="1"
												tabindex="0" role="slider" aria-orientation="horizontal"
												aria-valuemin="0.0" aria-valuemax="100.0"
												aria-valuenow="100.0" aria-valuetext="999999.00"></div>
										</div>
									</div>
								</div>
							</div>
							<ul class="styled__Ruler-sc-17lr53x-7 gPFsAW">
								<li>0m²(0평)</li>
								<li>33m²(10평)</li>
								<li>무제한</li>
							</ul>
						</div>
					</div>
					<div class="styled__ResetWrap-sc-17lr53x-8 YsSTr">
						<button class="styled__ResetBtn-sc-17lr53x-9 iZFApe">
							<svg width="22" height="22" viewBox="0 0 22 22">
		              <path fill="#000" fill-rule="evenodd"
									d="M15.344 10.344h-2L16 7.688l2.688 2.656h-2c0 .96-.245 1.856-.736 2.688-.47.81-1.11 1.45-1.92 1.92a5.201 5.201 0 0 1-2.688.736c-.512 0-1.01-.075-1.496-.224a5.476 5.476 0 0 1-1.352-.624l.976-.96c.565.31 1.19.464 1.872.464.725 0 1.395-.179 2.008-.536a3.972 3.972 0 0 0 1.456-1.456 3.918 3.918 0 0 0 .536-2.008zm-9.344 0c0-.96.245-1.856.736-2.688.47-.81 1.11-1.45 1.92-1.92A5.201 5.201 0 0 1 11.344 5c.512 0 1.013.072 1.504.216.49.144.939.355 1.344.632l-.976.96a3.835 3.835 0 0 0-1.872-.464c-.725 0-1.395.179-2.008.536A3.972 3.972 0 0 0 7.88 8.336a3.918 3.918 0 0 0-.536 2.008h2L6.688 13 4 10.344h2z">
		              </path>
		            </svg>
							조건삭제
						</button>
					</div>
				</div>
				<div class="styled__Wrap-sc-17lr53x-0 RsiHx">
					<div class="styled__SliderWrap-sc-17lr53x-6 ddVIaP">
						<p class="styled__Header-j0vsch-0 kaJHZK">관리비</p>
						<div class="styled__Slider-j0vsch-1 gDUATl">
							<p class="styled__Price-sc-17lr53x-4 egOvBg">무제한</p>
							<div class="styled__RangeSlider-sc-1wi5o59-0 jqwYlT">
								<div class="noUi-target noUi-ltr noUi-horizontal">
									<div class="noUi-base">
										<div class="noUi-connects">
											<div class="noUi-connect noUi-draggable"
												style="transform: translate(0%, 0px) scale(1, 1);"></div>
										</div>
										<div class="noUi-origin"
											style="transform: translate(-100%, 0px); z-index: 5;">
											<div class="noUi-handle noUi-handle-lower" data-handle="0"
												tabindex="0" role="slider" aria-orientation="horizontal"
												aria-valuemin="0.0" aria-valuemax="100.0"
												aria-valuenow="0.0" aria-valuetext="0.00"></div>
										</div>
										<div class="noUi-origin"
											style="transform: translate(0%, 0px); z-index: 4;">
											<div class="noUi-handle noUi-handle-upper" data-handle="1"
												tabindex="0" role="slider" aria-orientation="horizontal"
												aria-valuemin="0.0" aria-valuemax="100.0"
												aria-valuenow="100.0" aria-valuetext="999999.00"></div>
										</div>
									</div>
								</div>
							</div>
							<ul class="styled__Ruler-sc-17lr53x-7 gPFsAW">
								<li>0</li>
								<li>20만원</li>
								<li>무제한</li>
							</ul>
						</div>
					</div>
					<div class="styled__CheckWrap-j0vsch-2 eZBLGJ">
						<label class="Checkbox__Label-ifp1yz-0 kAqGVi clearfix" size="22">
							<input name="include_maintenance_option1" type="checkbox"
							class="Checkbox__CheckboxStd-ifp1yz-1 PcMeW" value="" checked="" />
							<span class="CheckBox"></span> <span
							class="styled__CheckText-sc-17lr53x-2 iMbsTF">협의가능 포함</span>
						</label>
					</div>
					<div class="styled__ResetWrap-sc-17lr53x-8 YsSTr">
						<button class="styled__ResetBtn-sc-17lr53x-9 iZFApe">
							<svg width="22" height="22" viewBox="0 0 22 22">
		              <path fill="#000" fill-rule="evenodd"
									d="M15.344 10.344h-2L16 7.688l2.688 2.656h-2c0 .96-.245 1.856-.736 2.688-.47.81-1.11 1.45-1.92 1.92a5.201 5.201 0 0 1-2.688.736c-.512 0-1.01-.075-1.496-.224a5.476 5.476 0 0 1-1.352-.624l.976-.96c.565.31 1.19.464 1.872.464.725 0 1.395-.179 2.008-.536a3.972 3.972 0 0 0 1.456-1.456 3.918 3.918 0 0 0 .536-2.008zm-9.344 0c0-.96.245-1.856.736-2.688.47-.81 1.11-1.45 1.92-1.92A5.201 5.201 0 0 1 11.344 5c.512 0 1.013.072 1.504.216.49.144.939.355 1.344.632l-.976.96a3.835 3.835 0 0 0-1.872-.464c-.725 0-1.395.179-2.008.536A3.972 3.972 0 0 0 7.88 8.336a3.918 3.918 0 0 0-.536 2.008h2L6.688 13 4 10.344h2z">
		              </path>
		            </svg>
							조건삭제
						</button>
					</div>
				</div>
				<div class="styled__Wrap-sc-17lr53x-0 RsiHx">
					<h1 class="styled__Title-sc-17lr53x-1 coyXRX">
						층수 <font>중복선택이 가능합니다.</font>
					</h1>
					<ul class="styled__Ul-akvkkw-0 gdjtey">
						<li><label class="Checkbox__Label-ifp1yz-0 kAqGVi clearfix"
							size="22"> <input name="room_floor_multi" type="checkbox"
								class="Checkbox__CheckboxStd-ifp1yz-1 PcMeW" value="" checked="" />
								<span class="CheckBox"></span> <span
								class="styled__CheckText-sc-17lr53x-2 iMbsTF">전체</span>
						</label></li>
						<li><label class="Checkbox__Label-ifp1yz-0 kAqGVi clearfix"
							size="22"> <input name="room_floor_multi" type="checkbox"
								class="Checkbox__CheckboxStd-ifp1yz-1 PcMeW" value="" /> <span
								class="CheckBox"></span> <span
								class="styled__CheckText-sc-17lr53x-2 iMbsTF">1층</span>
						</label></li>
						<li><label class="Checkbox__Label-ifp1yz-0 kAqGVi clearfix"
							size="22"> <input name="room_floor_multi" type="checkbox"
								class="Checkbox__CheckboxStd-ifp1yz-1 PcMeW" value="" /> <span
								class="CheckBox"></span> <span
								class="styled__CheckText-sc-17lr53x-2 iMbsTF">2층</span>
						</label></li>
						<li><label class="Checkbox__Label-ifp1yz-0 kAqGVi clearfix"
							size="22"> <input name="room_floor_multi" type="checkbox"
								class="Checkbox__CheckboxStd-ifp1yz-1 PcMeW" value="" /> <span
								class="CheckBox"></span> <span
								class="styled__CheckText-sc-17lr53x-2 iMbsTF">3층</span>
						</label></li>
						<li><label class="Checkbox__Label-ifp1yz-0 kAqGVi clearfix"
							size="22"> <input name="room_floor_multi" type="checkbox"
								class="Checkbox__CheckboxStd-ifp1yz-1 PcMeW" value="" /> <span
								class="CheckBox"></span> <span
								class="styled__CheckText-sc-17lr53x-2 iMbsTF">4층</span>
						</label></li>
						<li><label class="Checkbox__Label-ifp1yz-0 kAqGVi clearfix"
							size="22"> <input name="room_floor_multi" type="checkbox"
								class="Checkbox__CheckboxStd-ifp1yz-1 PcMeW" value="" /> <span
								class="CheckBox"></span> <span
								class="styled__CheckText-sc-17lr53x-2 iMbsTF">5층</span>
						</label></li>
						<li><label class="Checkbox__Label-ifp1yz-0 kAqGVi clearfix"
							size="22"> <input name="room_floor_multi" type="checkbox"
								class="Checkbox__CheckboxStd-ifp1yz-1 PcMeW" value="" /> <span
								class="CheckBox"></span> <span
								class="styled__CheckText-sc-17lr53x-2 iMbsTF">6층</span>
						</label></li>
						<li><label class="Checkbox__Label-ifp1yz-0 kAqGVi clearfix"
							size="22"> <input name="room_floor_multi" type="checkbox"
								class="Checkbox__CheckboxStd-ifp1yz-1 PcMeW" value="" /> <span
								class="CheckBox"></span> <span
								class="styled__CheckText-sc-17lr53x-2 iMbsTF">7층 이상</span>
						</label></li>
						<li><label class="Checkbox__Label-ifp1yz-0 kAqGVi clearfix"
							size="22"> <input name="room_floor_multi" type="checkbox"
								class="Checkbox__CheckboxStd-ifp1yz-1 PcMeW" value="" /> <span
								class="CheckBox"></span> <span
								class="styled__CheckText-sc-17lr53x-2 iMbsTF">반지층</span>
						</label></li>
						<li><label class="Checkbox__Label-ifp1yz-0 kAqGVi clearfix"
							size="22"> <input name="room_floor_multi" type="checkbox"
								class="Checkbox__CheckboxStd-ifp1yz-1 PcMeW" value="" /> <span
								class="CheckBox"></span> <span
								class="styled__CheckText-sc-17lr53x-2 iMbsTF">옥탑방</span>
						</label></li>
					</ul>
				</div>
				<div class="styled__Wrap-sc-17lr53x-0 RsiHx">
					<h1 class="styled__Title-sc-17lr53x-1 coyXRX">
						방구조 <font>중복선택이 가능합니다.</font>
					</h1>
					<ul class="styled__Ul-sc-1776kxx-0 LxDIu">
						<li class="styled__Li-sc-1776kxx-1 OiDjy"><label
							class="Checkbox__Label-ifp1yz-0 bXGJoU clearfix" size="22">
								<input name="division" disabled="" type="checkbox"
								class="Checkbox__CheckboxStd-ifp1yz-1 PcMeW" value="" /> <span
								class="CheckBox"></span> <span
								class="styled__CheckText-sc-17lr53x-2 iMbsTF">주방
									분리형(1.5룸)</span>
						</label></li>
						<li class="styled__Li-sc-1776kxx-1 OiDjy"><label
							class="Checkbox__Label-ifp1yz-0 bXGJoU clearfix" size="22">
								<input name="duplex" disabled="" type="checkbox"
								class="Checkbox__CheckboxStd-ifp1yz-1 PcMeW" value="" /> <span
								class="CheckBox"></span> <span
								class="styled__CheckText-sc-17lr53x-2 iMbsTF">복층</span>
						</label></li>
						<li class="styled__Li-sc-1776kxx-1 fiFUQW"><label
							class="Checkbox__Label-ifp1yz-0 kAqGVi clearfix" size="22">
								<input name="room_type" type="checkbox"
								class="Checkbox__CheckboxStd-ifp1yz-1 PcMeW" value="" checked="" />
								<span class="CheckBox"></span> <span
								class="styled__CheckText-sc-17lr53x-2 iMbsTF">투룸</span>
						</label></li>
						<li class="styled__Li-sc-1776kxx-1 fiFUQW"><label
							class="Checkbox__Label-ifp1yz-0 kAqGVi clearfix" size="22">
								<input name="room_type" type="checkbox"
								class="Checkbox__CheckboxStd-ifp1yz-1 PcMeW" value="" checked="" />
								<span class="CheckBox"></span> <span
								class="styled__CheckText-sc-17lr53x-2 iMbsTF">쓰리룸 이상</span>
						</label></li>
					</ul>
				</div>
				<div class="styled__Wrap-sc-17lr53x-0 RsiHx">
					<h1 class="styled__Title-sc-17lr53x-1 coyXRX">준공년차</h1>
					<ul class="styled__Ul-dawxpw-0 huwRiQ">
						<li><label class="Radio__Label-lgvo9c-0 eUbtsI clearfix"
							size="22"> <input name="enter_date_range" type="radio"
								class="Radio__RadioStd-lgvo9c-1 dvQVkh" value="" checked="" />
								<span class="Radio--circle"></span> <span
								class="styled__RadioText-sc-17lr53x-3 jFWGQr">전체</span>
						</label></li>
						<li><label class="Radio__Label-lgvo9c-0 eUbtsI clearfix"
							size="22"> <input name="enter_date_range" type="radio"
								class="Radio__RadioStd-lgvo9c-1 dvQVkh" value="" /> <span
								class="Radio--circle"></span> <span
								class="styled__RadioText-sc-17lr53x-3 jFWGQr">1년 이내</span>
						</label></li>
						<li><label class="Radio__Label-lgvo9c-0 eUbtsI clearfix"
							size="22"> <input name="enter_date_range" type="radio"
								class="Radio__RadioStd-lgvo9c-1 dvQVkh" value="" /> <span
								class="Radio--circle"></span> <span
								class="styled__RadioText-sc-17lr53x-3 jFWGQr">5년 이내</span>
						</label></li>
						<li><label class="Radio__Label-lgvo9c-0 eUbtsI clearfix"
							size="22"> <input name="enter_date_range" type="radio"
								class="Radio__RadioStd-lgvo9c-1 dvQVkh" value="" /> <span
								class="Radio--circle"></span> <span
								class="styled__RadioText-sc-17lr53x-3 jFWGQr">10년 이내</span>
						</label></li>
						<li><label class="Radio__Label-lgvo9c-0 eUbtsI clearfix"
							size="22"> <input name="enter_date_range" type="radio"
								class="Radio__RadioStd-lgvo9c-1 dvQVkh" value="" /> <span
								class="Radio--circle"></span> <span
								class="styled__RadioText-sc-17lr53x-3 jFWGQr">15년 이내</span>
						</label></li>
						<li><label class="Radio__Label-lgvo9c-0 eUbtsI clearfix"
							size="22"> <input name="enter_date_range" type="radio"
								class="Radio__RadioStd-lgvo9c-1 dvQVkh" value="" /> <span
								class="Radio--circle"></span> <span
								class="styled__RadioText-sc-17lr53x-3 jFWGQr">15년 이상</span>
						</label></li>
					</ul>
				</div>
				<div class="styled__Wrap-sc-17lr53x-0 RsiHx">
					<h1 class="styled__Title-sc-17lr53x-1 coyXRX">주차대수</h1>
					<ul class="styled__Ul-ybxeip-0 hWAZCK">
						<li><label class="Radio__Label-lgvo9c-0 eUbtsI clearfix"
							size="22"> <input name="parking_average_range"
								type="radio" class="Radio__RadioStd-lgvo9c-1 dvQVkh" value=""
								checked="" /> <span class="Radio--circle"></span> <span
								class="styled__RadioText-sc-17lr53x-3 jFWGQr">상관없음</span>
						</label></li>
						<li><label class="Radio__Label-lgvo9c-0 eUbtsI clearfix"
							size="22"> <input name="parking_average_range"
								type="radio" class="Radio__RadioStd-lgvo9c-1 dvQVkh" value="" />
								<span class="Radio--circle"></span> <span
								class="styled__RadioText-sc-17lr53x-3 jFWGQr">세대당 2대 이상</span>
						</label></li>
						<li><label class="Radio__Label-lgvo9c-0 eUbtsI clearfix"
							size="22"> <input name="parking_average_range"
								type="radio" class="Radio__RadioStd-lgvo9c-1 dvQVkh" value="" />
								<span class="Radio--circle"></span> <span
								class="styled__RadioText-sc-17lr53x-3 jFWGQr">세대당 1대 이상</span>
						</label></li>
					</ul>
				</div>
				<div class="styled__Wrap-sc-17lr53x-0 RsiHx">
					<h1 class="styled__Title-sc-17lr53x-1 coyXRX">
						추가 옵션 <font>중복선택이 가능합니다.</font>
					</h1>
					<ul class="styled__Ul-sc-86g1ou-0 fXlKSZ">
						<li><label class="styled__Label-sc-86g1ou-1 dcKnHM">
								<input type="checkbox" />
								<p class="styled__BtnLike-sc-86g1ou-2 gBSLFB">주차가능</p>
						</label></li>
						<li><label class="styled__Label-sc-86g1ou-1 dcKnHM">
								<input type="checkbox" />
								<p class="styled__BtnLike-sc-86g1ou-2 gBSLFB">반려동물</p>
						</label></li>
						<li><label class="styled__Label-sc-86g1ou-1 dcKnHM">
								<input type="checkbox" />
								<p class="styled__BtnLike-sc-86g1ou-2 gBSLFB">단기임대</p>
						</label></li>
						<li><label class="styled__Label-sc-86g1ou-1 dcKnHM">
								<input type="checkbox" />
								<p class="styled__BtnLike-sc-86g1ou-2 gBSLFB">풀옵션</p>
						</label></li>
						<li><label class="styled__Label-sc-86g1ou-1 dcKnHM">
								<input type="checkbox" />
								<p class="styled__BtnLike-sc-86g1ou-2 gBSLFB">빌트인</p>
						</label></li>
						<li><label class="styled__Label-sc-86g1ou-1 dcKnHM">
								<input type="checkbox" />
								<p class="styled__BtnLike-sc-86g1ou-2 gBSLFB">엘리베이터</p>
						</label></li>
						<li><label class="styled__Label-sc-86g1ou-1 dcKnHM">
								<input type="checkbox" />
								<p class="styled__BtnLike-sc-86g1ou-2 gBSLFB">베란다/발코니</p>
						</label></li>
						<li><label class="styled__Label-sc-86g1ou-1 dcKnHM">
								<input type="checkbox" />
								<p class="styled__BtnLike-sc-86g1ou-2 gBSLFB">전세자금대출</p>
						</label></li>
						<li><label class="styled__Label-sc-86g1ou-1 dcKnHM">
								<input type="checkbox" />
								<p class="styled__BtnLike-sc-86g1ou-2 gBSLFB">보안/안전시설</p>
						</label></li>
						<li><label class="styled__Label-sc-86g1ou-1 dcKnHM">
								<input type="checkbox" />
								<p class="styled__BtnLike-sc-86g1ou-2 gBSLFB">360˚VR</p>
						</label></li>
					</ul>
					<div class="styled__DescBox-sc-86g1ou-3 hnWGFY">
						<svg x="0" y="0" width="18" height="18" viewBox="0 0 27 27">
		            <clipPath id="c1_1">
		              <path
								d="M13.7,20.6c-.6,0,-1.1,-.5,-1.1,-1.1c0,-.7,.5,-1.2,1.1,-1.2c.7,0,1.2,.5,1.2,1.2c0,.6,-.5,1.1,-1.2,1.1Zm.1,-3.8c-1,0,-1.2,-8.3,-1.2,-9.2c0,-.8,.5,-1.5,1.2,-1.5c.6,0,1.1,.7,1.1,1.5c0,.9,-.2,9.2,-1.1,9.2Z">
		              </path>
		            </clipPath>
		            <g>
		              <circle cx="13.5" cy="13.5" r="13.5" fill="#E6E7EA"></circle>
		              <path fill="#9C9EA3" d="M5,28.3H22.5V-1.4H5V28.3Z"
								clip-path="url(#c1_1)"></path>
		            </g>
		          </svg>
						<p class="styled__Desc-sc-86g1ou-4 btqkEY">풀옵션 항목은 세탁기, 냉장고,
							에어컨, 가스레인지 또는 인덕션입니다.</p>
					</div>
				</div>
				<div class="styled__Wrap-sc-17lr53x-0 RsiHx">
					<h1 class="styled__Title-sc-17lr53x-1 coyXRX">거래종류</h1>
					<ul class="styled__Ul-sc-5stg4f-0 cJVfDQ">
						<li><label class="styled__Label-sc-5stg4f-1 dNTEHr">
								<input type="checkbox" checked="" />
								<p class="styled__BtnLike-sc-5stg4f-2 iWVUPx">전체</p>
						</label></li>
						<li><label class="styled__Label-sc-5stg4f-1 dNTEHr">
								<input type="checkbox" />
								<p class="styled__BtnLike-sc-5stg4f-2 iWVUPx">중개</p>
						</label></li>
						<li><label class="styled__Label-sc-5stg4f-1 dNTEHr">
								<input type="checkbox" />
								<p class="styled__BtnLike-sc-5stg4f-2 iWVUPx">직거래</p>
						</label></li>
					</ul>
				</div>
				<div class="styled__BtnWrap-sc-1p3e70q-2 kDNTCJ">
					<button class="styled__ApplyBtn-sc-1p3e70q-3 clOtRK">적용하기</button>
					<button class="styled__CloseBtn-sc-1p3e70q-4 jyqVxU">취소</button>
				</div>
			</div>
		</div> --%>
		<!-- 전체필터 상세창 끝 -->

	</div>
</div>
<form id="SearchForm" >
	<input type="hidden" id="userId" value="${sessionScope.principal.userId}"/>
	<input type="hidden" id="roomId" value="${room.roomId}"/>
	<input type="hidden" id="keyword" name="keyword" value="">
	<input type="hidden" id="roomType" name="roomType" value="">
	<input type="hidden" id="dealType" name="dealType" value="">
</form>
<script src="../js/all.min.js"></script>
<script>
	$('#ftco-navbar').removeClass("bg-dark");
	$('#ftco-navbar').removeClass("navbar-dark");
</script>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8ad4b165fec855f2776f599a8e5f6011&libraries=clusterer&services"></script>


<script>
	var map = new kakao.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
	    center : new kakao.maps.LatLng(35.165001, 129.114666), // 지도의 중심좌표 
	    level : 6 // 지도의 확대 레벨 
	});
	
	// 마커 클러스터러를 생성합니다 
	var clusterer = new kakao.maps.MarkerClusterer({
	    map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
	    averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
	    minLevel: 10 // 클러스터 할 최소 지도 레벨 
	});
	var data = {positions: ${map}};
	/* console.log(data); */
	// 데이터를 가져오기 위해 jQuery를 사용합니다
	// 데이터를 가져와 마커를 생성하고 클러스터러 객체에 넘겨줍니다
	
	    // 데이터에서 좌표 값을 가지고 마커를 표시합니다
	    // 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
	    var markers = $(data.positions).map(function(i, position) {
	        return new kakao.maps.Marker({
	            position : new kakao.maps.LatLng(position.lat, position.lng)
	        });
	    });
	
	    // 클러스터러에 마커들을 추가합니다
	    clusterer.addMarkers(markers);
	    kakao.maps.event.addListener(clusterer, 'clusterclick', function(cluster) {
	
	        // 현재 지도 레벨에서 1레벨 확대한 레벨
	        var level = map.getLevel()-1;
	
	        // 지도를 클릭된 클러스터의 마커의 위치를 기준으로 확대합니다
	        map.setLevel(level, {anchor: cluster.getCenter()});
	    });  
</script>

<script>

var searchForm = $("#SearchForm");

function search(){
	var keyword = $('.keOJyH').val();
	if(keyword == ''){
		keywordval = $('.keOJyH').attr('placeholder'); 
	}else {
		keywordval = keyword; 
	}
	
	document.getElementById('keyword').value = keywordval;
	searchForm.attr('action', '/filter').attr('method', 'get');
	searchForm.submit();

}

var pmdSliderValueRange = document.getElementById('pmd-slider-value-range');

noUiSlider.create(pmdSliderValueRange, {
	start: [ 0, 99999 ], // Handle start position
	connect: true, // Display a colored bar between the handles
	 tooltips: [ wNumb({ decimals: 0 }), wNumb({ decimals: 0 }) ], 
	format: wNumb({
		decimals: 0,
		thousand: '',
		postfix: '',
	}),
	range: { // Slider can select '0' to '100'
		'min': 0,
		'max': 100
	},
step: 5,
	  pips: { 
		  mode: 'steps',
		  density: 10
	  }
});

var valueMax = document.getElementById('value-max'),
	valueMin = document.getElementById('value-min');

// When the slider value changes, update the input and span
pmdSliderValueRange.noUiSlider.on('update', function( values, handle ) {
	if ( handle ) {
		let pvalue = values[handle];
		console.log(values[handle]);
		$('.eavwzc').val(pvalue);
		//valueMax.value = values[handle];
	} else {
		//valueMin.value = values[handle];
	}
});	


$('.hjVNgq').on('click',function(){


	let roomId = $(this).attr('value');
	let userId = $('#userId').val();
	if(userId == ""){
		location.href = "/login"
	}else{
		let data = { 
				userId : userId,
				roomId : roomId
		};

	 	$.ajax({
			type:'POST',
			url:'/likeroom',
			data:JSON.stringify(data),
			contentType:'application/json; charset=utf-8',
			dataType:'json'			
		}).done(function(result){
			if(result.statusCode==200){
				alert('찜등록 성공.');
			}
		}).fail(function(result){
			alert('찜등록 실패.');
		}); 

		
	}
});
</script>
<script src="/js/search.js"></script>
</body>
</html>


