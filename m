Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 536E7967DD4
	for <lists+linux-aspeed@lfdr.de>; Mon,  2 Sep 2024 04:32:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wxt8H2GCpz2yPM
	for <lists+linux-aspeed@lfdr.de>; Mon,  2 Sep 2024 12:32:47 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feab::727" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725244365;
	cv=pass; b=GY9HA4XrbXD6+faWiDb+CUuNj5GjDwlvEXph+iPU0NValGPnX6WvzBxWuJnIoSZV0z/aGMgna4MwIZSGN9x5NoXOAl09UmTRwI1ciaTS2Wgw/6YuanBQzcchCyqMQOaYWvmB81Wf9CNfT60ofDAcV2y/jGoTNkyJ76CMPGH8lUJBTQYg1sQ/I5TjooouNstqyYVdV0tpuv5lQRcX9z0tT7tgbcOrAl68dXrX1iRwLH7Vfv0kXqEnv+DltTsWWYqEUzSh9u1B3ME7aslt5GNlTEAUT0w6aFElq5Gz8DS3nYe8Jwlj56Vv4f/oaDdMk6uccK2zshfLhY3mlGWINX4FMw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725244365; c=relaxed/relaxed;
	bh=nLIW6/3AZXrsTrkfjLAaY21pPszmwWdcgFWzrupQ/6A=;
	h=ARC-Message-Signature:ARC-Authentication-Results:DKIM-Signature:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:
	 Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:msip_labels:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-M
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=HxNjok4m; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f400:feab::727; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=HxNjok4m;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feab::727; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20727.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::727])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wxt8F0D4Fz2xtQ
	for <linux-aspeed@lists.ozlabs.org>; Mon,  2 Sep 2024 12:32:44 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WuLvebzPyBDPrbrypDDP/EQsmlC7OGG+RxZamhbNso3qhOd+FukFvJP1+qnjeYYiGn6RNBN72pbG/gK7SBUc1UpXKGiZfeOpr4MdagXYQEqtsu0yN7h6XX/4vr759iNAjmWYtRlfr7LFIGj1yuE8HMvNxkf/8mMujkgpuxtYiWXSAXF9vV5ZgfHAAL4aGV4LB8msm8JIH0aBV9xa9Z8p7RPQvSwpc33YlDoP7LXF9PUcbZ91bonPnCTZQUzMSOLt/YoZDAsZGZV9ydmON9kjD1vXC3yYKWeJSTpjSf0uyjFxqvBsaGkyNf4bfxtyJj9hGnWpVJhNphVIgugSePbY6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nLIW6/3AZXrsTrkfjLAaY21pPszmwWdcgFWzrupQ/6A=;
 b=kaE/FQeBzIgttZlxOs1m7GSAuRDJD82+/OrkWjdb/8KKYOUB9iYdqrCAFt/gfnZVteUThg4Hs4EL5GaapaJCabunUTGOzMQMCW55TiZYZz99PArrNEE2LLG8nDYtz9CKPI8wKkPSrEetIx6kOTLbzx16j4jNyy7gJLJmopiz6vHLNgDg4LQJIki/2HfRexee6hXnnAUxrmBfU4ij0zTP7UbR5T56s0CIpXiYxpkTNR2EfP3t8uUCQfzhaD44GvnyKrbHrIGoMIZwjmijKr7vmYcbjLyKI4aalVgKYI9d+28hfC3qjQSK9nUCZsBGW8vY7Mzj50+RQXYifcb0kx4PDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nLIW6/3AZXrsTrkfjLAaY21pPszmwWdcgFWzrupQ/6A=;
 b=HxNjok4mNRlnc901IjqEU3U51KkvqEV63EJPYS3R6/Cvi0ZfGElY9hlHNjjCedE2NTmMjfmnfNq3iL7+TllVhA4BIVBiLGIGePIw14CrVs1w6Sf6G+CW4jKwv4JoZbcnJ3ZkjmYdG1pP/dFgNMxko8ZLoZzgoChSJGsvr20TzrE4Uqq5SYCj3eIUmTGtkeYMmESqJSlcaECmXMUtLNapWXOvv/ZGaMbF3bUeCaLFnnW83EIYnaPfjZGCyrlt9iob/dpKhUHTuI7SqA0NReibCK0I6a72I8+aDg7s+//Tu01jTn3QE8d/sfZysi4Fa2OXsjXFRAGA6PJ4/0isDkAkcw==
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com (2603:1096:604:29c::6)
 by JH0PR06MB6980.apcprd06.prod.outlook.com (2603:1096:990:6f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Mon, 2 Sep
 2024 02:32:23 +0000
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::814e:819a:7d52:7448]) by OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::814e:819a:7d52:7448%6]) with mapi id 15.20.7918.024; Mon, 2 Sep 2024
 02:32:22 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: gpio: aspeed,ast2400-gpio: Support
 ast2700
Thread-Topic: [PATCH v2 1/4] dt-bindings: gpio: aspeed,ast2400-gpio: Support
 ast2700
Thread-Index: AQHa+o5qvL/25jNAI0e7HajUDP4/ULI/1dQAgAP1Ntw=
Date: Mon, 2 Sep 2024 02:32:22 +0000
Message-ID:  <OSQPR06MB7252A649AC8CECB3E114C8BD8B922@OSQPR06MB7252.apcprd06.prod.outlook.com>
References: <20240830034047.2251482-1-billy_tsai@aspeedtech.com>
 <20240830034047.2251482-2-billy_tsai@aspeedtech.com>
 <20240830-untangled-charting-48503e510ea7@spud>
In-Reply-To: <20240830-untangled-charting-48503e510ea7@spud>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR06MB7252:EE_|JH0PR06MB6980:EE_
x-ms-office365-filtering-correlation-id: 12d67c71-5414-4aa7-365a-08dccaf779a3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:  =?Windows-1252?Q?OWn36Ao4Ays/icsrhGEVj1KQIVwYd9rvc8xugMTjbPUZs9xpwqxgNq6W?=
 =?Windows-1252?Q?fFowzY+BaFcAI17yJcBJ1bK007zcrEz8mM2OpOYS5RnwrNKZA7iLOh79?=
 =?Windows-1252?Q?1fCdhF3AZvc0qR8eub2xCPDVPIEmuIdrlKZRL0JVReDDQ57LIORE/mFA?=
 =?Windows-1252?Q?6Jzdb3J/af2DNLiYKc44ke6SOcGpFxKrDedyhev3OysDhQYJ1vKAltfi?=
 =?Windows-1252?Q?NW4s4wK3PyrCvs8IJeYCU1RRBVH3fy3R7a3vl3ZgNoCFaVmDYxCTCYLI?=
 =?Windows-1252?Q?qqoOKcTWNXayXIpXmOxvJIaCyI2hm+psUM/K3H9sx0xiiOjyu8E2X8pJ?=
 =?Windows-1252?Q?LnuysyFXFvtm0zTIIFo9FdfUXfmD8l9QVqcb4GFzi/JQaoc/DchNr9x+?=
 =?Windows-1252?Q?M0iDkI07wGXlUMqz4wTYYMoTUXuK9Ua8bU1UzZEqYtvdz3ojE8Ko/Eku?=
 =?Windows-1252?Q?/THUTdiRqgDNBb3oK1+OtgzGHChRAi1NkiNPsTY2ljjDb3fLotyOsUfA?=
 =?Windows-1252?Q?TIQ5JYu8yYPrRGTLfrOSkBhjA5Uz/NibkIrba5xcz03uH27S0GD24WcK?=
 =?Windows-1252?Q?9eqLOxVf3rHC5prm7WvCI9Xb3TVs9spxulnX70LWoCQgpRXxPgeoJJAS?=
 =?Windows-1252?Q?V50GIABBf9SMFtYhADYIKTcuop8bSdJi4zM12cVAUOM54ilW1s02Akfo?=
 =?Windows-1252?Q?rnmGd8Ood2pccjAkfyduOh6zTkiivyd2Gq8JJe2668dDl9v15G6lKuaj?=
 =?Windows-1252?Q?pls7el93flKBq1xWtb72Mxx2IAeZWoSO4DxGV9L1Bey+U2+7cTzNtcLc?=
 =?Windows-1252?Q?U5hO3SOMznoWesxH1jyV7GRCW20uH0iNCfFUmPWx67i8qRJQ1yyEcLtQ?=
 =?Windows-1252?Q?1hfcjWdoCSXOG/UgFvgE4P4rcMZcrZEIhKSjM91FZN6i1kfaLYBlaeH6?=
 =?Windows-1252?Q?37Xm7VtanKi/7xN6rv9KqDdO1/HMTlEXGc4NX6VSJzRkH7wu74eIrhQl?=
 =?Windows-1252?Q?SFkIkJaNLL6iJvpkOumAuOyV955J5Yzr8kXdpFnvrPSgYAzbz7eKxGFH?=
 =?Windows-1252?Q?EDGDLwaXXyOI0RQR/K5AIHYXCc/qpL4yH025XeqHGTqOx/6N+ccrB8T2?=
 =?Windows-1252?Q?3EyawKpj31tchpkeqjgrEpbc7wVkRjeD4+6umYjxtbCkJlTB/lYKsrWm?=
 =?Windows-1252?Q?aCaEdmuseJh8z2d/cGIIUo7paCQGjl9FP0ddyKPbwJVwwPVIr4B9ClYG?=
 =?Windows-1252?Q?eae3rdFL1j1+SjllOkBHM7lqb0VKVAWmggz1Es3zXFYMMqy7N2sd6Jjr?=
 =?Windows-1252?Q?wsHWyu7DIXv0f2UTGwbFnQHhnMMsKeSHx8Pn4ygC+Zr0oy0wCv73L3oj?=
 =?Windows-1252?Q?6KAWwWVjDv0Rem7lWTY1KP8ODFbMASrPJ0dv8LYwRikAUBzAgCYG2Kyd?=
 =?Windows-1252?Q?Tji2h10i5CvsafM/CWXHxXegzF7LejCvRk1FKZae8m8Nrz8USoDSXoDF?=
 =?Windows-1252?Q?OgP/JyhAnN7/C7GXcvrd8c1QaJighw=3D=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR06MB7252.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?Windows-1252?Q?Suq86uQSR7DPOUzhwiWR462cwodOOcQJDggoZcvMCnNBXB3H16q6wUVA?=
 =?Windows-1252?Q?jfXmX4JcL2HrchKKJCOGSeR+ALjjr19o2N+cC3Mvv8g0TIRvj0Bg6jRP?=
 =?Windows-1252?Q?IF30/EKkua/DmN7/12udfNExbZ6IktrYy3SC05qJKlLzORNnKoNr8R+A?=
 =?Windows-1252?Q?JYINkgE1p+uNmlmyU3WTwCWyyJ2QhJ1A4+1VnVjwvWzV4J9H/tHdiEAZ?=
 =?Windows-1252?Q?k4YeFpw5VMXkiuJCsBx11F2dw1D2swm2kyRJ1YKW6NXSXzej9KBmWzAV?=
 =?Windows-1252?Q?MmovYjVexeNEsqhaH4DxRFmBosZ7dtu9ZJTpvvgpUfCvxglMpU/j0D7X?=
 =?Windows-1252?Q?Kg+7xZmQZjxYumbddQgZg1sKKKQH78LRNs4wZysHsrtHcC0TqH+/o48Z?=
 =?Windows-1252?Q?+OblOStK8FanOr2sQHVF/K7Ka+Y3TKOjsETBdPVHdtr5Ovtt90/vY7Dj?=
 =?Windows-1252?Q?RIFYy8baMT93sTl0FReB0ZG/0lf+20IYtxLMsLmhWcvQ8No6bl2B39LO?=
 =?Windows-1252?Q?E2ofwHPHcfAB8e3uU2gVuq3kBrjtJuf3C6dkLs5eZKfqs5OFdZzEnRg0?=
 =?Windows-1252?Q?THimlt9XmuIrIJX14cT6t7ZT1UyB1gVaFkNTlohRRwRKfmA/MzpmfpHj?=
 =?Windows-1252?Q?XvX/oX9T+g7/2e37R0GoxEkV0lG8R0lmHbjaSwPNQ3oLguyhFzT6V+Wb?=
 =?Windows-1252?Q?Q8R6KZahQRsH2D+6fLhjIt7GQt+4+RSDhquMt+romVdK6e6kvxhr7LK6?=
 =?Windows-1252?Q?l0nCoY1NnjZDVgc7YdtM9MeOo4n+Rh60b5iz/rUr2t4MCdCM0ci6z6ng?=
 =?Windows-1252?Q?+1A6dWeCyXSk4qiuNF9Y4OMUd5OOSPV/jeaHn71xscCyjd3cIlQR0xYy?=
 =?Windows-1252?Q?2kEXGQ03YJuh+fdZ57xRi3649eTIYKjDBU3xZ+Yued00EeGHPl9156tt?=
 =?Windows-1252?Q?7pda31nivJ6mEkNgZUGZVtg5RIw+h/03oo0ACHsuZooseoJFey7XNY7A?=
 =?Windows-1252?Q?CYnJYuEt5q4w19FCsMxHjfoysvGPwgLSQ3Uyx7del32aOBpBBw1Nzg+9?=
 =?Windows-1252?Q?bAeDanVMB2Cad3OYilxJKVoiNWSXOOCW/l6XInAG1PRwppUfaNM8/hkd?=
 =?Windows-1252?Q?skx3t4Y8ci8UHCZMathN+jU1IiZkVXYQ+VwYgGRwzBWJHVDvNNjEAcZh?=
 =?Windows-1252?Q?KFHhM+j0atqIvJnosCtnfYM4gPjBoiJXJTZEpIU3RuDYlZsrGiczYKbZ?=
 =?Windows-1252?Q?BNwQ5Dg80I+j2DIRholyoHEiOWYuJ9GN/Ay3lOWP35kND+FH+2EOP4EZ?=
 =?Windows-1252?Q?yfIa/FlPpSc/iTZ94TLNkIMAKRUDwL+3QsTgi2Lw0QeHOh8f2PWsIPlA?=
 =?Windows-1252?Q?izinayZcOYsb1SDY71XGJlapt+v0NFQd67PzRVE7eAdy7LxXHOyZdC1G?=
 =?Windows-1252?Q?m4BBFFadYM1Lx8A36RS6Puuy4cz4bJxnKxmIaTJ6cbdFVElI4RO63yTa?=
 =?Windows-1252?Q?MRCmswYHwpFK1vh3I4ii5X91BpGpspYwviIHBaAFLBRIBuaUnq+il2pk?=
 =?Windows-1252?Q?kIfoN5SW4E6l2FkrZvDJHd2WPGQqSILZioHZuO04Hkv53dDrdGWXEb4o?=
 =?Windows-1252?Q?lD6B8q5HHwVT6cSkrda29Wxy33e+P/1XAgD2z1emfC+gu3ytk6d3dxWK?=
 =?Windows-1252?Q?Ivjo2hNUqE7m6y8fzxxhsKNjFH2ytrLB?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSQPR06MB7252.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12d67c71-5414-4aa7-365a-08dccaf779a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2024 02:32:22.5715
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I80omcIxUNydAm/AnTUjYXX6XCbs+a7//YFUxaD/AGuH8mOG/+csB8prpH9mak/BAW+7Cwydg9HtrD17k3RwGe/vJ/Hsq9mjuTMbTNEuzFA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6980
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
Cc: "robh@kernel.org" <robh@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "brgl@bgdev.pl" <brgl@bgdev.pl>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

> > The AST2700 is the 7th generation SoC from Aspeed, featuring two GPIO=
=0A=
> > controllers: one with 12 GPIO pins and another with 216 GPIO pins.=0A=
> > =0A=
> > Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>=0A=
> > ---=0A=
> >=A0 .../bindings/gpio/aspeed,ast2400-gpio.yaml=A0=A0=A0 | 46 +++++++++++=
+++++++-=0A=
> >=A0 1 file changed, 45 insertions(+), 1 deletion(-)=0A=
> > =0A=
> > diff --git a/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio=
.yaml b/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml=0A=
> > index cf11aa7ec8c7..4d439972c14b 100644=0A=
> > --- a/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml=
=0A=
> > +++ b/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml=
=0A=
> > @@ -15,6 +15,7 @@ properties:=0A=
> >=A0=A0=A0=A0=A0=A0=A0 - aspeed,ast2400-gpio=0A=
> >=A0=A0=A0=A0=A0=A0=A0 - aspeed,ast2500-gpio=0A=
> >=A0=A0=A0=A0=A0=A0=A0 - aspeed,ast2600-gpio=0A=
> > +=A0=A0=A0=A0=A0 - aspeed,ast2700-gpio=0A=
> >=A0 =0A=
> >=A0=A0=A0 reg:=0A=
> >=A0=A0=A0=A0=A0 maxItems: 1=0A=
> > @@ -42,7 +43,7 @@ properties:=0A=
> >=A0=A0=A0=A0=A0 const: 2=0A=
> >=A0 =0A=
> >=A0=A0=A0 ngpios:=0A=
> > -=A0=A0=A0 minimum: 36=0A=
> > +=A0=A0=A0 minimum: 12=0A=
> >=A0=A0=A0=A0=A0 maximum: 232=0A=
=0A=
> Aren't you missing a corresponding update to gpio-line-names, which has=
=0A=
> a minimum of 36?=0A=
=0A=
Yes, I missed updating the minimum of the gpio-line-names to 12.=0A=
Thanks, I=92ll fix it in the next version of the patch.=0A=
=0A=
Best regards,=0A=
Billy Tsai=
