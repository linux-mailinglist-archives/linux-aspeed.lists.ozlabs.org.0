Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A07755710
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jun 2019 20:22:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45YDzV27vWzDqTL
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2019 04:22:46 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=10790c7ec8=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="J3+jtjiz"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="XF8uuWu9"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45YDzJ4NllzDqL9
 for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2019 04:22:28 +1000 (AEST)
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5PI7asO004087; Tue, 25 Jun 2019 11:22:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=i5/ZiR3CFzOkPdZMk4xt+ZAvs6ekEPUnmSc2cLFVJVE=;
 b=J3+jtjizrDGyxUocmRagdjL/znAz1z6VaKWs0gld6Avj4A5QruoWjtZB89b75Mt3ksNX
 UOASRUiNYX4VLUZ8PQtAvl7EOlrO8l2XuesOk2e+AiT2VgncAijo3mX0+pX9vGe+Nve+
 1VrnK6pquQ7qRl1xbI4osS+xYrxmdB1p2iQ= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2tbjc1smgd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Tue, 25 Jun 2019 11:22:22 -0700
Received: from prn-mbx07.TheFacebook.com (2620:10d:c081:6::21) by
 prn-hub02.TheFacebook.com (2620:10d:c081:35::126) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Tue, 25 Jun 2019 11:22:21 -0700
Received: from prn-hub06.TheFacebook.com (2620:10d:c081:35::130) by
 prn-mbx07.TheFacebook.com (2620:10d:c081:6::21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Tue, 25 Jun 2019 11:22:21 -0700
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Tue, 25 Jun 2019 11:22:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i5/ZiR3CFzOkPdZMk4xt+ZAvs6ekEPUnmSc2cLFVJVE=;
 b=XF8uuWu9g5iCgqB3iuctj5Z0maR70hQB4teLvNsX1kFBIMCOtyZcNibZhGkQAXv9o/etbaJKhOdNDTLGaiSZxLuwNMeHpDb0CazjbtEdiZiDtMtfIz48MUutinoOK7lAL+5Ind7FIKGqTqHZOC3TCm+WM2R8R0/V8PTXQdJMvx0=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.177.11) by
 CY4PR15MB1573.namprd15.prod.outlook.com (10.172.160.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Tue, 25 Jun 2019 18:22:20 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::c026:bca5:3f4e:9b1f]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::c026:bca5:3f4e:9b1f%3]) with mapi id 15.20.2008.017; Tue, 25 Jun 2019
 18:22:19 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v2 1/2] hwmon: pmbus: Add Infineon PXE1610 VR driver
Thread-Topic: [PATCH v2 1/2] hwmon: pmbus: Add Infineon PXE1610 VR driver
Thread-Index: AQHVFz0mfbcjc0BylEeA/UB5fafmVKaNkSmAgAD8HwCAHdS8AA==
Date: Tue, 25 Jun 2019 18:22:19 +0000
Message-ID: <EAB47703-259E-4AE3-B5D5-C58BB6098787@fb.com>
References: <20190530231159.222188-1-vijaykhemka@fb.com>
 <20190605204659.GA32329@roeck-us.net>
 <75FAE0E3-DE09-416A-90A4-D0AEC0684FC9@fb.com>
In-Reply-To: <75FAE0E3-DE09-416A-90A4-D0AEC0684FC9@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::809d]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 99d6b27e-a679-4223-3f58-08d6f99a0f52
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:CY4PR15MB1573; 
x-ms-traffictypediagnostic: CY4PR15MB1573:
x-microsoft-antispam-prvs: <CY4PR15MB1573964ECFB7653DB338BBD7DDE30@CY4PR15MB1573.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-forefront-prvs: 0079056367
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(136003)(39860400002)(376002)(396003)(346002)(189003)(199004)(11346002)(99286004)(446003)(478600001)(33656002)(5660300002)(6246003)(4326008)(76176011)(66946007)(73956011)(2616005)(102836004)(91956017)(486006)(6506007)(476003)(76116006)(53546011)(64756008)(66446008)(66556008)(66476007)(6116002)(186003)(2906002)(6436002)(71200400001)(316002)(68736007)(46003)(4744005)(36756003)(14454004)(71190400001)(86362001)(6512007)(256004)(6916009)(7736002)(81156014)(229853002)(6486002)(305945005)(8676002)(54906003)(8936002)(25786009)(53936002)(81166006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1573;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: PKDWHLXtzxxije+VNtsTttusaFYuLHXnUOCLXKyOwXXeAJ3CNIVwcG5YQo/zEuoVlHh8jQtO+BNXs77QFt2sDDkyhagkL5474HQCoOSyLH47AxrkabdxI2pY5eR5wu5irWb+djDR0ay3Xtdy6wIrFmIeMwNMxsjuHEY+Eawl+2DGChS1W00dWWs0N+dJoJWq/Fhqpl4g/+xo7IwpX53XEnmt5cWCrhJ/nKBSWf14sEUKV/X9oezS3taLJS6RQb7MAYCKI1QbVqBr4OTwW2Ufg0LqP5mTpoWhj8+H+2woCDwT4fTgCF5CQgp4jfmZrJWXVKz9VnuE9HOxhgtbUKVVDffebqA3OouMDuDaAKFvXUZxj64nKxkAdILZiPUudotzvqXhI2Em4SaaZyqALAU37/Q5d5LLq/jorpUGaPgDNNY=
Content-Type: text/plain; charset="utf-8"
Content-ID: <173459D38FEDF84C83DE77F675333DD0@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 99d6b27e-a679-4223-3f58-08d6f99a0f52
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2019 18:22:19.5651 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vijaykhemka@fb.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1573
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-25_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=944 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906250137
X-FB-Internal: deliver
X-BeenThere: linux-aspeed@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux ASPEED SoC development <linux-aspeed.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Help: <mailto:linux-aspeed-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=subscribe>
Cc: Sai Dasari <sdasari@fb.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

DQoNCu+7v09uIDYvNi8xOSwgMTE6NDkgQU0sICJMaW51eC1hc3BlZWQgb24gYmVoYWxmIG9mIFZp
amF5IEtoZW1rYSIgPGxpbnV4LWFzcGVlZC1ib3VuY2VzK3ZpamF5a2hlbWthPWZiLmNvbUBsaXN0
cy5vemxhYnMub3JnIG9uIGJlaGFsZiBvZiB2aWpheWtoZW1rYUBmYi5jb20+IHdyb3RlOg0KDQog
ICAgDQogICAgDQogICAgT24gNi81LzE5LCAxOjQ3IFBNLCAiR3VlbnRlciBSb2VjayIgPGdyb2Vj
azdAZ21haWwuY29tIG9uIGJlaGFsZiBvZiBsaW51eEByb2Vjay11cy5uZXQ+IHdyb3RlOg0KICAg
IA0KICAgICAgICBPbiBUaHUsIE1heSAzMCwgMjAxOSBhdCAwNDoxMTo1NlBNIC0wNzAwLCBWaWph
eSBLaGVta2Egd3JvdGU6DQogICAgICAgID4gQWRkZWQgcG1idXMgZHJpdmVyIGZvciB0aGUgbmV3
IGRldmljZSBJbmZpbmVvbiBweGUxNjEwDQogICAgICAgID4gdm9sdGFnZSByZWd1bGF0b3IuIEl0
IGFsc28gc3VwcG9ydHMgc2ltaWxhciBmYW1pbHkgZGV2aWNlDQogICAgICAgID4gUFhFMTExMCBh
bmQgUFhNMTMxMC4NCiAgICAgICAgPiANCiAgICAgICAgPiBTaWduZWQtb2ZmLWJ5OiBWaWpheSBL
aGVta2EgPHZpamF5a2hlbWthQGZiLmNvbT4NCiAgICAgICAgDQogICAgICAgIEFwcGxpZWQuDQog
ICAgVGhhbmtzDQogICAgICAgIA0KICAgICAgICBUaGFua3MsDQogICAgICAgIEd1ZW50ZXINCg0K
Sm9lbCwNCkNhbiB5b3UgcGxlYXNlIHB1bGwgdGhpcyBwYXRjaCBpbiBvdXIgYm1jIGxpbnV4IHRy
ZWUuDQoNClRoYW5rcw0KLVZpamF5DQoNCg==
