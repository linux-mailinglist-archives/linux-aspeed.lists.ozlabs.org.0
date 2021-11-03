Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 137B9443B2F
	for <lists+linux-aspeed@lfdr.de>; Wed,  3 Nov 2021 02:56:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HkVHM68zlz2xD7
	for <lists+linux-aspeed@lfdr.de>; Wed,  3 Nov 2021 12:56:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=SpurY3nB;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.132.134;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=SpurY3nB; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320134.outbound.protection.outlook.com [40.107.132.134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HkVH85Nypz2xCs
 for <linux-aspeed@lists.ozlabs.org>; Wed,  3 Nov 2021 12:56:01 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WaeVRFCUwb1BV0PdeJ5lz0nop8FY6NQqw+ZasC/klYW0U4lK29mCDq7hcs/4un3jiPaMJpr3e6XNJ3o0NwZYoR7FpyENiodjUdE/+9HTy1ZMIQ9CU+1yH21abYCVDvwuBAgB2vv8EAEvx1tFz1qfbtnu3xCI1hLLWdSIzMrbb7mzFwKNvVzDc2/0FsBPQSqwtFuHCoLo8ur5/77hMM+i9kPuNtxFw4KiNL5gXhNSJaOeOWINHrtMGOEFGBAirlwoI407jqMRaovXQag8HRlWJfis7f6HzFQQsQYB9dOA9T3ap5/qycJ/7B44gmse3HzC/POUhTphvFIk+Hnrb85ULg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FiPMQmmFb4qy7zXZKspKmPXTatwLt44S6Hxgvjn8TEY=;
 b=lw2TFXyIG1Jy90RtvMCrx1X6z/+5CxRlTPKs/TSRGbYNsD+NEDOE9i9k2JtS+EagHttGdUBjTiJ9LaRDPDpXKNEC+M9YIQjGuViJBsoqmu5WUUk1TF+uZTebnH3S3GVv7mAUpsIJ8EDt7XgeCKqh7uP5odDntFdwLhuZM9tt1c4Ay2B0KtNoQA9AEhf91jEZQjPGVeBNGE/v0TFgQ+BtxJZ8ViZblsH0sTVjRvxrMG6LMDaKHBwk3O7FXCIVf4Cu8RKqb2LI5LhEskYHmkEZBw69SFVwen9MwT2Qa6FAQqpNz7EfR2jsesIEHm1t8dLH4MXgrwGHoSHzRRe+RTEBNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FiPMQmmFb4qy7zXZKspKmPXTatwLt44S6Hxgvjn8TEY=;
 b=SpurY3nB6EayrGKqSI1UM5/5xKErorixsjFC+NjdaDyzyXlnCR/3Pfas0ViF4cboFWcgXTl1Lj4Yr76T1MoyCDCgTjb+fZMrj5AYJq2K7KWIhW8PoUDdfpO7EIbRfFWJJmkzIjcRGHDt6UsNGNKv3oeCxjeMUzNVVrByevjYwlc2kJY8+sLbzCWqbyMkEFfo6mO8gMgE+T2wgSykwRiuhqno2lL7Ximyj1fIUpVZuG/cuk4UPx8io/z+rwIUDjgRiE9bzKUfzrs3vhwu2E8cjb6sOL+paXtFgGqUuAVsEYCQLJcxfHQOzH1YemgPOLv1QwrRNb/jwB0wZqxE82pK3Q==
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com (2603:1096:203:b8::10)
 by HK0PR06MB2274.apcprd06.prod.outlook.com (2603:1096:203:4d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Wed, 3 Nov
 2021 01:55:42 +0000
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::f4aa:d005:b469:2a71]) by HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::f4aa:d005:b469:2a71%6]) with mapi id 15.20.4649.020; Wed, 3 Nov 2021
 01:55:42 +0000
From: ChiaWei Wang <chiawei_wang@aspeedtech.com>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Joel Stanley <joel@jms.id.au>
Subject: RE: [PATCH -next 4/4] ipmi: kcs_bmc_aspeed: add clock control logic
Thread-Topic: [PATCH -next 4/4] ipmi: kcs_bmc_aspeed: add clock control logic
Thread-Index: AQHXz3eMHFa1vZeuBUOQ1Q58VTwgpKvvjSAwgAAHeoCAANvEgIAAmx/Q
Date: Wed, 3 Nov 2021 01:55:41 +0000
Message-ID: <HK0PR06MB377977167B4AD45BF9775349918C9@HK0PR06MB3779.apcprd06.prod.outlook.com>
References: <20211101233751.49222-1-jae.hyun.yoo@intel.com>
 <20211101233751.49222-5-jae.hyun.yoo@intel.com>
 <HK0PR06MB3779F8E273396ED805EE5D81918B9@HK0PR06MB3779.apcprd06.prod.outlook.com>
 <CACPK8XesLdb+Cbi3ZYrOahRHbXQi3L=cQXax=RV2=PrjiPQBew@mail.gmail.com>
 <edaeb540-aa31-d143-4320-cb2a73f0070f@linux.intel.com>
In-Reply-To: <edaeb540-aa31-d143-4320-cb2a73f0070f@linux.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none
 header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9069b4ea-0f64-4097-4073-08d99e6d0aee
x-ms-traffictypediagnostic: HK0PR06MB2274:
x-microsoft-antispam-prvs: <HK0PR06MB22744310C163036EEC52DF46918C9@HK0PR06MB2274.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 98LtMlTjzfVyR4F/fU3EiSn5D+EK+yj5Lq1lm+gMODCNKCE86cQj0OkJiwlzgJiTYcA+fn5uM42FPbjXkCPhG36oyX7t/jryPZaN5f1ohtFF2MWRJucst4FYUD0+SyBozZkL0a+mfjSJZb2kQDAqQkoi25q8Zg0dfyXWqy4iOYRQdr5RoacmjQlsKmj6ruM13sRqiHdpKJEQ101GyHDOmmeExO8lAKMCSVPzSVzPSILHkcKgHR+o3WH4eT9+a3ArckrqNaaiqCYyCieEom+RYGSQkecdjm8rErTaEOqXn0Jxxv0f+snEhiuv6oMRQU7xm7O0JkOFfk5J5oeZ9+24Iupajo3a0EKtdDfjV1SCdsXVwAYTs5iSkuYRhgCPAfzTmQbKYYuACFLk7K8rerRlbfUyUvsqreJ6d6tCSo8YCw7wVBxPb1FZ36bUTELDRBJO3LAhS12vU+i2MP8rMtpEC0Ou5V7X5/InOI+yt3c6w3q+aZw5s1dTL2Q/jl+w7hdxBVzb98sUFism+pAdypq4UJi+7/yhc+ULWXOnP/D2v1noU+6mvUM0iLJIC9gDWUVZQsNGrm6xrxZ6eErY2h0W9x/WqncjtM+37UqvH85xWKW5s+Y7QuOlaAvyqw+hOZM8JcOjOufto+TqmGUJz3HQOc0rxAdx5l0w1/wCT4W+daN1UQxRMT6ExkLw2OhozVwtcT6i4XOfuP9DrJ+z335ubCwmGKybK2jb6ISo5Ka/lI3nF37r6RkuIOMEPEN/ye3Fv7kYwpE0WHDPBhnls14iIqLZyaxXy4Vae//F/wB0DWLyAXMfc66M4ER70jnuC3IbNjjzYZ4iXzae0+OVnb5X6A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3779.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(346002)(39850400004)(136003)(376002)(396003)(53546011)(122000001)(966005)(33656002)(5660300002)(66476007)(4326008)(107886003)(66556008)(64756008)(83380400001)(71200400001)(66446008)(55016002)(8936002)(38100700002)(76116006)(66946007)(38070700005)(8676002)(508600001)(9686003)(2906002)(7696005)(52536014)(110136005)(26005)(7416002)(186003)(86362001)(6506007)(316002)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V20yTy82djVjWW5vZE1yM2c5WDJsZHRTQkp3eEtWSkJValVmU2l1bWVDYm5z?=
 =?utf-8?B?ZlpKelV4Wk4rdHdRN0paQWxHMnk0QWF0NTM3bmpvWWxwODFIL0lYR01DT1hR?=
 =?utf-8?B?d25mRjRFNk5DRitRdnB1ZEtON2N5VTN6dFRHRGpBYzlpNzh0Um5jUFk5aUx4?=
 =?utf-8?B?Z2ZwZ2R2Wlc3MFF0UmM5RzZ4aE8zcHJ0OXB6U1dUQzc2MXVrNGdFSlo4UVF1?=
 =?utf-8?B?cVAreEw0TWlidHNiMTJkRUI0SHNKTnVDRHBydHRKUGE1WmsrWVB6UGVoY05P?=
 =?utf-8?B?KzA1S0JoZjlRZmFaZFJId3dDSUR2ZHFSbGM3dTZYZHNMVzRyQmgwMlVpLzRr?=
 =?utf-8?B?S1hqZjBUQnpiT0tQRlhZdmVhdkQ0cGVDb0NKOEg3UkNueGFkQVYxdTJ1Z1lG?=
 =?utf-8?B?TFZrbjBHUjgzTTdsRzBxU0RvQk9PNEJyMUxmNFVpVk5PQ3lPejBFWHZueXRH?=
 =?utf-8?B?bVdhT2wzc2svZUdSUU0rWUFOelJFa05Eb1pRSkwvOXpKMHJOQnVUYmIrbnVE?=
 =?utf-8?B?UWxsbUc0Vzd5R1lZbStjeFdxQnhjYVFBbXBTUUpHRUxGd3diOG9YdW1BRlJq?=
 =?utf-8?B?aHk4MFIzejZaLzBPYi96aTRENzVlbVNHZmt2WUxzWnMvWUdkTDFHR1FiMnJC?=
 =?utf-8?B?bEhvQUdTNlppMjdpTnZMTExVYkVIbFZER2VCM2xoOGR2RGxZeFM3c1BHaU84?=
 =?utf-8?B?SlBMQmxlOUd0SDFES3doUTFWa0RtWSs3OFhtMEZwTkRNdEljQ3JPK1pZRFo0?=
 =?utf-8?B?TkZ1c3NLS3h2YlNJQnRtMmx0N0dSNXEzQS91bEZvYkxVYzJXYnBTb21Yc0l2?=
 =?utf-8?B?N3pvdmRLWW5EOTB4TDdCZUlCRzAwNHpMZGxLd0hPRzNjbUQ5czRRTCtaaG05?=
 =?utf-8?B?M2duQWd4c2g3c25URExjU2V2ckUxSktMMExDbmJJaGd6ZVNIWndscExpY1hw?=
 =?utf-8?B?U2FReVpJaVJ1WWxZbzliWThwNkJ1RUo5bCtvaUh4ejY3bHdsbmlINHUvUHpD?=
 =?utf-8?B?YTM4eHE2bHBMZ3JHREl6UUV0Zk1zb3Q5NGF0K2lnL3RrTVNMTlRvMHFYN1dz?=
 =?utf-8?B?MjFKMmFTeDBUQ2J3c01vVjF4NThBSG1qVCtjOHFzREUyNzJSVzc0MExzRjdq?=
 =?utf-8?B?V2sxSXliallIYzdzVFgrWENZQVJTOVVaaGY5cUVhaWRQa0tIcmQ2RlQyQ0tK?=
 =?utf-8?B?S3NaYmowZ1ZDeWhnZVlGcC9KNFJLU2FDdm82clJ5SVpZaU9ISVN1N2VvT3VX?=
 =?utf-8?B?czRKbHBxNmFSbnJtcjlGM091WFBaMGpHZGt2cUErSVhxaDN3MWRPMUtzdmZq?=
 =?utf-8?B?cHd3K0N0RTdGQ1NVZ2p3WVBLMkNsVFVGaktIR1k0S2tMYTF1eGRLcFJDVUVH?=
 =?utf-8?B?UE13RGRBNnJpdkFWbjRMbUpxUUVDLytYQjFXN3Vwd1Y0cFR4RDBxSUswTE9T?=
 =?utf-8?B?VW5zNllldUM3UTV2Qkdla0RBRDNNWDdFK21MdHYySVlocWF4Y2tQeWlGRW9p?=
 =?utf-8?B?SFlJc0tyeDRrZVgraHFKQTlWNlN5dHdHS0x3cjhIeXRKcWhHeWhVRTBDZDhw?=
 =?utf-8?B?M2o1RUJ0d0oxVGs0WmovVTdyRWhHT2cyNXVOU0pTbFNjYWFEYUFQRU9lYVFj?=
 =?utf-8?B?UUppUjVrdWxVcnpjdHN4ZTAzQks4QSsrbTNqK0VJZGhSM1NLOTFpN3oxYnNN?=
 =?utf-8?B?WlAyb2ZPQlUwTC9IbTBJTFZ4cGI4R0FvZFltZjkwaDk4Q2dOUlZEVWRpRmQz?=
 =?utf-8?B?cmhYRjdhc0JhUVg2bGtteDI2QmgwZ1o0WllpZlBLMCtWd25WS0kyNDZ5ZVdt?=
 =?utf-8?B?VkVEQnEwSzVtVlR2YlhBZ1lQdkJTeFlBN1Z3LzNORmt2RlVqc1BTSk5xZFlC?=
 =?utf-8?B?MUZnemVGVEN3cWZqeG55OXE1QTlITnJzS2VNQWpJQzJ1UXhMNS9jelVWMmkw?=
 =?utf-8?B?NEUzQ2FQQlFQUjRwNEs2YVM0SW0wNDdnbkl6YmtVZlBsb0d2c0p0T0ZnU1Z4?=
 =?utf-8?B?UkV5SkdSdlhYYVdFcksyY3dydkVyaEV6bkxLYk9vT0pHd0NCcVpTOS90ekxO?=
 =?utf-8?B?dWYxeno1bWlPYUo4bm11eml3dVlQVm1BcnRsdjNTNmVPNUY3bW01TjB6clhX?=
 =?utf-8?B?TjNyYnQ4MmNibE4wc2N2dEl2VlUrYXlZTW5lMDhTYmtWT1hwK3R2ZWRIS0FB?=
 =?utf-8?B?OFFRZklIVmhuZ09ocU1talBZWDMwRlprd1c1RlZLOVB2aG9NRENoZE9BVm96?=
 =?utf-8?B?ekd6cmJ2TzJHRnJMVWZNSVBKejNBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3779.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9069b4ea-0f64-4097-4073-08d99e6d0aee
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2021 01:55:41.9247 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lBG7nOrtr0wz7murEUjga9AqHNIOdqeJd4Hemz3G2X+3uwbqHow2z54zSR6RBv9WAqkJ3GYFUk5Gv48CnU1WPwklPdMIwCXnFcnugueX4t0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2274
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
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 Corey Minyard <minyard@acm.org>, Rob Herring <robh+dt@kernel.org>,
 "jae.hyun.yoo@intel.com" <jae.hyun.yoo@intel.com>,
 Cedric Le Goater <clg@kaod.org>, Jenmin Yuan <jenmin_yuan@aspeedtech.com>,
 "openipmi-developer@lists.sourceforge.net"
 <openipmi-developer@lists.sourceforge.net>,
 Haiyue Wang <haiyue.wang@linux.intel.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

PiBGcm9tOiBKYWUgSHl1biBZb28gPGphZS5oeXVuLnlvb0BsaW51eC5pbnRlbC5jb20+DQo+IFNl
bnQ6IFdlZG5lc2RheSwgTm92ZW1iZXIgMywgMjAyMSAxMjozNiBBTQ0KPiANCj4gT24gMTEvMS8y
MDIxIDg6MjggUE0sIEpvZWwgU3RhbmxleSB3cm90ZToNCj4gPiBPbiBUdWUsIDIgTm92IDIwMjEg
YXQgMDM6MTYsIENoaWFXZWkgV2FuZw0KPiA8Y2hpYXdlaV93YW5nQGFzcGVlZHRlY2guY29tPiB3
cm90ZToNCj4gPj4NCj4gPj4gSGkgSmFlLA0KPiA+Pg0KPiA+Pj4gRnJvbTogbGludXgtYXJtLWtl
cm5lbA0KPiA+Pj4gPGxpbnV4LWFybS1rZXJuZWwtYm91bmNlc0BsaXN0cy5pbmZyYWRlYWQub3Jn
PiBPbg0KPiA+Pj4NCj4gPj4+IEZyb206IEphZSBIeXVuIFlvbyA8amFlLmh5dW4ueW9vQGxpbnV4
LmludGVsLmNvbT4NCj4gPj4+DQo+ID4+PiBJZiBMUEMgS0NTIGRyaXZlciBpcyByZWdpc3RlcmVk
IGFoZWFkIG9mIGxwYy1jdHJsIG1vZHVsZSwgTFBDIEtDUw0KPiA+Pj4gYmxvY2sgd2lsbCBiZSBl
bmFibGVkIHdpdGhvdXQgaGVhcnQgYmVhdGluZyBvZiBMQ0xLIHVudGlsIGxwYy1jdHJsDQo+ID4+
PiBlbmFibGVzIHRoZSBMQ0xLLiBUaGlzIGlzc3VlIGNhdXNlcyBpbXByb3BlciBoYW5kbGluZyBv
biBob3N0DQo+ID4+PiBpbnRlcnJ1cHRzIHdoZW4gdGhlIGhvc3Qgc2VuZHMgaW50ZXJydXB0cyBp
biB0aGF0IHRpbWUgZnJhbWUuDQo+ID4+PiBUaGVuIGtlcm5lbCBldmVudHVhbGx5IGZvcmNpYmx5
IGRpc2FibGVzIHRoZSBpbnRlcnJ1cHQgd2l0aCBkdW1waW5nDQo+ID4+PiBzdGFjayBhbmQgcHJp
bnRpbmcgYSAnbm9ib2R5IGNhcmVkIHRoaXMgaXJxJyBtZXNzYWdlIG91dC4NCj4gPj4+DQo+ID4+
PiBUbyBwcmV2ZW50IHRoaXMgaXNzdWUsIGFsbCBMUEMgc3ViIGRyaXZlcnMgc2hvdWxkIGVuYWJs
ZSBMQ0xLDQo+ID4+PiBpbmRpdmlkdWFsbHkgc28gdGhpcyBwYXRjaCBhZGRzIGNsb2NrIGNvbnRy
b2wgbG9naWMgaW50byB0aGUgTFBDIEtDUyBkcml2ZXIuDQo+ID4+DQo+ID4+IEhhdmUgYWxsIExQ
QyBzdWIgZHJpdmVycyBjb3VsZCByZXN1bHQgaW4gZW50aXJlIExQQyBibG9jayBkb3duIGlmIGFu
eSBvZiB0aGVtDQo+IGRpc2FibGVzIHRoZSBjbG9jayAoZS5nLiBkcml2ZXIgdW5sb2FkKS4NCj4g
Pj4gVGhlIExQQyBkZXZpY2VzIHN1Y2ggYXMgU0lPIGNhbiBiZSB1c2VkIGJlZm9yZSBrZXJuZWwg
Ym9vdGluZywgZXZlbg0KPiB3aXRob3V0IGFueSBCTUMgZmlybXdhcmUuDQo+ID4+IFRoZXJlYnks
IHdlIHJlY29tbWVuZCB0byBtYWtlIExDTEsgY3JpdGljYWwgb3IgZ3VhcmRlZCBieSBwcm90ZWN0
ZWQNCj4gY2xvY2sgaW5zdGVhZCBvZiBoYXZpbmcgYWxsIExQQyBzdWIgZHJpdmVycyBob2xkIHRo
ZSBMQ0xLIGNvbnRyb2wuDQo+ID4+DQo+ID4+IFRoZSBwcmV2aW91cyBkaXNjdXNzaW9uIGZvciB5
b3VyIHJlZmVyZW5jZToNCj4gPj4gaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMjAvOS8yOC8xNTMN
Cj4gPg0KPiA+IFBsZWFzZSByZWFkIHRoZSBlbnRpcmUgdGhyZWFkLiBUaGUgY29uY2x1c2lvbjoN
Cj4gPg0KPiA+DQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9DQUNQSzhYZEJta2haOG1j
U0ZtREFGVjhrN1FqN2FqQkw4VFZLZks4Yw0KPiArDQo+ID4gNWFuZVVNSFp3QG1haWwuZ21haWwu
Y29tLw0KPiA+DQo+ID4gVGhhdCBpcywgZm9yIHRoZSBkZXZpY2VzIHRoYXQgaGF2ZSBhIGRyaXZl
ciBsb2FkZWQgY2FuIGVuYWJsZSB0aGUNCj4gPiBjbG9jay4gV2hlbiB0aGV5IGFyZSB1bmxvYWRl
ZCwgdGhleSB3aWxsIHJlZHVjZSB0aGUgcmVmZXJlbmNlIGNvdW50DQo+ID4gdW50aWwgdGhlIGxh
c3QgZHJpdmVyIGlzIHVubG9hZGVkLiBlZzoNCj4gPg0KPiA+IGh0dHBzOi8vZWxpeGlyLmJvb3Rs
aW4uY29tL2xpbnV4L2xhdGVzdC9zb3VyY2UvZHJpdmVycy9jbGsvY2xrLmMjTDk0NQ0KPiA+DQo+
ID4gVGhlcmUgd2FzIGFub3RoZXIgZm9yayB0byB0aGUgdGhyZWFkLCB3aGVyZSB3ZSBzdWdnZXN0
ZWQgdGhhdCBhDQo+ID4gcHJvdGVjdGVkIGNsb2NrcyBiaW5kaW5nIGNvdWxkIGJlIGFkZGVkOg0K
PiA+DQo+ID4NCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzE2MDI2OTU3NzMxMS44ODQ0
OTguODQyOTI0NTE0MDUwOTMyNjMxOEBzdw0KPiA+IGJveWQubXR2LmNvcnAuZ29vZ2xlLmNvbS8N
Cj4gPg0KPiA+IElmIHlvdSB3aXNoIHRvIHVzZSB0aGlzIG1lY2hhbmlzbSBmb3IgZWcuIFNJTyBj
bG9ja3MsIHRoZW4gSSBlbmNvdXJhZ2UNCj4gPiBBc3BlZWQgdG8gc3VibWl0IGEgcGF0Y2ggdG8g
ZG8gdGhhdC4NCj4gDQo+IFdlIGFyZSByZXZpc2l0aW5nIHRoZSBhZ2VkIGRpc2N1c3Npb24uIFRo
YW5rcyBmb3IgYnJpbmdpbmcgaXQgYmFjay4NCj4gDQo+IEkgYWdyZWUgd2l0aCBKb2VsIHRoYXQg
YSBjbG9jayBzaG91bGQgYmUgZW5hYmxlZCBvbmx5IG9uIHN5c3RlbXMgdGhhdCBuZWVkIHRoZQ0K
PiBjbG9jayBhY3R1YWxseSBzbyBpdCBzaG91bGQgYmUgY29uZmlndXJhYmxlIGJ5IGEgZGV2aWNl
IGRyaXZlciBvciB0aHJvdWdoIGRldmljZQ0KPiB0cmVlIHNldHRpbmcswqBub3QgYnkgdGhlIHN0
YXRpYyBzZXR0aW5nIGluIGNsay1hc3QyNjAwLmMgY29kZS4gU28gdGhhdCdzIHRoZQ0KPiByZWFz
b24gd2h5IEkgc3RvcHBlZCB1cHN0cmVhbWluZyBiZWxvdyBjaGFuZ2UgZm9yIG1ha2luZyBCQ0xL
IGFzIGEgY3JpdGljYWwNCj4gY2xvY2suDQo+IA0KPiBodHRwczovL3d3dy5zcGluaWNzLm5ldC9s
aXN0cy9saW51eC1jbGsvbXNnNDQ4MzYuaHRtbA0KPiANCj4gSW5zdGVhZCwgSSBzdWJtaXR0ZWQg
dGhlc2UgdHdvIGNoYW5nZXMgdG8gbWFrZSBpdCBjb25maWd1cmFibGUgdGhyb3VnaCBkZXZpY2UN
Cj4gdHJlZSBzZXR0aW5nLg0KPiANCj4gaHR0cHM6Ly9saXN0cy5vemxhYnMub3JnL3BpcGVybWFp
bC9saW51eC1hc3BlZWQvMjAyMC1KYW51YXJ5LzAwMzM5NC5odG1sDQo+IGh0dHBzOi8vbGlzdHMu
b3psYWJzLm9yZy9waXBlcm1haWwvbGludXgtYXNwZWVkLzIwMjAtSmFudWFyeS8wMDMzMzkuaHRt
bA0KPiANCj4gQnV0IHRoZXNlIHdlcmUgbm90IGFjY2VwdGVkIHRvby4NCj4gDQo+IEFuZCByZWNl
bnRseSwgU2FtdWVsIGludHJvZHVjZWQgYSBiZXR0ZXIgYW5kIG1vcmUgZ2VuZXJpYyB3YXkuDQo+
IA0KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMDA5MDMwNDAwMTUuNTYyNy0yLXNh
bXVlbEBzaG9sbGFuZC5vcmcvDQo+IA0KPiBCdXQgaXQncyBub3QgYWNjZXB0ZWTCoHlldCBlaXRo
ZXIuDQo+IA0KPiANCj4gQ2hpYXdlaSwNCj4gDQo+IFBsZWFzZSByZWZpbmUgdGhlIG1lY2hhbmlz
bSBhbmQgc3VibWl0IGEgY2hhbmdlIHRvIG1ha2UgU0lPIGNsb2Nrcw0KPiBjb25maWd1cmFibGUg
dGhyb3VnaCBkZXZpY2UgdHJlZSBzZXR0aW5nLiBJIGJlbGlldmXCoHRoYXQgd2UgY2FuIGtlZXAg
dGhpcyBwYXRjaA0KPiBzZXJpZXMgZXZlbiB3aXRoIHRoZSBjaGFuZ2UsIG9yIGl0IGNhbiBiZSBt
b2RpZmllZCBhbmQgYWRqdXN0ZWQgaWYgbmVlZGVkIGFmdGVyDQo+IHRoZSBTSU8gY2xvY2tzIGZp
eCBpcyBhY2NlcHRlZC4NCg0KVGhhbmtzIGZvciB5b3VyIGZlZWRiYWNrIGFuZCB0aGUgaW5mb3Jt
YXRpb24gc2hhcmVkLg0KV2Ugd2lsbCBrZWVwIHRyYWNraW5nIHRoZXNlIGNoYW5nZXMgYW5kIGNv
bnN0cnVjdCBhIGNvbXBhdGlibGUgcGF0Y2ggZm9yIHRoZSBTSU8gY2xvY2tzLg0KDQpSZWdhcmRz
LA0KQ2hpYXdlaQ0K
