Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 635EB55A5F8
	for <lists+linux-aspeed@lfdr.de>; Sat, 25 Jun 2022 04:04:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LVHNK1Mw4z3cfH
	for <lists+linux-aspeed@lfdr.de>; Sat, 25 Jun 2022 12:04:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=JESJZsIM;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=40.107.215.98; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=JESJZsIM;
	dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2098.outbound.protection.outlook.com [40.107.215.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LVHN81gxkz3bkH
	for <linux-aspeed@lists.ozlabs.org>; Sat, 25 Jun 2022 12:03:50 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CNx6QBCgASHB3GfrjIEfhM7dYSmLC5cFvyEc3VK8KseuI7BtQuIBpT0qERtYb18EsBYGF7xrM0jEo4SaSzeN6vHdmM2Duw9+QZOO6sy25fW37VAGyKiE3ekBjaPodYv4nVe8iG87nRl5hJOSyyUDWn4gD4OVWAfBQztpQ2jI1C2WXhLoHF5AC957Q5IOh0VmiZvyOk8CD3lUQpO/VNu8hKwyT+nR1qbOTL3+SzGEO512/x/NdyMQr2VHCVzJ+mq0cypSj+0iDJI943hZ8rag1xhIrwJ9Z3gAZ1FCNosEdbtGLU1m/KG/1sItMZoDmTdRQwFOX0Xnwzu8NglIgN51gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uFD2M5bVtgiHCsjDNAfMCtAgoeUyWXwaoQEnWnB4QOA=;
 b=OZMwHm7Un9e9ztCYDf9JIlnO7iQJcJUTSqMUGyINS9dc0jlQMNAZnXZf1O0yWP/uWAVjz1xsltsAiSpZTs7T0KD4hjdJaLKSNWgcBoRBKLnUCFJeKictsFYkxSJVTEoIWiAYoXFjcUbCSvt2ITEG1ATqEJN0tGmqq6JwgCRe1yyhjLOOQ1GsIv12d6LXAbANSHSD73DVnmxfRcy6Xx5gdl0qXSufSgkD0cwsepWcqTtt7BvbmrpOS2AvkxHZ8JeWNsze1ddlQIFJucHl0H5LfZwap06TfbA2SHCQshR439bJP8CURa6pze+YxoVJcxw7fP7FENpXyCQft6N2Zhu/Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uFD2M5bVtgiHCsjDNAfMCtAgoeUyWXwaoQEnWnB4QOA=;
 b=JESJZsIMiIRjSOnVrGlCodas+k6SBGZhafkO9CfsnCTiiLe72PgLXxjgVMoalkrx2HfzrU6+h9PomNfTco5dF5XHG1i1PiXDXhnxE4NXG0GgBhWGC537eqmZUyXh2/ifIlYXbCgp8cL5SGmpeEq6+Uo3Cw4EC3YmpRDMCDp6OhZbqe3YgqBVbs69eHwDyEPU2c8UE6pFEwoVtjzHDbHoGGFKDWmlbDTH2kO9cPOazimX4QWYayGgSKCn/Z7mhzYa1QIzmZOBLc5tiSRngxJ+e2NeYOMsFFXuFSbtSIwMPA3Edf3C6+tCW8lJ8EurVsHQrIJ3sD0WecM9iTocW94mgg==
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SG2PR06MB2940.apcprd06.prod.outlook.com (2603:1096:4:59::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Sat, 25 Jun
 2022 02:02:18 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ac67:6f7c:3c88:eb8c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ac67:6f7c:3c88:eb8c%6]) with mapi id 15.20.5373.017; Sat, 25 Jun 2022
 02:02:18 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>, Joel Stanley
	<joel@jms.id.au>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>
Subject: RE: [PATCH] ARM: dts: aspeed: ast2600-evb: Update I2C devices
Thread-Topic: [PATCH] ARM: dts: aspeed: ast2600-evb: Update I2C devices
Thread-Index: AQHYhuZDWs8CMhL7O0aN8WAWwoIfeq1eEzMAgAFN4OA=
Date: Sat, 25 Jun 2022 02:02:18 +0000
Message-ID:  <SEZPR06MB52692D05886361F39D363135F2B79@SEZPR06MB5269.apcprd06.prod.outlook.com>
References: <20220623094717.3873328-1-joel@jms.id.au>
 <3114efc7-5131-2de5-4ebc-6b6deeea1f23@kaod.org>
In-Reply-To: <3114efc7-5131-2de5-4ebc-6b6deeea1f23@kaod.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 409c2dab-f7d8-4666-5f2c-08da564ebb9e
x-ms-traffictypediagnostic: SG2PR06MB2940:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  b34QLAvZ2Fp0G4/nNsW21XBEjmnV5CZQNOo0eY3ple+IT5dkBjqrHfPr7kGAHmW1yowFsd3T6iLJgS3t9N9rFrmD8GNTbGdq3g7aYFCt5lP2+YZqkooZA5mKfrEKr5KBiCCTxcz8ACnGmBdw8NhSgTeUNUIf1ntGXG3LBoUhjZj93+Nt+t9drVAhuLsPSiyJdUxqbzF86kDkU5trA5SVoOhgcCB+6qK5WCudfJWYguezeiwEtW5bj6f4o3ifC/QczfLn3V9nYZ4KQ4ivf3hXizTkzAjV+W+hjzJHekfa3E4WNCQ5XFYYV+G2JfNtlyRnTS8QexywHSjws+6g0CuLtgaur4viuDrXwsvhbG3MlI/lrqlu4TrstPDNOEQ+cv7yAAADvIiHT1sEFnLuISSVxmKdP/BiC2jv2urZ2zRHenf58W2BKiDk1ra2Flfd5kr1+Wic/I2H8hfOoPiSvebmb5hjeaAx+PgBXYW/x6DLjcLf9M65uFJ5PxFP4ZBYNcBI5ulLDFtErfqNTij8ALM/eflTvDUs1RIY4AC6NKB4nRJbrjPRKdzDW3HUvQ1q6XSrl3eSmPfiTorp3Cwa2hTgLdJQEguFVkZ2YM2qCqHQMgcTcMFYvFhWMqOtcvIL+GH+WSOPM7yUmyEMXDWbpV1oVVKYAX3Zl8k4am1hS45cy0vKQSHCTM2ZvjZMnzMqd3Mlx/VoxSh+901Rf9EaFOIUpECUxd/ap1CDUmqXHX27KWruWHsDtQ/pUhvmnhr034N3qkeJIn+VQV8bq0w4YLIvL/3bom4A7zGdL/SfbbYwxnA=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(346002)(366004)(39850400004)(396003)(136003)(110136005)(66574015)(41300700001)(6506007)(8676002)(66446008)(7696005)(33656002)(66946007)(55016003)(76116006)(66476007)(66556008)(83380400001)(15650500001)(186003)(9686003)(2906002)(71200400001)(64756008)(53546011)(122000001)(316002)(38100700002)(86362001)(52536014)(478600001)(5660300002)(26005)(38070700005)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Lzg5bDY2RUJid1FWdjErTVRUeGpIT3VuVzdCRG0xQ1JQZ3ZaaU1aemxIR1px?=
 =?utf-8?B?VkQ2RVRtdkw5ZTIrSHE4V05hQUpJYUcvUlQ4L00yUENwaUZxQm0rNWd2M3JW?=
 =?utf-8?B?dmtiNXRoWWszaGxabmcvbFppTjEwVXlyL3Q2a2VpM0tQZWpJZXBLSktlTzhG?=
 =?utf-8?B?ZGNPQ2Z1OE9SaHlJZkdoWXFBK0kvejRoTzhGd0ZRZm5BdllINVJQTVNmMWJy?=
 =?utf-8?B?czhWcVMweUJVTW1SR28zNHJxMm0xNUVDSWpnVk9SM0l4cWk2c1BuZ3cyTDRY?=
 =?utf-8?B?ZUZmNjFqZUVKUDdOWG4vZmlGQi9rcEhzRU5LRG5URVB5WUgvVGQrNGpNM3Vv?=
 =?utf-8?B?c1ZLNlNBTGJBV21PWURkVGVrWi9iaHB6RjdQWGlha045TzBOVFJnUU5aTDRI?=
 =?utf-8?B?TGhDWkVMVkE3c29NQnhlL1FMT0FxVDlJelJpZFdjbU5Lb3hjT1lkL2JUbEN3?=
 =?utf-8?B?WTJoQ2NYTzErcVVDZWc5VUpkcHlNRmJjUzZyVUxITk5BRE1rK3FKSWlyNXBQ?=
 =?utf-8?B?TlNwTDZVTlFjYVYvQjhVNW5lR0pNajlVWjMvRG1xRzJhMkpIR1NiSGhycCtx?=
 =?utf-8?B?c21DRzdPMXkvcGlSNHUxVmQ0SDZWWUQ1NHVydDBvVjB4bDB3NElzZTE3aWlS?=
 =?utf-8?B?elJLTVp1S1h2SDdzTzF1WkpqSGtiY3c4dlc5UW1Jc3h1Nkl3enFIUEUrMzF0?=
 =?utf-8?B?TmZTd3cxOEd5b1BGQXlvazRLbVk1ZGNJTnVNNEl1OWVhZ3BIZ3MyNG8zL0hv?=
 =?utf-8?B?dFhVMVMrQUVva1FpT2N4QUNRa1FEanRNT01udTJUay9rYjFldUU4bmNTUWVB?=
 =?utf-8?B?MnBCQi9Ocjh6YWF4ZitqK3VJWWc5TndmN3lYNkRYRFpLRlhyNUZ2MmVNd285?=
 =?utf-8?B?ajltaVo3UDFJTjlLTm5CeDJhaGs1ZmVDbXMzNEhsY2p3OHVXU1p0bUdqWDk1?=
 =?utf-8?B?bE1RNkpjRDVlbW4reU8wRXdJOEZ3NEVXRmFZbnR3L2gvSTFiZWI5Q2FNT2lM?=
 =?utf-8?B?bU1HeTdJOHY4a08waEcyRHJTOHJpTVRYWmF6ajQ2NG1BYzFQb21aeWFWZUV0?=
 =?utf-8?B?R0VOVUdoclZDLzNoa1hVb3FQdTRkTDV6RXNGZWFTSktrNXhkK1lSRGtGeEUv?=
 =?utf-8?B?ZGRoYnh6WnkySE9wc1ROY1dyY2lwUkhUTkpOVDh3elgxeTQyRVkza3V3THZq?=
 =?utf-8?B?d25POEhiRHhReFVnTm9sRWFTUVFvN3VaUzI1L253TFRJMldvQXRLakNwalk3?=
 =?utf-8?B?YTVHdjR0ZEwwR3dxcHBvd0E3SWVwNjRaVlhGVEkvTkFlT0svWjVQempHVnVi?=
 =?utf-8?B?UkpRNy9SZXN1dnNZYitnVGNSSjhycU9DQ1V0eHlRU29vR3UxQitjWHh6ay9R?=
 =?utf-8?B?Q2lPbWtVMnNjMEozWlFOWnhsSlpYbUlWMDlpN2hEaHR5a29qZUk1b1ZoV1pN?=
 =?utf-8?B?a1dwYlV1bzM3d2NieXd0NkhweEVBc2I4aGFsR25XcTZIT1NISitWdHgrUE9y?=
 =?utf-8?B?QzZ1L0k4c1lEckcvUUNPZzYycUFyNWxrUDVSRHV1MjNFY1VEL1MwVm1GYmlr?=
 =?utf-8?B?QmpYc1ZWV3FWRVlqVVhvMWorRStublFGQUs3ZWlYckIxUG1XMEJxWWNJOUYz?=
 =?utf-8?B?dlJBeitXWjErb3BabnpTUHZNL1l3bENielF6UWovTlJyWEFkTnlhRjVGT3dI?=
 =?utf-8?B?ZnoveTNtZEFXb21TaVd5YVRxM1ZWbWRnZmRuS1RzU3h5a1RpZUxNdGJwZ0w2?=
 =?utf-8?B?c1I4WlpFenU1NlhlT21sTUdUb3ZyK0UvSW9qMlV0dEtDbEdVbHIweEdkUG00?=
 =?utf-8?B?VXdwVVhPMlFDcGpnM1h5NEsyOStrZDE0S1RaRGxONGgrdkhFaDJZVVJ4WHMz?=
 =?utf-8?B?cTdpN0xzZXFML1RDMzh2SVRwbXpsUHNOd0pDKzVsTUJoTWZ6c3BaOUtLdzNK?=
 =?utf-8?B?VmgyVXBZVVFRb2RqYlQwSVY3dUFKZHh0RkxSeVRWc3dFSzJuUWRiTFBHMW5C?=
 =?utf-8?B?bDVoM3ZReGdCMmNCU0tFUXRDTmg5WnhlV1lrQWNsR0ZNRm1YbHVUN2ROV0Q5?=
 =?utf-8?B?aHZSLytKbTFjdk9Bc25WNzhES0dpdnRVY0g2SDYrdVVyMnJQQTJ1ZUxLcG1o?=
 =?utf-8?B?K3g4cXRScys3WHhieFhjbHNpaUMrbFhERk85cm1BZk8rYUNZekswQ3ladDhW?=
 =?utf-8?B?a3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 409c2dab-f7d8-4666-5f2c-08da564ebb9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2022 02:02:18.0877
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hajr1rYOut+SR8UzWWj/Qp0DCBBPLoDVl9PQTRBW/nXpPDmxR2j1DeEdSw0AQR+bLts6y4fkIDNF0R04cYHwRV9GeT2zx5H43s3oxmkqPH8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB2940
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
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

DQoNClJ5YW4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBDw6lkcmlj
IExlIEdvYXRlciA8Y2xnQGthb2Qub3JnPg0KPiBTZW50OiBGcmlkYXksIEp1bmUgMjQsIDIwMjIg
MjowNiBQTQ0KPiBUbzogSm9lbCBTdGFubGV5IDxqb2VsQGptcy5pZC5hdT47IFJ5YW4gQ2hlbiA8
cnlhbl9jaGVuQGFzcGVlZHRlY2guY29tPjsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7
IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsNCj4gbGludXgtYXNwZWVkQGxp
c3RzLm96bGFicy5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gQVJNOiBkdHM6IGFzcGVlZDog
YXN0MjYwMC1ldmI6IFVwZGF0ZSBJMkMgZGV2aWNlcw0KPiANCj4gT24gNi8yMy8yMiAxMTo0Nywg
Sm9lbCBTdGFubGV5IHdyb3RlOg0KPiA+IFRoZSBBU1QyNjAwQTMgRVZCIGhhcyB0aGUgZm9sbG93
aW5nIEkyQyBkZXZpY2VzOg0KPiA+DQo+ID4gICAtIEFEVDc0OTAgYXQgMHgyZQ0KPiA+ICAgLSBF
RVBST00gYXQgMHhhMA0KPiA+ICAgLSBMTTc1IGF0IDB4OWENCj4gPg0KPiA+IFRoZSBidXMgdGhl
c2UgZGV2aWNlcyBhcHBlYXIgb24gY2FuIGJlIGNvbmZpZ3VyZWQgYnkganVtcGVycy4gVGhlDQo+
ID4gZGV2aWNlIHRyZWUgaXMgY29uZmlndXJlZCB3aXRoIHRoZSBidXNlcyBnaXZlbiBieSB0aGUg
ZGVmYXVsdCBqdW1wZXIgc2V0dGluZ3MuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBKb2VsIFN0
YW5sZXkgPGpvZWxAam1zLmlkLmF1Pg0KPiANCj4gUmV2aWV3ZWQtYnk6IEPDqWRyaWMgTGUgR29h
dGVyIDxjbGdAa2FvZC5vcmc+DQo+IA0KUmV2aWV3ZWQtYnk6IFJ5YW4gQ2hlbiA8cnlhbl9jaGVu
QGFzcGVlZHRlY2guY29tPg0KPiANCj4gQy4NCj4gDQo+ID4gLS0tDQo+ID4gICBhcmNoL2FybS9i
b290L2R0cy9hc3BlZWQtYXN0MjYwMC1ldmIuZHRzIHwgMjEgKysrKysrKysrKysrKysrKy0tLS0t
DQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkN
Cj4gPg0KPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtYXN0MjYwMC1l
dmIuZHRzDQo+ID4gYi9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtYXN0MjYwMC1ldmIuZHRzDQo+
ID4gaW5kZXggNWE2MDYzYmQ0NTA4Li45ZGE3MGI4NzNhYjYgMTAwNjQ0DQo+ID4gLS0tIGEvYXJj
aC9hcm0vYm9vdC9kdHMvYXNwZWVkLWFzdDI2MDAtZXZiLmR0cw0KPiA+ICsrKyBiL2FyY2gvYXJt
L2Jvb3QvZHRzL2FzcGVlZC1hc3QyNjAwLWV2Yi5kdHMNCj4gPiBAQCAtMjA3LDExICsyMDcsNiBA
QCAmdWFydDUgew0KPiA+DQo+ID4gICAmaTJjMCB7DQo+ID4gICAJc3RhdHVzID0gIm9rYXkiOw0K
PiA+IC0NCj4gPiAtCXRlbXBAMmUgew0KPiA+IC0JCWNvbXBhdGlibGUgPSAiYWRpLGFkdDc0OTAi
Ow0KPiA+IC0JCXJlZyA9IDwweDJlPjsNCj4gPiAtCX07DQo+ID4gICB9Ow0KPiA+DQo+ID4gICAm
aTJjMSB7DQo+ID4gQEAgLTI0MCwxMCArMjM1LDI2IEBAICZpMmM2IHsNCj4gPg0KPiA+ICAgJmky
Yzcgew0KPiA+ICAgCXN0YXR1cyA9ICJva2F5IjsNCj4gPiArDQo+ID4gKwl0ZW1wQDJlIHsNCj4g
PiArCQljb21wYXRpYmxlID0gImFkaSxhZHQ3NDkwIjsNCj4gPiArCQlyZWcgPSA8MHgyZT47DQo+
ID4gKwl9Ow0KPiA+ICsNCj4gPiArCWVlcHJvbUA1MCB7DQo+ID4gKwkJY29tcGF0aWJsZSA9ICJh
dG1lbCwyNGMwOCI7DQo+ID4gKwkJcmVnID0gPDB4NTA+Ow0KPiA+ICsJCXBhZ2VzaXplID0gPDE2
PjsNCj4gPiArCX07DQo+ID4gICB9Ow0KPiA+DQo+ID4gICAmaTJjOCB7DQo+ID4gICAJc3RhdHVz
ID0gIm9rYXkiOw0KPiA+ICsNCj4gPiArCWxtNzVANGQgew0KPiA+ICsJCWNvbXBhdGlibGUgPSAi
bmF0aW9uYWwsbG03NSI7DQo+ID4gKwkJcmVnID0gPDB4NGQ+Ow0KPiA+ICsJfTsNCj4gPiAgIH07
DQo+ID4NCj4gPiAgICZpMmM5IHsNCg0K
