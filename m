Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B26129FDC0
	for <lists+linux-aspeed@lfdr.de>; Fri, 30 Oct 2020 07:16:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMsXJ2WfFzDqtG
	for <lists+linux-aspeed@lfdr.de>; Fri, 30 Oct 2020 17:16:48 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=8572db1ff5=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=HcY5Ig+n; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=M02zsjNm; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMsX56vfczDqgb
 for <linux-aspeed@lists.ozlabs.org>; Fri, 30 Oct 2020 17:16:36 +1100 (AEDT)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09U65CrB023022; Thu, 29 Oct 2020 23:16:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=u9NltFt0jNDRexuymzrmA8bcomCAYDLYbIOhNtcM9iw=;
 b=HcY5Ig+n7JSBFQU+mezsckELFWuWdewB5LxkS1D5T7CA71cJRUx7Mn7vHAAzS36IuLgr
 WuoCDnfZOM6jUoVHMVO0by80rDAq6aKtPYr/Ij8v9euZVyCWDw5uIMgeWi9La+0zqJt1
 4OzcYw2WwS972YxR5ohSHEuh8rPiJevgSCM= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 34g35gtvjh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 29 Oct 2020 23:16:25 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.230) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 29 Oct 2020 23:16:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nLqX2AboM6Jd99Qb0XxItWwuapDt5CcUUTvyjr7MHA6A4OwmdknLUN7951FtaXcuZK/hFR/BEzP/DfYfx1zeOn8Rn1QCiCMqCisvteynBVzIpXA0hDskHhBogJci5w8Y+tAExDHjZmY1iEl3fyD+wd6R40vbmlpqXXX1/vZ4xJF1+2oD/obT+A8ykLC3YZp1JNSqZcjTtLWzL9VEWTAz15yCh49BHINZOp9M1aGsgr9bGAFiVLW+nQf0LNCyx+Qy6X+oGq7pow09P8vw9zNxS8NifoYSUXpOt4ILmNq8fGTRkv0RMbrwAZZ09WbdRg/A4zk6awCWj916eulDAcc60w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u9NltFt0jNDRexuymzrmA8bcomCAYDLYbIOhNtcM9iw=;
 b=gGQq5xNKT92xn/1Gx5Uc2AzKLJuaGpovsFlJ2O3n/b8aXCnyDxaLGLXsufS4+1JM7M/1pnhSHaI2DcJitj+skH5E5p5ov6HWr765hznJA+G8OnvEUJ2+M/kF1ip4nxJEbKJxmwj0cRIBpWcdYecjywaBIVy4Q/SEeu1T86FHCzYhQz8UGk5/hxMHpwiA3qHGI0CGe7sV39+MszE8pLuQXWacOLFWU+xxVZMhsEF5GXRyTslIabYEpwvAabSHji8vI8eu3/F6Z5EK2MkGqrYctib9zt8TTNd3Yv8g8jKnORj5Pr4HkXTG9p4Gkz5+c5zJxpFY1xTWQMyHrDV7TQ8/Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u9NltFt0jNDRexuymzrmA8bcomCAYDLYbIOhNtcM9iw=;
 b=M02zsjNmK7ISmrkmEVMxE2S0FxiIs2M+IqUugF917OLcNj7MHELwr5wfHDriMFcrvCoRmRitXFR+HharVGAwHT1xkkJvdyszDDBJX2Ro/mfOJczi394tEtdcPvvqFM/xmew11MghLNKM7SWzgX73lQ6wKRKgf8u6rKtCOem8hMs=
Received: from BY5PR15MB3537.namprd15.prod.outlook.com (2603:10b6:a03:1f5::20)
 by BYAPR15MB2790.namprd15.prod.outlook.com (2603:10b6:a03:15a::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19; Fri, 30 Oct
 2020 06:16:23 +0000
Received: from BY5PR15MB3537.namprd15.prod.outlook.com
 ([fe80::5cb9:7809:838b:488a]) by BY5PR15MB3537.namprd15.prod.outlook.com
 ([fe80::5cb9:7809:838b:488a%5]) with mapi id 15.20.3477.029; Fri, 30 Oct 2020
 06:16:23 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@aj.id.au>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>
Subject: Re: [PATCH] ARM: dts: aspeed: tiogapass: Remove vuart
Thread-Topic: [PATCH] ARM: dts: aspeed: tiogapass: Remove vuart
Thread-Index: AQHWcaSd7Ih1dVVMGkWZGBdD7/uNBamvr7+A
Date: Fri, 30 Oct 2020 06:16:23 +0000
Message-ID: <6E9E8073-F918-4BBE-A41D-F0602A363CF4@fb.com>
References: <20200813190431.3331026-1-vijaykhemka@fb.com>
In-Reply-To: <20200813190431.3331026-1-vijaykhemka@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:4c83]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b1205dc5-4378-45c1-1822-08d87c9b53a0
x-ms-traffictypediagnostic: BYAPR15MB2790:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR15MB27902EE9D77C83954361EE74DD150@BYAPR15MB2790.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:1186;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9uGZLCn6bJ7iw1O8hZyWJafB6uwSZNoHdDuhW0dKwq0L32TBcCOn+KUUKMYffrjZvsiZ3hXQiBm0pCnlZuDbK3SYwcU1mEmKO5we/ZJ3mtM/BFfNcCAh5fQMx3DmiSFKvVUrKW5O8p8idFy0gieE6n0VQnkAQm03T4zFftY/SyCA+Hbaiy6f01stHx0VMa+kA/ynpMW3P1LVA1VhDWhQCiG55upD1DSJRN7YUmUfIZ9GT086mklf9V7nmpMQmaEHXQ7k/7+MH7wpB78rBoL/xF7p1LVQc50yw4IFz2NoWXpG94YD/Y2OYOqydW4nmQtp6Ij3FNsf6dy406WBgzVqiw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR15MB3537.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(136003)(39860400002)(376002)(346002)(396003)(66476007)(5660300002)(478600001)(66446008)(4326008)(6512007)(83380400001)(6486002)(71200400001)(36756003)(33656002)(4744005)(6506007)(66946007)(66556008)(64756008)(76116006)(86362001)(186003)(8936002)(2906002)(316002)(8676002)(110136005)(2616005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: Cd1u3lBeWXqvuqYvbAAEjMkmDKpCjlCjEb9PlHnAS5NslDF4gRDnulT5VmiNp7dwCxVKkekizn+iDr7b429qJSB3+3z7TDaqtMwxZCiXsqwEq3kxo+F8VsgMPxWTtEd7zam/Or1ClRMsEVuTJJM+rUFWX35aHLMdEXEO6nscVZfI+tKJMbVUv+lHD0Rhi2wv0CbnwILyykYpEzL/fYQY2iyK6n4ZqhK5F7UH8B7vpICkn5xqZIDQQgOLEzk3EoT7Gd2EM6kv1JVQ559rrpf6fO6y3PxL40gMzIjRn4oUGl7TF0GBuYNPkQIByGDKR+CHsTO3ZQcrShw6QCkYhkOXNdkd2/9NhThI8deMAiZUyUQwTodmRJURd+mBd6wz82LzOygB/g6cPg6p9FxOM+6Uj/t37cmUFo9i+iABbojnQ3KUy2O2/Dzpketi6BQwbLG6b/9Dp50pWt/cPPJmIFgJ5gL6kbKzJyOULWnbJ7tzZrVRq+Rtw73whMJvB6nklcWLNhmKumFl47XNGmX2/3lwS6LlHwZH92+pw9glwTBMUa5aWThaCJBRibwcL9ArG9x1velqCleSN+9zteBDGnrZLGhX3lrJNCfE96MNDA0bja/kQr1AC4LaJdP50M+EYzYRUnDT1MKxyrL5bigso1mVVCYXUvRdC28Q06nwOLXVj6fqEp6FuDqxQTWm+jfLON/i
Content-Type: text/plain; charset="utf-8"
Content-ID: <1344FC7705C6A54D808E63F9DB9EAE68@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3537.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1205dc5-4378-45c1-1822-08d87c9b53a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2020 06:16:23.6861 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uEtttz8ZGBPCt5s27v5qveEmJsi6Bk5M3WmnAgPKwo8GIPUr2YF/xmGr/2/uML5LV6syPzDq/XBBWPwAHYQD4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2790
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-29_12:2020-10-29,
 2020-10-29 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxlogscore=999
 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1011
 suspectscore=0 phishscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010300047
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
Cc: Sai Dasari <sdasari@fb.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

SGkgSm9lbCwNCkEgcXVpY2sgcmVtaW5kZXIsIGNhbiB5b3UgcGxlYXNlIG1lcmdlIHRoaXMgcGF0
Y2ggaW4geW91ciBuZXh0IHJlbGVhc2UuDQoNClJlZ2FyZHMNCi1WaWpheQ0KDQrvu79PbiA4LzEz
LzIwLCAxMjowNCBQTSwgIlZpamF5IEtoZW1rYSIgPHZpamF5a2hlbWthQGZiLmNvbT4gd3JvdGU6
DQoNCiAgICBSZW1vdmVkIHZ1YXJ0IGZvciBmYWNlYm9vayB0aW9nYXBhc3MgcGxhdGZvcm0gYXMg
aXQgdXNlcyB1YXJ0MiBhbmQNCiAgICB1YXJ0MyBwaW4gd2l0aCBhc3BlZWQgdWFydCByb3V0aW5n
IGZlYXR1cmUuDQoNCiAgICBTaWduZWQtb2ZmLWJ5OiBWaWpheSBLaGVta2EgPHZpamF5a2hlbWth
QGZiLmNvbT4NCiAgICAtLS0NCiAgICAgYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWJtYy1mYWNl
Ym9vay10aW9nYXBhc3MuZHRzIHwgNSAtLS0tLQ0KICAgICAxIGZpbGUgY2hhbmdlZCwgNSBkZWxl
dGlvbnMoLSkNCg0KICAgIGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtYm1j
LWZhY2Vib29rLXRpb2dhcGFzcy5kdHMgYi9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtYm1jLWZh
Y2Vib29rLXRpb2dhcGFzcy5kdHMNCiAgICBpbmRleCAyZDQ0ZDlhZDRlNDAuLmU2YWQ4MjFhODYz
NSAxMDA2NDQNCiAgICAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtYm1jLWZhY2Vib29r
LXRpb2dhcGFzcy5kdHMNCiAgICArKysgYi9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtYm1jLWZh
Y2Vib29rLXRpb2dhcGFzcy5kdHMNCiAgICBAQCAtODIsMTEgKzgyLDYgQEAgJmxwY19jdHJsIHsN
CiAgICAgCXN0YXR1cyA9ICJva2F5IjsNCiAgICAgfTsNCg0KICAgIC0mdnVhcnQgew0KICAgIC0J
Ly8gVlVBUlQgSG9zdCBDb25zb2xlDQogICAgLQlzdGF0dXMgPSAib2theSI7DQogICAgLX07DQog
ICAgLQ0KICAgICAmdWFydDEgew0KICAgICAJLy8gSG9zdCBDb25zb2xlDQogICAgIAlzdGF0dXMg
PSAib2theSI7DQogICAgLS0gDQogICAgMi4yNC4xDQoNCg0K
