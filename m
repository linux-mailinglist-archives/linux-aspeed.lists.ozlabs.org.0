Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1105F14447B
	for <lists+linux-aspeed@lfdr.de>; Tue, 21 Jan 2020 19:42:41 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 482HTT6r5hzDqTl
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 Jan 2020 05:42:37 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=8289fa29e8=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=Xd7SPgWU; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=ZHvmPJBD; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 482HTJ6BTyzDqRt
 for <linux-aspeed@lists.ozlabs.org>; Wed, 22 Jan 2020 05:42:20 +1100 (AEDT)
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00LISLqR028058; Tue, 21 Jan 2020 10:42:10 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=XjKr1mOAwTyH8XzefxvXGAmAsm+lnLPYlcr+ALfSZho=;
 b=Xd7SPgWU2a0anTt6RkAeixmqdKpypoAIXwFZp2QUwtsnMTdJw5Ad/panvznIQulJv5Ni
 epRxeUnPvyQUg6PHE4ZAgmlD0dLI3a949Qq+o0Y/k6rPT9zC3NsuMWZYBmPkAVdYWWwr
 EMhFaFoKr5kLsbefw2jh45razDtKveckHVc= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 2xnwtjte0x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 21 Jan 2020 10:42:10 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Tue, 21 Jan 2020 10:42:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CXAe1brKm2DeDz1G0h71XZHqZuC9198+m2SDofzohgCUBSv3gyybcXUxLQaKny9p5CajS8tZJVbe0QrLOZ8wCF1eI0h4tJ0N+hKudgxa16buiM0CIZrdn/rJP1ukkOSRm/5uSqfkke+izCA+qrMJfGrtVj9WOzrwgJmYw1SmcMklKeYJaXyXK+cu5es0Mhc5RCY+gjvgnKdAnPtZ7ZSHgyH6Aoo0tex+ziqkppAlyGyG7M/QDaIuyCxhcBx6jrll6BL/J3D+Ruv+JVFhafB9R10q8lbfKzsqNwvliy9TKg6HBYsls+j0NJp18fiWIsOu7qW/rIB7Q9GwHJuY1bDCVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XjKr1mOAwTyH8XzefxvXGAmAsm+lnLPYlcr+ALfSZho=;
 b=gs3HCJFZygns0yi5DN86GO8Tu8U5UvPzKQaSa+8oKkYPT5TFl8M7o4R45FsJP7U5e/spWb0LV60RXfRRVh8mrKwI2nmuNX/zvml6RDx665yZEBAHy++NnzH8bX0J2g1+NTG7D4bs9w3RTWtJoYs0QT44HRmMjjyREzBMsuO1ATEv66XKmw/dj7xJr6mhTPIXyM3F+AoJnZo5Lf1v6y1gbIdCSBekK3lAqxVWp5UYow86n1xCkNzrwqtoVVlz8W8LGup44y+G/qfzvbm59zv5tqFuibkit+okfGzDj5kkeAFktB4ASS75a6jgWyzPd3MR47dAVH/uWqGCHxScPs2XCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XjKr1mOAwTyH8XzefxvXGAmAsm+lnLPYlcr+ALfSZho=;
 b=ZHvmPJBDOwDyJSAg1a+iJUZGeoTccqonYkGwyuxbmRGvAaKpnvr7bPSgP8z/73pzj6vp5xIomKIhw5nFsWughFOgckTJb7cb00JJJ3DmNqi0GHyZ2QnJUjXGNoNg729RXmdJuP53Yy6ZCy7kc/P5gKa9AsqHa2sPggNK5urlqmI=
Received: from MWHPR15MB1597.namprd15.prod.outlook.com (10.173.234.137) by
 MWHPR15MB1613.namprd15.prod.outlook.com (10.175.139.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.23; Tue, 21 Jan 2020 18:42:08 +0000
Received: from MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::cdbf:b63c:437:4dd2]) by MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::cdbf:b63c:437:4dd2%8]) with mapi id 15.20.2644.027; Tue, 21 Jan 2020
 18:42:08 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Joel Stanley <joel@jms.id.au>, arm <arm@kernel.org>, "soc@kernel.org"
 <soc@kernel.org>
Subject: Re: [GIT PULL] ARM: aspeed: devicetree changes for 5.6
Thread-Topic: [GIT PULL] ARM: aspeed: devicetree changes for 5.6
Thread-Index: AQHVz1nRlw+DeKlNcEe7ShTrMglgn6f08CaA
Date: Tue, 21 Jan 2020 18:42:08 +0000
Message-ID: <6958E763-F18E-4305-8480-2EB6C58A082C@fb.com>
References: <CACPK8XepSy6D4CNWjSWDDK0p7Dx_rneWne4t4uyy=di5nx3zmA@mail.gmail.com>
In-Reply-To: <CACPK8XepSy6D4CNWjSWDDK0p7Dx_rneWne4t4uyy=di5nx3zmA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::2:8d24]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 524f8cfb-073f-4859-2584-08d79ea19ea1
x-ms-traffictypediagnostic: MWHPR15MB1613:
x-microsoft-antispam-prvs: <MWHPR15MB16138F336F596DD26E7147BDDD0D0@MWHPR15MB1613.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:1169;
x-forefront-prvs: 0289B6431E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(396003)(366004)(346002)(376002)(136003)(189003)(199004)(478600001)(6506007)(6512007)(36756003)(4326008)(6486002)(110136005)(8936002)(2616005)(316002)(2906002)(71200400001)(33656002)(86362001)(66556008)(5660300002)(76116006)(66946007)(8676002)(66476007)(64756008)(66446008)(54906003)(186003)(81156014)(81166006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1613;
 H:MWHPR15MB1597.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HrJ2b28aRhzFeH5nsVH+zlQ/aZtd+TS3LIotD/UfEqE0mQZ4rMnKIgqPQ0TI0ntRXgiFSlxfK39cn7lLo4WC4tN/4rIH6L1rezZZDq9SNKUP4usAgtbUUjBoQ3tb7svvrO36hc1urTKkyE8eTkJeQIk10MkuGBznkqqw6CXOath1MXguDN0LLuZUDxivQPZYKQELKSpJ2sLZz/UDqvUeV0eoZ9o4guKAZSFa3g3xZWC6kwHR9oDDk6t2GGRnyDo862oA+H75X0xwLUdRksnv0niepHXiJ80M5LT4Ys1iUHNm9UZLi3n3ve78LBkGoWmLonOR12lurbsPWtCtuSeM3RrnoJt4Eq+8ycqyt1k5eD1pVAfL5GeMitVUkdZmWNMC9HLAAEB5Vrc/cCq786LHenCZDlr4wGVOqFHlggX1wFcaW2oCyJnO3uM0YyGtbGmC
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <8161525A418F4A4EA746A98BFF432DC4@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 524f8cfb-073f-4859-2584-08d79ea19ea1
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2020 18:42:08.2359 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OQRrYUqqpuLzSQuGT2jo3fUOU4XMgigDja6u6niLTXDJhPa/yv0hRyEdueafnyVd5IsxETIm6QMkAqvRGQ43Kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1613
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.634
 definitions=2020-01-21_06:2020-01-21,
 2020-01-21 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 suspectscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 impostorscore=0 spamscore=0 mlxlogscore=999 clxscore=1011
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001210139
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

SGkgSm9lbCwNCkkgZ3Vlc3MgeW91IG1pc3NlZCBteSBwYXRjaCBoZXJlLg0KICAtLSBbUEFUQ0gg
djJdIEFSTTogZHRzOiBhc3BlZWQ6IHRpb2dhcGFzczogQWRkIGdwaW8gbGluZSBuYW1lcw0KDQpJ
IGhhdmUgc2VudCB2ZXJzaW9udjIgb24gSmFuIDE3IGFzIHYxIHdhcyBub3QgbWVyZ2VkLg0KDQpS
ZWdhcmRzDQotVmlqYXkNCg0K77u/T24gMS8xOS8yMCwgMTA6MjEgUE0sICJMaW51eC1hc3BlZWQg
b24gYmVoYWxmIG9mIEpvZWwgU3RhbmxleSIgPGxpbnV4LWFzcGVlZC1ib3VuY2VzK3ZpamF5a2hl
bWthPWZiLmNvbUBsaXN0cy5vemxhYnMub3JnIG9uIGJlaGFsZiBvZiBqb2VsQGptcy5pZC5hdT4g
d3JvdGU6DQoNCiAgICBIZWxsbyBBUk0gbWFpbnRhaW5lcnMsDQogICAgDQogICAgU29ycnkgZm9y
IHNlbmRpbmcgdGhpcyBvbmUgaXMgYSBiaXQgbGF0ZSwgSSB3YXMgb2ZmIGF0IGxpbnV4LmNvbmYu
YXUgbGFzdCB3ZWVrLg0KICAgIA0KICAgIFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21t
aXQgMzliZTllODRmNjViZTU5OTkxOWM3MDY5YmRhZDI0ZGMyZDljZDY1ZDoNCiAgICANCiAgICAg
IEFSTTogZHRzOiBhc3BlZWQ6IHJhaW5pZXI6IEFkZCBVQ0Q5MDMyMCBwb3dlciBzZXF1ZW5jZXIg
KDIwMjAtMDEtMjANCiAgICAxNTo1MDo1NyArMTAwMCkNCiAgICANCiAgICBhcmUgYXZhaWxhYmxl
IGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoNCiAgICANCiAgICAgIGdpdDovL2dpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9qb2VsL2FzcGVlZC5naXQNCiAgICB0YWdzL2Fz
cGVlZC01LjYtZGV2aWNldHJlZQ0KICAgIA0KICAgIGZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1
cCB0byAzOWJlOWU4NGY2NWJlNTk5OTE5YzcwNjliZGFkMjRkYzJkOWNkNjVkOg0KICAgIA0KICAg
ICAgQVJNOiBkdHM6IGFzcGVlZDogcmFpbmllcjogQWRkIFVDRDkwMzIwIHBvd2VyIHNlcXVlbmNl
ciAoMjAyMC0wMS0yMA0KICAgIDE1OjUwOjU3ICsxMDAwKQ0KICAgIA0KICAgIC0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCiAg
ICBBU1BFRUQgZGV2aWNlIHRyZWUgdXBkYXRlcyBmb3IgNS42DQogICAgDQogICAgIC0gQ2xlYW51
cHMgZm9yIGR0YyB3YXJuaW5ncw0KICAgIA0KICAgICAtIEV0aGVybmV0IGhhcmR3YXJlIGNoZWNr
c3VtIGNsZWFudXBzLiBBIGJ1ZyBpbiB0aGUgZHJpdmVyIHdhcyBmaXhlZCBzbw0KICAgICBtYWNo
aW5lcyBkb24ndCBuZWVkIHRvIHNwZWNpZnkgdGhpcyBhbnltb3JlLg0KICAgIA0KICAgICAtIE1p
c2MgaW1wcm92ZW1lbnRzDQogICAgDQogICAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KICAgIA0KICAgIEFuZHJldyBKZWZm
ZXJ5ICgxMyk6DQogICAgICAgICAgZHQtYmluZGluZ3M6IHBpbmN0cmw6IGFzcGVlZDogQWRkIHJl
ZyBwcm9wZXJ0eSBhcyBhIGhpbnQNCiAgICAgICAgICBkdC1iaW5kaW5nczogbWlzYzogRG9jdW1l
bnQgcmVnIGZvciBhc3BlZWQsIHAyYS1jdHJsIG5vZGVzDQogICAgICAgICAgQVJNOiBkdHM6IGFz
cGVlZC1nNTogTW92ZSBFREFDIG5vZGUgdG8gQVBCDQogICAgICAgICAgQVJNOiBkdHM6IGFzcGVl
ZC1nNTogVXNlIHJlY29tbWVuZGVkIGdlbmVyaWMgbm9kZSBuYW1lIGZvciBTRE1DDQogICAgICAg
ICAgQVJNOiBkdHM6IHZlc25pbjogQWRkIHVuaXQgYWRkcmVzcyBmb3IgbWVtb3J5IG5vZGUNCiAg
ICAgICAgICBBUk06IGR0czogZnA1MjgwZzI6IENsZWFudXAgZ3Bpby1rZXlzLXBvbGxlZCBwcm9w
ZXJ0aWVzDQogICAgICAgICAgQVJNOiBkdHM6IHN3aWZ0OiBDbGVhbnVwIGdwaW8ta2V5cy1wb2xs
ZWQgcHJvcGVydGllcw0KICAgICAgICAgIEFSTTogZHRzOiB3aXRoZXJzcG9vbjogQ2xlYW51cCBn
cGlvLWtleXMtcG9sbGVkIHByb3BlcnRpZXMNCiAgICAgICAgICBBUk06IGR0czogYXNwZWVkOiBD
bGVhbnVwIGxwYy1jdHJsIGFuZCBzbm9vcCByZWdzDQogICAgICAgICAgQVJNOiBkdHM6IGFzcGVl
ZDogQWRkIHJlZyBoaW50cyB0byBzeXNjb24gY2hpbGRyZW4NCiAgICAgICAgICBBUk06IGR0czog
YXNwZWVkLWc1OiBTb3J0IExQQyBjaGlsZCBub2RlcyBieSB1bml0IGFkZHJlc3MNCiAgICAgICAg
ICBBUk06IGR0czogYXNwZWVkLWc2OiBDbGVhbnVwIHdhdGNoZG9nIHVuaXQgYWRkcmVzcw0KICAg
ICAgICAgIEFSTTogZHRzOiBpYm0tcG93ZXI5LWR1YWw6IEFkZCBhIHVuaXQgYWRkcmVzcyBmb3Ig
T0NDIG5vZGVzDQogICAgDQogICAgRWRkaWUgSmFtZXMgKDEpOg0KICAgICAgICAgIEFSTTogZHRz
OiBhc3BlZWQ6IHJhaW5pZXI6IFN3aXRjaCBQU1VzIHRvIHVua25vd24gdmVyc2lvbg0KICAgIA0K
ICAgIEl2YW4gTWlraGF5bG92ICgxKToNCiAgICAgICAgICBBUk06IGR0czogYXNwZWVkOiBBZGQg
U0QgY2FyZCBmb3IgVmVzbmluDQogICAgDQogICAgSmltIFdyaWdodCAoMSk6DQogICAgICAgICAg
QVJNOiBkdHM6IGFzcGVlZDogcmFpbmllcjogQWRkIFVDRDkwMzIwIHBvd2VyIHNlcXVlbmNlcg0K
ICAgIA0KICAgIEpvZWwgU3RhbmxleSAoMSk6DQogICAgICAgICAgQVJNOiBkdHM6IGFzcGVlZDog
QVNUMjQwMCBkaXNhYmxlcyBodyBjaGVja3N1bQ0KICAgIA0KICAgIFRhbyBSZW4gKDIpOg0KICAg
ICAgICAgIEFSTTogZHRzOiBhc3BlZWQ6IG5ldGJtYzogRGVsZXRlIG5vLWh3LWNoZWNrc3VtDQog
ICAgICAgICAgQVJNOiBkdHM6IGFzcGVlZDogeWFtcDogRGVsZXRlIG5vLWh3LWNoZWNrc3VtDQog
ICAgDQoNCg==
