Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D66E99BCE5
	for <lists+linux-aspeed@lfdr.de>; Mon, 14 Oct 2024 02:18:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XRd9c5g9fz3bg1
	for <lists+linux-aspeed@lfdr.de>; Mon, 14 Oct 2024 11:18:12 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2011::718" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728865091;
	cv=pass; b=SYzpXP/kjSAw9P/6rq0XlqZYi3UVuQKIZE3a9gXL1e22OEHn9ZpQ1nMKBllqSlpsoRaob1fU9hErYOz9eSN7rbbC74ATPIphq658PONxgPa/cFImAgF+p3IyQAzLjbYp/Bb+ao3nEd8OwEZgaxCNEWbuKYnt/XMvovKK4H6L2scHH/xj3SgWjCEgH+E6OaZ7EXN33iSCxu3gnNrBZYUfSD1y0h95TxRyhZ1eXGPL62QN2uNHwFPaUj+gccW4+qM1lzsQzkZWj2zB538jxl/sHJ6MOWubmLBR9o4bQJJaYbC0FoLTBxcuwve/QRxF65UG36avEFSFp6zq+B1dijeBxA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728865091; c=relaxed/relaxed;
	bh=thP95kHS7gHAxdKa6+C7kKQjgmXtKrkJ8qkOxwk8nMU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iq94RPEFIvstmB8R5/gGfsm12+T2O4OE4Tk/8AmzRKmqSV9YKFc6Dx4ruLAtKvu9VDF021dj7fMHPBlsJBf9LIFZMoV0onkhlJd9zFcN+94rkkXbxqePDAPA0wRUnQ7Y/wSY1j1KNeFlEBR06DsmCZVX5jXLOYjWr+MuQ0VC7/O7F7nn60z4SotamIW2iH4beDt67DlGh/G4wMn8F5EUOQ7OjM8QI6AQcatNuEBOQGIrxB+TlPDSkQP3dGIjPKod12VhcaG39f9c34GPRf5QoA5DXjsNzm3yrewp2fhYmEwtjZjAWqnby7yho+zw2rBM0BnPiS0vMZ5imMiEV7bHmA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=2a01:111:f403:2011::718; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=kevin_chen@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:2011::718; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=kevin_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20718.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::718])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XRd9B62X6z2y64
	for <linux-aspeed@lists.ozlabs.org>; Mon, 14 Oct 2024 11:17:31 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FmOuR6yjwhcrG8M3APwKTC+l4uPhFwme/TdtQt0Fr2eW3BNZ8chEqPkjqUepyJ6d0C82VmzexYxKjSyx2dq9SAOmojIhxnsd4a0xBqUO4tGhz35oKrWl94uingK3xr+OLz8qN/SljZO2PderDOqicZZx7cQlD+4/ZiYez74dPrQmN3qM642X7ftJWY57pZVm+Q4KE9jQoi5HJzTBtYeePwSpepIJXq/NgRhIhFaLG5DQtx1zkRcduQGseS8RIKPPL+jxa1gMFODleEdPjQ/cyj83S16yE01a0HuRgJI0NpnfiTvKWn8rtm9pCEJpVDlF9reGruteNt8g2RmJOXDiqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=thP95kHS7gHAxdKa6+C7kKQjgmXtKrkJ8qkOxwk8nMU=;
 b=ul3CFqHgVzMRB61JPV/4Hsk9YlQpuUwU+15Ot4tZ67e7GXQZbXmFQ1Ysv/b8Q7ygb2ngPprYUxUytieZUt+JWDlKdVZDdllMv3XXAQiNfNMpGUfMHKgrgb/mr26ewRppYP6iJFjH2zWCIES1iHb1xil/+DZuWTS4kTzgLAY+yTqp3k4raabkl/0sA+oXkZmVsaV1X+BeBQILOe6P1p4b6PBkZeeSV0dMhacA0eEAsW3bT3KKtyvpwzDV5P92B5MYxk+vDS2jclzqFdJHsL9Yy505PzHKjlQMFv6ostHt2LVClbtuA3EWCO9rkD3K2O6ut9rFjPrJjSoVyb5mzJe2mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=thP95kHS7gHAxdKa6+C7kKQjgmXtKrkJ8qkOxwk8nMU=;
 b=EU+hVKVUIyhKRMeAW2RNsCuoEIu5i+bSVsh+so0BCkOYHOseb3DRUvAQzk6l+bDSS+ERN8FTwA2ZMrRFn7adWxodiPCxj9SrfXqCWBIHd9keKgbjXhvR0f+E5yA6ZAIYLoP86yovsdLW2wCYcoOrWrtPcff7tZT1Is/pB33xjfS98Xmi45P3ZISQdtZUrSqbpJphE/2ATEN4iglFB8FawDDRssJ/f0HBfokOlH5pVkWQPbRazUc6CirU2g3Ysswz15ro3XPAmtB7XzvFpZmdEphy0GrmC4aj5JPKb6RLXC3NpHDJxzwpo0OGbBoaRzjhdPHI4kObjK50nIVHBY/p6g==
Received: from PSAPR06MB4949.apcprd06.prod.outlook.com (2603:1096:301:ad::9)
 by KL1PR06MB6071.apcprd06.prod.outlook.com (2603:1096:820:ca::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.15; Mon, 14 Oct
 2024 00:17:06 +0000
Received: from PSAPR06MB4949.apcprd06.prod.outlook.com
 ([fe80::7bdd:639a:6b94:37bf]) by PSAPR06MB4949.apcprd06.prod.outlook.com
 ([fe80::7bdd:639a:6b94:37bf%5]) with mapi id 15.20.8069.009; Mon, 14 Oct 2024
 00:17:05 +0000
From: Kevin Chen <kevin_chen@aspeedtech.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Subject: RE: [PATCH v3 2/2] irqchip/aspeed-intc: Add support for AST27XX INTC
Thread-Topic: [PATCH v3 2/2] irqchip/aspeed-intc: Add support for AST27XX INTC
Thread-Index: AQHbGkKMCnGgBPvFn0OoVljQ1X0eJrKBiCQAgAPgAAA=
Date: Mon, 14 Oct 2024 00:17:05 +0000
Message-ID:  <PSAPR06MB494904BAC3F09133E3E0121189442@PSAPR06MB4949.apcprd06.prod.outlook.com>
References: <20241009115813.2908803-1-kevin_chen@aspeedtech.com>
 <20241009115813.2908803-3-kevin_chen@aspeedtech.com>
 <37525238-c9f8-4f0e-b4e5-4e2f05fab775@stanley.mountain>
In-Reply-To: <37525238-c9f8-4f0e-b4e5-4e2f05fab775@stanley.mountain>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR06MB4949:EE_|KL1PR06MB6071:EE_
x-ms-office365-filtering-correlation-id: b99c3506-512a-46be-45f5-08dcebe58903
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:  =?us-ascii?Q?ie5rZByGUx8gmwB5t5x5Zb8ddx2aJo3Dz2GVC2huvP1j0RnvSDJ4aqxdYpwA?=
 =?us-ascii?Q?SsT/RcY7+FfOxqs+nv+noyM0Q2zy5BI50scW+Y2UPn0nWEZCA+jhzexgTymP?=
 =?us-ascii?Q?nzJQiugEm51y9fnbaIG5FzqzKz92B9DJijNkHHTS3YzmdpcJaa21SHLNh/bv?=
 =?us-ascii?Q?8RjO79VHclUT28e/AItpMoW4hTYIlTSVPHsyFDeQHIFFNo04ch2ehyjcJdCz?=
 =?us-ascii?Q?MGEyJdGjPZB1Q1vSJyNocna+UkVdtgu67sf5UuQEwDxexCAbNEEqwcMDoDT+?=
 =?us-ascii?Q?YiOVO5ZbcglcglsrTsb/q1lAxZmJYtuSD08S5xpwWnHt8Y0/58WfAuBd3GpQ?=
 =?us-ascii?Q?pSA38Kv0ixTZZwZ0nQWptN4ClUGwFldpy1KQ9dmfL8zAVHQ0BtIBQH8NKl11?=
 =?us-ascii?Q?Y8CBe6z36vztDyk0898Au7HNlPHCAOdU2gciVo/5xbuweNysoyM3hkb48PeA?=
 =?us-ascii?Q?aFyYWYI0u2d1NHh0uUJ7NNr6Xlu2SBkSaA0TupIRXJEXDJDnHyIM68avePPF?=
 =?us-ascii?Q?+MbKUvWlkCTMyikY/HyB9RPWw6kool0eymcdYfvMu15MDN3jg5q+X4p25Yq2?=
 =?us-ascii?Q?nrG7XZsbCba5tyrIOTsOiPEBtljOF9sZ8aALrJ6zTsmtU6JBWIygHnlDQAGH?=
 =?us-ascii?Q?XMSEEdZA77BoLQzxzj1uJB8/d33EOnhzTlITX3LS83QAKpEYa1FCFPgmqPWW?=
 =?us-ascii?Q?L8hrMgAorRgR/dq8kUEFtASQObSqMYKEgqnPFL1nyxzUHQ7YgbgAB92TKJ9z?=
 =?us-ascii?Q?aHpRNlhTt0/uOikKzQHWNImZ012azNIKsN5Lf6z+5JWmHoJCgiM0KJTjZ2wO?=
 =?us-ascii?Q?T4Bp1KoMhbLvVCCrfR67fM+PyvqXfYLqQQ8ra/q0piRNE/KqkHRWAFhr7b2U?=
 =?us-ascii?Q?mv06MwnqEkGZtc9tN2HVsqVK8PP2xY1FgOiRi174nmAyCc700DVZ38u0s242?=
 =?us-ascii?Q?dLuU6M5y7vIfr4dB83PDwZUfhhk+6IdoQ1Wo0XuDFUd5o0aNZS2gwyjqsFvV?=
 =?us-ascii?Q?EUZpmOo4LvT89BxTBjIfvEQOcDC0U7YmhcRpJaD0lcGBoyZFw59bfxJWDJZR?=
 =?us-ascii?Q?opLMrpnuyGTcgpLOt9y8issGHXJ7L0a+Bh5zoHzmuyBF4jsqechpFrSAE13L?=
 =?us-ascii?Q?rhxZYdz//SCnTfvUPHwqPNvFihJm2fRzAY7IUw8mho4WikWSYsRwwz+V7ezX?=
 =?us-ascii?Q?pD/LwL30UGa4x17tSvosjanELdVpOBNDdZq1AqjWnuQAvFAqRnEsHZY7+AIy?=
 =?us-ascii?Q?Pp6v/91PilwbsxgHLmtbAyD5uhVfXDI5dRmFnGRIVqDw0vcYRdBcRqS3tLnD?=
 =?us-ascii?Q?q/nLVvTY+Fwo9gD5vorf4GGZ?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR06MB4949.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?JmKlUuEipmaIXqz+ZEOecpbNJ0tDoXeeBu9wNSDHLQMwSWrlp3U/bUeIShvy?=
 =?us-ascii?Q?Rla+p0mhSRVKk/jrsuCcPPS1BIDev5hwCT8TWV8YtOwq6Hm+MZL0v85fbGPN?=
 =?us-ascii?Q?e9qtlsizF/izEx/DbgVaxftTIeatR1UvqZIH6I1gMpxHK71EzDYB3tHYvSXH?=
 =?us-ascii?Q?grC3UyM/gaHVekcDyIvXdHM4Ge+xhFheIIIevjqpwq1FGHAcJdU9x1SiWQbj?=
 =?us-ascii?Q?PK9fpmWhY8yy0Etz03FIOhSXRINTlCb2o56D2ZvgElrqhtBtHt6RQ7MHDTyV?=
 =?us-ascii?Q?XL377uuUpTr69DUGtTNuhG9/r8b9AGqScSnTO57uM19E9oKf1I/EVEQ7C7w5?=
 =?us-ascii?Q?jcbl21Bnc6eX4XUM5MV/5UQXaaTEHV+nNoPPgqSNAtLWWguueLLCNq9QONLc?=
 =?us-ascii?Q?w5GnmACMKaxSM1Zeu52xcKSm6snFrJN6PHhq5g2HYeN/mAL9StU+J2ePG5h8?=
 =?us-ascii?Q?wJ4AbP3M/xs5V4TZFv3d6G+htLeXIMnBO8Pi/yLZ79aIRRMBnc9Ty9G7Z54l?=
 =?us-ascii?Q?JI2caJme3FlfHdNFoyBhb/WN0aelzt+uOMa1FqFz2KIlV7kQFZ2UewX97cYN?=
 =?us-ascii?Q?BjjN1Ac2FiF5jlcJE5icOlVUY8benzVaDFT2s/8DFP99YNWz1lKY1/Tfditk?=
 =?us-ascii?Q?r0MXFomdHN8QPS70oR2rDcELZVf+L/DbkYOfsei3rFDzKAwgcFU7vY9Jk7+a?=
 =?us-ascii?Q?0pr7NxuPp2bHh9dbNVQm+BOBsaU9aiLc7VQCUMJCac5Kpj3uAxZ2Jgs/x/vq?=
 =?us-ascii?Q?jobfkWThh3Ema7G02pCwm/1qnXZO7W1g5/BZ0DjowABpB1ai1Kel+5jcZYpy?=
 =?us-ascii?Q?YsHviyoWSsMrDQznikUSfzIG9SYGvbqsMY2agpcTebNjyk0Q4mTezpC1355g?=
 =?us-ascii?Q?zJe6R5EcTDSWn1ldiU5QIExwyLRyKy7AppPkMr8etBxeALm1/7diOgeK2Hzm?=
 =?us-ascii?Q?yRXcxQJUrxeY44c8eJLsCWoyS3ymiu6Qx5mriiF/29jrMku4+UEDytm3URpg?=
 =?us-ascii?Q?1eTpMYuli8dRM9J7+sUxmpx9s1YS7D88QSxrC3zQVCDRgXWRS6OGl0g1IfF2?=
 =?us-ascii?Q?Yxez9wZ1I6kWwukJyAgtlBzEeBpjMVc5iGXE2vIQtqjNGtm3dCnLIdh7PAmi?=
 =?us-ascii?Q?RJ69wIgmZdgeO/7yqv6fE9m4DF649MF8TOZZ2K2A5Zg1tcx7TY28RS9gNJJS?=
 =?us-ascii?Q?2mUuw59G+OeXXBBLLQLy0cAlMdMJwpAaRGNQfzxVhktuMF4+gRZRGqEJkQd7?=
 =?us-ascii?Q?MwmJJkEu0DdsKrncQCFIqTEs7lH65d1dl8MeXMuhs6VIKs7BmIkWM+3zYtPD?=
 =?us-ascii?Q?FdOid7QqR+fZwYpG/dK3EuEMXR1sZEOCcq2TEMUgrMwprHJKDuXfxxasmk/0?=
 =?us-ascii?Q?4aMtb4DqJ4Cw+EitpmRT+IVIj+hAYrxacQ3/NoV9DRdWE6yaKi+0Si8ZZJYA?=
 =?us-ascii?Q?L3A3TxL4q/fXxBCuLZyakPhPZSoPzlvYcKgJhizE3puQJStIPZFmCYI54s8U?=
 =?us-ascii?Q?mPc4X248emp4kRK6xxwuw9cghuni5pXwD/pEFvOnnxZALk73i0W9+CGFBVqy?=
 =?us-ascii?Q?HPJJGlm9NinQu1+xDrRqXqYDIPIle+JullgpCVdx?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4949.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b99c3506-512a-46be-45f5-08dcebe58903
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2024 00:17:05.7951
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tHCpSmdXB9x+9zPd7OuXlV9kFD9+nphe+8HIHDAlgkI5Gg3IIpYsDpfqLK5Re1OL06rC9+wX1I1rtqNs4giDpma5iY9G+w1nMzjbev2Dy64=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6071
X-Spam-Status: No, score=0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_INVALID,DKIM_SIGNED,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
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
Cc: "robh@kernel.org" <robh@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

> > +static int __init aspeed_intc_ic_of_init(struct device_node *node,
> > +					 struct device_node *parent)
> > +{
> > +	struct aspeed_intc_ic *intc_ic;
> > +	int ret =3D 0;
> > +	int irq, i;
> > +
> > +	intc_ic =3D kzalloc(sizeof(*intc_ic), GFP_KERNEL);
> > +	if (!intc_ic)
> > +		return -ENOMEM;
> > +
> > +	intc_ic->base =3D of_iomap(node, 0);
> > +	if (!intc_ic->base) {
> > +		pr_err("Failed to iomap intc_ic base\n");
> > +		ret =3D -ENOMEM;
> > +		goto err_free_ic;
> > +	}
> > +	writel(0xffffffff, intc_ic->base + INTC_INT_STATUS_REG);
> > +	writel(0x0, intc_ic->base + INTC_INT_ENABLE_REG);
> > +
> > +	intc_ic->irq_domain =3D irq_domain_add_linear(node, 32,
> > +						    &aspeed_intc_ic_irq_domain_ops, intc_ic);
> > +	if (!intc_ic->irq_domain) {
> > +		ret =3D -ENOMEM;
> > +		goto err_iounmap;
> > +	}
> > +
> > +	raw_spin_lock_init(&intc_ic->gic_lock);
> > +	raw_spin_lock_init(&intc_ic->intc_lock);
> > +
> > +	/* Check all the irq numbers valid. If not, unmaps all the base and f=
rees
> the data. */
> > +	for (i =3D 0; i < of_irq_count(node); i++) {
> > +		irq =3D irq_of_parse_and_map(node, i);
> > +		if (!irq) {
> > +			pr_err("Failed to get irq number\n");
> > +			ret =3D -EINVAL;
> > +			goto err_iounmap;
> > +		}
> > +	}
> > +
> > +	for (i =3D 0; i < of_irq_count(node); i++) {
> > +		irq =3D irq_of_parse_and_map(node, i);
> > +			irq_set_chained_handler_and_data(irq,
> aspeed_intc_ic_irq_handler, intc_ic);
>=20
> There is an extra tab on this line.
OK. Fixed. Thanks a lot.

>=20
> regards,
> dan carpenter
>=20
> > +	}
> > +
> > +	return 0;
>=20

