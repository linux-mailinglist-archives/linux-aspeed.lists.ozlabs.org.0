Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B73DA2B0E25
	for <lists+linux-aspeed@lfdr.de>; Thu, 12 Nov 2020 20:34:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CXBcn6nhdzDqbl
	for <lists+linux-aspeed@lfdr.de>; Fri, 13 Nov 2020 06:34:33 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=85857ee873=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=H2Mmt19d; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=TlcQZbRR; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CXBB750jdzDr1m
 for <linux-aspeed@lists.ozlabs.org>; Fri, 13 Nov 2020 06:14:54 +1100 (AEDT)
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0ACJB56r019504; Thu, 12 Nov 2020 11:14:47 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=mIAjw/MgzOocqk1OFQO8cY7CuG1v0Q/Zs2vpMMzjDH8=;
 b=H2Mmt19dItiVTzwKMS4teEgBQhaIo6zZwJzrJ4l4geiFX4elqGLUdXlP0MBFsJX6yR3v
 9OSrl8E+8Lv8SygUdbUI587ar83Gxf+S0fw4Pv07MuHQs3xAIgB10se8dGgEJrJOktu/
 NXKmq96TBlnbabcG5WMXYoUNjnKpQZS2iA8= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 34rf8ss3jq-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 12 Nov 2020 11:14:47 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.101) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 12 Nov 2020 11:14:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AC29rSbgR4kxa1AdikZ3q8LP0uMLInus33oG3UjR5SKSFPbFiarXAwmkUM+xmInEdeXXfzrZ3cpBJA8GdTSn2GlCwrFAkrxN4j7CbgX+B2UJExGCtzhTb14L9OF4wH3rFVGMuGMlYE5TxM2XeUbuIASnxvE0jHYLffCmCdvJG8ANz4cTBc/oFyIiv3XIkGw2OPQoI7Qco8anndDv6pa/OBTsSLjIBqYt2Nx+UY3ORBEZaL0oUh0bU2GJnC43Og/wxu1iUfUTcrW0XXJErYYankGF6JhB62Uss6RTsFwRCmH/7NnwLEwf0yQ9NmqKi68ee5Ct4/QBPbm7ZKlZ69yHKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mIAjw/MgzOocqk1OFQO8cY7CuG1v0Q/Zs2vpMMzjDH8=;
 b=Kmd6ubVsmKOe8KKVN5q2PCmLMyWGhvVVdRFeL5gooYRva1SvRfWGAXTpQlXQKVzgNPsTct5XWPDLYB7W8TfzNZ6F1/gpyhWt3TM7kyO5Zm1rKserrex4peXt94P/glg2AKDODc7Ltpm526gr1NzVzleZmXQwzL2Jb6Ffe/QxLCSyteExH0iYM+b7nR+S3foRVhBw7ym/uSrFPBaWSJrXxb9aBgL7hyWNcXMNj3cse2tsFTH8wAhNUj5plAGHUB9bk4sQbmX7Ym4W0kr64gHGfwk2PKx8qVK/7WHVBek2lo02miZXVTM8N1BkWwWOcH4ktmLVatwyj546oPO5Fi6aNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mIAjw/MgzOocqk1OFQO8cY7CuG1v0Q/Zs2vpMMzjDH8=;
 b=TlcQZbRRisDu7xUsVaQybRO8EEQfyf2jCiQCH0tyYXfSkepd0vIvSgm9hPoX6HBhYei7/Sl+/BLgzpExzxB7fvYu8WVSFsLrN27hy3VN2Azx56UN8nG0BFTUCka1P6kieQNV0hSTug2jruMuT+Tfjalr5RdRHxviE5SrH9s6wHQ=
Received: from BY5PR15MB3537.namprd15.prod.outlook.com (2603:10b6:a03:1f5::20)
 by BYAPR15MB3384.namprd15.prod.outlook.com (2603:10b6:a03:112::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Thu, 12 Nov
 2020 19:14:33 +0000
Received: from BY5PR15MB3537.namprd15.prod.outlook.com
 ([fe80::35ef:5d5d:6617:e58a]) by BY5PR15MB3537.namprd15.prod.outlook.com
 ([fe80::35ef:5d5d:6617:e58a%6]) with mapi id 15.20.3541.025; Thu, 12 Nov 2020
 19:14:33 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Joel Stanley <joel@jms.id.au>, Paul Fertser <fercerpav@gmail.com>
Subject: Re: [PATCH] arm: dts: aspeed-bmc-tiogapass: enable second MAC
Thread-Topic: [PATCH] arm: dts: aspeed-bmc-tiogapass: enable second MAC
Thread-Index: AQHWl1+4Glegd+uDPU6Wf8gEcB3+hKmsrfYAgBftSAA=
Date: Thu, 12 Nov 2020 19:14:33 +0000
Message-ID: <21F4D101-0402-4401-AD11-2EB12406F86A@fb.com>
References: <20200930192507.27847-1-fercerpav@gmail.com>
 <CACPK8XdMXBUYZxYnvLeZ1V=mT6=uMhy6rNZ9dsksw0_yf6obeA@mail.gmail.com>
In-Reply-To: <CACPK8XdMXBUYZxYnvLeZ1V=mT6=uMhy6rNZ9dsksw0_yf6obeA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:d2d]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 04e840ef-0273-4697-a6b5-08d8873f304f
x-ms-traffictypediagnostic: BYAPR15MB3384:
x-microsoft-antispam-prvs: <BYAPR15MB33841E5765BBF3B22E10D811DDE70@BYAPR15MB3384.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iDiccJ9oPFjT/mN8ZIKGFejKFbhnT/6dTAkV6wvynAA/VFTmaQLk0on1ZEf3txCJqflgkQOAN34gM2xvNvoaOWne9ZMfOdcdlY6TIAdTZN24K9KwHxb0NfXHxc5yVXXi5qdvWpdc0tyKcgB609oexK+UEOXG5MMCERdpjTilMUmP4OQWljwnNhWkRuroZRIttO8HKzdfo7wIQVmel2hk/qa1F334FKl8BKgfTqMEdDRuooNsSQ3qm7uS8vX/5N2LPMbSCEM//m14+IVo21vlp8IpmfFZZaxRLzP+eRKtjw/h3Sh/i/Ew+HUFxpznMDllmxj9NGT5e41mQREid/G80A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR15MB3537.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(136003)(396003)(366004)(376002)(346002)(83380400001)(5660300002)(6506007)(66446008)(66946007)(66556008)(66476007)(91956017)(76116006)(36756003)(2906002)(4326008)(6486002)(8676002)(478600001)(64756008)(110136005)(6512007)(33656002)(86362001)(8936002)(316002)(54906003)(186003)(2616005)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: Qj/F94nCoLXWeY/QryPwVQ2XbDZO/hD7ypPkZTSyh3/+VWtfoawlhRd2s788NmjAV8zKbMYod5JhFuzHY4jz83L/RbyVWFgAQuHozvpbNqXyk25gM7uoKkf/iFb+xA6Pm4RfLuLH1nY0TfKIljZK4EBqx5PLJzi0XJAFPh9edyIb3F1dLbpvmjVvAh5W9TqjzBUEdmZlQyarFCJ5iwfblBG4X9y8fy7JVU5UeeFmDHsQ720iSoKeLLJPE8OY1/z3noY+Zt0KVgD+pS9S23OGq/zmvlRFYE/lZtF6MC4fOR9g97TlC9s6U/wLMWHWp/lVZnH9o0L541s5KfRspXiPnTsjp+HusjdILe+sQSpIPMnbZa7dKA3fGtTDCbMTscysPCKmxxv4YgthbhKXw/Qtzo3nW7d4edNMRmJfccMeQ/i0hvOdMi8YBm1Qhy4IOxu05MoXTfGFKBo67PqpCDfzqAvHYJRIquMdkwFTQ0fGoeF2JB4TjC6D8uT4hZSpgVyDeCtbRvGOMH1finUUtveHIwDOyyrrtgcWgZGEdAsVbRWKZfF5gl1ijqkSVv3UUwUB0h+MR0WaCO8jkNM3QA9BIagrbiKsvkSMaWp5coy8BdnpCuv02sLx3H0vt3U0OGpZ5xiOeVKU7Sq/zaPiP/kfDI/ssD4Mny7Qcivv5S20xM8=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <3EC9EDF423DB60449F8D2DC4C1C72569@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3537.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04e840ef-0273-4697-a6b5-08d8873f304f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2020 19:14:33.5861 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xU2HKzaFGMTh6unvfbNRL6h9IGOhIgMvi+/KCCJBl+9xNoynwKi3eS4r0kPtsxE8ZJIZhRVrPRcFV9dTfKHa1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB3384
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-12_10:2020-11-12,
 2020-11-12 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 malwarescore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 mlxlogscore=999 adultscore=0
 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011120114
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

DQoNCu+7v09uIDEwLzI3LzIwLCAxMDo1MSBQTSwgIkpvZWwgU3RhbmxleSIgPGpvZWxAam1zLmlk
LmF1PiB3cm90ZToNCg0KICAgIE9uIFdlZCwgMzAgU2VwIDIwMjAgYXQgMTk6MjcsIFBhdWwgRmVy
dHNlciA8ZmVyY2VycGF2QGdtYWlsLmNvbT4gd3JvdGU6DQogICAgPg0KICAgID4gVGlvZ2EgUGFz
cyByZWZlcmVuY2UgZGVzaWduIGluY2x1ZGVzIEludGVsIEkyMTAgRXRoZXJuZXQgY29udHJvbGxl
cg0KICAgID4gY29ubmVjdGVkIHRvIHRoZSBCTUMgd2l0aCBOQy9TSS4NCiAgICA+DQogICAgPiBN
QUMgcmVhZG91dCBpcyBub3Qgc3VwcG9ydGVkLg0KICAgID4NCiAgICA+IFNpZ25lZC1vZmYtYnk6
IFBhdWwgRmVydHNlciA8ZmVyY2VycGF2QGdtYWlsLmNvbT4NClJldmlld2VkLWJ5OiBWaWpheSBL
aGVta2E8dmlqYXlraGVta2FsaW51eEBnbWFpbC5jb20+DQpUZXN0ZWQtYnk6IFZpamF5IEtoZW1r
YTx2aWpheWtoZW1rYWxpbnV4QGdtYWlsLmNvbT4NCg0KDQogICAgVmlqYXksIGNhbiBJIGdldCBh
IHJldmlldyBmcm9tIHlvdSBvbiB0aGlzIG9uZSBwbGVhc2U/DQoNClNvcnJ5IEpvZWwsIGZvciBs
YXRlIHJlc3BvbnNlLCBJIGhhdmUgdGVzdGVkIGFuZCB2ZXJpZmllZCB0aGlzIHllc3RlcmRheQ0K
DQogICAgPiAtLS0NCiAgICA+ICBhcmNoL2FybS9ib290L2R0cy9hc3BlZWQtYm1jLWZhY2Vib29r
LXRpb2dhcGFzcy5kdHMgfCA4ICsrKysrKysrDQogICAgPiAgMSBmaWxlIGNoYW5nZWQsIDggaW5z
ZXJ0aW9ucygrKQ0KICAgID4NCiAgICA+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9h
c3BlZWQtYm1jLWZhY2Vib29rLXRpb2dhcGFzcy5kdHMgYi9hcmNoL2FybS9ib290L2R0cy9hc3Bl
ZWQtYm1jLWZhY2Vib29rLXRpb2dhcGFzcy5kdHMNCiAgICA+IGluZGV4IDJkNDRkOWFkNGU0MC4u
YjJiYTc5OGJmM2M0IDEwMDY0NA0KICAgID4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVk
LWJtYy1mYWNlYm9vay10aW9nYXBhc3MuZHRzDQogICAgPiArKysgYi9hcmNoL2FybS9ib290L2R0
cy9hc3BlZWQtYm1jLWZhY2Vib29rLXRpb2dhcGFzcy5kdHMNCiAgICA+IEBAIC0xOTYsNiArMTk2
LDE0IEBADQogICAgPiAgICAgICAgIHVzZS1uY3NpOw0KICAgID4gIH07DQogICAgPg0KICAgID4g
KyZtYWMxIHsNCiAgICA+ICsgICAgICAgc3RhdHVzID0gIm9rYXkiOw0KICAgID4gKw0KICAgID4g
KyAgICAgICBwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOw0KICAgID4gKyAgICAgICBwaW5jdHJs
LTAgPSA8JnBpbmN0cmxfcm1paTJfZGVmYXVsdD47DQogICAgPiArICAgICAgIHVzZS1uY3NpOw0K
ICAgID4gK307DQogICAgPiArDQogICAgPiAgJmFkYyB7DQogICAgPiAgICAgICAgIHN0YXR1cyA9
ICJva2F5IjsNCiAgICA+ICB9Ow0KICAgID4gLS0NCiAgICA+IDIuMTcuMQ0KICAgID4NCg0K
