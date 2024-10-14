Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF10999BD9D
	for <lists+linux-aspeed@lfdr.de>; Mon, 14 Oct 2024 04:08:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XRgcW21F7z3cGb
	for <lists+linux-aspeed@lfdr.de>; Mon, 14 Oct 2024 13:08:11 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feab::71b" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728871689;
	cv=pass; b=kHElqOhgEKi1UxRKyOQ+F7fvyWyjvuVqwZstUMx+Za9BHob7lUPLQD4edDz85jsU0SG6MEjFaQO0bJQJTTnpxEdE7plBm10bCrN/UCH4/M+hAxhY1HwIndxChg3ONDU9QDOAZICNY+HI7G1DVTjjiqFgce82LxE4J4AD3xfcc5+HFlW4bhqweYAKu2SKPcTECVEIjS5AfeGAXpMLJ4TsVuQBM7hwPDDhA58Xrrp1PbAPEyQgHUnl40KIayDtiG4HVu+rwWC1jcRG9q7KK7kseooGJzDQuFAKH4h0HCQ/YH/ai4z7sNHPELDJhoE3sHkK+3HU7vxe1/nQI7hVwCp2vA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728871689; c=relaxed/relaxed;
	bh=ANO2HQboqVicZAI6eCetxefyRF36/CZrgK2mg6IgeUg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=msxm1Vwk1UGnrtWcb4nBOYiDqtX7U+voOtC+jmGIlIubGXVq/HSOi4hFw/mmLX7ejBFqP36kQZiojbRycALR644dSKJ0KuusjjO6bSX2PUJ3QubfM5uhdXo/LvqfG3tAg7ko65p1GuLCm6PLcxTvmHfn6RW4y5NQTTMlSOf2VT3sX+9qLKLCBsqLYOdWcoa6u7DkEx4rXtnR5TiDxVBQdg8D9EYyfGXviZJjsXZp16hCxaxOUO52njhsIgY5FOUyA8TfKTS2rHBVRcg3oHj4CVOVxXq5jwYHAh52iXazrocAnmML5dm1530+c3KL7jOffr56z3JtkD9BaA7AE0zykQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=juVDiBpP; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f400:feab::71b; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=juVDiBpP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feab::71b; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2071b.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::71b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XRgcS6Qlcz2y83
	for <linux-aspeed@lists.ozlabs.org>; Mon, 14 Oct 2024 13:08:08 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pPbiRgDDQcSDtc6tOeYkxeXIo03DEyZj2C/aYadMwz+Pxyv+hS8n3lf/aVuAx5zyaxugF4jETsy82IWLb/E+623ms6ITVQV0FKD7KteAZljaH5kq1JRbgqqtQC8JO6179wJSXxaqXKAY3DuJm1BgduUVUtWhT3LXaX0fYnnW3PjWFXNecT4/g+imHnVm1uY+ZocteZjg7Dfn/dPB1o05+yToNr62mkgmFmrZSQdOjKbB/E5I5ZzxvrmF6hoVMycIfZh+orsq/JhLQlA/fKwV/v9xud5JanW6vCmcWFHT1dYaRNRWgStQB6jzqgDvtLo8Ycwyzkz2+ZznsJawSAiGmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ANO2HQboqVicZAI6eCetxefyRF36/CZrgK2mg6IgeUg=;
 b=k6vHLXL30AsGAgt6lcno5CdC3T6WOSsm7G+KNcqMzWH1jUkxfqv7GQZtjHLsg0IeYNz7LUBkbTFXrGdQY4bLpFm4VodS3NRJeCcp+xhCqa5O0ioTmOftMIX3IkueQea9eevXITQhObXs5NOg8nEghtckCR6BFBTRGOAmOAwOT4dHPMleNyNW2vTlkMXpxBYs4CtE/PQOFq53fQhRhkbtpHVBaEpJmiED74YhKYt8Fqtl6pu2VMsV3xA7HpXcAef1h0I48NpjizDj5CUYWdXOw46J3pJMEJg1tOQ0C/PfH4y9/xPF5wiIFooDcMswmiV6l5675e0Bmnf0DmLBL7Qjmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ANO2HQboqVicZAI6eCetxefyRF36/CZrgK2mg6IgeUg=;
 b=juVDiBpPSn0lhuWU9DBFUyDQGDI+HrN49JXozJsLDuu58mZPAj1t57W6ydBfwYUqbLVf7ZXE5/I9A/Jo0sFEwFyNiMrNlWkt8CmYL1AwPom9RmofhO2iflJafEumaIb3CdQVcgsBaudgRBIiO6YsdO0aS+IZcCR32lM65yi3ts2uXj50y3VK176+F5KyPHzn52Os26u41BcCK+yWBkRKIlEqkCggL9h2XGs9C7mHATxDbJJ5qD1CogdOG1kMo/dk6cOOVY1r5N8a9Ncsq01KKTuIoS3Uea0RBARmmtA0z0SVTqLFNm5XWavaq/gz3YQtcT1sgDYi6/5M5SZ1bN/Aug==
Received: from TYZPR06MB5203.apcprd06.prod.outlook.com (2603:1096:400:1f9::9)
 by TYZPR06MB6356.apcprd06.prod.outlook.com (2603:1096:400:41b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.13; Mon, 14 Oct
 2024 02:08:07 +0000
Received: from TYZPR06MB5203.apcprd06.prod.outlook.com
 ([fe80::b7e4:5d25:213:ef9b]) by TYZPR06MB5203.apcprd06.prod.outlook.com
 ([fe80::b7e4:5d25:213:ef9b%3]) with mapi id 15.20.8069.009; Mon, 14 Oct 2024
 02:08:07 +0000
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>
Subject: RE: [PATCH 1/4] dt-bindings: watchdog: aspeed: Add property for WDT
 SW reset
Thread-Topic: [PATCH 1/4] dt-bindings: watchdog: aspeed: Add property for WDT
 SW reset
Thread-Index: AQHbGILwQgrDNDHU9U+K+QITBzViybJ7lGGAgAAgJwCACdQ6EA==
Date: Mon, 14 Oct 2024 02:08:07 +0000
Message-ID:  <TYZPR06MB520352D80EF554E86934230AB2442@TYZPR06MB5203.apcprd06.prod.outlook.com>
References: <20241007063408.2360874-1-chin-ting_kuo@aspeedtech.com>
 <20241007063408.2360874-2-chin-ting_kuo@aspeedtech.com>
 <20241007175949.GA1738291-robh@kernel.org>
 <3b7e7305-5711-4b4e-abdd-a9a3e11ca33b@roeck-us.net>
In-Reply-To: <3b7e7305-5711-4b4e-abdd-a9a3e11ca33b@roeck-us.net>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB5203:EE_|TYZPR06MB6356:EE_
x-ms-office365-filtering-correlation-id: e9223aa5-c3df-4967-49dd-08dcebf50b7f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:  =?utf-8?B?UU16QW5hRklpVVJYTXhTVWpZRGg1WHh3UlZjaUJSWjFsWElyMkwxOVdzT2Iv?=
 =?utf-8?B?QWZMQkJUUXNId3VUQ216am1tZXVqWmNOM3p1ZDUzbnN2NUtNSHNxOU85Q0Jq?=
 =?utf-8?B?VzlBeE9HMmdkN3VzbzllK25VNkltRHJPSE41eUxNUFdUVXZvVzFoQzBXWHdS?=
 =?utf-8?B?WVhrcnBFS2l2MHZtRzZRQnZSRDdoUG1maTRDZWx3dUFmdEhzbkdybTFBZGR0?=
 =?utf-8?B?cFlGSXFtcVpiWCt3WEFsY04ra3Awbzk2TFY5ODB3akU5OTNkbHhTZGtmUWp6?=
 =?utf-8?B?UjJIYUs2cHZVUnZSdUxISG5qQ1ZjZDl4WUUxNmczQ1g2bTR3Z1ZlakFPMi9H?=
 =?utf-8?B?ZWNjcXhQeEtUQUViZHo2bklqRHpadWxzVmFQcUduVUdHNjlYbHpJVi9ZL2ZC?=
 =?utf-8?B?dUltWkVHK2RvbzdQNmsrODRwZW5GNU1zQ2Y1M041aU8xZEZHVzRSc3ZKS1pN?=
 =?utf-8?B?R3d4L09nZ0JmZk92N0U1R3VTVWo4ODEyKzk3bTF1eUN5eG12ZkdVL3l5L0cv?=
 =?utf-8?B?UXdIZDJ4WVJhbzlTdUZGVXZROUh2eWl3MVplYnJNQ1pXN2dmc1FIRVJXWXpz?=
 =?utf-8?B?Ym1Bcmx6N21nOFg3bWVmRGkrd0dtVzltbUY5dTlEQWE1VTJseVA2MllBNHhk?=
 =?utf-8?B?bFJzOEVpSGMvV1ZKYXR1c29GaWlGc216WWxlcjJ5VHNCeTd2QitkTy9LWVJT?=
 =?utf-8?B?Zk0ybjJ3K1BwdndiODdOWXBNeWNUS0xoNDJSckJCZ3FCWTNsY3hiVWVKallK?=
 =?utf-8?B?dzFVQWZMaTlSVGt0cFVBZGlCSDM3YVl1bW5wUlNhaG9Pc3JEVkdOd050emJ0?=
 =?utf-8?B?L29mbGNLaFZEM0IxUGVFNVJzdkZSRTZnZnVCaEdBU3lIN0xwN1N2RHZwRHNW?=
 =?utf-8?B?ZTlUa0FrOTdubDJxOTRQaXhVKzNiRkp1U0RKM2Y3MkRkNVBzQm9LOWZTbzN6?=
 =?utf-8?B?VG9Ua2hhQjNRNnNTVThlaWIwYXBwNjZHU2dXaHZqdXNGd0FuZHdNNzk4Q2JO?=
 =?utf-8?B?cWpJeW9hMS82NWJ3cmhIejFyZHpDOThOQ3JxblBBTHZsQzJNem5POXpVT1Z4?=
 =?utf-8?B?NG92bnNsdFZDSTZmSE1TaXJBYUtzanNNZnRteldDNjFjTk85WFFUeE1WenJ4?=
 =?utf-8?B?SEFJVjJpM3hoVkowUzdPS1JiT0FxOFNlUVd1WXpZWGs1UDVTQXJEeHM3WWlQ?=
 =?utf-8?B?K0lvSmd0aU9GL2VIK0hFMXRZQnplcG5CWDRtZ0hSQ2lzekhIRldEU2hsTUxt?=
 =?utf-8?B?UmNtRUV5VWx2MVJVZlA5MjZxK3dXNUoxcHFYTytPUEc1K2pIVjkzMmUyRXNM?=
 =?utf-8?B?cVdra2tuSFRSWWVQZys0RXhwZ2Z0dkJkTDI2SEtzZ1NkRnByT2kzekVPNW1M?=
 =?utf-8?B?dkxNMDZQM1JUMkVFbFp6T0djRzM1R2p2ekZ2M3JOZXVTWFA4TytzTmJSUDEw?=
 =?utf-8?B?TlU0Q3dJWkZPWTM1QWdtM3hEaUpYZnNJMGpRbkNtdVltaDFRZWNwc1dtVkRi?=
 =?utf-8?B?ZTc2dk9VMlFRdlFheSs5a3AzQ3NQbzA4ekFnRy92SDE0cG1ONEs1LytYbno1?=
 =?utf-8?B?WWYrNml1VmVPdGRsWXNkMVBhZk9DK0EydmRTWUVGQVRNbDFPU29TSFNTVlM2?=
 =?utf-8?B?Q1hYeS9sMnZFNTJML0s5T2JGbmFKUTgxcC9lMXQ4K0hIM2VwRTdZSjgrUVNU?=
 =?utf-8?B?S1Z3TFE4ZXp3T3pWWjRCR3BZNWJTWjQ5clQ1UGYwdVYxQTBsT3RuSjhXSitS?=
 =?utf-8?B?d3FtRXRTclNnMy9TZkRRTnkyMzBiclUvVmdkQlZ1Ri9HaGI1Qk5VSStvWFQx?=
 =?utf-8?B?NkdzK1N6L0g3SW9aSnVGdz09?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB5203.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?WHlEMFlHTUtaWkFtM25kMldRWndFMmFiczNXRHZnUHdsVjJHSjQxZjU3WUhD?=
 =?utf-8?B?eVRWenlleTdIR3l5TTRXMkMvZEdKblNDOTNmeEdTMnd3cXMyNmMrKzduMW4w?=
 =?utf-8?B?aldpY0xtZ0dQMC9mYVp5bW94bHlPcUVtK29nVjVBN29uN0xKRDI1bVM1bVY5?=
 =?utf-8?B?UVY4N1BGdlA1UkhaNW9OOGVBcU1oZnBsODFKMlNIZHVGaUJDc0lTcnVTelp0?=
 =?utf-8?B?bW1XSFFmU0xMaWdZYktsWEdkR2FNMzVWOExMMkpqM29WV0hQTlFhV2ZneHk4?=
 =?utf-8?B?NVltYVhWTTZMT1BWMTJkTU85OUVzeEcvRUJvMndhcnE5eUU0QW1QTlFobDlu?=
 =?utf-8?B?RzFkNktGbmFCUHltRTFiaWRGdkNrNldzT0hBeHR3RWxXWloxYjAyRHpsS1hY?=
 =?utf-8?B?di96U1lNNXNGYXdva2I0bnNwSFhGOXBTUjBRQTR2eUM1Z2FpbWlBTVNxMUM0?=
 =?utf-8?B?bjBFelNDZ0pUODlwUkRXSHA2RVlJWU1IeGNRRHlreXF0aXphVktoMHJWV0pT?=
 =?utf-8?B?ZzdnWXFsd3VKRjh3T3Z0WlZtN3prNnFtbjZQRVhzVTd2RFprUHZmVXowcTdt?=
 =?utf-8?B?WW9jSVVKT3U1eGxkMGJiUERNbXpDQVlTRm00SzNzYzRJSHZLUzM4YXNjekdY?=
 =?utf-8?B?YU5rV2U4Q294b3ZPK2tVTDBVSG9RblF5TitzQUlXRmVZampCTFNtVlpmZDVi?=
 =?utf-8?B?eE05VXJVWUJPTzBPRXp0OWNNSGxNM1RveXVhd1daUHU5L0VzYkJOd0hOOHp2?=
 =?utf-8?B?c3pUWW9VaXR6YUIrb2RiTVhCSUpmV0o0LysvZ3VTOVhkd0hYdTRQWEtrWDNM?=
 =?utf-8?B?NWphRlBNRldhQU9rOUNFdlAwaEdKY012N0RIZWg4aEhtVWdub1hYdFhCcWxX?=
 =?utf-8?B?THErUE9MZWl5VkY0djI3cW5ubXdwUGVYVXlONzlxNnhMMUYrYkNwa1JjbVgr?=
 =?utf-8?B?NUd3U1JoMThFSFVoSFZSbnNyN01TTE5sOVdvOE5KcU5sSmYwZnROSWJqbCsr?=
 =?utf-8?B?R3NiY2Y2eG8zVVNLYkJCNnJnK201eWxoN2U4dzJBVzRiUGFpbmNtcE9uemlR?=
 =?utf-8?B?VmtVTHV4K2JQWmRocmQrKytORHZONDJvN2NlcitsbzVZT2g4K0MwYmlZeXlG?=
 =?utf-8?B?TzVOM1ZLblhJWkJIT0xWNUxJQ1VrOEN5SEtSUEtaajhwUjIrVWZhZ2t3OVVW?=
 =?utf-8?B?aTBaQS90Wjc4WnVONEIrdFgxWFVDVm9lR0dXR3o4VmxoOHFsa3pxQnBaT2x0?=
 =?utf-8?B?UHM5WHNIcjJuTFVxeC9ERkIyRzIzcmdPL2p5YUVLYmJZdmphUThjc1ZvVGJz?=
 =?utf-8?B?UDk5d3FCWmVMc0Z6MEFSVVptNmg2NVUwcGVVdXEvMkVWQ3l5Y1VBY0RUdWIz?=
 =?utf-8?B?SWtyeWJGeG1IZU1yTTVSU0U4UGlwRWZXMi9RcWZvWkdRNTBJMzRvQUx4bmQ0?=
 =?utf-8?B?MjlXVVREcDZxZ3k4VkFLdWJjUjJOVGhmQ2xwTFZ5UlZPSHdsVUhVR3E0S3ZF?=
 =?utf-8?B?elJMUFNGVTU4N2Irb25QcDNaMjBQRFA2aFMrU05qSnMrdVcxL0dGbjl4UG5a?=
 =?utf-8?B?aWVHWXVObEN4cnUxbXBhaWx2ZitwSTQrREFrcHlYSUNocWh3TVhKZU9kYVg2?=
 =?utf-8?B?U241K3JhaUdROWZVaFJmYVU4QXdKRHQyWnpQd3laNG0xRFl6OEVvNEYyZ3d1?=
 =?utf-8?B?UGpXamxLU1hNNW5tZGNJRUxGZUV6VXRzN1R2VU5QbjFFOVVnT3R2K0VWaW81?=
 =?utf-8?B?VklYYkkvcURWYmhxVEFyMUxVY3Z0MmVoeDhjK2t1dWxSTFdPbnQ0Tmx3QzVO?=
 =?utf-8?B?N1hBTXp0dERlT2o1Z1VJTzBCcFBXUkJNSWRkVTdQZnc2YytJTEN0a3locE9S?=
 =?utf-8?B?VHIvaCtoQTVPOVlsTmpmeHhnM1p2RkdiQnR2M1FUWll5NlFEK3d6R0tFZktM?=
 =?utf-8?B?c01wWkVGSUo5TTNLbFRWRjZJbkhUVy9ieXkzWVdmTHVxZXBBTUpEL3lGLzJD?=
 =?utf-8?B?eU5zbkF3MERRdEl0OTBHMTBkLytJYkhORURaZnVkWHhQeVVDWFhUdlBEU1hx?=
 =?utf-8?B?VDNqMlVJUE9WQWwrdURoTi9GRGMrM3YxQjVEV1FjWW84cUJOVjMwRlVGL05K?=
 =?utf-8?B?bjZtZHkvVFAycUhHTzQ2a3k4em10SnRIMld6UEUvTkgyTnJQUWRMOFZGNmt5?=
 =?utf-8?B?RXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5203.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9223aa5-c3df-4967-49dd-08dcebf50b7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2024 02:08:07.1859
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LruqtjPWYDK/lLk6/X/h2w29aMOkfYksM0VlNuEr9emoMMx/XVpOLgOF5KWfFtohijFpXEEE4vGDw2WVub4KhACdtoe5ZDxDjUVSn4ZrF68=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6356
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, "Patrick_NC_Lin@wiwynn.com" <Patrick_NC_Lin@wiwynn.com>, "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, BMC-SW <BMC-SW@aspeedtech.com>, "Peter.Yin@quantatw.com" <Peter.Yin@quantatw.com>, "Bonnie_Lo@wiwynn.com" <Bonnie_Lo@wiwynn.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "DELPHINE_CHIU@wiwynn.com" <DELPHINE_CHIU@wiwynn.com>, "patrick@stwcx.xyz" <patrick@stwcx.xyz>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "wim@linux-watchdog.org" <wim@linux-watchdog.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

SGkgR3VlbnRlciwNCg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3Lg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEd1ZW50ZXIgUm9lY2sgPGdyb2VjazdAZ21haWwuY29tPiBP
biBCZWhhbGYgT2YgR3VlbnRlciBSb2Vjaw0KPiBTZW50OiBUdWVzZGF5LCBPY3RvYmVyIDgsIDIw
MjQgMzo1NSBBTQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDEvNF0gZHQtYmluZGluZ3M6IHdhdGNo
ZG9nOiBhc3BlZWQ6IEFkZCBwcm9wZXJ0eSBmb3IgV0RUDQo+IFNXIHJlc2V0DQo+IA0KPiBPbiAx
MC83LzI0IDEwOjU5LCBSb2IgSGVycmluZyB3cm90ZToNCj4gPiBPbiBNb24sIE9jdCAwNywgMjAy
NCBhdCAwMjozNDowNVBNICswODAwLCBDaGluLVRpbmcgS3VvIHdyb3RlOg0KPiA+PiBBZGQgImFz
cGVlZCxyZXN0YXJ0LXN3IiBwcm9wZXJ0eSB0byBkaXN0aW5ndWlzaCBub3JtYWwgV0RUIHJlc2V0
IGZyb20NCj4gPj4gc3lzdGVtIHJlc3RhcnQgdHJpZ2dlcmVkIGJ5IFNXIGNvbnNjaW91c2x5Lg0K
PiA+Pg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBDaGluLVRpbmcgS3VvIDxjaGluLXRpbmdfa3VvQGFz
cGVlZHRlY2guY29tPg0KPiA+PiAtLS0NCj4gPj4gICAuLi4vYmluZGluZ3Mvd2F0Y2hkb2cvYXNw
ZWVkLGFzdDI0MDAtd2R0LnlhbWwgICAgICAgICB8IDExDQo+ICsrKysrKysrKysrDQo+ID4+ICAg
MSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykNCj4gPj4NCj4gPj4gZGlmZiAtLWdpdA0K
PiA+PiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy93YXRjaGRvZy9hc3BlZWQs
YXN0MjQwMC13ZHQueWFtbA0KPiA+PiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy93YXRjaGRvZy9hc3BlZWQsYXN0MjQwMC13ZHQueWFtbA0KPiA+PiBpbmRleCBiZTc4YTk4NjU1
ODQuLjZjYzM2MDRjMjk1YSAxMDA2NDQNCj4gPj4gLS0tDQo+ID4+IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3dhdGNoZG9nL2FzcGVlZCxhc3QyNDAwLXdkdC55YW1sDQo+ID4+
ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy93YXRjaGRvZy9hc3BlZWQs
YXN0MjQwMC13ZHQueQ0KPiA+PiArKysgYW1sDQo+ID4+IEBAIC05NSw2ICs5NSwxNyBAQCBwcm9w
ZXJ0aWVzOg0KPiA+PiAgICAgICAgIGFycmF5IHdpdGggdGhlIGZpcnN0IHdvcmQgZGVmaW5lZCB1
c2luZyB0aGUNCj4gQVNUMjYwMF9XRFRfUkVTRVQxXyogbWFjcm9zLA0KPiA+PiAgICAgICAgIGFu
ZCB0aGUgc2Vjb25kIHdvcmQgZGVmaW5lZCB1c2luZyB0aGUgQVNUMjYwMF9XRFRfUkVTRVQyXyoN
Cj4gbWFjcm9zLg0KPiA+Pg0KPiA+PiArICBhc3BlZWQscmVzdGFydC1zdzoNCj4gPj4gKyAgICAk
cmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9mbGFnDQo+ID4+ICsgICAgZGVz
Y3JpcHRpb246ID4NCj4gPj4gKyAgICAgIE5vcm1hbGx5LCBBU1BFRUQgV0RUIHJlc2V0IG1heSBv
Y2N1ciB3aGVuIHN5c3RlbSBoYW5ncyBvcg0KPiByZWJvb3QNCj4gPj4gKyAgICAgIHRyaWdnZXJl
ZCBieSBTVyBjb25zY2lvdXNseS4gSG93ZXZlciwgc3lzdGVtIGRvZXNuJ3Qga25vdw0KPiB3aGV0
aGVyIHRoZQ0KPiA+PiArICAgICAgcmVzdGFydCBpcyB0cmlnZ2VyZWQgYnkgU1cgY29uc2Npb3Vz
bHkgc2luY2UgdGhlIHJlc2V0IGV2ZW50IGZsYWcgaXMNCj4gPj4gKyAgICAgIHRoZSBzYW1lIGFz
IG5vcm1hbCBXRFQgdGltZW91dCByZXNldC4gV2l0aCB0aGlzIHByb3BlcnR5LCBTVyBjYW4NCj4g
Pj4gKyAgICAgIHJlc3RhcnQgdGhlIHN5c3RlbSBpbW1lZGlhdGVseSBhbmQgZGlyZWN0bHkgd2l0
aG91dCB3YWl0IGZvciBXRFQNCj4gPj4gKyAgICAgIHRpbWVvdXQgb2NjdXJzLiBUaGUgcmVzZXQg
ZXZlbnQgZmxhZyBpcyBhbHNvIGRpZmZlcmVudCBmcm9tIHRoZQ0KPiBub3JtYWwNCj4gPj4gKyAg
ICAgIFdEVCByZXNldC4gVGhpcyBwcm9wZXJ0eSBpcyBvbmx5IHN1cHBvcnRlZCBzaW5jZSBBU1Qy
NjAwIHBsYXRmb3JtLg0KPiA+DQo+ID4gV2h5IGNhbid0IHRoaXMgYmUgaW1wbGljaXQgYmFzZWQg
b24gdGhlIGFzdDI2MDAgY29tcGF0aWJsZSBzdHJpbmc/DQo+ID4NCj4gDQo+IFNhbWUgcXVlc3Rp
b24gaGVyZS4NCj4gDQpZZXMsIHRoaXMgcHJvcGVydHkgd2lsbCBiZSBpbXBsaWNpdCBiYXNlZCBv
biB0aGUgYXN0MjYwMCBjb21wYXRpYmxlIHN0cmluZw0KaW4gdGhlIG5leHQgcGF0Y2ggc2VyaWVz
Lg0KDQo+IEd1ZW50ZXINCg0KQ2hpbi1UaW5nDQo=
