Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CAB96822E
	for <lists+linux-aspeed@lfdr.de>; Mon,  2 Sep 2024 10:39:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wy2Hp1cYxz2yQ9
	for <lists+linux-aspeed@lfdr.de>; Mon,  2 Sep 2024 18:39:50 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feae::72c" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725266386;
	cv=pass; b=e9Ou3bTeKZndIwd6UzPOSi6BcVMVVtc+ZklAcJuVrXmsTVuUB2WcvKKKUOnqFrwARzWOIbXBJ/+v62hSfgbOPQIsZPffBE92vfE26goudOoaCl/gf8SXtxHaoHuYq2hcrHkX+o8JdjIzWm9ioSdxBXckboxxlqDcoNo/ibA1I8w1j+pPfULBG3UhcpAdAKMmYk5kVvfCnzG9APSSS+OBtOPFaq109+UQtrgSFGOP0Jw/CIyyjMrCT2TmJiE6JSzLlKbGnDJ1qyp5dYwxr2ir1BzALWT45p2mXl3YqjCtjBfnEkrzHB2mPu/fi9FVaRum0mPtSkiWq0FCsqSDO9+xNw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725266386; c=relaxed/relaxed;
	bh=dU6JLzruOY5uh6CRJnaZPS3J6xtqJJksiiLHp1b9zhc=;
	h=ARC-Message-Signature:ARC-Authentication-Results:DKIM-Signature:
	 Received:Received:From:To:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 X-MS-Has-Attach:X-MS-TNEF-Correlator:msip_labels:
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
	 X-MS-E
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=b/K6MgDV; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f400:feae::72c; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=b/K6MgDV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feae::72c; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2072c.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::72c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wy2Hf6yRvz2xdX
	for <linux-aspeed@lists.ozlabs.org>; Mon,  2 Sep 2024 18:39:42 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cMtIwiIBtOw6Jl+n7JUOD6zyJbCbaip8K3unTvOuJU6/Rx24Y9SJoPdCaSp40UTpCO7zTv8zSxEf/VQZFxNH/uFVEnJX2InwhREAZ3qs3s5cwx+aXlgbyfssGntDb1LLABcP0cEPjDGZkBG0+49v9nBb4htijKPDwRo+F8zx1rvIEKSiMg05/OaGiHVwh0nZGLgoY7SaDjoXsFIQVVj3IIN6LPttoDb8NAdrU0BNGvmRu4sS1xsfVxjdxEkKm/1ImhyWZZQ8r0QilVY2i2TsqGpHlOBifDubQUakeKlZW4PSRmuUnLS5AadqHUKJYX28u4fkh8QEaFSRxp9p5sduGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dU6JLzruOY5uh6CRJnaZPS3J6xtqJJksiiLHp1b9zhc=;
 b=gHA01n4wAni/F3J5g7Cmwq1Pe9WBye2kh0psVWIm0I8dzmmtn9CtpItl6jyhfE1UGY2J1yGwkCQ50FAs/TvCmaOg5raSsea2dhwVjiaF5Rro2aqDKm/g65TLK0DfNqNWdvuzmoPVQdElmDEsVSCWbOJo8DI5jPbIVtGl+odkXllo0S/kCtjStEYx8LQ97KvsEOmboHV1JJEuoQiMio0Fdh0aqvQtPT9ek80q3Vyf2SNIVIiD8Da0U6VDubfHitG5QuIuhnCu23O1O957JmRGeVw+vgtdZ/uHm+bYUvQUolXn6hnjb0i0UTNyzPhKOlTjmOnEkBmgxopVenEusukeKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dU6JLzruOY5uh6CRJnaZPS3J6xtqJJksiiLHp1b9zhc=;
 b=b/K6MgDVw9VVuAC54eIj4xjp+Jy16L9nhFKLsKvKqGcBMS0j56bFXu/D/mlaT86RdN7fZokMTar0ZK73sC1Ndhf41tcwYNlaCybiAq+AiE9ZSyYF9dWZMZ4tMoizVmA+lAFjUrt3FTDIEEy5ivlMxCrEku2HfaHD+a/Ao3gMObie4aRFASSESdxuipJBvYnx13jSW1FfNqVJmMlVAem9ykSQSb90K9A3OKzx+sPXqKkYfE3Y4lM6jjQfs6ZfNU4AJHC0wV6ygXdYjduV4Uylh4CjBvuN4vr4iyo3EGklcbGwwXQuPJBX0qi+t+bAcVzN0nBTVuKsmPKShsu3+MVnvQ==
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com (2603:1096:604:29c::6)
 by SEZPR06MB6642.apcprd06.prod.outlook.com (2603:1096:101:17b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 2 Sep
 2024 08:23:40 +0000
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::814e:819a:7d52:7448]) by OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::814e:819a:7d52:7448%6]) with mapi id 15.20.7918.024; Mon, 2 Sep 2024
 08:23:39 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "brgl@bgdev.pl"
	<brgl@bgdev.pl>, "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"joel@jms.id.au" <joel@jms.id.au>, "andrew@codeconstruct.com.au"
	<andrew@codeconstruct.com.au>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: gpio: aspeed,ast2400-gpio: Support
 ast2700
Thread-Topic: [PATCH v1 1/2] dt-bindings: gpio: aspeed,ast2400-gpio: Support
 ast2700
Thread-Index: AQHa85jVx8y1iulrU0+Po1dhfG22krJEOU8Y
Date: Mon, 2 Sep 2024 08:23:39 +0000
Message-ID:  <OSQPR06MB72523232F3596E3479D2785F8B922@OSQPR06MB7252.apcprd06.prod.outlook.com>
References: <20240821070740.2378602-1-billy_tsai@aspeedtech.com>
 <20240821070740.2378602-2-billy_tsai@aspeedtech.com>
In-Reply-To: <20240821070740.2378602-2-billy_tsai@aspeedtech.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR06MB7252:EE_|SEZPR06MB6642:EE_
x-ms-office365-filtering-correlation-id: 9534345b-f4ba-4c15-8c98-08dccb288c8e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018|921020;
x-microsoft-antispam-message-info:  =?iso-8859-1?Q?HJn7K+U5oTtrgRHkBRUfeQ4qfdn7A0fu3PCGaQqZKBVoD398WxcwW6Jprm?=
 =?iso-8859-1?Q?4tn4GhGyD/bpkgnc+NThO9KRO4v+tNbIvzqr19++4ch9ssNG82Hvly4heK?=
 =?iso-8859-1?Q?7u/4JTSoXnHGU6P1g6KHDE9xXWo/D3aqeV51GvwZ7TbqyxVhsWYTTW8xoB?=
 =?iso-8859-1?Q?B04MznwPPhThY5zH8mXir3n6W7pF6Q2G6TI2LLmS22Z9KdqjP0SNedg0iB?=
 =?iso-8859-1?Q?hxk72rE4MZwvK1PP4+3ZKbftpsij0NqVyCOhe4+pqifquZp1peY9LN2KnN?=
 =?iso-8859-1?Q?f/ylpr2KBJjqdTzktIOSP01hq3sRbG7myCxDZDjCGWus1rLZ60GFuAIvEH?=
 =?iso-8859-1?Q?Ue75QsPDVnvbCLxuDVnaOwe0nMRiLAze0vMxgqUTWq8IZMUXUycJb1BLhq?=
 =?iso-8859-1?Q?jBWcuZDgpi4i92w8WdFK87WDbocGvI9/Z5j+1sLHWe2/sZ0BvcljtcgrE6?=
 =?iso-8859-1?Q?mN5ISkJnL/CqMj2w9AU/9Ktbm8PuMoPertGbSNYWbMEulQHvIlw05JyBet?=
 =?iso-8859-1?Q?GFVkAB0ITkh3GRn0q1YIiSwWJjMH2dxYI+M8AlHJ8zUvXH76f8AkbUEECc?=
 =?iso-8859-1?Q?CS7IdNpirLfcwQ+vLByNSOZkh5TQEny0CrXbzsnMjQdzBoq/hz/WmuyFFW?=
 =?iso-8859-1?Q?cUGSkqEIlEyi+LiYKRkuxc3bTXuD90p9sgpycm7DRdiFfW+l3qM5M4cdJH?=
 =?iso-8859-1?Q?atYsgLlJ2CrbuHAykXhNoA+o6kw/jIh1Cg/rA09czjgJpZGh5dLpsUBoIo?=
 =?iso-8859-1?Q?el2q5Ir0Yz7d/ImBWcsBKlQ65RHrfXiLeRL394BBYBgI0FmPjrcXaNDc6/?=
 =?iso-8859-1?Q?B5vYQzedOy/Exvlfemw/P7DXooRm5vuEY8ti7LEpZWTyYmXZ0wvmPj5pj5?=
 =?iso-8859-1?Q?LUTULho9S4LYx7fbo8FIUtdrerDco7buMTuqPzuoKU3UJXJxl3UyfuKC4A?=
 =?iso-8859-1?Q?0kfuAVN/IBB/DueS3C74UlQuUQ6YhzUfBg+c4tkqk/o+6Q7aaLB22Jphs5?=
 =?iso-8859-1?Q?pL0Grne2HXZB8fMV3VYKxpLHtvtTe1XzSR9RNAwiA8IJKLn3+10ZzeZXyN?=
 =?iso-8859-1?Q?hsr/fb/726DpAkeLf5Ze1ugyS375RmKniTT1u3ky8cUzr9ztbtJa8Hv2eT?=
 =?iso-8859-1?Q?k8ij9kMXjN7X+MdWrB8HMT04OoVxKjkfHoPjFte2M/7LeA6vKpJxSNcV7Q?=
 =?iso-8859-1?Q?anX6azxiBNdLMY4lcPZoexOzfdpaC+PmcbbP8GzowsNr2qLfbL0qHnQJ2B?=
 =?iso-8859-1?Q?1spRsGS53jbt+D8uMGifaPlrIGTFLqiiNJvEWvcz2r4BrVqEymOLHg1mQ7?=
 =?iso-8859-1?Q?8PBaG8Y72SDmEyp8iCbA+lRbTM/f6KDYS/nh49MnS8Hpv4Qslg+buUELWE?=
 =?iso-8859-1?Q?F4lnpob0qdscTMrZHfErqFWaUtNUVG/R8ypl2hdOzEsSK9cujiUWVbk1By?=
 =?iso-8859-1?Q?/tfEz8RZyiHNpyAGUEGcyvvFI1VELnzxFii8ZccijTdyhDW+WoC/0BuEGl?=
 =?iso-8859-1?Q?0=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR06MB7252.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?iso-8859-1?Q?8edOlyvmC1vGJT/+EoQLtA3VGGdfMOZ1wPzaPLDFO1/uwSdsK4PIcDPkow?=
 =?iso-8859-1?Q?E5y++cmBrjQktrgyO7w0qdnyTReIPIw9Pld/nhywDZPOXIJVZjwmIWRHQh?=
 =?iso-8859-1?Q?2Yj12UdJ85CNgQSc+VJhx53p9Ctcd6FJPZHApgVUKPuaAHWbcvVyjM3tno?=
 =?iso-8859-1?Q?9cqpDgGHr6INViq4re/DvUuFLpiefWgehgTF45UtttUkPeJv38UU/I5KxD?=
 =?iso-8859-1?Q?NA7X9APHXTKCV/2Y14vhjbsyweO/yr8ldj+wkoou6L72vKYlnkdGc9qpFI?=
 =?iso-8859-1?Q?tVYJpXGLxvSo/5Zr+xZ4qvD1fFGosmHSEW+bp55+EJg7vbfRKq2to11bi5?=
 =?iso-8859-1?Q?xYDf4OCCuvEqYjU8/Xm3Ey9bLtXpLmhvzkn7iMVo9Xg0CNTU9zARdgOT3F?=
 =?iso-8859-1?Q?bkLxRiQ5DujShFaYjjgCZ75i8xYO13eF8qhBibGlduy1gXOSH35wfgj9xq?=
 =?iso-8859-1?Q?MtuTEESiMJ7GyGcfxII+O6B7NpWE77HhV/Sf6imFk9r1XZ2J/JQSnXEKEp?=
 =?iso-8859-1?Q?Xf1mxFpxXsrVk5ehYP1sYuekIj2zR4vO/2VdmNYulDQVxSdE9neElWZF4s?=
 =?iso-8859-1?Q?N0g3HJKw0TU12Vzx7I3Ure9IPUb17QAEvNY9pccEOM0zxSiNEppeLE+wEH?=
 =?iso-8859-1?Q?p6Gzevh2MdODDczGgQ0Npm4aDj5yEB1SVpU9QlLeDsNLHT24uEucGVispS?=
 =?iso-8859-1?Q?MWV1Ta+2UtqK/rPxGX9po0G0Bbf+whYsqj7wMoffc6Ip/VeaDbAyqj6/6J?=
 =?iso-8859-1?Q?GSpUYNBBqfcJTaF6N3UrwnvToNStTUnIc1zk3vlVHWiN+XNQMcU9zu8nxv?=
 =?iso-8859-1?Q?2TJRfowoczVNROMyCxo3EKpZAK5JwVYm4ogxzmaXlfk7pq0fgfOe3v9ODQ?=
 =?iso-8859-1?Q?UXjN+8ISU38ss5zO0/7TvijsW/KuZsqXKYU2iKmSvPpCAzunV5/lg8QaOa?=
 =?iso-8859-1?Q?tHmuxKxq35RD0GFQ7ckf3XGUDkINWhtFe+ILe8rDuU+5s5Xs/8giRKy/Hc?=
 =?iso-8859-1?Q?2P195WuIX3e806C4gsMnOzNfGIM+RPGnEA6mVdvuQmu2ObDslk3dcQXu0Y?=
 =?iso-8859-1?Q?9CVL8TW6PjSttYO/zp0wYX3NF7H9UZwBU6t2VeRkqmyPEw/7Da2Jqq2MsQ?=
 =?iso-8859-1?Q?NQTqKc6ThmUwS2/EnLFZi2g2lo6uAPfTL93MfXMshh652b9K4hNJtIchnc?=
 =?iso-8859-1?Q?HCBG21MCUKUMxAKXMAZd+HHsH56cIg8UxvuiAt/3NPUZeqIqvzh3eDR3sM?=
 =?iso-8859-1?Q?uDsg8q0kDjd/vJ5UkTghDGC4/3DMlT3L82Hf0drIOkR/0qQWdmKQVrleRv?=
 =?iso-8859-1?Q?JyR9hsLHkpwoyk2cj3Ax5xhQH6cmFry1CQsblheImlJ6k5A2sr+/mCsdI3?=
 =?iso-8859-1?Q?mYj0a8NYABk7WrWrqIxZnBUZQ4RefeSHqqCZLQKl4/z8HLKfnVVpcTcVs0?=
 =?iso-8859-1?Q?VK+e8zj8m7g2bz91anaonZfn/rDKOR7zLXDtfHwiWmK63n5/lOXxQvFtsP?=
 =?iso-8859-1?Q?BLvzKfH6ws3973cQvM/wvBVRWXyqQR4XnRje8uMXLVAJO/N6Boi9JR0bSu?=
 =?iso-8859-1?Q?VgR7I0yEUVoRPo9GJs9WEeSpyMigYvOsTo8h6vJcBCkUIqHekoC9XTT659?=
 =?iso-8859-1?Q?JC8aUqPbt9S8zvE83i3oHjrE9OL4om9Cpz?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSQPR06MB7252.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9534345b-f4ba-4c15-8c98-08dccb288c8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2024 08:23:39.6750
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /V5wvc6o8tUL68YWty6+3gBkF+lnUGuhH6g7o1J2Hw1HDX6asCou1nkkolVyBaB/w9drc9UDKpW4UqYUYg0AHArYqA4a3MEHB07kNpBC5I4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6642
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

Hi Krzysztof,=0A=
=0A=
I'm sorry for missing your comment.=0A=
=0A=
I will remove the example in the next version of the patch.=0A=
=0A=
Thanks=0A=
=0A=
Best Regards,=0A=
Billy Tsai=0A=
=0A=
> > The AST2700 is the 7th generation SoC from Aspeed, featuring two GPIO=
=0A=
> > controllers: one with 12 GPIO pins and another with 216 GPIO pins.=0A=
> > =0A=
> > Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>=0A=
> > ---=0A=
> >  .../bindings/gpio/aspeed,ast2400-gpio.yaml    | 46 ++++++++++++++++++-=
=0A=
> >  1 file changed, 45 insertions(+), 1 deletion(-)=0A=
> > =0A=
> > diff --git a/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio=
.yaml b/Documentation/devicetree/bindings/gpio/> aspeed,ast2400-gpio.yaml=
=0A=
> > index cf11aa7ec8c7..4d439972c14b 100644=0A=
> > --- a/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml=
=0A=
> > +++ b/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml=
=0A=
> > @@ -15,6 +15,7 @@ properties:=0A=
> >        - aspeed,ast2400-gpio=0A=
> >        - aspeed,ast2500-gpio=0A=
> >        - aspeed,ast2600-gpio=0A=
> > +      - aspeed,ast2700-gpio=0A=
> >  =0A=
> >    reg:=0A=
> >      maxItems: 1=0A=
> > @@ -42,7 +43,7 @@ properties:=0A=
> >      const: 2=0A=
> >  =0A=
> >    ngpios:=0A=
> > -    minimum: 36=0A=
> > +    minimum: 12=0A=
> >      maximum: 232=0A=
> >  =0A=
> >  required:=0A=
> > @@ -93,6 +94,20 @@ allOf:=0A=
> >            enum: [ 36, 208 ]=0A=
> >        required:=0A=
> >          - ngpios=0A=
> > +  - if:=0A=
> > +      properties:=0A=
> > +        compatible:=0A=
> > +          contains:=0A=
> > +            const: aspeed,ast2700-gpio=0A=
> > +    then:=0A=
> > +      properties:=0A=
> > +        gpio-line-names:=0A=
> > +          minItems: 12=0A=
> > +          maxItems: 216=0A=
> > +        ngpios:=0A=
> > +          enum: [ 12, 216 ]=0A=
> > +      required:=0A=
> > +        - ngpios=0A=
> >  =0A=
> >  additionalProperties: false=0A=
> >  =0A=
> > @@ -146,3 +161,32 @@ examples:=0A=
> >          gpio-ranges =3D <&pinctrl 0 208 36>;=0A=
> >          ngpios =3D <36>;=0A=
> >      };=0A=
> > +  - |=0A=
> > +    soc {=0A=
> > +        #address-cells =3D <2>;=0A=
> > +        #size-cells =3D <2>;=0A=
> > +        #include <dt-bindings/interrupt-controller/arm-gic.h>=0A=
> > +        gpio2: gpio@14c0b000 {=0A=
> > +            compatible =3D "aspeed,ast2700-gpio";=0A=
=0A=
> No need for new example, no relavant/important differences here.=0A=
=0A=
=0A=
> +            reg =3D <0x0 0x14c0b000 0x0 0x1000>;=0A=
> +            interrupts-extended =3D <&soc1_intc2 18>;=0A=
> +            interrupt-controller;=0A=
> +            #interrupt-cells =3D <2>;=0A=
> +            #gpio-cells =3D <2>;=0A=
> +            gpio-controller;=0A=
> +            gpio-ranges =3D <&pinctrl1 0 0 216>;=0A=
> +            ngpios =3D <216>;=0A=
> +        };=0A=
> +=0A=
> +        gpio3: gpio@12c11000 {=0A=
> +            compatible =3D "aspeed,ast2700-gpio";=0A=
=0A=
> Especially for two the same examples...=0A=
