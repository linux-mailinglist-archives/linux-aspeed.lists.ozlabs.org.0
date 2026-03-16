Return-Path: <linux-aspeed+bounces-3678-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6N0nKwRut2l+RAEAu9opvQ
	(envelope-from <linux-aspeed+bounces-3678-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Mar 2026 03:42:12 +0100
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3B4294364
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Mar 2026 03:42:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fYzrc6Trzz2xpn;
	Mon, 16 Mar 2026 13:42:08 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c40f::6" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773628928;
	cv=pass; b=VvWouMaVCQOgmgmnI9KVgRXXhezLWoxw8wW6xWjKMl+bdaxTOuMqfGmuIhM3nxCBvKxLnkVkqUOnPZXJxUvO8yzR1nYgOb6U1HNhOz6chpJSTYgK4cnS7Y9vPEPthEpuRKQx2MObhFBZJAs1SlYZMZi3RWDvFtLoG6oneJEs0JloP8m8/fGj8LXHvlL2k4aUrX7O89fAEMZVM9vYGH/43Zqs850d1fiQLpBC1zPWI4kApj4F9RY9grcLef9qzt4Jm3KBYcKr+Ivr/ZNO/nkA5aGEyDX1KiEjdBqAaWgxnk8KdZFpjfXyzqiSqWIhZEbRPw1NoDRCcGPTg3fV3slgNA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773628928; c=relaxed/relaxed;
	bh=I5pxCeEhS098Z/O8u1iwvzT/wsKlQK7AfhevfsZvOMs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GcwbH5pMIqniOq/5gASXqRjimmIHODf+qQZcfTXnYcfOXU+uCjj29SCJvOwuCm5f6aDIGQBX6mI5bjQwjeDJIXOjkBu4Ed3vSNkdmNOKjmp1QEPMqvha5xuvGZa/w/FajYpgBoJqTgdtkKQp2QZKTjMs1W6oDlXBn2XDlKydW//5LuHyhi/NvO6lK40SASfIN+cdlPvIyUmtgHtW5WIDaTFLvI9LhrN59SiQK9dvf4kPK7oGmOVNAuud5ONoLGHV/r9jZByY7PeouutGXVgDlEP4tbklG24rnYs+B3/Mp7blpmmakROUsCQosWhs65PNdfsoXGABmKVDay6yzIVi5w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=h7tjiWim; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c40f::6; helo=seypr02cu001.outbound.protection.outlook.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=h7tjiWim;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c40f::6; helo=seypr02cu001.outbound.protection.outlook.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazlp170130006.outbound.protection.outlook.com [IPv6:2a01:111:f403:c40f::6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fYzrb6Wcvz2xS3
	for <linux-aspeed@lists.ozlabs.org>; Mon, 16 Mar 2026 13:42:07 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cgr5fJ+ewAfo36oNID9MdmmTYUkAwsNaQflsWdcF6l7Ykw6AQ0uDApt3mSJyJTUgUevLKpsrw0g1n7nhNRlkmD2QJ2z3+7YwHwXE0Ok/5GaYNZgU9Fn8PhCYjWSqRiblL6QSriZrUW+3WeyWrvhIiOLz2LqVewcHNvqFKIPL9jIVGtqPOKTxE18B1Lyd2VCV3nnmFnCO86ZGTszLnRqSdRVnqxJ2I4KOyXXSLS8NYaStIW/MnWlM8McGgkE5Poo6glzg7B+J7x1VpdL4i1p+hCmiqDAmVd3ZrDdxAfcZoci33evWJhUV+8sN2pXm1fnV3mHMPhLwJJ33v5o5faJZdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I5pxCeEhS098Z/O8u1iwvzT/wsKlQK7AfhevfsZvOMs=;
 b=AAqR9cFbNbdPbk4R5IZaAqV8yvUUM8UX6wGrRJztmzpMbZwCotsV2a2pdiAzDiLA1PINmTwFcUj7xjiT55MYw3kwJAUpIQUpwesDZdD3jQy/e6UvBeBt/jVLiWMuNwTV5jyoUxfsKJN0M1c5q/7xwJVB7f9gwV+NpjKYDGMOUF4MRL3T6U5aaNUx/2HsOkXURlZF/hy9U0axGOmISpn7a2FGLr4lNfTrWulnwbcYOfqhvzzwuCiNktJ+DIK8oBmypCmbG+RXZXb1LpV7aTeQtosWJyz0qtgnyFtfDT5sS9tBkbYZyfALwo0/diC6l4d5OVrz2YGcvl10lUrBI7QQyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I5pxCeEhS098Z/O8u1iwvzT/wsKlQK7AfhevfsZvOMs=;
 b=h7tjiWimwwOWruz4fasvyOuu2ZtAbpGzOE3HKYan7QiWihLnfrDJgZDcrxg5kGoZzEaTd5jvMVp2PjWC0whiUz69IJ+FJXe7bNJETC7nkSrrvpLsGDF/0T+vXd/TinJXxQhV/05EBHbLpNAE2nX50PURJ4w5AMbQEylUXDvVA/xVcXRyF+PU+YLqmvokI0sUEatBtpXg5WnsVda303ndYEl9IAApjpr3isn4Nm0MOGMWCntiArXvz1Zgga8Mtlrq1c4aK+HwiaTgqvobVVaNlFs7BYvtwj7xOD/VzPju5gKfR9+25o/kIXhw1bYjlGpNOs5IwCZPCFyazDB99zVK9w==
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com (2603:1096:604:29c::6)
 by TY2PPFAC281535F.apcprd06.prod.outlook.com (2603:1096:408::7a2) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.18; Mon, 16 Mar
 2026 02:41:43 +0000
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::92af:c9d9:8779:d19]) by OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::92af:c9d9:8779:d19%4]) with mapi id 15.20.9700.022; Mon, 16 Mar 2026
 02:41:42 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
CC: Jonathan Cameron <jic23@kernel.org>, David Lechner
	<dlechner@baylibre.com>, =?iso-8859-1?Q?Nuno_S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew
 Jeffery <andrew@codeconstruct.com.au>, "linux-iio@vger.kernel.org"
	<linux-iio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Morris Mao <morris_mao@aspeedtech.com>
Subject: Re: [PATCH] iio: adc: aspeed: Reserve battery sensing channel for
 on-demand use
Thread-Topic: [PATCH] iio: adc: aspeed: Reserve battery sensing channel for
 on-demand use
Thread-Index: AQHcstB/suvbgA5O906ENjKMGzWXRrWsPRUAgAQ5sLE=
Date: Mon, 16 Mar 2026 02:41:42 +0000
Message-ID:
 <OSQPR06MB7252DEEE7710BFA347A7E1E78B40A@OSQPR06MB7252.apcprd06.prod.outlook.com>
References: <20260313-adc-v1-1-7a2edb4e5664@aspeedtech.com>
 <abPiJEOL40C5eR1k@ashevche-desk.local>
In-Reply-To: <abPiJEOL40C5eR1k@ashevche-desk.local>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR06MB7252:EE_|TY2PPFAC281535F:EE_
x-ms-office365-filtering-correlation-id: 3d23907f-f01a-4d5e-4333-08de83058ec6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 240fjdhrEZgymeJ4HkfErcb5+IV0Kcx3pr4WY+d0vUF8kXmnjG4KD1WYsUS+HAyb3wvIWinDXmTVV2ZCWz1bcTLuB4MtyJvcFglus7nUwOqGLOzktHZGtoDUcF0UzsG1bMSBEzqeOEgAmrLIa70bPa4XtFbECL3J9cB7+kMgPSmSWeWLw84yKipOprRJzxb5pxFSHjjq9GuUtyCiuS6jLrWYxtOL2fYo93cRDbSHgbC9aNUWc/VKoT52vrdYQC4VRduXKTVrUga0GuDIyTIadpTvfXlpY/rRMeD6NXr1vcCvOcwgNULHikuZS7m+GLRLAx/lxq3WUfwTeojec161hsxfLiV4fFK/giftQY+YMO82l++CQ3eHSQLHEs6zuOkd+GujpcwrV40PEWbfYDnYhxmzrUTetDsn8tLAwRKQRgjjYpJhLqGnPrL+4YLEwa5FukglS+vX/ffDZX3ZPDeArwJ39FNLOMZ2hzexRjCsN9AlYt9Iklmq03NUbPI82+jZoviAlQAb5aqCIF44sLGFSnbG5bUA/KuJ5vrKE/PZANcTTrqCdwFYTHQ5nrF74b9OY1YSnJ4sAxiRBacAZeqko1wQeRG2vL05GNX2MlOOveOkzUA2ZlsWvKg3dSjHcfoPN18UGUv+jNMVqAsxZJ9Y4vcCJuK5u2oTZdqyGF7SdhS+BMWPZnWP2ZasrufMPBKLJc22BBddYuyxpktAIie+hpMQ4EbFxDExzBsWkm0mBPIoaKujYBtNGHa94TuiL2y1jjbLfgnC3Ds+UAOr4cz3ZJn1Fp0r189i/drZD/uCXUg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR06MB7252.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Hn8zHRs8wjGLq3tTG3kHwdCap0wekl3ZJD8JicP5nsJbJJlGhhunY70OmO?=
 =?iso-8859-1?Q?YKn7DQ25IvhFjhshuw7ObjkrYzhmJdrFXKDvFfnD6+v1n7Wh/Kq7WRLq+f?=
 =?iso-8859-1?Q?oN8qrDtUIoAdK9NGAxmNp5i7dz+LRX4QZ24wuiZznqUF/8i2EmiPOtKDUy?=
 =?iso-8859-1?Q?ADsum6RRli/ic/N05YYeOs061AYgi3Jwxlj9EeDhk3dU5RFfvPk2NhtQ5R?=
 =?iso-8859-1?Q?NrbyNY+mV8qrUXs9yfqdfNFqcLwU3gy27BQKnTHtz9ptJL2X7PxRN3xHJn?=
 =?iso-8859-1?Q?HeZAGM6l/6tR6O3Bmuk4XSI4U0EEX3HhE8SXsSHk7AW+hcP51wxLA1aeEf?=
 =?iso-8859-1?Q?qctlhOKzMAK0W3zjLErltlA3huauuG8Oed+VF0HOBOywNnwvX+fcMtMOKc?=
 =?iso-8859-1?Q?X7pWHi82GI1+aREGdZwTqfSir6EnXVDJNd5+H8jlmVyT9Prg4LZi///1YV?=
 =?iso-8859-1?Q?UWy7mQAoktcWXA9YchnLBdF9RXM0Jk1qQWJs0OcjSrucovISvz2R2jIbRt?=
 =?iso-8859-1?Q?f1hYr+eBj2RDZPtDvLqJlgGaNOpMrDDZ9hqTYoJrXSfgcagt0ZocnN1RXZ?=
 =?iso-8859-1?Q?OZxJd5ikXD1SBmULicw1t+GJkNbCAoO3R09RFo/pzN1xZqZlhUSysqxDlv?=
 =?iso-8859-1?Q?JkS369EQhgTfSSVZMlZ+lye2PO3cDx9dVGb+WKadne/yA/v0c9fB7k+xTx?=
 =?iso-8859-1?Q?4JxKYniQQAriSlz69qMY0ByZ/VbVirMkWgsApS3cgLV39WjoAIJA0dXnNa?=
 =?iso-8859-1?Q?lo9DPtoGCwIR6ia/zdspcB+fLN3/bORyvkerxB4RqNwNbQAjqMaX4RcYWr?=
 =?iso-8859-1?Q?8zKXOpdyG/9XHJ2YyH/A3ux1/PHuQ+atRWcHLGqL1yzcdO7vOq22ZoxA0W?=
 =?iso-8859-1?Q?YrMCTY8n6xtzgb/7rJOuAqQlVwR2dnJHObTKGwC3SSrils46lKR8t42wvb?=
 =?iso-8859-1?Q?ASHz8u2pmFxWwAlgkvQyXzm0Aa3rnE+aeWK6QRebEDaPU34G53xiduQQGA?=
 =?iso-8859-1?Q?we+j9ye3bUzGmAUP3GyShAamtXqzLIhXM4oLEsPHIfw9n3/fWf3+aK/wVJ?=
 =?iso-8859-1?Q?Zv2v1UTDrUXcjYiLMBaJs1YwgsD10vQatt78d9zMcqgQ9CG53G84P6MtbR?=
 =?iso-8859-1?Q?ThhDyULmD9OX92ePoFC7z/7Ryd9Vmfca9R6eAdzq2tdq3voZudGXQQ2HMV?=
 =?iso-8859-1?Q?0pZKzDsqMOpj5XSK8r6Pu1F1Q1LexoEEUsHF/sJmcILAZTV49fEyyiPrfj?=
 =?iso-8859-1?Q?oaMqKJw7OTY1T5ul4wu/G/i4pEd/TQIZcEIyI4ViWVJd0cVr45B2TYrq8K?=
 =?iso-8859-1?Q?2KRA76Y48a85ZNaMFiF7bSp63mVHZx4vURIDpEYZw9l9GwBSBFFl7ZD81r?=
 =?iso-8859-1?Q?BdEmtFuJKBBT5qBDMdYzC5KMwk1mzcWHfW8HM9XGiGdh3KXIiAGtYy6Xns?=
 =?iso-8859-1?Q?udKanak6suWE/Qr0tIgr/GFE5MgnkF4vzOUuRWPA0nF3UWvsWkWCgS33Dp?=
 =?iso-8859-1?Q?ThF3/X7/++NNI3qtbn8V1MhNG/vYf0uOiQ152kGSbawvEijlIzzkZf7G2/?=
 =?iso-8859-1?Q?ZErcR9a5gywjtnV8j9KPY2s4KEuWT3wTXFmH19wgM5YvN3+C+RZjvWVHy1?=
 =?iso-8859-1?Q?2I/ijOCgjgpaASV6S1wnHEHsoSW9lt7ApBgx7xRlEMIhAgb0sa2mHuqWV+?=
 =?iso-8859-1?Q?eCUivE6AWoJOGaP5o46O98WAJPWe41THwE4E76QvAI4JCOIMTu3AwG3tkc?=
 =?iso-8859-1?Q?NQXKiywlb9eBD1AjXFFhK4yDCtujFecsWD1coH6wvToMvFQh4t/hXev51H?=
 =?iso-8859-1?Q?co4Bi4WtfQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-aspeed@lists.ozlabs.org
List-Id: <linux-aspeed.lists.ozlabs.org>
List-Help: <mailto:linux-aspeed+help@lists.ozlabs.org>
List-Owner: <mailto:linux-aspeed+owner@lists.ozlabs.org>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linux-aspeed/>,
  <https://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Subscribe: <mailto:linux-aspeed+subscribe@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-digest@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linux-aspeed+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSQPR06MB7252.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d23907f-f01a-4d5e-4333-08de83058ec6
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2026 02:41:42.6433
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /2lXjzc5T6RAfMd8b0eRKajty9AEa2kWP3SwPpSWDM/eGB4cEfQivVEFPI+CrslR4S3pt8KNSwstQUKdEoKcUXF0VM5WUfGX1vQD0o0kiOM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PPFAC281535F
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[aspeedtech.com,quarantine];
	R_DKIM_ALLOW(-0.20)[aspeedtech.com:s=selector1];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:linux-iio@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:morris_mao@aspeedtech.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[billy_tsai@aspeedtech.com,linux-aspeed@lists.ozlabs.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-3678-lists,linux-aspeed=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[billy_tsai@aspeedtech.com,linux-aspeed@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[aspeedtech.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-aspeed];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aspeedtech.com:dkim,OSQPR06MB7252.apcprd06.prod.outlook.com:mid]
X-Rspamd-Queue-Id: 6F3B4294364
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 06:02:16PM +0800, Billy Tsai wrote:=0A=
> > For controllers with battery sensing capability (AST2600/AST2700), the =
last=0A=
> > channel uses a different circuit design optimized for battery voltage=
=0A=
> > measurement. This channel should not be enabled by default along with o=
ther=0A=
> > channels to avoid potential interference and power efficiency issues.=
=0A=
> >=0A=
> > Changes made:=0A=
> > - Introduce aspeed_adc_get_active_channels() to return the number of=0A=
> >   channels that should be enabled by default=0A=
> > - For battery sensing capable controllers, exclude the last channel=0A=
> >   from the default channel enable mask=0A=
> > - Enable the battery sensing channel only when explicitly accessed=0A=
> >   via read_raw()=0A=
> > - Replace hardcoded channel numbers with ASPEED_ADC_BATTERY_CHANNEL mac=
ro=0A=
> > - Add helper functions for cleaner channel management=0A=
=0A=
> Why not series of patches each for the change made?=0A=
=0A=
Okay, I will split the changes into a series of patches for better clarity =
and=0A=
review for V2.=0A=
=0A=
Thanks=0A=
=0A=
Billy Tsai=0A=
=0A=
> This ensures optimal power efficiency for normal ADC operations while=0A=
> maintaining full functionality when battery sensing is needed.=

