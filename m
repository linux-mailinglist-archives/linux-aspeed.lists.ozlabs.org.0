Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4770D14F292
	for <lists+linux-aspeed@lfdr.de>; Fri, 31 Jan 2020 20:10:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 488RdX22qSzDqhY
	for <lists+linux-aspeed@lfdr.de>; Sat,  1 Feb 2020 06:10:56 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=9299fa1787=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=KblOJ0u5; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=DZhAglsZ; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 488RdJ1qmYzDqgF
 for <linux-aspeed@lists.ozlabs.org>; Sat,  1 Feb 2020 06:10:42 +1100 (AEDT)
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00VJ3w4m000846
 for <linux-aspeed@lists.ozlabs.org>; Fri, 31 Jan 2020 11:10:39 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=facebook;
 bh=yRnoB9+SX/m0fhgWoTWx6ZXR2+ftnjjXUaMg914h4kY=;
 b=KblOJ0u5i/Fvtvm+FHPL19P3Voot1Q4/Pf4YQyLo7/yNNhzAlz5DqgUjE22GHquoHYMU
 aqWovt4PFnT0XabSw6h5xGYNHlq64B/lhuAtPUnsoinFAqw94D/18hfsi0sn9ydpMwSn
 AOrQKYQ3rH+AhluxiA65GQ9QiBVvTG0fEmE= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 2xvsru85gx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-aspeed@lists.ozlabs.org>; Fri, 31 Jan 2020 11:10:39 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Fri, 31 Jan 2020 11:10:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SN+O5RF1np7rGl2n0aKaMmGmCpPuQg6LASGtPserCLObYDqNfdhRUtFBoqiW69XdD0RwuaC39wtZnC8xq/nMfmQ0es7JwLP/GZ05RHK6waFEg9r1LofMKV6zDG4SoWdZeL9Vls1Fz5OKtmTK9PlyCLbZr8COBNDjsPHG2VOQv3zHCevq39RgpZiIFdR3lXLhTRZ6cOzUYcyJeHXasjVJbZX2zwfphbn1lClxYvaVUTp5d5+OL7Psmsd5ajVxsZkddsajDA0JtnmJIqO21dlkyDZIEa12Msf6j4JLxocO0bEP00n2l5hXcq6s00MQDz71Rl6jx+k8K44IYxUD3x6f2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yRnoB9+SX/m0fhgWoTWx6ZXR2+ftnjjXUaMg914h4kY=;
 b=dfxo9a3OE0ADIUMt4uZ7NWCEX1YpZpTFA7frE4WbozLuc4UGcO5HJdtmwxK6yjGxT1hbNoII4n9B/xp2dtj+UpNSGh3DDaVd6ISBrv9YFNGsPdOkIEiSMKOKb+fy7b/sfXyAWO469pnQ60cpyWFpakhCDZXF3v4UZfa8hHcJ4/2ixZxUghB9TFAixDZmdalHkLFrFeAEBSGuNz00Am4crwyaKR4XwDY4wB54sBVYodaFrdHS6Q4aMvf8w9b4PRrYYjgJMtdVGJRcM5C+6ROxQVJgB4DmNcKN7psLkYQTRsUxGSDi+InUHLTxnAvnEUAjugOc14QxDPELnXxLdWjILQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yRnoB9+SX/m0fhgWoTWx6ZXR2+ftnjjXUaMg914h4kY=;
 b=DZhAglsZldOuzQH91RswijpfWvJsbillCfUEwijgba+gwQkPE3adSt70+Gs7FsrkUeBa7PY5aaK2MtKl4fIa7a3pYI64E+kbOw4/qIOawYKUU7ys6PTKD93dj/4s/D/XLTq7GCN4nu9phYDtZXpAx4E6SHy6JNDm9KIwZzq/5LA=
Received: from MWHPR15MB1597.namprd15.prod.outlook.com (10.173.234.137) by
 MWHPR15MB1741.namprd15.prod.outlook.com (10.174.254.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2686.29; Fri, 31 Jan 2020 19:10:36 +0000
Received: from MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::cdbf:b63c:437:4dd2]) by MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::cdbf:b63c:437:4dd2%8]) with mapi id 15.20.2665.027; Fri, 31 Jan 2020
 19:10:35 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: linux-aspeed <linux-aspeed@lists.ozlabs.org>
Subject: Some issues while unbinding spi driver
Thread-Topic: Some issues while unbinding spi driver
Thread-Index: AQHV2Godjqe8YxvDGUaRSIKwjKBiLQ==
Date: Fri, 31 Jan 2020 19:10:35 +0000
Message-ID: <502948A1-BA1E-4D82-A803-62D625BC37F3@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::3:652d]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eb018326-0b53-4e7d-443b-08d7a6814082
x-ms-traffictypediagnostic: MWHPR15MB1741:
x-microsoft-antispam-prvs: <MWHPR15MB17410192845DEAB75D59C9C5DD070@MWHPR15MB1741.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 029976C540
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(376002)(39860400002)(346002)(136003)(396003)(189003)(199004)(6916009)(66476007)(9326002)(64756008)(66556008)(66446008)(66946007)(6486002)(2906002)(4744005)(76116006)(36756003)(2616005)(81156014)(186003)(8676002)(86362001)(8936002)(316002)(81166006)(33656002)(5660300002)(6506007)(478600001)(71200400001)(6512007)(554374003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1741;
 H:MWHPR15MB1597.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aqTIFt/TkdidbbNyAs9M7LD1Zk13+Gt7b/AhfzMsDBX08CHNlDNWfIw5onwPe8nSg+4caEvoQermhJX5FEHSsF+f3YJ2BAF6fRTZ0aue5R3lC0dir0p2tgiwPYN3KNEDuwueY4jMBhi5idrWhJAXXdhDggA8fzDtxevtDSwxh3c8f/IZo3sR47/GiRLxBG6ghfwCQarC78bG1rBih5YcX1zHk0SRQ4hzljQTA01rPlkk8kSD0wdVGH++WBhfXeljnjEZnNEgLDl4E4hoBv+c7muPPnxZ4VGXms8jkn6c+BHxVx0AqwrzC8Rl49Rhh62v5UvaP0EEaWTizP1wyQfAU56hpRjTmbHEyN8uW61gkq1sjA+Bn8+S+Ot/Y/X5iQjeYy7a2YmIttpG5AdknpQfFoi5PqieuBP/y9trZxCthue8WIT3Q6yUbDG+cYhAlEPG4k6CUzXXcseyuVcIxY7nnlokw64TIwv0wuW1SbU08ZS00ZOH+Ls5HAYfpXnlVYh8
x-ms-exchange-antispam-messagedata: oP4Fn+ZS0H3o092LnSgJPWDEp7RZ0V1pzvdB1Y0ePV8ZTpgmJebDVttWsf0Ve9MFOV1VIZYssfLUPjcijYDfod52gQl7wUE8B+vL8oi+Qmwm17jrmu7FmEB4n7mS40Ded8tBfQuxPrGwahlXnJySYVPUD1oMDOuGfP6tGSCGPi2oEoD8uiJxcRfbgomwcBHL
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_502948A1BA1E4D82A80362D625BC37F3fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: eb018326-0b53-4e7d-443b-08d7a6814082
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2020 19:10:35.7716 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JmCg6CKgEg3x4EUaNsL7wrftxvdN7DvYbp32E0fyoKK/6k62wH+rEqtZGQ9PVA1xzK3aBYsbzE8o2lJcC/8t7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1741
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-31_05:2020-01-31,
 2020-01-31 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 mlxlogscore=504
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1911200001 definitions=main-2001310156
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

--_000_502948A1BA1E4D82A80362D625BC37F3fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksDQpJIGFtIHRyeWluZyB0byBhY2Nlc3MgQklPUyBmbGFzaCBkZXZpY2UgZnJvbSBCTUMuIFRv
IGFjY2VzcyB0aGlzIGZsYXNoIEkgbmVlZCB0bw0KZG8gc3dpdGNoIGEgbXV4IGdwaW8gdG8gYWNj
ZXNzIHRoaXMgZmxhc2guIEFmdGVyIHN3aXRjaGluZyBHUElPLCBJIGJpbmQgc3BpIGRldmljZQ0K
dmlhIHN5c2ZzLiBBZnRlciBjb21wbGV0aW5nIGFjY2VzcywgSSB1bmJpbmQgdGhpcyBkZXZpY2Ug
YW5kIHN3aXRjaCBncGlvIGJhY2suDQoNCkJ1dCBpc3N1ZSBoZXJlIGlzIGlmIEkgc3dpdGNoIGdw
aW8gYmFjayAobWVhbnMgcmVtb3ZpbmcgcGh5c2ljYWwgYWNjZXNzIHRvIGRldmljZSkNCmltbWVk
aWF0ZWx5IGFmdGVyIHVuYmluZGluZyBmbGFzaCB3aXRoIDEgc2Vjb25kIGRlbGF5LCBJIGxvc2Ug
YWNjZXNzIHRvIGkyYyBidXMgOQ0Kd2hpY2ggaXMgY29ubmVjdGVkIHRvIE1FLiBJZiBJIGdpdmUg
ZW5vdWdoIGRlbGF5IGxpa2UgMTAgc2Vjb25kIGJldHdlZW4gdW5iaW5kaW5nDQphbmQgR1BJTyBz
d2l0Y2hpbmcsIHRoZW4gZXZlcnl0aGluZyBpcyBmaW5lLg0KDQpUaGUgZHJpdmVyIHVzZWQgZm9y
IHRoaXMgaXMgYXN0MjUwMC1zcGkuDQoNClBsZWFzZSBzaGFyZSB5b3VyIHRob3VnaHRzLg0KDQpS
ZWdhcmRzDQotVmlqYXkNCg==

--_000_502948A1BA1E4D82A80362D625BC37F3fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <DCF3861716D2644BA3471CC4E8E446FD@namprd15.prod.outlook.com>
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
IixzYW5zLXNlcmlmO30NCnNwYW4uRW1haWxTdHlsZTE3DQoJe21zby1zdHlsZS10eXBlOnBlcnNv
bmFsLWNvbXBvc2U7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7DQoJY29sb3I6
d2luZG93dGV4dDt9DQouTXNvQ2hwRGVmYXVsdA0KCXttc28tc3R5bGUtdHlwZTpleHBvcnQtb25s
eTsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjt9DQpAcGFnZSBXb3JkU2VjdGlv
bjENCgl7c2l6ZTo4LjVpbiAxMS4waW47DQoJbWFyZ2luOjEuMGluIDEuMGluIDEuMGluIDEuMGlu
O30NCmRpdi5Xb3JkU2VjdGlvbjENCgl7cGFnZTpXb3JkU2VjdGlvbjE7fQ0KLS0+PC9zdHlsZT4N
CjwvaGVhZD4NCjxib2R5IGxhbmc9IkVOLVVTIiBsaW5rPSIjMDU2M0MxIiB2bGluaz0iIzk1NEY3
MiI+DQo8ZGl2IGNsYXNzPSJXb3JkU2VjdGlvbjEiPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNw
YW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPkhpLDxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxw
IGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5JIGFtIHRy
eWluZyB0byBhY2Nlc3MgQklPUyBmbGFzaCBkZXZpY2UgZnJvbSBCTUMuIFRvIGFjY2VzcyB0aGlz
IGZsYXNoIEkgbmVlZCB0bw0KPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05v
cm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPmRvIHN3aXRjaCBhIG11eCBncGlv
IHRvIGFjY2VzcyB0aGlzIGZsYXNoLiBBZnRlciBzd2l0Y2hpbmcgR1BJTywgSSBiaW5kIHNwaSBk
ZXZpY2UNCjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFu
IHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij52aWEgc3lzZnMuIEFmdGVyIGNvbXBsZXRpbmcgYWNj
ZXNzLCBJIHVuYmluZCB0aGlzIGRldmljZSBhbmQgc3dpdGNoIGdwaW8gYmFjay48bzpwPjwvbzpw
Pjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXpl
OjExLjBwdCI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1h
bCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPkJ1dCBpc3N1ZSBoZXJlIGlzIGlmIEkg
c3dpdGNoIGdwaW8gYmFjayAobWVhbnMgcmVtb3ZpbmcgcGh5c2ljYWwgYWNjZXNzIHRvIGRldmlj
ZSk8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHls
ZT0iZm9udC1zaXplOjExLjBwdCI+aW1tZWRpYXRlbHkgYWZ0ZXIgdW5iaW5kaW5nIGZsYXNoIHdp
dGggMSBzZWNvbmQgZGVsYXksIEkgbG9zZSBhY2Nlc3MgdG8gaTJjIGJ1cyA5DQo8bzpwPjwvbzpw
Pjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXpl
OjExLjBwdCI+d2hpY2ggaXMgY29ubmVjdGVkIHRvIE1FLiBJZiBJIGdpdmUgZW5vdWdoIGRlbGF5
IGxpa2UgMTAgc2Vjb25kIGJldHdlZW4gdW5iaW5kaW5nDQo8bzpwPjwvbzpwPjwvc3Bhbj48L3A+
DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+YW5k
IEdQSU8gc3dpdGNoaW5nLCB0aGVuIGV2ZXJ5dGhpbmcgaXMgZmluZS48bzpwPjwvbzpwPjwvc3Bh
bj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBw
dCI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNw
YW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPlRoZSBkcml2ZXIgdXNlZCBmb3IgdGhpcyBpcyBh
c3QyNTAwLXNwaS48bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48
c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9w
Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPlBs
ZWFzZSBzaGFyZSB5b3VyIHRob3VnaHRzLjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNz
PSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij48bzpwPiZuYnNwOzwv
bzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1z
aXplOjExLjBwdCI+UmVnYXJkczxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29O
b3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij4tVmlqYXk8bzpwPjwvbzpwPjwv
c3Bhbj48L3A+DQo8L2Rpdj4NCjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_502948A1BA1E4D82A80362D625BC37F3fbcom_--
