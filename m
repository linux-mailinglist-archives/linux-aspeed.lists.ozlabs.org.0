Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5770559456
	for <lists+linux-aspeed@lfdr.de>; Fri, 24 Jun 2022 09:47:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTq315CrZz3cB8
	for <lists+linux-aspeed@lfdr.de>; Fri, 24 Jun 2022 17:47:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=oQAK2zGL;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=40.107.117.93; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=neal_liu@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=oQAK2zGL;
	dkim-atps=neutral
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2093.outbound.protection.outlook.com [40.107.117.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LTq2p6rfNz3c00
	for <linux-aspeed@lists.ozlabs.org>; Fri, 24 Jun 2022 17:47:13 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ntHsFTdFKb/dWDLmBS9XiU/urOKtogLfews0J1BuattNUT1DFmfmCv1l14q7XQdawYHtkXtLl9CsKE7VDz4IBlPZhOczGID6JpsoqmQfkdSXIGEHvANuzJnmthD8qdA1DtrbZi5ehfAiUEi5hARn3khV8YuwPiVLCu/m+64gW4Hvm4eoRhX811JK5kihTRF0wgW8ITYLj67cpEB5aq0Jm2K8D6FzXW6g1nEmmBrHxSa9snZlDJ/Y2WjKiXghgOWnkSmLNByTqyWQTICDzwnWU7Zg3vt9DjGw6VPCpeLQID8TO8M7qxXdi2+zAmXvQOdcT7gnhf/ycnp1t+ZX//tF0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ifrMUWYuTcUFizYE2VGDj5dEbv/qNvdqhEQUiwmRJoc=;
 b=axrGuYxnB4qHP60DGvTnKCWXheKQHH3n49sxo/vlwHT27eMyuixw3FVwWZOnrZliucPyMhttDYlLScmD8jbZMqC/Xvigaop2tH7pvHLzoG1feA5A8jg0AlmyRa3UF9a1eU1dNU+ThCck4lnLvu4JRPMTfvcrVo7zQESgrNCicAAVGBKV9mRMqlByoB/SjdmhkqmxnTfFpTsTuHUqqBooP1nBLIYgyGsH4R7/q9vle2nXCJtDFRdatPSR7nOusW3CGrPznF/MqptA9q7H3ZJw8nWajYqrn2bc1RNGR/G6Ly3YF1vSKUrGW5gCjFIswYlzhBBfUeuRN5cJWPyfdrO6tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ifrMUWYuTcUFizYE2VGDj5dEbv/qNvdqhEQUiwmRJoc=;
 b=oQAK2zGL4DocOHoOQX4UGAbtv0DG3V86lsFL+Mv75KQBNGfwTU2/ICHowwdMsjjZS7xSjzY2Oy63FSwD5y4FbHjuO6oyhlW4jmvZ0WGbskGyuPv+BOUUQSB5XoEDOqG0ObSWQupcie8pkTQp1+fehK2n8U91F9QsgE9FQc5Xf5MUys9yO5bkjqd//w3H+i2t75TjmxhLBXOtVgGhR5SmIXVaXIs3zgI17CKbtfICFq+6ufYTrcUxkjFQAUFKfgknDQGW34uGuajT5RyW9C4jMvqGLAUpE4GQBomOlhUsUE0XYeBU/KBQPIDEzOY3FBd4DZUQgp6zya8JcwI0tJiYww==
Received: from HK0PR06MB3202.apcprd06.prod.outlook.com (2603:1096:203:87::17)
 by SI2PR06MB4457.apcprd06.prod.outlook.com (2603:1096:4:154::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Fri, 24 Jun
 2022 07:46:51 +0000
Received: from HK0PR06MB3202.apcprd06.prod.outlook.com
 ([fe80::46d:a7a:f047:e9bf]) by HK0PR06MB3202.apcprd06.prod.outlook.com
 ([fe80::46d:a7a:f047:e9bf%5]) with mapi id 15.20.5353.022; Fri, 24 Jun 2022
 07:46:50 +0000
From: Neal Liu <neal_liu@aspeedtech.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Dan Carpenter
	<dan.carpenter@oracle.com>
Subject: RE: [PATCH] usb: gadget: aspeed_udc: fix handling of tx_len == 0
Thread-Topic: [PATCH] usb: gadget: aspeed_udc: fix handling of tx_len == 0
Thread-Index:  AQHYhkeMr7IZN0wRcEahtwSU6oJwdq1cN3kAgABVBQCAAYsegIAABN+AgAABXQCAABEX0A==
Date: Fri, 24 Jun 2022 07:46:50 +0000
Message-ID:  <HK0PR06MB32024B6C49E2C958185E005280B49@HK0PR06MB3202.apcprd06.prod.outlook.com>
References: <YrMsU9HvdBm5YrRH@kili>
	 <HK0PR06MB32023259EBD6B4C649C62E8280B59@HK0PR06MB3202.apcprd06.prod.outlook.com>
	 <20220623064320.GN16517@kadam>
	 <e0b1c201bec2ccb68d1779ea8e9cfdf27563dd73.camel@amazon.com>
	 <20220624063457.GG11460@kadam>
 <46f88070d8f6f47f55310e964a4576cadbc810f4.camel@kernel.crashing.org>
In-Reply-To:  <46f88070d8f6f47f55310e964a4576cadbc810f4.camel@kernel.crashing.org>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 04efbfb0-4b6d-43fd-5387-08da55b5b2fe
x-ms-traffictypediagnostic: SI2PR06MB4457:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  nCwW3koojqJC9aHMCIv2AWBaaSnSyNFyTTIZ8lpCGTWn3LBasB3WTWGH8JhrDUIYVtcpNCKWmYzKGVbUzZwM2Zx1oTWskE8eXBP3NIwr+JnreXo3tGN98JtmCsYhC3vlGBCtnbGL5Va8DcXdUxDAH2kaccWc1Rrpc05Wn+qEB40xb/inmk0WTN5mVojzpto1kWH4SGfhflQgEvntyHpD3HK0oy3yxlIapeXwe4iS1qACbaM6zBudY1b8aFqQX9zhUjTk0Aq0foCMQGrk8s5TmfTewNWn9brUqJyVUvyaK0pRtbgHLaxiWDVRUgmM4jgGQaylkXzGlODNumkKmxecF4D+lgjMBc5//BSMY0OaewWy8724u1e3O3V/e0mJ5c6TuHVTafrvmqOOA1s49gSpTTYDvgGXZF5yn3FX3Q8dp6mQSlSU9/CPGDVOW4FFBaISzvBmmL6fWbhNxPKuChu1eUP8angnZL7Q3QNQJrUdGgx4HTGu4K0xzKdYWMHUnnowKkMLgHim2oWxG1mHJAiKpkyXgGXtkl4liuO0/5nRXZPT3RCZ9H1Y7CLD/6JJtpRAEhDD0lmbdYOrv6/yyyb5vjhWPl+l/0Ux0Da72LAPt/gAosh4S/JY/lWyAzc26jeB2n+3fheTE+z16QPfXMDl2CsDuQ26XIUH9dj4dxdzPE/QrvdKGMF18KcQuMs+bdK9D2JbNCxkJMocO/MORNw0Q1hvmhFbYNW1RsYQofS23dyZ1m739jaj46FajrT43dZuCt0LYkfhqED8P9+CZNtF6os90ptfWeplZeWzjW4pgIM=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK0PR06MB3202.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(396003)(346002)(366004)(136003)(39850400004)(55016003)(64756008)(76116006)(38070700005)(83380400001)(33656002)(38100700002)(66556008)(478600001)(66476007)(122000001)(5660300002)(6506007)(2906002)(26005)(7696005)(41300700001)(186003)(52536014)(86362001)(8936002)(66946007)(110136005)(71200400001)(8676002)(66446008)(4326008)(316002)(9686003)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?blE2ZEZlMjRCWHlXTEVDWDlzdmtQa2lqdmFtTm5MQUpLb2xqMG51S0VnQ2tj?=
 =?utf-8?B?OHY3V0l5NXR4azN5SDRWd0Z2ODV0NUN2QWdLWTlaVSsyZE5haUl2d0c3TDUr?=
 =?utf-8?B?bWRIclFvMnYwWkdTZkRDSFEraEJFdUNTZFZkWHVhblhYM29KY1ErcHR1UjZh?=
 =?utf-8?B?dnNVMUJkL1IvNWxBV3NQd1ZRUUZlR3JhdDFVZHJnL0VqdDJMaTBmT0hmT01t?=
 =?utf-8?B?QkFnUENnbEdpbnJqUGhKWnhPbU1NemZTa2hSYldkbUEweWMydUxOci9zai95?=
 =?utf-8?B?dmxzUmZKMitHZUJ1OGJMcjREQ1Q5TG8zUVNvNHJwQ1NCeVM5TzhRRzlUQXRq?=
 =?utf-8?B?S1czNTVnNVpEYk1Ba0dNanNjcmFGcFpLWFNSeGpUQ1Z1ZnZLdzJ5ZXBJSEZQ?=
 =?utf-8?B?eXhMMWhZbXFmZVNRZTZTTURmaEd4ejQ5cHc4ZWVlZFhnRUtZcmVoMVFNcmhv?=
 =?utf-8?B?MG0yU29LK0NaV0hIenpiSXVwalpuUWJWYzlDRTlUUnpJY3NhMVRnbzZ5OGN6?=
 =?utf-8?B?WUFYNEJXSDJxQjBuVHpKMG9pQkthQXNWVno0TlhqaWs1VjBRN00yREg3cG1y?=
 =?utf-8?B?ajg3TjE4aGl1c1RNcEVUcEJOcGdWSkhCQmJlSWFmNDduWlFFNk9NN2RISDNj?=
 =?utf-8?B?SDNVNlh3OXRJaWhGeCt5eldzS3RrVkhNNGovWnQzc0lDR3RocXU4TkI5S1pa?=
 =?utf-8?B?ajQrb1RUeStSZXVyWUg3Uk1uUUlHdG5JOFM1dGE4T3duNHZDcVBCTlJxMVNG?=
 =?utf-8?B?dW45U2JUdDhTNzd2TWx4TERvNVM4NVNUSXNXTU1uVGdGTDhtUVBiTWs0WG5n?=
 =?utf-8?B?ZnJMOUhXY2p2bVdmeXR0VEtkcjl3R3hHUXdWSGJ4cVZBY0toS2YzS3NQU1Iz?=
 =?utf-8?B?UXZ4bGN3VDBiQUZLUjZ6NVUzS0dXVEQ3ZTVqbEdCejBCTjIxcGNKQTd2Z3M0?=
 =?utf-8?B?K2dhd3pLbVpvQksvd3pFaWZRY0FGQ2lGNDJ6WXZDaDQ1YjNuVUNFU0tudFZv?=
 =?utf-8?B?Vnhib3pxbXVHaXJLY1VQZTF6cENwc3hFN3pjNEswUnBLUVRPMGlEVGxCdzQ3?=
 =?utf-8?B?M1dheGJsNDBnYnV5U2lzMGJ4Wlk2dFF1UjhDOFFlTGRPSW85WHB1RzRjR1JS?=
 =?utf-8?B?UHhibXNudmJVd1FQVFpTbHg2UDJoem1BSDUwNkIrUGxWRUhOWUJmQlY0NGNG?=
 =?utf-8?B?QjhVZzJIM0E4L3VYSzRGc1RlV1doRW1xOU55cGEzVjJVTmFUMW9nY21rVFlC?=
 =?utf-8?B?YmgzUVIwRW96UmtBOHdSQTBMSGJONVhpVFVEL0pQeDRLQ1pYTDZYZTVIVkhq?=
 =?utf-8?B?SHhnS3RTUXUrV00vTWsrU1h3NnU2OHNuRFNURWlwd1V6TnVseHFTcVFGSWE1?=
 =?utf-8?B?Q3VVaVhCM3U5dnd5YzYydzZtb2VtSy9tdWVPTGd5MHd6VnFqZlRGYnVCYzYr?=
 =?utf-8?B?bFlRTVRBWEQxWnhlb2lxbEN2NVN4QnhiVXk5eXVkVFN4OUJ1ZFRBdHQ1Zzg5?=
 =?utf-8?B?TGdDQVlCc0diWWQ4Q3MrRVp2MEpWQmdoaHlFV01wOVFLa24wenV2VW42d3V0?=
 =?utf-8?B?Zi82aGJzQ2JCbDFjaXB5cG1XbTV2eWQyeElIOWR0ckxkVUJFbW9ISDQyL29i?=
 =?utf-8?B?Y2luL3FzNjBnM2oxRUZXRFVhd2w3aHpDaDM3cUkzbmxULzZMdTYrUkl6OTU3?=
 =?utf-8?B?R0ZGNmwrSTQrSXU4NkI3ZW1IclI4MW90Zlo1eFZCcDJUTndyaHY2M2huaHU2?=
 =?utf-8?B?ZWhpMnZzdVpVU3BOOXFMR1N5SlJ4cTRLdmNBUC9OdE1xMk5aYm5OU0VvWTcy?=
 =?utf-8?B?N09ydjdMbTlaN25DaEI5N0tkV0NCWm1FMUlGenFpeWNzZU1CdHZYOTZ2Ymo2?=
 =?utf-8?B?cFlobHQ3WGFzTmt3V2xXeEE0N3Y3ODN6NmdIMXRXcmRIQTNYVG1PYU14VWRX?=
 =?utf-8?B?b3p4NTYyYUhoTFJmOE5aUWx2ZlEzN1gyNERyUGVVRzA5eFRQK2F5MmNqd2lR?=
 =?utf-8?B?TEhBOURiZ1JGdkJKMnFPK1JUUVZiQkpKMWZIMWdHVWQwY3RZY0tncVdNVjBQ?=
 =?utf-8?B?RFg1eVhxalNtTWhtbkYwbHo4UVNaUzdHM2dSbHk0bERmVFBMVjNuazJHczh2?=
 =?utf-8?Q?JqGwybTqF9mo4oEmIVI/5OUJf?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3202.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04efbfb0-4b6d-43fd-5387-08da55b5b2fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2022 07:46:50.6487
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WLiTlMRjYBOdhGvLHPV5+r3RRJCY+Cpy62tH6crD9Mz95ch95fb+venUkeqHqfpHk0iYlf4SfQSr1OLfi2ns8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB4457
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
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "balbi@kernel.org" <balbi@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

PiAoc3dpdGNoaW5nIGJhY2sgdG8gbXkgbm9ybWFsICJjb21tdW5pdHkiIGVtYWlsKQ0KPiANCj4g
T24gRnJpLCAyMDIyLTA2LTI0IGF0IDA5OjM0ICswMzAwLCBEYW4gQ2FycGVudGVyIHdyb3RlOg0K
PiA+ID4gSHJtLi4uIHdoYXQgaXMgdGhhdCBkcml2ZXIgPyBJJ3ZlIG1pc3NlZCBpdCAuLi4gaXMg
dGhlIGNvZGUgbGlmdGVkDQo+ID4gPiBmcm9tIGFzcGVlZC12aHViID8gSWYgeWVzLCBzaG91bGQg
d2UgaW5zdGVhZCBtYWtlIGl0IGEgY29tbW9uIGNvZGUNCj4gPiA+IGJhc2UgPw0KPiA+ID4gQW5k
IGlmIHRoZXJlIGFyZSBidWcgZml4ZXMgb24gb25lIHRoZXkgbWlnaHQgYXBwbHkgdG8gdGhlIG90
aGVyIGFzDQo+ID4gPiB3ZWxsLi4uDQo+ID4NCj4gPg0KPiA+IE5vLCBJJ20gdGhlIHBlcnNvbiB3
aG8gaW50cm9kdWNlZCB0aGUgYnVnIHNvIGl0J3MgdW5pcXVlIHRvIHRoaXMNCj4gPiBkcml2ZXIu
DQo+IA0KPiBPayB0aGFua3MuIFRoYXQgc2FpZCwgdGhlIGNvZGUgbG9va3MgZmFpcmx5IHNpbWls
YXIgdG8gdGhlIHZodWIgY29kZSwgc28gbXkNCj4gY29tbWVudCBzdGFuZHMsIGlmIHRoaXMgaXMg
dGhlIHNhbWUgSVAgYmxvY2ssIHdoaWNoIGl0IGFwcGVhcnMgdG8gYmUsIHRoZSBkcml2ZXINCj4g
c2hvdWxkIGJlIGNvbW1vbi4NCj4gDQo+IElFLiBUaGUgdmh1YiBpcyBtYWRlIG9mIGEgdmlydHVh
bCBodWIgd2l0aCBhIGJ1bmNoIG9mIFVEQ3MgdW5kZXJuZWF0aCwgdGhpcw0KPiBhcHBlYXJzIHRv
IGFkZHJlc3MgdGhlIGFzdDI2MDAgIm5ldyIgc3RhbmRhbG9uZSAobm8gaHViKSB2YXJpYW50IG9m
IHNhaWQgVURDDQo+IGlmIEknbSBub3QgbWlzdGFrZW4uDQo+IA0KPiBUaGUgd2F5IEkgc3RydWN0
dXJlZCB0aGUgY29kZSBpbiB2aHViLCBpdCBzaG91bGRuJ3QgYmUgb3Zlcmx5IGRpZmZpY3VsdCB0
byBtYWtlIGl0DQo+IHN0YW5kYWxvbmUuIEkgd3JvdGUgKGFuZCBtYWludGFpbikgYXNwZWVkLXZo
dWIgYW5kIHdvdWxkIGJlIGhhcHB5IHRvIHdvcmsNCj4gb24gdGhpcyBpZiBJIGdvdCBzZW50IGFu
IGFzdDI2MDAgYm9hcmQuDQo+IA0KDQpIaSBCZW4sIFRoaXMgVURDIGlzIHRoZSBpbmRlcGVuZGVu
dCBJUC4gVGhlIGFzdDI2MDAgYm9hcmQgY2FuIHJ1biBhc3BlZWQtdmh1YiAmIGFzcGVlZF91ZGMg
c2ltdWx0YW5lb3VzbHkgd2l0aCBkaWZmZXJlbnQgVVNCIHBvcnQuDQpJIHRoaW5rIGl0J3Mgbm8g
bmVlZCB0byByZXN0cnVjdCB0aGUgY29kZSBpbiB2aHViLg0K
