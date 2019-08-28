Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA49A7370
	for <lists+linux-aspeed@lfdr.de>; Tue,  3 Sep 2019 21:15:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NGqw2slLzDqlc
	for <lists+linux-aspeed@lfdr.de>; Wed,  4 Sep 2019 05:15:24 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=microchip.com
 (client-ip=68.232.149.84; helo=esa2.microchip.iphmx.com;
 envelope-from=tudor.ambarus@microchip.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=microchip.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.b="e4vUV6rg"; 
 dkim-atps=neutral
X-Greylist: delayed 63 seconds by postgrey-1.36 at bilbo;
 Wed, 28 Aug 2019 20:21:20 AEST
Received: from esa2.microchip.iphmx.com (esa2.microchip.iphmx.com
 [68.232.149.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JMGS1S51zDr3T
 for <linux-aspeed@lists.ozlabs.org>; Wed, 28 Aug 2019 20:21:19 +1000 (AEST)
Received-SPF: Pass (esa2.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa2.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa2.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: Dr1c/fVYZbyvlG/T1T9K6ZljGGy9vfYc0WILr7BIIfb62lA4nEOsUz34APACHtIL1SwLXUIbnJ
 sn6A15Kb+cwu4YaUgG28ady3g9z0W7/InQ6M8yN7I37Ml8go4XLa1GEQhwtll19+ktAK+2a+Ih
 yR0+aiJAqXg9LEaC1B3nq7ZuR+ny5JOf7MwHuQ07UnWEuMFgYFOyf6i3viuWVWQaqa0SKvTjCl
 dg9PdqCR3BXoVFP/vFp5099PlX0Cvl3ESmGrqBFWy4QKslI2UhgRdCwMoKuoramOmeno+ScXAW
 VxE=
X-IronPort-AV: E=Sophos;i="5.64,440,1559545200"; d="scan'208";a="46839166"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Aug 2019 03:20:13 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 28 Aug 2019 03:20:13 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Wed, 28 Aug 2019 03:20:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R1NkyIjc3iRgDy1760cE7ot91AxGQjA4UR3trp+Jq0+XIHOi0EtWoJDGxL+ZKK4U4L3MvA/NKzZxZCC5AbpbKj92F4stLZMFDeXMvuA4pl0ySMjPnFiW6qPsdCPgrpXJuL3Bevmb2dcdrAnyM+op7q+IS9MQw204LxvTii0rVTN0C6MYttnKmshvaV5gFUC2yH7VJbYL7V+lLdAOqWCOv0PNfHljk3kbfL4POcsEz+rSVBS8WbKnasuxF/QAJ1DetfrM3UOTahzuV3Sr0RQUbKNmUPvkD4F3twJ1s7rvfdqDhN5Gs3rIAGBf0HIDdTHwJKBWADwvRNOkLqnJnItejg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3aS+nfAfNSmMWmncMtavycpmYG1KzVlyMZ+jyoGN1k0=;
 b=n5FvkA8Xw1xrWoS3ztPad1uGrmQ9y9wUQdj5amjFF0wZfIopMa3PCil9fkvS+RPL/MBbmGriRHxPCAimk+vzHcF8JLkX6oxap2emNVqT0BioBb1M94uZpMuS0WQESmZCufAaJa8qUuI0p0eyCpLLaLp1L55/qmGzeOSsG4zQAXLB/8YOnI6XHGYLd7Wk6lLRDOjVqnqvPZRGk24XmX85JvqI2xVsGHhrxFKMsEHFr7taH5d8mriSFic1Ef5Ji06QgXAZRWQnmnnm2mhZAklkGJSPdWx8CoF4E2u2FVOuFOXL5CkcVX2KXpfk8JwR6khJGfEvYTBdG0hNXBgZl88Tpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3aS+nfAfNSmMWmncMtavycpmYG1KzVlyMZ+jyoGN1k0=;
 b=e4vUV6rgtbBv2tpgLRQZcuOeqIPMsFEX7zqMnz64KVVoZ5R/HSaFVKqd9zh+1SpII/ltv1TuwUHOkpzNDzqGfhBNTJIg1hKccAFB9+YsOd6FVCb9JpJv4yQf8OZ4Yj8PzkrQ1UXbzYEdI/Krlmx1tc0YNMo3Forad7BrVi4Q8A0=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3727.namprd11.prod.outlook.com (20.178.252.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Wed, 28 Aug 2019 10:20:12 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2199.021; Wed, 28 Aug 2019
 10:20:12 +0000
From: <Tudor.Ambarus@microchip.com>
To: <nishkadg.linux@gmail.com>, <marek.vasut@gmail.com>,
 <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <joel@jms.id.au>, <andrew@aj.id.au>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>
Subject: Re: [PATCH] mtd: spi-nor: aspeed-smc: Add of_node_put()
Thread-Topic: [PATCH] mtd: spi-nor: aspeed-smc: Add of_node_put()
Thread-Index: AQHVTb4VASkIRT72fUW6SyhLcwXSAacQeNWA
Date: Wed, 28 Aug 2019 10:20:11 +0000
Message-ID: <96475f82-066c-ff67-3ea9-1fec64eef021@microchip.com>
References: <20190808075104.15928-1-nishkadg.linux@gmail.com>
In-Reply-To: <20190808075104.15928-1-nishkadg.linux@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0102CA0041.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::18) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 43a6a3ab-f03a-44b7-c072-08d72ba14f43
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR11MB3727; 
x-ms-traffictypediagnostic: MN2PR11MB3727:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR11MB3727E5D48FBC4BB4256F763AF0A30@MN2PR11MB3727.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 014304E855
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(366004)(346002)(376002)(136003)(189003)(199004)(446003)(4744005)(6246003)(11346002)(76176011)(2616005)(6436002)(2201001)(6306002)(25786009)(5660300002)(36756003)(99286004)(6506007)(6486002)(316002)(6512007)(14444005)(256004)(2501003)(486006)(53936002)(2906002)(476003)(52116002)(66066001)(71190400001)(229853002)(102836004)(186003)(478600001)(81156014)(81166006)(110136005)(8676002)(966005)(86362001)(26005)(66446008)(64756008)(66556008)(66476007)(305945005)(6116002)(14454004)(7416002)(3846002)(31696002)(7736002)(8936002)(66946007)(71200400001)(31686004)(53546011)(386003)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3727;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: bOhrFAWOF9WuG0e7fHXc2N0EUgixEEcwCWwsypcq/JYmOddYKV1Al/Qwf1ZDGjgaPrm8dqAPJgyPtsjUslalQTqBfpwB/4sl4EnBYSFqTfyjAx3KPdHG8yLLVjILIkhUamc/7fqVJUECfeo2JeqPA2zaIc9X6OrjSc+KcD3Os+KZTkEQEaA5fZlZuThnrioFXDpnSvWYBJwWLEQ97sgh9AnHOEDD34GBIUSrG9+jIsAeyq3CSl8gd5P9rJOb4+BjMlSjOhNNZDvLxe+ukpkzYQZqpo+sq8DjL9qFu//RErt41QLxckLBs5nieeoB9FvCugPzoXmYqERe0HvkGEwMn6LVZ1vmj0dzpS6ee7Dj8FJQfADbbQltDbWbrKMV17javqdXAJ9Z0+Hh6C2ljrb6bEWD9S81/dGutLpY2ZJxf5Q=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <0265766D62590C46AC174EF2A1C7DCEF@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 43a6a3ab-f03a-44b7-c072-08d72ba14f43
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2019 10:20:11.9861 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lvIk2VStxMATCYQj4HYQAuKWbZoMYN9getF0EvEeMIbPtyceBTeVQ/KdbuyB8sJrGc9IsQ+ACEq2x9NCXiEgO4psSb0qKWmmEmoY7IuMEbw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3727
X-Mailman-Approved-At: Wed, 04 Sep 2019 05:12:12 +1000
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

DQoNCk9uIDA4LzA4LzIwMTkgMTA6NTEgQU0sIE5pc2hrYSBEYXNndXB0YSB3cm90ZToNCj4gRXh0
ZXJuYWwgRS1NYWlsDQo+IA0KPiANCj4gRWFjaCBpdGVyYXRpb24gb2YgZm9yX2VhY2hfYXZhaWxh
YmxlX2NoaWxkX29mX25vZGUgcHV0cyB0aGUgcHJldmlvdXMNCj4gbm9kZSwgYnV0IGluIHRoZSBj
YXNlIG9mIGEgYnJlYWsgZnJvbSB0aGUgbWlkZGxlIG9mIHRoZSBsb29wLCB0aGVyZSBpcw0KPiBu
byBwdXQsIHRodXMgY2F1c2luZyBhIG1lbW9yeSBsZWFrLiBVcG9uIHRlcm1pbmF0aW9uIG9mIHRo
ZSBsb29wDQo+ICh3aGV0aGVyIGJ5IGJyZWFrIG9yIGEgbmF0dXJhbCBleGl0KSwgZWl0aGVyIHJl
dCB3aWxsIGhhdmUgYSBub24temVybw0KPiB2YWx1ZSBvciBjaGlsZCB3aWxsIGJlIE5VTEwuIEhl
bmNlIGFkZCBhbiBvZl9ub2RlX3B1dCgpIHRoYXQgd2lsbA0KPiBleGVjdXRlIG9ubHkgd2hlbiBy
ZXQgaGFzIGEgbm9uLXplcm8gdmFsdWUsIGFzIGNhbGxpbmcgb2Zfbm9kZV9wdXQoKSBvbg0KPiBh
IHBvc3NpYmxlIE5VTEwgdmFsdWUgZG9lcyBub3QgY2F1c2UgYW55IGZ1cnRoZXIgaXNzdWVzLg0K
PiBJc3N1ZSBmb3VuZCB3aXRoIENvY2NpbmVsbGUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBOaXNo
a2EgRGFzZ3VwdGEgPG5pc2hrYWRnLmxpbnV4QGdtYWlsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJz
L210ZC9zcGktbm9yL2FzcGVlZC1zbWMuYyB8IDQgKysrLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCkFwcGxpZWQgdG8gaHR0cHM6Ly9naXQu
a2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbXRkL2xpbnV4LmdpdCwNCnNwaS1u
b3IvbmV4dCBicmFuY2guDQoNClRoYW5rcywNCnRhDQo=
