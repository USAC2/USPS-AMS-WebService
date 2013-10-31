<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html ng-app='ams' id='ng-app' class='ng-scope'>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title></title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/normalize.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <script>window.contextPath = "${pageContext.request.contextPath}";</script>
    <script src="js/vendor/modernizr-2.6.2.min.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="${pageContext.request.contextPath}/js/vendor/jquery-1.10.1.min.js"><\/script>')</script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.8/angular.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/common.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/app.js" type="text/javascript"></script>
</head>
<body>
    <!--[if lt IE 7]>
    <p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
    <![endif]-->

    <div id='wrapper'>
        <section class='validate-section' ng-controller='ValidateController' ng-cloak>
            <div class='grid-3'>
                <div class='col-1' style='width:280px;'>
                    <form method='post' ng-submit='lookup()' autocomplete="off">
                        <div id='address-input-container' style='height:auto;'>
                            <h3 class='section-title' style='padding-top:0px;background:#005588;color:white;'>
                                <img style='position:relative;top:10px;' height="30px" src="${pageContext.request.contextPath}/img/uspslogo.png"/>
                            </h3>
                            <hr class='section-title-hr'/>
                            <div style='color:#333;font-size:13px;margin:20px 10px 0 10px'>
                                Enter an address below to retrieve the USPS corrected version as well as matching address records.<br/><br/>
                                In order to obtain a match Address Line 1 must be supplied with either City/State or Zip5.
                            </div>
                            <ul class='address-input-list'>
                                <li>
                                    <label>Address Line 1</label>
                                    <input ng-model='addr1' type='text' id='addr1-input'/>
                                </li>
                                <li>
                                    <label>Address Line 2</label>
                                    <input ng-model='addr2' type='text' id='addr2-input'/>
                                </li>
                                <li>
                                    <label>City</label>
                                    <input ng-model='city' type='text' id='city-input'/>
                                </li>
                                <li>
                                    <label>State</label>
                                    <select ng-model='state' name="state">
                                        <option value=""></option>
                                        <option value="AL">Alabama</option>
                                        <option value="AK">Alaska</option>
                                        <option value="AZ">Arizona</option>
                                        <option value="AR">Arkansas</option>
                                        <option value="CA">California</option>
                                        <option value="CO">Colorado</option>
                                        <option value="CT">Connecticut</option>
                                        <option value="DE">Delaware</option>
                                        <option value="DC">District of Columbia</option>
                                        <option value="FL">Florida</option>
                                        <option value="GA">Georgia</option>
                                        <option value="HI">Hawaii</option>
                                        <option value="ID">Idaho</option>
                                        <option value="IL">Illinois</option>
                                        <option value="IN">Indiana</option>
                                        <option value="IA">Iowa</option>
                                        <option value="KS">Kansas</option>
                                        <option value="KY">Kentucky</option>
                                        <option value="LA">Louisiana</option>
                                        <option value="ME">Maine</option>
                                        <option value="MD">Maryland</option>
                                        <option value="MA">Massachusetts</option>
                                        <option value="MI">Michigan</option>
                                        <option value="MN">Minnesota</option>
                                        <option value="MS">Mississippi</option>
                                        <option value="MO">Missouri</option>
                                        <option value="MT">Montana</option>
                                        <option value="NE">Nebraska</option>
                                        <option value="NV">Nevada</option>
                                        <option value="NH">New Hampshire</option>
                                        <option value="NJ">New Jersey</option>
                                        <option value="NM">New Mexico</option>
                                        <option selected="selected" value="NY">New York</option>
                                        <option value="NC">North Carolina</option>
                                        <option value="ND">North Dakota</option>
                                        <option value="OH">Ohio</option>
                                        <option value="OK">Oklahoma</option>
                                        <option value="OR">Oregon</option>
                                        <option value="PA">Pennsylvania</option>
                                        <option value="RI">Rhode Island</option>
                                        <option value="SC">South Carolina</option>
                                        <option value="SD">South Dakota</option>
                                        <option value="TN">Tennessee</option>
                                        <option value="TX">Texas</option>
                                        <option value="UT">Utah</option>
                                        <option value="VT">Vermont</option>
                                        <option value="VA">Virginia</option>
                                        <option value="WA">Washington</option>
                                        <option value="WV">West Virginia</option>
                                        <option value="WI">Wisconsin</option>
                                        <option value="WY">Wyoming</option>
                                    </select>
                                </li>
                                <li>
                                    <label>Zip 5</label>
                                    <input ng-model='zip5' type='text' id='zip5-input'/>
                                </li>
                                <li>
                                    <button ng-click='lookup()' style='margin-top:10px;' class='submit' >Validate Address</button>
                                    <!--<input type="submit" style='display:none;visibility: hidden;'/>-->
                                </li>
                            </ul>
                        </div>
                    </form>
                </div>

                <div ng-show='result' class='col-2'>
                    <div id='validated-address-container' style='width:100%;float:left;height:auto;'>
                        <h3 class='section-title' ng-class='statusClass'>{{result.status.code | statusNameFilter}}</h3>
                        <hr class='section-title-hr'/>
                        <div class='section-row' style='font-size:13px;'>
                            <p>{{result.status.desc}}</p>
                        </div>
                        <hr/>
                        <div ng-show='result.validated'>
                            <div class='section-row' style='font-size:16px;color:#333;'>
                                <p>{{result.address.addr1}}<br/>
                                    {{result.address.city}}, {{result.address.state}} {{result.address.zip5}}<span ng-show="result.address.zip4">-{{result.address.zip4}}</span>
                                </p>
                            </div>
                            <hr/>
                        </div>
                        <div ng-show='result.validated'>
                            <div class='section-row' style='font-size:13px;color:#333;'>
                                <p><span style='color:teal;font-weight:bold;'>City Abbreviation:</span> {{result.detail.standardCityAbbr || result.address.city}}</p>
                                <p><span style='color:teal;font-weight:bold;'>FIPS County:</span> {{result.detail.fipsCounty}}</p>
                                <p><span style='color:teal;font-weight:bold;'>PO Location:</span> {{result.detail.postOfficeCity}} {{result.detail.postOfficeState}}</p>
                            </div>
                            <hr/>
                        </div>
                        <div ng-show='result.footnotes.length > 0' class='section-row' style='font-size:13px;'>
                            <div ng-repeat='footnote in result.footnotes'>
                                <p style='color:#ff4500'><strong>{{footnote.name}}</strong></p>
                                <p>{{footnote.desc}}</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div ng-show='result.recordCount > 0' class='col-3'>
                    <div id='address-records-container'>
                        <h3 class='section-title default-indication'>Matched Address Records</h3>
                        <hr class='section-title-hr'/>
                        <table class='light-table'>
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th colspan="3">Building</th>
                                <th colspan="4">Street</th>
                                <th colspan="4">Secondary</th>
                                <th colspan="1">Zip5</th>
                                <th colspan="2">Zip4</th>
                            </tr>
                            <tr>
                                <th></th>
                                <th>Low</th>
                                <th>High</th>
                                <th>Parity</th>
                                <th>Pre</th>
                                <th>Name</th>
                                <th>Suffix</th>
                                <th>Post</th>
                                <th>Unit</th>
                                <th>Low</th>
                                <th>High</th>
                                <th>Parity</th>
                                <th></th>
                                <th>Low</th>
                                <th>High</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr ng-repeat='record in result.records'>
                                <td>{{record.recordId}}</td>
                                <td>{{record.primaryLow}}</td>
                                <td>{{record.primaryHigh}}</td>
                                <td>{{record.primaryParity | parityFilter}}</td>
                                <td>{{record.preDir}}</td>
                                <td>{{record.streetName}}</td>
                                <td>{{record.streetSuffix}}</td>
                                <td>{{record.postDir}}</td>
                                <td>{{record.unit}}</td>
                                <td>{{record.secondaryLow}}</td>
                                <td>{{record.secondaryHigh}}</td>
                                <td>{{record.secondaryParity | parityFilter}}</td>
                                <td>{{record.zip5}}</td>
                                <td>{{record.zip4Low}}</td>
                                <td>{{record.zip4High}}</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </section>
        <section style='display:none'>
            <iframe style='border:0;outline:0;width:100%;height:100%;' src="${pageContext.request.contextPath}/docs/_build/html/index.html"></iframe>
        </section>
    </div>
</body>
</html>