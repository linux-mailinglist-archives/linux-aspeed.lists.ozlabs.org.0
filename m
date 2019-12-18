Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 906801253F4
	for <lists+linux-aspeed@lfdr.de>; Wed, 18 Dec 2019 21:58:50 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47dS6H5CKkzDqhk
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Dec 2019 07:58:47 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=7255711be9=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="ai2S6xiZ"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="R9mS+FMS"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47dS6770jqzDqcV
 for <linux-aspeed@lists.ozlabs.org>; Thu, 19 Dec 2019 07:58:34 +1100 (AEDT)
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBIKtiYw017897; Wed, 18 Dec 2019 12:58:30 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : content-type : mime-version; s=facebook;
 bh=EfEWpZSfbNBl2ZYh59oQuglvyCb3iwfvE9VYzQrLh7o=;
 b=ai2S6xiZ6LRJae/Dmu5zYvgLVfm4GgZd9dLlYQtZRGnLKysig5AORY38wxcO4xS7yFfw
 Xojc0WjeXmrdQPmjV/x997eIS1mNmqfellaNYUAJzcESmpp56u0nxvBeKB0pzU/MOYZy
 kUKYeTP11Dc6U5KG/Iu5QmstUrgxfrhObpM= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2wy61t5twb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Wed, 18 Dec 2019 12:58:29 -0800
Received: from prn-mbx01.TheFacebook.com (2620:10d:c081:6::15) by
 prn-hub01.TheFacebook.com (2620:10d:c081:35::125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Wed, 18 Dec 2019 12:58:29 -0800
Received: from prn-hub05.TheFacebook.com (2620:10d:c081:35::129) by
 prn-mbx01.TheFacebook.com (2620:10d:c081:6::15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Wed, 18 Dec 2019 12:58:28 -0800
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.29) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Wed, 18 Dec 2019 12:58:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OJbaWp5+19zU4AuBEXg71dtW5ed5Brg3cvoBkkb4baNnHtlW4nPuelVTpSlWG3eA1Ggu9QLCqq7qGOo+N3vRK5nFfBIUL3HTz9tvtTvU21ozEu93ZpOZUfK1jU5BMY8no7SCxS50UonU6eW/kLEKRdF+vS2gWE11G+8eVmaqRdh212jht2Jg0AkBlCV3+qErYY2LKSQEjQG9mIxVIGxkVHpwZk5g4AKZ/SRTvXtZ01k+18itDeR/k6z7fsmXd6fKJPKoFxEKl3vfBWBIpYpVOQMJH47GpFrT+HCdMoQDEa26e3ens33ReyF3Qlgmx7M2GDH+eJ0l8dWjl7a302KkGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EfEWpZSfbNBl2ZYh59oQuglvyCb3iwfvE9VYzQrLh7o=;
 b=R7eKGnVljnuX1+KrmK1yH2+E2Yn6b7PP03Xhej4+i0kYOxlei4VzM5RHjJ7QdCYV3JfSXZTyfT6p+JUGB+eZzGjO5DecCR/9ZeITHzlYH+V1mClLH1LZ2BgYhPZspWu5NllbP/g/Bwg7+dfebp5lp2gbPW0ppZEQSyvfGncMq/q6yJn//dA8QvFeXCfOgAlS4oSAskQCQW/CCxJnZH4Vlpq+lecYCYPihGZvmYQhvneIkKVXZlkWdV/d0bYKNguWjimhThGshXLIOjlVER6Kkm2zIztr9wfTzFxfL0f7n/2QcQj96Eg6h2D65Wd+t9//DQzCd+az8dDzUsax9KuV/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EfEWpZSfbNBl2ZYh59oQuglvyCb3iwfvE9VYzQrLh7o=;
 b=R9mS+FMSnixZhFGwwKl4OabRIAKAeNpvbRu3w5m8xQoMAquPVmDRWXwP39db2b5fL8baeRRVcG9xGXl0iq43e/0bhNv5g8ZAiRQQ3SNhwk++0fNcFHPz6eMVmaq58U9m5etK142NnmQNCn5V0qKxgxC/EuHjss8B7B/uoSwk/C8=
Received: from MWHPR15MB1597.namprd15.prod.outlook.com (10.173.234.137) by
 MWHPR15MB1245.namprd15.prod.outlook.com (10.175.2.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.16; Wed, 18 Dec 2019 20:58:27 +0000
Received: from MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::cdbf:b63c:437:4dd2]) by MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::cdbf:b63c:437:4dd2%8]) with mapi id 15.20.2559.012; Wed, 18 Dec 2019
 20:58:27 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Pulling ipmb patch
Thread-Topic: Pulling ipmb patch
Thread-Index: AQHVteXlUA+yq0HfFUSSV9onCJICog==
Date: Wed, 18 Dec 2019 20:58:27 +0000
Message-ID: <C8678983-8901-4E16-94BB-6C6AF0959B62@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::fd0]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1fb33df9-864c-4f65-53ff-08d783fd07e9
x-ms-traffictypediagnostic: MWHPR15MB1245:
x-microsoft-antispam-prvs: <MWHPR15MB12450F78B93162A94A15B838DD530@MWHPR15MB1245.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0255DF69B9
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(136003)(39860400002)(376002)(366004)(346002)(199004)(189003)(8936002)(2906002)(8676002)(478600001)(6916009)(81156014)(81166006)(316002)(66446008)(86362001)(64756008)(2616005)(966005)(66556008)(71200400001)(6512007)(66946007)(186003)(33656002)(4326008)(5660300002)(66476007)(3480700005)(36756003)(6486002)(6506007)(4744005)(7116003)(76116006)(9326002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1245;
 H:MWHPR15MB1597.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: na8coMU6BTssIl0j1a+5FHcGILEDz2b6Oi279DM7WvbWxutKsDiAUEUzR/P3v9tWRJTCrBHWwPlu01cR6Fe2C8gPi5cF53LB5JwTHmR6A1Udpy7xQJHS6UnSAyeruBbsGlh4qK9lbfOSAA+j4TUSAVhusTgNMwkQNjcw2cEi9/0sHmTD9MT+740WL7XB1Vo9DLD3oYaOZ9hhxRUhywz4R202s7sYQcWOZw0DefHdp0Ulouu0zu6zm+B27Tfn83moOiLZk3hQ6VXumqEgSUXcz6gus6xiEXcFVoduhoGo1XIurtuXxI1MDiTtJnZZIyDPqh9AiTVZehasZhpu8OkkBaelfDAjnKhcRkbeD6xEs8HyLUgbxZz04WeQC1AbMo2C0rERvmgtlNzwbyVIipKW8AaUTz24j0qz9qLcU1GGVi2qseotDQJpS3PgY0fp5PgD7lAVSmNRy5oGibIAgEdjkRWAgjuE8BE1Hf32mtV3xxw=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_C867898389014E1694BB6C6AF0959B62fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fb33df9-864c-4f65-53ff-08d783fd07e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2019 20:58:27.8271 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YaHXxfZEiMAR6ipvTixA3QQ2TurG5AIETnx5Q4bCHKsfMWtVMcYUPZWOdNajyLQbznoXsopkk8Z/8s0vgesT+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1245
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-18_07:2019-12-17,2019-12-18 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 clxscore=1015
 malwarescore=0 mlxlogscore=758 bulkscore=0 phishscore=0 suspectscore=0
 spamscore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912180161
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
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

--_000_C867898389014E1694BB6C6AF0959B62fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgSm9lbCwNCkNhbiB5b3UgcGxlYXNlIHB1bGwgSVBNQiBwYXRjaGVzIGZyb20gQ29yZXkgZm9y
TmV4dCB0cmVlIGFzIGJlbG93IGludG8gb3VyIExGIGtlcm5lbC4NCldlIG5lZWQgdGhpcyBmb3Ig
aXBtYmJyaWRnZSBhcHBsaWNhdGlvbi4NCg0KICAxLiAgaHR0cHM6Ly9naXRodWIuY29tL2NtaW55
YXJkL2xpbnV4LWlwbWkvY29tbWl0LzBkODYzM2JmNTMxMTE3N2M5YTI2ZDc1ZGFlYzY3N2NkODdl
MzI2MWIjZGlmZi03NzA4ODUzMjQ0ZTViZjhjZDEwZDIwNWVlMWY1ZGMyYw0KICAyLiAgaHR0cHM6
Ly9naXRodWIuY29tL2NtaW55YXJkL2xpbnV4LWlwbWkvY29tbWl0LzA0MmYwNTdmZTJkY2YzODY4
MmQ4NWQ5Zjg4ZGYwMGQxYThkNDVkYmQNCiAgMy4gIGh0dHBzOi8vZ2l0aHViLmNvbS9jbWlueWFy
ZC9saW51eC1pcG1pL2NvbW1pdC8zODA2NjViZWNkZWViNGY0NTVjMjM1ODJiN2YzMmU2YjNjZWEy
N2QyDQoNClJlZ2FyZHMNCi1WaWpheQ0KDQo=

--_000_C867898389014E1694BB6C6AF0959B62fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <E42AD3DA3E33804D988E33879E0432D8@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6bz0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6b2ZmaWNlIiB4
bWxuczp3PSJ1cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOm9mZmljZTp3b3JkIiB4bWxuczptPSJo
dHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL29mZmljZS8yMDA0LzEyL29tbWwiIHhtbG5zPSJo
dHRwOi8vd3d3LnczLm9yZy9UUi9SRUMtaHRtbDQwIj4NCjxoZWFkPg0KPG1ldGEgaHR0cC1lcXVp
dj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg0KPG1l
dGEgbmFtZT0iR2VuZXJhdG9yIiBjb250ZW50PSJNaWNyb3NvZnQgV29yZCAxNSAoZmlsdGVyZWQg
bWVkaXVtKSI+DQo8c3R5bGU+PCEtLQ0KLyogRm9udCBEZWZpbml0aW9ucyAqLw0KQGZvbnQtZmFj
ZQ0KCXtmb250LWZhbWlseToiQ2FtYnJpYSBNYXRoIjsNCglwYW5vc2UtMToyIDQgNSAzIDUgNCA2
IDMgMiA0O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6Q2FsaWJyaTsNCglwYW5vc2UtMToy
IDE1IDUgMiAyIDIgNCAzIDIgNDt9DQovKiBTdHlsZSBEZWZpbml0aW9ucyAqLw0KcC5Nc29Ob3Jt
YWwsIGxpLk1zb05vcm1hbCwgZGl2Lk1zb05vcm1hbA0KCXttYXJnaW46MGluOw0KCW1hcmdpbi1i
b3R0b206LjAwMDFwdDsNCglmb250LXNpemU6MTIuMHB0Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJp
IixzYW5zLXNlcmlmO30NCmE6bGluaywgc3Bhbi5Nc29IeXBlcmxpbmsNCgl7bXNvLXN0eWxlLXBy
aW9yaXR5Ojk5Ow0KCWNvbG9yOiMwNTYzQzE7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9
DQphOnZpc2l0ZWQsIHNwYW4uTXNvSHlwZXJsaW5rRm9sbG93ZWQNCgl7bXNvLXN0eWxlLXByaW9y
aXR5Ojk5Ow0KCWNvbG9yOiM5NTRGNzI7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9DQpw
Lk1zb0xpc3RQYXJhZ3JhcGgsIGxpLk1zb0xpc3RQYXJhZ3JhcGgsIGRpdi5Nc29MaXN0UGFyYWdy
YXBoDQoJe21zby1zdHlsZS1wcmlvcml0eTozNDsNCgltYXJnaW4tdG9wOjBpbjsNCgltYXJnaW4t
cmlnaHQ6MGluOw0KCW1hcmdpbi1ib3R0b206MGluOw0KCW1hcmdpbi1sZWZ0Oi41aW47DQoJbWFy
Z2luLWJvdHRvbTouMDAwMXB0Ow0KCWZvbnQtc2l6ZToxMi4wcHQ7DQoJZm9udC1mYW1pbHk6IkNh
bGlicmkiLHNhbnMtc2VyaWY7fQ0Kc3Bhbi5FbWFpbFN0eWxlMTcNCgl7bXNvLXN0eWxlLXR5cGU6
cGVyc29uYWwtY29tcG9zZTsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjsNCglj
b2xvcjp3aW5kb3d0ZXh0O30NCi5Nc29DaHBEZWZhdWx0DQoJe21zby1zdHlsZS10eXBlOmV4cG9y
dC1vbmx5Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmO30NCkBwYWdlIFdvcmRT
ZWN0aW9uMQ0KCXtzaXplOjguNWluIDExLjBpbjsNCgltYXJnaW46MS4waW4gMS4waW4gMS4waW4g
MS4waW47fQ0KZGl2LldvcmRTZWN0aW9uMQ0KCXtwYWdlOldvcmRTZWN0aW9uMTt9DQovKiBMaXN0
IERlZmluaXRpb25zICovDQpAbGlzdCBsMA0KCXttc28tbGlzdC1pZDoxMDE4MzEyOTk4Ow0KCW1z
by1saXN0LXR5cGU6aHlicmlkOw0KCW1zby1saXN0LXRlbXBsYXRlLWlkczoxOTg4NTE4NTI4IDY3
Njk4NzAzIDY3Njk4NzEzIDY3Njk4NzE1IDY3Njk4NzAzIDY3Njk4NzEzIDY3Njk4NzE1IDY3Njk4
NzAzIDY3Njk4NzEzIDY3Njk4NzE1O30NCkBsaXN0IGwwOmxldmVsMQ0KCXttc28tbGV2ZWwtdGFi
LXN0b3A6bm9uZTsNCgltc28tbGV2ZWwtbnVtYmVyLXBvc2l0aW9uOmxlZnQ7DQoJdGV4dC1pbmRl
bnQ6LS4yNWluO30NCkBsaXN0IGwwOmxldmVsMg0KCXttc28tbGV2ZWwtbnVtYmVyLWZvcm1hdDph
bHBoYS1sb3dlcjsNCgltc28tbGV2ZWwtdGFiLXN0b3A6bm9uZTsNCgltc28tbGV2ZWwtbnVtYmVy
LXBvc2l0aW9uOmxlZnQ7DQoJdGV4dC1pbmRlbnQ6LS4yNWluO30NCkBsaXN0IGwwOmxldmVsMw0K
CXttc28tbGV2ZWwtbnVtYmVyLWZvcm1hdDpyb21hbi1sb3dlcjsNCgltc28tbGV2ZWwtdGFiLXN0
b3A6bm9uZTsNCgltc28tbGV2ZWwtbnVtYmVyLXBvc2l0aW9uOnJpZ2h0Ow0KCXRleHQtaW5kZW50
Oi05LjBwdDt9DQpAbGlzdCBsMDpsZXZlbDQNCgl7bXNvLWxldmVsLXRhYi1zdG9wOm5vbmU7DQoJ
bXNvLWxldmVsLW51bWJlci1wb3NpdGlvbjpsZWZ0Ow0KCXRleHQtaW5kZW50Oi0uMjVpbjt9DQpA
bGlzdCBsMDpsZXZlbDUNCgl7bXNvLWxldmVsLW51bWJlci1mb3JtYXQ6YWxwaGEtbG93ZXI7DQoJ
bXNvLWxldmVsLXRhYi1zdG9wOm5vbmU7DQoJbXNvLWxldmVsLW51bWJlci1wb3NpdGlvbjpsZWZ0
Ow0KCXRleHQtaW5kZW50Oi0uMjVpbjt9DQpAbGlzdCBsMDpsZXZlbDYNCgl7bXNvLWxldmVsLW51
bWJlci1mb3JtYXQ6cm9tYW4tbG93ZXI7DQoJbXNvLWxldmVsLXRhYi1zdG9wOm5vbmU7DQoJbXNv
LWxldmVsLW51bWJlci1wb3NpdGlvbjpyaWdodDsNCgl0ZXh0LWluZGVudDotOS4wcHQ7fQ0KQGxp
c3QgbDA6bGV2ZWw3DQoJe21zby1sZXZlbC10YWItc3RvcDpub25lOw0KCW1zby1sZXZlbC1udW1i
ZXItcG9zaXRpb246bGVmdDsNCgl0ZXh0LWluZGVudDotLjI1aW47fQ0KQGxpc3QgbDA6bGV2ZWw4
DQoJe21zby1sZXZlbC1udW1iZXItZm9ybWF0OmFscGhhLWxvd2VyOw0KCW1zby1sZXZlbC10YWIt
c3RvcDpub25lOw0KCW1zby1sZXZlbC1udW1iZXItcG9zaXRpb246bGVmdDsNCgl0ZXh0LWluZGVu
dDotLjI1aW47fQ0KQGxpc3QgbDA6bGV2ZWw5DQoJe21zby1sZXZlbC1udW1iZXItZm9ybWF0OnJv
bWFuLWxvd2VyOw0KCW1zby1sZXZlbC10YWItc3RvcDpub25lOw0KCW1zby1sZXZlbC1udW1iZXIt
cG9zaXRpb246cmlnaHQ7DQoJdGV4dC1pbmRlbnQ6LTkuMHB0O30NCm9sDQoJe21hcmdpbi1ib3R0
b206MGluO30NCnVsDQoJe21hcmdpbi1ib3R0b206MGluO30NCi0tPjwvc3R5bGU+DQo8L2hlYWQ+
DQo8Ym9keSBsYW5nPSJFTi1VUyIgbGluaz0iIzA1NjNDMSIgdmxpbms9IiM5NTRGNzIiPg0KPGRp
diBjbGFzcz0iV29yZFNlY3Rpb24xIj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxl
PSJmb250LXNpemU6MTEuMHB0Ij5IaSBKb2VsLDxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNs
YXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5DYW4geW91IHBs
ZWFzZSBwdWxsIElQTUIgcGF0Y2hlcyBmcm9tIENvcmV5IGZvck5leHQgdHJlZSBhcyBiZWxvdyBp
bnRvIG91ciBMRiBrZXJuZWwuPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05v
cm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPldlIG5lZWQgdGhpcyBmb3IgaXBt
YmJyaWRnZSBhcHBsaWNhdGlvbi48bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8b2wgc3R5bGU9Im1h
cmdpbi10b3A6MGluIiBzdGFydD0iMSIgdHlwZT0iMSI+DQo8bGkgY2xhc3M9Ik1zb0xpc3RQYXJh
Z3JhcGgiIHN0eWxlPSJtYXJnaW4tbGVmdDowaW47bXNvLWxpc3Q6bDAgbGV2ZWwxIGxmbzEiPjxh
IGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS9jbWlueWFyZC9saW51eC1pcG1pL2NvbW1pdC8wZDg2
MzNiZjUzMTExNzdjOWEyNmQ3NWRhZWM2NzdjZDg3ZTMyNjFiI2RpZmYtNzcwODg1MzI0NGU1YmY4
Y2QxMGQyMDVlZTFmNWRjMmMiPmh0dHBzOi8vZ2l0aHViLmNvbS9jbWlueWFyZC9saW51eC1pcG1p
L2NvbW1pdC8wZDg2MzNiZjUzMTExNzdjOWEyNmQ3NWRhZWM2NzdjZDg3ZTMyNjFiI2RpZmYtNzcw
ODg1MzI0NGU1YmY4Y2QxMGQyMDVlZTFmNWRjMmM8L2E+PG86cD48L286cD48L2xpPjxsaSBjbGFz
cz0iTXNvTGlzdFBhcmFncmFwaCIgc3R5bGU9Im1hcmdpbi1sZWZ0OjBpbjttc28tbGlzdDpsMCBs
ZXZlbDEgbGZvMSI+PGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL2NtaW55YXJkL2xpbnV4LWlw
bWkvY29tbWl0LzA0MmYwNTdmZTJkY2YzODY4MmQ4NWQ5Zjg4ZGYwMGQxYThkNDVkYmQiPmh0dHBz
Oi8vZ2l0aHViLmNvbS9jbWlueWFyZC9saW51eC1pcG1pL2NvbW1pdC8wNDJmMDU3ZmUyZGNmMzg2
ODJkODVkOWY4OGRmMDBkMWE4ZDQ1ZGJkPC9hPjxvOnA+PC9vOnA+PC9saT48bGkgY2xhc3M9Ik1z
b0xpc3RQYXJhZ3JhcGgiIHN0eWxlPSJtYXJnaW4tbGVmdDowaW47bXNvLWxpc3Q6bDAgbGV2ZWwx
IGxmbzEiPjxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS9jbWlueWFyZC9saW51eC1pcG1pL2Nv
bW1pdC8zODA2NjViZWNkZWViNGY0NTVjMjM1ODJiN2YzMmU2YjNjZWEyN2QyIj5odHRwczovL2dp
dGh1Yi5jb20vY21pbnlhcmQvbGludXgtaXBtaS9jb21taXQvMzgwNjY1YmVjZGVlYjRmNDU1YzIz
NTgyYjdmMzJlNmIzY2VhMjdkMjwvYT48bzpwPjwvbzpwPjwvbGk+PC9vbD4NCjxwIGNsYXNzPSJN
c29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+UmVn
YXJkczxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+LVZpamF5PG86cD48L286
cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBw
dCI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+
DQo=

--_000_C867898389014E1694BB6C6AF0959B62fbcom_--
