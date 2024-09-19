Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C6C97C425
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Sep 2024 08:07:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X8Q6H6HLdz2yMF
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Sep 2024 16:07:35 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feae::705" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726726054;
	cv=pass; b=b0tsg4J+Cf4ssqubLFRxJlk1Ez3nJB77Gik4AAYnrokclNrDxq8TpHRMNMJtOYKPqCM3Aw7ETFrhSBX4GhJ41QaM6V9XwHbWJO6zBdMWHe7oiSjdLJy5bbi4iculAbD9yIanlT7lDGP3cAf+I6CLV0l5z9MKe3wDvUW0RTlh4kwMncFjVDLSlG57zSVbRhJIkvz3v+5zuY89iXXj7sRrETthdAHjS/8R9c6xEGQPPOp83/eCFC0Hklh+u7nI6zoA+OoVqB1xFif/bsqNzuCVFh2ClY3rU51GXAuW41Ta6vR98gIZOM5NQV3f9s6+eFxfm4M8kNm9wd9D8x18QkzH3Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726726054; c=relaxed/relaxed;
	bh=453brNVhqnRIHLESR9vpSUdbsR476eb33wn9bOocwUs=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XJoMFFjIeIcavwwsyIsq7TMZdPRCMdQZym9QzfruC0otdK9VE8xokzrOnA+SgX0otAZrbVJzvuMiKNVD1AHNXqAoBehOYiIMwAE/vEPUe44QQ9TKL4aTyLaaQwWtIy+9vUl+ZkhKAH2IZzgJH5C3LQrwnK/ymKzfUWz45XKQkZirCCAM7euYrC2DY6Je9H+HOCCVPaafebNiY08cl22/9efBS78DKK1d6pFkoRXUHJEDr3RCb3Kh6Q7lelUd7nWJm/bk3hf1REgxc/xHayG5MtmpNPYJ+Yh3vfX3X33Cf8/NTU8ODUgOrqACRo/TDy8ri+SBlPUCm6V1iZouGeXgNw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=J4BAm7Yv; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f400:feae::705; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=J4BAm7Yv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feae::705; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20705.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::705])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X8Q6F6Bx5z2y66
	for <linux-aspeed@lists.ozlabs.org>; Thu, 19 Sep 2024 16:07:33 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o2ZPTvcg67x/Jk9VfUqxkfVjsa6PhaMnhFsjP5nBQvMUyv6ggd2nD+T7FPLTtdNtOP/KBw/5XOb6gi1Qgom7uRV2SLGpxWLv8kVxPXr9DFni3i2LSubqigV3c29tqvf6DyQafPWzVqfy17dvcsLfNtLmn9sQtZXgw2VEgIfpp2yRskIPhKUdWe+7Nx8E9cFrJsDcl0RLdEwzADcw4hyC1c5EKSIeGawwFnWIvKRC10Qdx5kkMTkH3u7GcWmdlVOeqdY4jzHN1Jp1d4I51dcbkfjys5/vUXSxHaDcAa/VYkYzgTZZtBskPvTg5hw7oSZpVgZ0beBCgSkLpfgG/KMbbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=453brNVhqnRIHLESR9vpSUdbsR476eb33wn9bOocwUs=;
 b=nncXE1ji1ZDcrS70S+qi3+wuGcm1vfBDTfEngspCsvbAb34l6J1BlhfpRv81Ni2C2LMPAEvAf9VGgZBiyJqqOQiptTKqHnFo3+bIPJfAALAdI8Ntcu4ZXl3gb1SDTnMs8ZOP6RQg3kO48Oz2oxIAkqbXwcbMnRwMIOcRNgRvhubz9WU/zVlLYPTdogelcDeXtWL7LiARQFKmtv1/1DHiu7O0wqfbluOBKa+Fc7x8k40ym3aMV2imRazhlPEqx2qTXvCiN8jQi1+mZVU4jU/AyzPVC3CKuXSthhDN91CqPjLXnD7YxCvC9OVUVRPzLmNwygJuoFzQf3G9ysv+NL8LVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=453brNVhqnRIHLESR9vpSUdbsR476eb33wn9bOocwUs=;
 b=J4BAm7YvMKFfpLV4Xy9plcChihVlFS8RNjC0IijTZV3lPoqMN0RouSio6ES3UQ3dgjaLyxj1eHUI+JXq8wOM56UGFkVfdkcee2tNPHGtagVk0nQT8pOnKzVhL3S6s2oH8RByy1g7aaMgpsecx+D1GpLWZuLDNeDCptyUdoyZqPcSeQOIOLqiDxmwCEfkY/pXyAXP+9ByLBCGqDS9k8qCRVvz+F970pJgk0HPtFutyTSqcNl0CFIwbehL/YxIl9SB4mfNjITMerq4nanD7on3qKt2DwpgdgB5oR385ri0mqZeSBYdDuiuxqV/ThMDDqD68gbXc4lpAvl/dtXn2eqMrQ==
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com (2603:1096:604:29c::6)
 by SEZPR06MB5222.apcprd06.prod.outlook.com (2603:1096:101:75::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Thu, 19 Sep
 2024 06:07:11 +0000
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::814e:819a:7d52:7448]) by OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::814e:819a:7d52:7448%3]) with mapi id 15.20.7982.018; Thu, 19 Sep 2024
 06:07:10 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>, "brgl@bgdev.pl" <brgl@bgdev.pl>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"joel@jms.id.au" <joel@jms.id.au>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>,
	"Peter.Yin@quantatw.com" <Peter.Yin@quantatw.com>
Subject: Re: [PATCH v3 6/6] gpio: aspeed: Add the flush write to ensure the
 write complete.
Thread-Topic: [PATCH v3 6/6] gpio: aspeed: Add the flush write to ensure the
 write complete.
Thread-Index: AQHbBbCklnKbclZOhkmIyCk6TQtm3LJZvooAgATpWm0=
Date: Thu, 19 Sep 2024 06:07:10 +0000
Message-ID:  <OSQPR06MB7252E3D6D693BB5A920EFE798B632@OSQPR06MB7252.apcprd06.prod.outlook.com>
References: <20240913074325.239390-1-billy_tsai@aspeedtech.com>
	 <20240913074325.239390-7-billy_tsai@aspeedtech.com>
 <7433f7d95a0a51eb54ea0b1c9db102adb029f946.camel@codeconstruct.com.au>
In-Reply-To:  <7433f7d95a0a51eb54ea0b1c9db102adb029f946.camel@codeconstruct.com.au>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR06MB7252:EE_|SEZPR06MB5222:EE_
x-ms-office365-filtering-correlation-id: a3548a0a-740d-4a39-cb9a-08dcd8714c8b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|366016|376014|7416014|1800799024|921020|38070700018;
x-microsoft-antispam-message-info:  =?Windows-1252?Q?auAJ52qTCTclRY+ISyOaGNJ6sbw87hWOFokI305ZtjU3ijUNRQinEiax?=
 =?Windows-1252?Q?7/eJv8p/lT8dtgakc1JvCCcCZyCkWU6+Jd3I2s0N14DHlb8YgrAS8MPN?=
 =?Windows-1252?Q?rVa/CN7hJ9wBgKWkmQ6TBKsWvvUBH2yBnLe1Y+/gClEZvFRe0jZN2/PL?=
 =?Windows-1252?Q?ZePNl+o7BH/oFR4r3Rl5oCeyS0kZLKnhEDY6K3t9ZFQ8L7I706ZTtY/c?=
 =?Windows-1252?Q?+TqVP4v+cXU00Bl1Hvsm5z1WFeZ2FefoKnwBRH3TRJyosZweDW9DVCSX?=
 =?Windows-1252?Q?Y8jMqp0V0jJLLjxfHh6o4msBRgYR9rT/EkqnQrDMpndPTEOSvgxTqJkQ?=
 =?Windows-1252?Q?lDzGWVlmSa6SuPscr1/FTCPHCbNvP+OX62fUTUvJC44l4pDQxrFqZQ8V?=
 =?Windows-1252?Q?PgdXHCxnGH3n7ZcAV3RFZvjBBVYSIgAgMtcve9lJmIBq/bKy169okCrU?=
 =?Windows-1252?Q?6cZ+ldxaZ4wX1nP3f15GGREankLjtyWsVX5oPXxEeRdmqFSfejdhelAZ?=
 =?Windows-1252?Q?fteP1cvKDImH06iOsPQ6t+7F5MwrvxUcPCvhYpE36dtEf/oJ8n3aNrOD?=
 =?Windows-1252?Q?42aYLLni73vjXGpUV7UpdnkBNIvFfbCAJojypaitk38bF6xpxAEccOmJ?=
 =?Windows-1252?Q?AJtJO32kSICnBArKwjdnroMBEkgHDt19ucgIr1C8r3fwz77rNCcgHZYa?=
 =?Windows-1252?Q?7T3iNRlG7Sj+TQ83Ukojnl1nAagF5W66FSWMRkH4llONMmweHEejuQHW?=
 =?Windows-1252?Q?VmjbKGPthXN2fbeYUy7GMi4ebf+op0/X1CMP9/rt3cyvaUnyvfSPpftT?=
 =?Windows-1252?Q?M0RrYUQB+nA33NsrC2u4i2//rOra7MtNyJJmoXfcXLc79TiVB7h1WMp9?=
 =?Windows-1252?Q?KH9+PeWkIZMPWhiTmLEJaCzuigmmF7loxsUumyM2OAm3PE1AKFS+0VSl?=
 =?Windows-1252?Q?RKeNwXzi1HP//46qdCOKf1HErp0JirSBhcLxvvRC41kRUj1ZOHkOtrfQ?=
 =?Windows-1252?Q?a0sOPY7QCX1VVXkbxbOZqWBbufeoC77M7z4gH8RJnRKO8nqxZIdDOj8y?=
 =?Windows-1252?Q?lnpu+qfm+Y+J9/ViZ0Ykk/oYyTRLpZYOzgyh87zJ6wPJFhHKaXkRPtki?=
 =?Windows-1252?Q?HjgjeG/fx3U0kxQodytWhPPORxvwhOhLP5AeDODencjHj9uXV2X7kMh5?=
 =?Windows-1252?Q?twg+sKDnofGh6tSlKddwP0WSw19UNvL9VSP8XH6VVw7mOnTMAE+Drkv2?=
 =?Windows-1252?Q?oDzdkue7x6zw53pIgY5CVY0EQa6w+K/HIjOlc2cOdKW/52i0ZABd5mPz?=
 =?Windows-1252?Q?tGHZUmG89cFuwdNGGY1rPawx8XxjyIBiPQT5K8QvER6xUT+J7bA4jQZm?=
 =?Windows-1252?Q?pcj2U077G3CZGYcBnfbGdp4mzIJZvfdDxQHTW1Qlg1n7v/TrfPvS7IB0?=
 =?Windows-1252?Q?Kxpv1XJYOBZFbHHaEXFP/8f+c26cs0hkIbwQRXfrADsfCTs45RI/OxX6?=
 =?Windows-1252?Q?/vM1CW/zS7TDDjmSfheZhzGMaPJ0o47jtWhxAnqkyaLaolIdM18=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR06MB7252.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?Windows-1252?Q?Eh9Etp2gVNJGaLvhJEzsTJtnElVuL4eHWQwpKP4+H/VM1ScyP6/eyy8O?=
 =?Windows-1252?Q?2pyGViaxJku+Kl8HkhdRTnk7FdVAQq2ajhGsTWaA3AgqGCKd6LHCCXBJ?=
 =?Windows-1252?Q?72uyXkpmZQQcT4oXSFcPuosknT6iIdGxkUhxN4ecaoLw2KYfU1vGtNUU?=
 =?Windows-1252?Q?VrFhH4KuoiRL4SmdMckY48hAi0d1bmq1Kyet2PZivdEnCdwvyy7FxySX?=
 =?Windows-1252?Q?HqhHKRQTbQNfS3xS64SIg8H9tWVcg+JcVqi3bY0UHDWic8VQvwhdvkRT?=
 =?Windows-1252?Q?sRl5URTGt8oN1iO2CnSMxTslvXm50I2bDOW08gi/ExAMtX4UYuiTPOEc?=
 =?Windows-1252?Q?bQjhnsT79ArC2GVNTZ1ECbxG5g5hbvp16MJcepC+Ibk1tHt5J/YRDHny?=
 =?Windows-1252?Q?yXA0dm20Ge6AZg/Iix78G7g69yVt/yJlxz72pMkCJp0On4JH+IhW5NCr?=
 =?Windows-1252?Q?BK4OzHe1W0U5DSavhrIJSbzThkMyfZ3ycVvxuPPvrDKwGR8VdEpp5rdr?=
 =?Windows-1252?Q?pdZucBqeeAMn89Xq5uWQeiMwLFIXSF/Yd5tYxbuADFVJWeK+i7xy3pxB?=
 =?Windows-1252?Q?Aaowf3MZTvGCz1DA+OmPHHOmJsJgJo2gApI4LUIH9AnAIQ1n92M0oNkb?=
 =?Windows-1252?Q?6ofPk6hdkNOBYD6WonxwIKJwt+ChIgdylgRcJ5n08j5NW5sxmq6EoFw5?=
 =?Windows-1252?Q?U197ORNBNj0F6ZxyfC43xKdCehI88znHF1nOPBBK+NLaXLFnsUtuBv1B?=
 =?Windows-1252?Q?Hmn1rWjzNxXB4vWwKFf2YQjjkq66S5UJCrEsALusHZNGJ9JFCoq8gfIt?=
 =?Windows-1252?Q?Q73Hx7HRodR4kkqplr+F6goMEpTRyHutkANFVD2cYIYB/Km8MPP7hND/?=
 =?Windows-1252?Q?IArUqJbpTMFE0SyuCDVkYIpwTCOwo5ElS8d86IIkX6IRUKwHtmAAOSin?=
 =?Windows-1252?Q?SzsodiAwlRbxtZl2JNgZ199EBzL2NYf0RnLYo/GtvstRWLlJZfYENVQG?=
 =?Windows-1252?Q?YPl6u8tyJBh+wr/zSQdValLOeI3cFZ93tVfvPYEXcJfko/2DClmPlpF4?=
 =?Windows-1252?Q?62K+7kSFp8eDlIMXR+l/OeN6rpplgQB89ZG91XnjzOT0t6QDi50Z/XqV?=
 =?Windows-1252?Q?CpqcQX+cuei3nUDx9PF6kAgK6NXGCIb2vhpI7B6UtRVmyyOe77pRPyUO?=
 =?Windows-1252?Q?e+vGsKT8YxQemmPu6oUDeLKiIFfbvRjSytn4vOwViV/JxQo93TNAceeI?=
 =?Windows-1252?Q?OwC1d9RV9eomg7py//VGqMYhASSGl4cEjLv29AJmTQMS7qLuDbkO2jGM?=
 =?Windows-1252?Q?QVfczVKtS4o5Z3pcwRs146yqdMAaGQur5hoW4t5R064EE/5R2dy26Ko0?=
 =?Windows-1252?Q?5vFdYBw8kkAGZoVmn7jWgeMHtIwRPPtE4r+a4EAbqdjvPs+V08jPejoJ?=
 =?Windows-1252?Q?cdb+SUVoU7MV8NX5MD5sclPxKcojSbn93Apjs0ho3PeSM8Fd/VxUmuwM?=
 =?Windows-1252?Q?GuYR3cg9dgh745geEMx6FVLuG1edG0tcdCESm5EH/8YRkBGLN9YWcQLo?=
 =?Windows-1252?Q?c70rp6D90++T2Ngc3mmzGrvFvTqe/qIgFDV0IqpNQbOjI4/Q9W/X1LfI?=
 =?Windows-1252?Q?goSfAcX4RDeuCDwlL6BrfFnEMb3kC4WAXqjeH5kSFxBK1ZmUg/CpgyPb?=
 =?Windows-1252?Q?AX2EO7VROypkl9VI5atC19UfLCev/CTD?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSQPR06MB7252.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3548a0a-740d-4a39-cb9a-08dcd8714c8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2024 06:07:10.6451
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vIiI0RVM9Kvl95Xh2m/32823svNRFAh4Xv/rQnf1eb/HA7OXVaZEek5sD5Q4qCR1VVNdJMyjYF4COgc2+iTCJ8NF0NXVZ0cUJ5VN6024860=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5222
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

> > Performing a dummy read ensures that the register write operation is fu=
lly=0A=
> > completed, mitigating any potential bus delays that could otherwise imp=
act=0A=
> > the frequency of bitbang usage. E.g., if the JTAG application uses GPIO=
 to=0A=
> > control the JTAG pins (TCK, TMS, TDI, TDO, and TRST), and the applicati=
on=0A=
> > sets the TCK clock to 1 MHz, the GPIO=92s high/low transitions will rel=
y on=0A=
> > a delay function to ensure the clock frequency does not exceed 1 MHz.=
=0A=
> > However, this can lead to rapid toggling of the GPIO because the write=
=0A=
> > operation is POSTed and does not wait for a bus acknowledgment.=0A=
> >=0A=
> > Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>=0A=
=0A=
> ... are you aware of any other driver concerns of a similar nature wrt=0A=
> the architecture of the SoCs?=0A=
=0A=
No, we are only aware of this issue with the GPIO controller, which affects=
=0A=
the output pin behavior immediately after register write.=
