Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1411E97C42F
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Sep 2024 08:13:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X8QDm5dljz2yLJ
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Sep 2024 16:13:12 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feab::709" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726726389;
	cv=pass; b=AO1G7HGAxG9fIQprW42KehonBh3OSkLzCcbXmGcUIEOyPILcqCjPzegwBUrg/hhMB/bd9bpehlr27ZCSv4VDOL8JiZsaDnMTxd2yoM6rbKe1V/EcMsQcsQ+AMYt2i7IUptnpGwoQ/P31FzbqVMeITPcBFWVS5uxf8QK7UdmjOJB+Nc8e3z2iRHodChgtXcb0ZCa1VGfq6LJHweAqWSO0O1TJpf4xa1f0zdQzJf9vtoZogQscw5JsV6znCyNjqIaIxXwmJeq4IsEgN2mou88osyMJRMbE1ww703yhbc6iLKMB0gruPa4bNdr7W7gjhkbU3rAxE79RW19BM+TcI5++rQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726726389; c=relaxed/relaxed;
	bh=RsaW0718OpwZhXvacw78XyPXSkWKPYDZEWkyETek2WQ=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=A/9S7u2RfvEECMFgNbhE0ozotnFXiRWWRgxomq4FOuyiNT+RBxB+sbG5Arw670oaGfi/5nEZYVDHzoVv7YJG2S/lf9x6zL0AbJ2eICyhTJHQyaHv3f4Te2fd99l1cl5Lecypn4PpFOHlrzXtug1+EHNnUK/kyWqLNILveG+PfnirUJW0G4ApDLl5hwywthh9gQafN7f2uGdSBBkurA4AOvuDfidMHSeElEStK513o3SrcplztUF/AbkhkxgnSQDuoEZdfbG/KeyhrxfetpYdfo8nVyw1/hh+4W7KEWW0D7U3GoXfhQH/svdoEui2pVOL5NvIlAxU5Z5I5B+hrxA1rg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=IX6MmkB5; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f400:feab::709; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=IX6MmkB5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feab::709; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20709.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::709])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X8QDj2hYWz2y66
	for <linux-aspeed@lists.ozlabs.org>; Thu, 19 Sep 2024 16:13:09 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=seNC5++fU189xfBv08youzimDsieQuIsXGujV7+YgTinDyvWPyZ8qBJjmmw+pMmIaclhIEUMOxMvTk2/nFncuDxOya6Bzz+d6zHBSDzLnf5RPCx65e4vCUjZDSS1MpApoYyxUmO1EJAOkj9ifWYNN7ERDuGs+iRMUhHxjE11GZpUE66F6UoHru6prwz9AzpNEAoUeSvZRMkHcPf2UQFzw3rzr74a8U39h4YaAndCRsGTpFAjCnPpfGQVFK2rAfBDxSdyIdcWHYJEDbwFKW2W8i1qGWqJhzZ4Wx+cX5iIlbnLkSjWu9J+I+o69r12OpnNj5+BdFPq2qdgOalT25pKSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RsaW0718OpwZhXvacw78XyPXSkWKPYDZEWkyETek2WQ=;
 b=cGITuxmUV82mE+y1vaSBtlyV4o6MDCPyIoH8omraBWy6h/N2h9O3d0wH0T791e9xDlGUKN2fX3H9vjf9FKMGU6v2xmP7M4lN4r68Gg+WtiEgmt50wCv96WCeKEIkNGcjjgzF1NRIbJKpIweSjkJxtisiv8LAA8eyCZCT+Z6ym4Bn2XQ3RW1F5t4W5hDHLc/Px7Ws34gK+LyfgMeuhkkY+pApYw8r7qMKO1/K3ZuZkSnYKvDrZu+wi6EM+n/kq0cr0MkeHQ1m/kLJ6nOWYRkWwW4Cn+ngdSuHy3qhr1Lr57tzy6yrBt8Ol2WlerqH9xmwlJQVre0dIv4yuOGT2+45qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RsaW0718OpwZhXvacw78XyPXSkWKPYDZEWkyETek2WQ=;
 b=IX6MmkB5FsnoNNFs4Z3AI30CLa5X3bUvxOsjqU8CWT7Dqrt60x5arNGxfl8QKICKJ54Q2LCSm60uhmKwZCGBkisg50w2oU+c8hsLkUfcjAQKEsV8itkqF/AfEzKvoAYtz427CurZQ9rNd9MbHhNOqlS4vHZtD58SxvrpH0d/lVFQ0FcwVMkgjB5zfA+d8H4nMq7PDLkEdCeUqD7STZ5RoPMdUVkUnjBoLupinZJNsRKb12uasvQuxG0vTDk3U+Y8xjBYrzuxmzd/je194ce6oAS0pk9DrrkxXZb6NB0Mqd0LHPIU0gRiRTlDcFPoJV6aRzPzT6nqWO6zGF+21QM+2A==
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com (2603:1096:604:29c::6)
 by SEYPR06MB6400.apcprd06.prod.outlook.com (2603:1096:101:141::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25; Thu, 19 Sep
 2024 06:12:46 +0000
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::814e:819a:7d52:7448]) by OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::814e:819a:7d52:7448%3]) with mapi id 15.20.7982.018; Thu, 19 Sep 2024
 06:12:46 +0000
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
Subject: Re: [PATCH v3 3/6] gpio: aspeed: Create llops to handle hardware
 access
Thread-Topic: [PATCH v3 3/6] gpio: aspeed: Create llops to handle hardware
 access
Thread-Index: AQHbBbClpHPPCcZ2n06VXrbepaD7UrJZvbCAgATr8rs=
Date: Thu, 19 Sep 2024 06:12:46 +0000
Message-ID:  <OSQPR06MB72528D55D21A34EFA29797CC8B632@OSQPR06MB7252.apcprd06.prod.outlook.com>
References: <20240913074325.239390-1-billy_tsai@aspeedtech.com>
	 <20240913074325.239390-4-billy_tsai@aspeedtech.com>
 <2be44ea18d15f1ecda22d867396671802be14ebf.camel@codeconstruct.com.au>
In-Reply-To:  <2be44ea18d15f1ecda22d867396671802be14ebf.camel@codeconstruct.com.au>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR06MB7252:EE_|SEYPR06MB6400:EE_
x-ms-office365-filtering-correlation-id: bf34260b-d790-43d2-05fa-08dcd872148d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|1800799024|376014|7416014|366016|921020|38070700018;
x-microsoft-antispam-message-info:  =?iso-8859-1?Q?Thy9pB7/wVbRiGHcF2syJhGVJM9tCukVR8ihs3wPWYtfVr+U0Ji0YT4rKg?=
 =?iso-8859-1?Q?VQu+w1VTpn9O4g+s0iv2N4jO0TtYR0YisWNNeBmkP0F1EabMavUApcNiZj?=
 =?iso-8859-1?Q?/omigmK3BhlCGgqsbpHCw/va7Hzs0CuLmt4x6U48APpMwZu19JLjMnczVp?=
 =?iso-8859-1?Q?+jWGMP3qd3ywXlLhIe4f3Rsly3/C7GtGU73H/zU4Gl7PBuX88FHZJy0sLK?=
 =?iso-8859-1?Q?PVXpsnwubQb0zb4cvQyxf2hvQQrRIoOhzBiX/mTku2Yvwvw/0+8X7ZWMos?=
 =?iso-8859-1?Q?Pyledlan93melrr5FQL+0l7sCdc9Hy7jUxv6J2XfFajlJo2YFhuDem2yw3?=
 =?iso-8859-1?Q?PTVwFlNrpP0Difr5zLbpvlczY09ljRYVrYMGxuhVh7jdD4IPJ0K4wK3g5s?=
 =?iso-8859-1?Q?gyl6ZmSvQ3DqE107mB2hCpaE7flFELgciJ/SATF5tAFV4wGwG2xdaSwIYJ?=
 =?iso-8859-1?Q?wfFaP/ynefUn0MvNmAoqbAvbskP+VN0d7uZSQosvaqzJpIMrMN/sGm0miH?=
 =?iso-8859-1?Q?ZStXIF0fCiOwgSxZHmhRzR032iR2A9hKvZ0I0XqtAvO3ltjD0rdJroDqQo?=
 =?iso-8859-1?Q?sMtHgq/QSFQ90obz6dIugf7O22tTK3B3Mwm4ezVT6FbWaJTCXRl64I1Y3s?=
 =?iso-8859-1?Q?Jm/ESHDIlR7BgOzPaepLST2KsfMjkXHE0KTZ3yYzHR6WkN0R1aUALDEU9s?=
 =?iso-8859-1?Q?fDlViG5ivYiTI3ObZkro4UwUVWrgErvCc2N1lChUNHwuHlIH4kE1QG400Y?=
 =?iso-8859-1?Q?BnVawXnJPJnGEs08tpGcWaurdNORQlgM32X4L1bPNXfLM9VVRRfz3bnNq0?=
 =?iso-8859-1?Q?Fij6maYitWi8Moj6fp/baxUEX6BqqWskkellzS6OrvEHgsfab2jEyVflu6?=
 =?iso-8859-1?Q?KPixdI2p6wB8DHZJ1oG38PjQqw8aZXHdOiYutSkt+Mfnyf5S6HstWYgAfJ?=
 =?iso-8859-1?Q?wQytgfuaJozMhplVwRojELJYGy5ejTvfYHMutNYd7favIBhE33dbBBz3V4?=
 =?iso-8859-1?Q?pQ/LnRigQI2h+HXz4bZEOHPneQCWiT0eEFVts8E+BvIzgALIgWEVSBAfEJ?=
 =?iso-8859-1?Q?nBJu9rEq6h9O6pHs8a35xp6bEUcgM75W8y5RP2mWN/U7eWzV65mq5R7afa?=
 =?iso-8859-1?Q?RAIuJWy8T70lDzEc4TuiB5NhQJCpwsbUInLHyKqbkRmmCWsF1F268/DH3D?=
 =?iso-8859-1?Q?luY/C1vHi41PQ9Ou1oiCA+rrxFJZVPQgY6RNDGKeFRwphEXKCx1DbETXN/?=
 =?iso-8859-1?Q?5krx3aewjsOqlNm/k5ptFEOiv/U3VORCmBMlK3iAV5QCwbtNlq7c/07Lwn?=
 =?iso-8859-1?Q?Lq/d3n2UuYGpOY9lQ2GiNSpCEjzmmyy2WsC48Vp7n4MGpwHxYQHJUExk6s?=
 =?iso-8859-1?Q?QYqcALsubrlBFxOxg6FPXkCfzoS3GXFOn2IloSUPrSLvoeO6Wt+WGwFT09?=
 =?iso-8859-1?Q?CMyQ/3J/lm2SwgvpVl8iMPyzm/hWcH4mIL9DJ/vK+jsUh9pBHKdyoMV16b?=
 =?iso-8859-1?Q?s=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR06MB7252.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?iso-8859-1?Q?T6J2KKl657YvrYD1unV8nDGJ62I61ncAQSGEiWoFa971UtRY0l+09XRlNj?=
 =?iso-8859-1?Q?e/FBeTxJEnnoo/S7kXdyTunXlJGKnXoCZEe3bzh/ZKf7NuWqb1rYNlmLW1?=
 =?iso-8859-1?Q?CHjBZ+X40EytDB9Q2v2Um0c9+PBqe8tIDCvGBVv/7HkR9RHBdtWkuskfEa?=
 =?iso-8859-1?Q?TKzWuS420oIb1l0Hev+MyxgF+vs6OrRReon0FMOGdpA8g8ngR/P04zmfAG?=
 =?iso-8859-1?Q?UqZ2iBrCX58ooec7MdJ6j0zb3RUNDaYZEcNdmBIhPA9casMrHyklliglLZ?=
 =?iso-8859-1?Q?aqGeTOGKxpeeCTbU4Dw8nNFY3KSReQAU32wWNyXJItvgu+mG2fmG4vwAwm?=
 =?iso-8859-1?Q?+3x3SU8IOJELlhldj8VB7OLBl1TigZBtyFJkiNbfmeGuRpda7GAxi/Q9zb?=
 =?iso-8859-1?Q?jtf0K9BOAZPryH3f3v58qd0buQ/x+aRYxkMo28OOwWPCw+PRxaeBN43er9?=
 =?iso-8859-1?Q?KBSCGOQ7U+bvkO3MlxpRNLIMgFfPHe+PD/BXPbbfsVuLTrjKawH2+6CZ83?=
 =?iso-8859-1?Q?SvhOfeTWjaQG45mF1nRU0XUBp1cksnqyS30Znez7acXe4EijSuSNhf/tGG?=
 =?iso-8859-1?Q?VDmX6iULfR1X4kZ2IL/imATbZREyZY+boKmWswDirmGFuEVr5QvBfZKaBC?=
 =?iso-8859-1?Q?M3xCwQsD0xyPiDrcgtwuGVNNwfpvcaOKpjt8tMAZhwbZv6kRImOmZKah6R?=
 =?iso-8859-1?Q?sMfd+i5ba1DMN+sejjdYrEI28o2OBiSbXGXRGxe5H7n00o5Y63INfnobn5?=
 =?iso-8859-1?Q?MHQ6HjVMtlMGUYBV8qNmd4Ore+ZLTx7N3jX31VazNZF6TpD1QGS8q/8m2W?=
 =?iso-8859-1?Q?bLmdjz+Y1j3tUN8/PE3lsmUBDYkEyaUHUXATGZwbUlwSWaWGHDlpSEu4UE?=
 =?iso-8859-1?Q?PUbMR5QL37SN3B7uEBkirFgyjqyprUlu2JpA4TjCWgSBOqjsLWe8CxVHCP?=
 =?iso-8859-1?Q?03h5zRu/EuRftLhhb9i62fHVx5+0PtMT2v3EN9bdYVm1rDHvqTVSAhugZE?=
 =?iso-8859-1?Q?IYvLyPqLxZtcQdxQGW0fj00siwTBqJFfUH1mpTxB14nO/WKUnozoFZOZbs?=
 =?iso-8859-1?Q?xkr1SDMImhdVdDQs9N+HQXIhdbr/M2bAvNC9wQL+BEJcB8YQARal/e9FRM?=
 =?iso-8859-1?Q?/MafGP4aHbMvI4T+QeUMpL6WWRY78z3hD4YHA6SzZTapGdDHL6PGf7F+PY?=
 =?iso-8859-1?Q?yAjPgijTLgbSxA1FY31ZPtbjXtICiVmKF3LfdkwDaR0zIre+jM/hEbGk+m?=
 =?iso-8859-1?Q?w4d4QVIvOd44ReqYAHAD7uzRmM+dFP7qJ11VYzNV+eIxCCcQovdSUR+VAx?=
 =?iso-8859-1?Q?Xfll9P2AIwjzYeLlVj2VuW4hRWxELmpwXZZ5Pl8mjYsXnXV7xorBpbqCFm?=
 =?iso-8859-1?Q?2xER00Frq9VVbRB7tLja/3U+8ixcndlavk9fTx0ryea1A6t87gdhitdCIs?=
 =?iso-8859-1?Q?8GBReWmR83z8y+Ks2uZBl6x1qqQy02O+ZaO1ckSKFWhK3P+CCPtr/xpsN0?=
 =?iso-8859-1?Q?U5F7tUNSYV1T2o7dSo2cJSN5eQjUOKtI9Gyr8ClqhMvK/xjpuOIjLcJOTf?=
 =?iso-8859-1?Q?qorqowchBKtsx7sUST/xXLCOW++Bxqiak75rrBTnQxdXseInxqyVsRG9MT?=
 =?iso-8859-1?Q?OzeyZA1hI+AyGuGzxFZiCupn56U0mhgwBO?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSQPR06MB7252.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf34260b-d790-43d2-05fa-08dcd872148d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2024 06:12:46.2345
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V5qxZcsxrFPejOehSJx55AYfOtQ1ZSV0VST21SbFOqULrjHu6q/I9jAD1tQYGgFsqWPp+2CzGFweGfYXdjVzSuorYle0cgIPfYPqbb9V+80=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6400
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

Hi Andrew,=0A=
=0A=
I will add the following change on the next patch:=0A=
=0A=
1. Add `privilege_ctrl` and `privilege_init` callback=0A=
2. Use `bool aspeed_gpio_support_copro()` api to replace the `cmd_source_su=
poort` flag=0A=
3. Add the `dcache_require` flag and move the dcache usage into the `reg_bi=
t_set` callback=0A=
4. `reg_bits_set` -> `reg_bit_set` and `reg_bits_read` -> `reg_bits_get`=0A=
5. `bool copro =3D 0` -> `bool copro =3D false`=0A=
6. if (!gpio->config->llops->reg_bit_set || !gpio->config->llops->reg_bits_=
get) return -EINVAL;=0A=
=0A=
Thanks for your comments.=
