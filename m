Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C913F1196
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Aug 2021 05:30:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gqqyf02x1z3bXv
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Aug 2021 13:30:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=c/da6atd;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.132.94;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=dylan_hung@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=c/da6atd; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320094.outbound.protection.outlook.com [40.107.132.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GqqyQ55kTz2yxF
 for <linux-aspeed@lists.ozlabs.org>; Thu, 19 Aug 2021 13:29:46 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aEdQr7o9WaYjXQYB8vCwC8WYyMbfLqUCRI87YfLauZAXDw38DSyL0JBv47/0fnwn4sPpEtelbCNotfukxYckt+JEXv5v2RBr6sFXXVGvn8jJ6KOd7Jhif4XG0V/q3OIljlZio94VcS2fBDQl/v7dlFJBTkgtV8XWSsL1MTuhKcRvkrhXJUnrW3SHx6Qg9ORl/Y9wybWaK3ahUeo81EsvTDruOgrV2d+TWHG3Wcie+Lv5DcjATgkeRqOa4e0+lUhfKskZiqOkDhmdNGwleJmRdtdhAEmKynNzbRT341+XfahWU7yfrrDM3f1vKvYsUeWdBunmi0+foU6e+ExAqo622w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EbKr+vFTKTcctXqa2uxb3TeSogXAjY9OgKsBsnj+TDc=;
 b=Kum5D4uxQ8dwdfGv9htpwThjqPjstjadcTp8JwKGrptcbD5htbywJlQ3Jr/3hDORDWkDd6hXrGEtlFM6igF1JGfecKs8QlM3mmoFjBmFcpf2nXF/43/RvMRjUq1IjjXu2BXwAYMOSEGDpssQROBXIMXnQ6CIQnGqdEfYaeUvk+PnrcvrgWU1csOG5dwzPIqYEXWA1CfuI2UJJe6ifz7O6FpSZ3dfQimDeLL1mXmevH53k0pw3Gm2mCGs9BvzGysnf/55tMm7PiAaeNgJUvzChOTTvHo+PhHuHnaiUGfgQmr67t1QM/IWmSQskRxgSjx6Pbmyh6LxHUb09wo2dT3GKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EbKr+vFTKTcctXqa2uxb3TeSogXAjY9OgKsBsnj+TDc=;
 b=c/da6atdAEVtnN4xRcC8ufTX9CSvXDQx088Q4HtKRTb1bIjEqKXAHNzYscwCSwuVw2WtS2pl+6915ZeoUJTZGrhBTrAIVziBvP+Fe1tT3qPId8PDYd5ulfBj+dE0EQOnHEe9mB3fgxXffAPVfrakTgoNfLjvUwnS+qhYjgo/RnV2i/fWhv2bWYpyPF5S9fZYzJUqQMGIBgQJMF9BbBqlmgGzqGRrh+U7YKsLDAtmG/lxexphAYXUITF3xKna0EfEsYgNP+MLD2OblkklVQyl9dszy/FfcFhpz/TgIem/F8xGVKwvAbrz1nhgDJ+vKJBX3xm4Ym1X7uMUy/Hd6Qwa8w==
Received: from HK0PR06MB2834.apcprd06.prod.outlook.com (2603:1096:203:5c::20)
 by HK0PR06MB3681.apcprd06.prod.outlook.com (2603:1096:203:bd::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Thu, 19 Aug
 2021 03:29:28 +0000
Received: from HK0PR06MB2834.apcprd06.prod.outlook.com
 ([fe80::5dc9:79cd:c90:7aa6]) by HK0PR06MB2834.apcprd06.prod.outlook.com
 ([fe80::5dc9:79cd:c90:7aa6%5]) with mapi id 15.20.4436.019; Thu, 19 Aug 2021
 03:29:28 +0000
From: Dylan Hung <dylan_hung@aspeedtech.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Subject: RE: [PATCH] soc: aspeed: socinfo: Add AST2625 variant
Thread-Topic: [PATCH] soc: aspeed: socinfo: Add AST2625 variant
Thread-Index: AQHXk80wKWdoIyYQyESV59pQo3t4WKt6LNSg
Date: Thu, 19 Aug 2021 03:29:27 +0000
Message-ID: <HK0PR06MB28347997935D31D1F0799C8B9CC09@HK0PR06MB2834.apcprd06.prod.outlook.com>
References: <20210818010534.2508122-1-joel@jms.id.au>
In-Reply-To: <20210818010534.2508122-1-joel@jms.id.au>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b6f4c662-c951-45c7-8050-08d962c18ce0
x-ms-traffictypediagnostic: HK0PR06MB3681:
x-microsoft-antispam-prvs: <HK0PR06MB368102F2CBF4BCC7E6DD9A509CC09@HK0PR06MB3681.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:962;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pzrbB1ARxAH8zkKbp8wkhAQjrIYI1GEGSuyPVT7M2QjOBc8Ovfk0Z6Rv2NOYbYf7W/G2TIuxqiQsQNdOtRtY4Vv5cXylh38ZTMBM5V+8Me3oSCCsYKVKZGtgyYXMXJ/LwKIHImo/d0FtqZde+3eJMOk3Ucf9brX1cfCaas/dUEKZ8u1ze541EegCF+e6/43Kc/1jV8pq6VZ+BUoJlCa5TrRcM6acFcMYlkzkuO1HA9UJba6vY8kDhFA06F7jgcj7lCNZ6NxJY749EzmdcKaj4iFNHsLj0Tg53yGvs381QTV8j5yhJz6you1L6T63yD6Gg/s7NOQhKv9zvYRqeLkJJzvHSuhHuT1efPwbZULlOj1ltpujodH1NbK1UFzAwxuEbvj6x0I/aIgINx9wJHVUMwCrEMdN+wqaYFlpadgIc3XAC/SXnqpmhm45Z50dr5CviCMGxlPX/R26PWR7gxDJpKCcwCEl3U7SiMKBnFXL90OdxTyJswB/6Rvb8RYRe7MBP36jlRi+/XQLNka8UHbPEX7DXOfD6aF3gVZrbzFy6GH3+af32jh/zR9X1sXW2uu9anHwDAnEJ9KTMlEsaakmofm7QKo8zmNgq29PWW20XyIwnNcrns+ytqJGzbH4G2OnHwx3nPnL9wW6uSyEG4RIgDpvDY/KD9Ila5yFp61aI6yRFRpmA11LTNGkGrISGDN5yRNIsyq4VP02xNnkvo7j0g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB2834.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(39840400004)(366004)(136003)(346002)(396003)(54906003)(76116006)(110136005)(38070700005)(52536014)(64756008)(5660300002)(4326008)(478600001)(83380400001)(9686003)(38100700002)(55016002)(316002)(122000001)(66946007)(8936002)(53546011)(2906002)(86362001)(66556008)(66446008)(66476007)(7696005)(26005)(71200400001)(8676002)(33656002)(6506007)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?big5?B?eWViZDlweUJrTlUwUFpOeVRLckMrYng2M29OdEhPOFRPNnNkMWFWN1grYzN6bHE3?=
 =?big5?B?Qmg0SjdGaTloV1QwdURMV2crZ2pzSlFhRzVabVQxRGwzaG1rcEh1NnpVMkdDbnhO?=
 =?big5?B?cWxZQ2VJZHRZcU9GelRTTng3dFZQUHNjZlY3NFA1Qmdkd3VUanNhVjRqb3BLZm0r?=
 =?big5?B?RnlSeEpGSFJVdGVNQkZ0Q0l3UDNKNWcyaUFEY2RKOU56d1Y5d0I2TFU1R21WWDBm?=
 =?big5?B?QTZSbTlGMzR0OUhMUEltVUpYeGwyWUVhOER2dzdwYy9MWG5DZXZzWXdXR01GUlVE?=
 =?big5?B?Q21hYWZHZnpuSFFKUFBmUlJvc3hENHFxTXhzbnQxWXY1bWc5TVMrK3VpR2dBSmsx?=
 =?big5?B?bGxKeXVRZ2dkMTVQMFVOb2ZpM3UzNi9rR0doaFY0UVp6ZktQVmFFTGx1STlJQTZE?=
 =?big5?B?MjhPeFZuK3MrTXAwNndJUDluVXdZM2NneUZaTU83NFBuc0ZVYzVPc094MjNRNGpH?=
 =?big5?B?OVo3Y0lHR01jaVF4NFlqTXNKamxtNVg0RkQ1eksvbEdBWllWTkV6aDVDeW1rVllt?=
 =?big5?B?WUgvQ0p0RHFQL3hCbjBwKytEY3lmUDZRU3d6V3BMVDNSajcrMXE0TmVPbXE4eFZS?=
 =?big5?B?SkxseWkwY3Q1TGdqZXFiTmdqeHc3TVBqVE9FdjdvcHFlc0pQZWhZKzdLTHpQK2cv?=
 =?big5?B?dVpPUUFEcW5xTmsxb1NvUUw4MHhmVW8zTUZnOGF5WjdyTVJnQ2E5T1hEQmZmcTNl?=
 =?big5?B?WlZ5Y21aMGpXdHdKR2JkRE9sL2lUNWZ4ZlFEaTBPbW80dWNkZUJOcmVHc3R6aUxG?=
 =?big5?B?YlVHazJGNi9BNCtnSkl4c0s0RTVzN0VZZkFHVGZtOGVLbjRqeUF4L1RnQ2lQVlJB?=
 =?big5?B?Mk85L0E2emQ5YlY1dk9KQkQ4c1VsenFBZ2crOElCVTlLZFpMV0ZSTjJxNmVyUmF3?=
 =?big5?B?SmZwS0VYN1dySG51ekZweWxaMGJuY0huRlRMbEFqbnBKcVFZSHNjYUticDR5bDNo?=
 =?big5?B?NnREdmhVY2M4b2d3Q0FKOWZQZFpReFJ0dEgyMjJZeDUzU0phcE56U1dFNWN3YUlN?=
 =?big5?B?ZURrOVp4Y0JYOEJrdGVPcXlaOURaalA2UzREMmZ0NUJ4aXdkK2JJZ21IajJOL2Rr?=
 =?big5?B?OFNKRFVzREhMRGQ1OGtEZWRmbnFMQkQrWXFDQ2pWN2hWSXFqM2NKNk15VlhjSWsz?=
 =?big5?B?YlFsU2dta1BZeXF0RXV6ZHNTNFRGUXBGNGV4MzhHKzhXTHlrYzlJWk5PNWFuM2Na?=
 =?big5?B?aVJrQ1c5a3phRG1WVEd1SERQVE1vczkxODJrVFMvSEh5aFd0ME96TVlBV1lIZGpk?=
 =?big5?B?RVZlMFlwb01YY204THhvTzhTS2NrVjRDM01sNitwUjlxYng1R2VhaDFWdzdlNkkx?=
 =?big5?B?eGdlYS9JY1EyRWhyTW5jZzFpMHRhOUszOXNxZ0xtN1ZDWHNMTlNhc1NuYzJ3WTZv?=
 =?big5?B?YWhMUDEyZ3JlMmwxbTBWaW45SnBnQkJLY0hIbW5jQ0YvR0pCSlh1ajRDbnRmK29s?=
 =?big5?B?YUwwUTV6TWlxUytlKzQ4MVYxZE5kRDVTWE9qZmZtdmE3RmtFZDcwYVFhQjFBd3ZG?=
 =?big5?B?SVdMbUFzSmtXMkNna1d6MlVObDl6dXdSWndKVzNWVEx5TUdQbm9qaUFRdk9NU01W?=
 =?big5?B?L1lweWg0cm5STnJnbEVhNVRUUENDbW9GVXRmL2ZCc3ljWnNPN2ZKZGUzbzIyQUNB?=
 =?big5?Q?WdSA6nRV+H1JB+3yQKwX9Lr6ugfpz+Hpre7MODl1uGs7TyHH?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB2834.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6f4c662-c951-45c7-8050-08d962c18ce0
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2021 03:29:28.0069 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RuwGqK90fnCnO5V1pr34X68ieQiY0V8KOgoncyZFB/0uyXJL5UK1sQEcJiT1MWMBGNQp/L9HzcZww8BTFcfOYinpNzEH54skXPt7thccuNw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB3681
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
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBqb2VsLnN0YW5AZ21haWwuY29t
IFttYWlsdG86am9lbC5zdGFuQGdtYWlsLmNvbV0gT24gQmVoYWxmIE9mIEpvZWwNCj4gU3Rhbmxl
eQ0KPiBTZW50OiAyMDIxpn44pOsxOKTpIDk6MDYgQU0NCj4gVG86IER5bGFuIEh1bmcgPGR5bGFu
X2h1bmdAYXNwZWVkdGVjaC5jb20+OyBBbmRyZXcgSmVmZmVyeQ0KPiA8YW5kcmV3QGFqLmlkLmF1
Pg0KPiBDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBsaW51eC1hc3Bl
ZWRAbGlzdHMub3psYWJzLm9yZw0KPiBTdWJqZWN0OiBbUEFUQ0hdIHNvYzogYXNwZWVkOiBzb2Np
bmZvOiBBZGQgQVNUMjYyNSB2YXJpYW50DQo+IA0KPiBBZGQgQVNUMjZYWCBzZXJpZXMgQVNUMjYy
NS1BMyBTT0MgSUQsIHRha2VuIGZyb20gdGhlIHZlbmRvciB1LWJvb3QgU0RLOg0KPiANCj4gIGFy
Y2gvYXJtL21hY2gtYXNwZWVkL2FzdDI2MDAvc2N1X2luZm8uYw0KPiAgKyAgICAgICBTT0NfSUQo
IkFTVDI2MjUtQTMiLCAweDA1MDMwNDAzMDUwMzA0MDMpLA0KPiANCj4gU2lnbmVkLW9mZi1ieTog
Sm9lbCBTdGFubGV5IDxqb2VsQGptcy5pZC5hdT4NCj4gLS0tDQo+IER5bGFuLCBjYW4geW91IHBs
ZWFzZSByZXZpZXcgdGhpcyBmb3IgbWU/DQo+IA0KPiAgZHJpdmVycy9zb2MvYXNwZWVkL2FzcGVl
ZC1zb2NpbmZvLmMgfCAxICsNCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc29jL2FzcGVlZC9hc3BlZWQtc29jaW5mby5jDQo+IGIv
ZHJpdmVycy9zb2MvYXNwZWVkL2FzcGVlZC1zb2NpbmZvLmMNCj4gaW5kZXggZTMyMTVmODI2ZDE3
Li4xY2ExNDAzNTZhMDggMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvc29jL2FzcGVlZC9hc3BlZWQt
c29jaW5mby5jDQo+ICsrKyBiL2RyaXZlcnMvc29jL2FzcGVlZC9hc3BlZWQtc29jaW5mby5jDQo+
IEBAIC0yNiw2ICsyNiw3IEBAIHN0YXRpYyBzdHJ1Y3Qgew0KPiAgCXsgIkFTVDI2MDAiLCAweDA1
MDAwMzAzIH0sDQo+ICAJeyAiQVNUMjYyMCIsIDB4MDUwMTAyMDMgfSwNCj4gIAl7ICJBU1QyNjA1
IiwgMHgwNTAzMDEwMyB9LA0KPiArCXsgIkFTVDI2MjUiLCAweDA1MDMwNDAzIH0sDQo+ICB9Ow0K
PiANCj4gIHN0YXRpYyBjb25zdCBjaGFyICpzaWxpY29uaWRfdG9fbmFtZSh1MzIgc2lsaWNvbmlk
KQ0KPiAtLQ0KPiAyLjMyLjANCg0KUmV2aWV3ZWQtYnk6IER5bGFuIEh1bmcgPGR5bGFuX2h1bmdA
YXNwZWVkdGVjaC5jb20+DQo=
