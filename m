Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45635957A04
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:59:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqL23tQnz3vwn
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:58:18 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=kYq2FP1v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feae::712; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=kevin_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20712.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::712])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wkr2v0y5Qz2yDp
	for <linux-aspeed@lists.ozlabs.org>; Thu, 15 Aug 2024 13:19:47 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o5QW9Z1D2cBQTJ+cvKX/MMFzGecB3ohyBpnmI+UaOLTzoQZ+dJlCbkc49strVfFR9FVXXAiP1YpO7qXBOIGgzqTxWQ/KIi5j335wDARb4Hnb+9b3VJ3bO67EvvCcZw0SMLPnSxF/VeRTRDZkgA75bbJHxzh7tA30O/X3rvXaRnvDi1PX0khR1+UCXPd4HT6AYhPsmPi/oLbNtOJFXcC/z4KkI+wG6JN6PGT6r0v1lqsBU2agYi9A7/Os/Y5+0BNI/GArfJAxyNn0l0hV6tuIcelHeue6RKUt3NDmGR89IueK5mE7/A3LHcKv91+XZAPgk5HWmlAPkZXC9qwbaKchgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ls41rp9K2ahxXlUBNaiLcxTwpfzwjN6c2waCWathzmY=;
 b=ucIPs1SJg4BpkQ7zCKL/XOlv+Wcf7GkwACxw32VZ3hChOdLcHrTqUGq+mLe4CYlYG85jptkFcinjjfV/syuW3vIr7gM2Yk9MNXmgXq+JTHvsASYBX1sNVZrDljKn0QfEr/q6E52HXMj4aTcGsTh5II/EvUgzJ9J2LO3KVdxqEJnb8Wsp5rD9eV4MUvi430139oK+GuF4FMgV6sl07ijnyPnOym/ddW03guTcfFET7nmOG3E1YBQpR3AOiy4ygMzrHxTGNuMC4I8JAL9BSAH1U4x1UXU7xWl46heg+TTUfayXXKIAcoYFCyAvGgcJbn+K+yo3kWS4w0R016/6SgsV8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ls41rp9K2ahxXlUBNaiLcxTwpfzwjN6c2waCWathzmY=;
 b=kYq2FP1vACAKsnepap2/VpGDkvJXoQ2GV/wYgBuW7RWIdi+glZYqX8WKUqV4Cbp0XNHPDwwahqBJflHBVkdXdfz+slZVl6cSOgedkb9UG46bagHhWj7KpzQKOlr3igmsO0Lrmrxx1qMNDdleBH+6XRihDFt0L8ERksk/C8FZNv4ElwGwj5N4Z8ZnGaujSx9/6IYBidL5Cm1Q8KF0DjtrSekoPCC85a5/S9y+Oz/ekJu26IWlu6BbijvazOBWi0gTmnwVtwVaHQsPicXdNkbPbsBT+PFoHZ5JXO0imimtY0ZqbfoL4/re/I9IwQX8BI7JmZ5NAQzgLrOUKuUBiYJsZg==
Received: from PSAPR06MB4949.apcprd06.prod.outlook.com (2603:1096:301:ad::9)
 by SEYPR06MB7043.apcprd06.prod.outlook.com (2603:1096:101:1d8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.23; Thu, 15 Aug
 2024 03:19:24 +0000
Received: from PSAPR06MB4949.apcprd06.prod.outlook.com
 ([fe80::7bdd:639a:6b94:37bf]) by PSAPR06MB4949.apcprd06.prod.outlook.com
 ([fe80::7bdd:639a:6b94:37bf%7]) with mapi id 15.20.7875.016; Thu, 15 Aug 2024
 03:19:24 +0000
From: Kevin Chen <kevin_chen@aspeedtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "tglx@linutronix.de"
	<tglx@linutronix.de>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "joel@jms.id.au" <joel@jms.id.au>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>
Subject:  =?big5?B?pl7C0DogW1BBVENIIHYyIDAvMl0gQWRkIHN1cHBvcnQgZm9yIEFTVDI3MDAgSU5U?=
 =?big5?Q?C?=
Thread-Topic: [PATCH v2 0/2] Add support for AST2700 INTC
Thread-Index: AQHa7j7es1vtdXazRkyaHqQ76/ucuLIm3MgAgAC6EOM=
Date: Thu, 15 Aug 2024 03:19:24 +0000
Message-ID:  <PSAPR06MB494959EA1822E0DE5AEF36CD89802@PSAPR06MB4949.apcprd06.prod.outlook.com>
References: <20240814114106.2809876-1-kevin_chen@aspeedtech.com>
 <20240814114106.2809876-2-kevin_chen@aspeedtech.com>
 <1bf9edfe-5b32-4382-83d4-5be91e6c036e@kernel.org>
In-Reply-To: <1bf9edfe-5b32-4382-83d4-5be91e6c036e@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
undefined: 6365508
drawingcanvaselements: []
composetype: reply
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR06MB4949:EE_|SEYPR06MB7043:EE_
x-ms-office365-filtering-correlation-id: 954e2ef0-17af-4408-da2d-08dcbcd9102b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|7416014|376014|1800799024|366016|921020|38070700018;
x-microsoft-antispam-message-info:  =?big5?B?NHRKL0h0cDVyQVJXYTB6OGVtaDJCTkRXUlFIS21OaTEvcXRYOXJuMG45UEhIcmQw?=
 =?big5?B?Y21pSHEzZFdDQXVpUnJITENMUlhzREplcXJvREloR1AwUVlEd2NGNzRWSEMzVUMz?=
 =?big5?B?Wmh0bnRqY25KSnhoT0JkUlQwclkza0tqd2Z6blk4djN5YitqYTZMVFJtU0tnZDhZ?=
 =?big5?B?dmJHY1E4VUR5Tld0L2EwVU9kRFYzU2lyaVF1ZHo5WGkvS1dCNHNkUXcwVEgzTWJj?=
 =?big5?B?RjQyZWt4bjhwckQxVUFQMnFrQ3hoUjRxMW9BUzVIMi9IOXZzUk5mKzJqbGM5LzJQ?=
 =?big5?B?d2EyV1F0S3FZam5uNGt4UStsUnVJNzZVaFhwNDdra3RmYm92aG1nYVNvL3VFR3dX?=
 =?big5?B?aEZERUVnd1pTeURuNmVscWZ6STRnMnNlMWtrUXZrc1RxUTkwdE5Oa2VLa2dJRTRx?=
 =?big5?B?NnNDeEREdTJiVnd2THZGWXhKam5GM2dUNTljRm83WUpmVDBXaWFKWDkvSFRBSkFi?=
 =?big5?B?MDdURDl4SzlJZW1JY2lCWUVSRjBER1JIYlJjbFArMHdrTzFVTVhvZmp2YUJpWkMv?=
 =?big5?B?bGhRKzRybkVHS2VGSHFDVzdYM3AwZ0lYYUJrUit2VEpHcDl0M1dCRjc1WFUrRU8r?=
 =?big5?B?TG5tUkNIVVEycXE3aDlPanRrc0wydk5SZHNjVFFNamlNWXh0RkZqbnJDQmo2dkJK?=
 =?big5?B?TU9MRWlqT1lSL0V2d1lHSzNFc29BaTFVOGV1cisyN3FrT1kxbmJ2NUw0REIrVmlw?=
 =?big5?B?MUE4bFZDUW96NkxRRW9JVFdwVDNVR1BZMDRXcjVtbE9KOWpGU0tMS3J4d0RxNUEv?=
 =?big5?B?MWJSNVpIQVl0WnhSY0NPT0k5NHhwWVBYQmZaS1hBMHI0NkpOR1ZLSnllMlNiUHdy?=
 =?big5?B?b3NlWUZKbGpUNUpiSzMvak9raCtEdHEzaTBVZGhZSjRVellHYWt4dkltZ01WOC9j?=
 =?big5?B?K2Eza3FQUUpjcGVnR1dueTE2cTIzN1FxRldOVytCL29mUkZJUlFUNktvQWRJMy94?=
 =?big5?B?Nmszdnk4UEpXbmxEQlpySVJhbDU1azA1NUFUL3JJTVdJaG9qSFFtMmhxSkRZUUt0?=
 =?big5?B?L1RQVWRaRTZyVVM1bVpaVU9RSjVPSVRQTHdJVmJVNWU5NW1EWklqNVpjWkZrM2VB?=
 =?big5?B?SWpjTFVFNjZocDN0QWF1anlWOUpibE9maTRjTjM1MHNoaER4WDJqaXZkMlJhcU9l?=
 =?big5?B?MkZyMS9rSzkxbmpoY09PVkFzZTRkdXh4NWNVVEpSRWxpcmdtNkovMUZVTjF0Tjk2?=
 =?big5?B?b3FzRGlETjVpSFBKb01KM050czVBTENCSkpFbDhTN3piNGIrL2FGSkZ3VEZ6MkxV?=
 =?big5?B?K0pGREZpMGcxUHhwaXhNdlRGa2p2bWYxa0R6Ri9tenBDNnVsejZIczA3NkFqR2l2?=
 =?big5?B?djBwYkZlc1ZmR1lIMk40Wm5GVWs2cXFvUm1yUytaY2h6bjYzWjVpOGkwSVVwRm8y?=
 =?big5?B?R1VpOWRwT3hGMmJWOWRkbUl2ck8yQjBwMFZiWVVUZVgrckFnMjE3UjlVL0tpTlo2?=
 =?big5?B?V0JMQnU0V1NaL3gwTEJZTjJjVDRnbTQzeHYxRFpWTkViSFl5aWxONExLak82bkVR?=
 =?big5?B?UUtad3ViaktoUHZNZk9YSFU0a3N5SVBXZU4zR0oyWWpaY2NIenB0VjczdDlhVWhC?=
 =?big5?B?NVFZOVA3c2IwblgzcksyNEtHM1lJVGg0NmZ3NDdENFNOQlJnd3pmUnRORzBKWkdj?=
 =?big5?B?RDY1WXhCSHM2WHhqd2tickdlOElJb0pGeDhUUUdpTmJBd2tLaTdQaFBiOFNkY0Ry?=
 =?big5?B?TGFINXVreG1lamg1cHJwTUZWR0JiT3hPeTIrMjJWRHQwRityWWx0R1NCaERFTGoz?=
 =?big5?B?MDRNOXYrb3hzbTBETE5tWmYrQTB3cXJGTW1yTFRxZjl2OGcxQm1LYlRrZEwzWUpH?=
 =?big5?Q?/8qGJ7I1e6w=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR06MB4949.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?big5?B?YmFKR0VEVFRjaldmT2daT0luR3pOd3ZWamNEQ2ozT0F3TkpYK0dKK0dRbS9KeURX?=
 =?big5?B?RUVIS1BvNjkxbHc3MmYraHJPRHhaR05ZcTMzMXRCbU5vQkJud3dOQXZDMFdLbERU?=
 =?big5?B?ZU5lb2xiOHpQVnM1YlJRdWJNbW44WVJEVXV3bDRiSmNaZG55RHpBbnRRWkRacG9L?=
 =?big5?B?RlV4Y1ZIMDdEZTR3NldCbU1rdnYzVXJEbjlsaVU5dmtEcVVqak9VUlUvWERudE9n?=
 =?big5?B?ZWRVUncwQnYySW5oVmRaYzRqdk85NklvaXFuMGlMbW5hRCtGUDNVNGVva1liMnpG?=
 =?big5?B?OFp1L0VnVEs0cW0yT0E3Ly9YUld5L0RTenUvMFZjNFRCK1ExU3JSZTR1VTVQY1Nk?=
 =?big5?B?Z0NCdHp5cHhIbDZkNUJPZHV3Y25UTEhMVXc5MGt4UWVFd1FDOWFPTFY1K3JFM1Fs?=
 =?big5?B?K3N5cDd4MC9UU0NmVDV5UkJHVlRLSnpyMWs4NDZQUWs5bThwZ1kxanFJOVl3ZVVW?=
 =?big5?B?UkhoZDNVbFVLVkVVOTd3TFBheGx2em03cnRBaVRkWXM5aHpCdGtVVk1XSDNNbVp0?=
 =?big5?B?TEdZakNobkduQWNwOUhQR0tzdEYrbFpCUlZVc202MS9RZnVBYkNVT1VjK2tlSmsx?=
 =?big5?B?YWQ1ZUlTbHlOTjlXM1VNUXBLUS9RT05YSE0vaHNkY2graUk4aXFyVERKYVErV0kx?=
 =?big5?B?RzlSdEEyOXl3RzlsSlJIWVE4TndGcEVMTys3V1NaMHYxK0VLSjE5NUhBUUR6d3Vz?=
 =?big5?B?VFp3b2k2WCt1WTZkRFdKbTliV3p2T0Z3V0VHQlVYdTZnZlRrLzJ4M01DbWtRTVE2?=
 =?big5?B?L01NSitIeVFwNVdNTm5HaE9RUlNNbThPRUdWcmVtMEZHZXFFWDNaNWFtTitvazFq?=
 =?big5?B?OU5MMDUyZ1RtTExRM20zVGFLaXpJTW9Dcjd6OWpmdnp6UjJpRFVUZXN3YkZ3S0N3?=
 =?big5?B?VXlHanBPTUw3VkkyVnIzY2ZMZHVoVzFzakVUL1JpSG5kWlRsWWRZc1RqazMwNnRD?=
 =?big5?B?eE1POUxFWmQ5bTVqdWRJbkNLaDdVdFZmZjY2cjVScE5yMHNXeHZGMkpOYjArZ2Vr?=
 =?big5?B?Q1o3TTltMFo3S1NwdTJPTWd4dmIrNUwxeXcyVjRkU3lQZVZFdEtkWGZnS3JmZzIv?=
 =?big5?B?M0cwYlJMeVNYc3RMamJGSktHV1VXWWRFK1UraGZJRnhVSlg4TXFMNzhsUnBUSE1o?=
 =?big5?B?bitPQ0FqZ2ZWNm50LzNNUVYrZWVJb3g0M2J2T0hHb2FFVFJjRFdxVHdtVTVrVTRI?=
 =?big5?B?K3JQdXl1aXpHUnk0Ykc1d210YzJ2RU8vTmpGby9XTXVhSDBKdVAvRDY5TlFwcVRV?=
 =?big5?B?UkNzcE00VHgyWjVmV3N0N29HbklBdUhrRzRBVk5yVUNDME1uamRJUGp0WHVKYUs5?=
 =?big5?B?TnJGdU5wcW1yZWdMUDFyMHRNd2tPY0RYMVhNUHRraDhOWk1xS0xoOXJQakY1WGpO?=
 =?big5?B?VkFEQ2JNanJKRkxnR0d4VG5jR2pPeUcyUHErMkdWWnRwcGlGSW1DQUZUU1lLK3oy?=
 =?big5?B?T2E4SkNXRk1jemt0dU1QY2FHVG1xb1hvak85VHRIMUUySFFhSjFobWVjeFNmRzB3?=
 =?big5?B?L1B0aitsVzBEM1ZRbGV3eFJEbGNqeExqTjNaNXZiVzlUUWlPYUJ3RjJhMElqbTI5?=
 =?big5?B?anIwblZsRHZFUGFNSFRjbjQ4YzlNUFhTeHNCYzkwTE1pQlp1TnhNOW5ab3daUGJG?=
 =?big5?B?V25neitScXgzVjJ2eVduZ0liNUpvczViOWlrcGNQSGo3RUluOVFCVkIyRG81Rk5v?=
 =?big5?B?Y3Rna2wyWFBnTGJ2OTZkL3dOUHVuT3N2UEFwQ0xjTjRNL3JieUVXckUrSUJnaTlQ?=
 =?big5?B?cXJiaWpKNTA3bUVzTTREL1hROGFQcFZxYXpidzY5dyt2MFRhd0hFWkdVa0psR3hi?=
 =?big5?B?OVZ4ZUxMWnltaUdQblJGeEpEVk9wcEdjcHNyWUwvU0hUSG1PQXdtRFN1N2NtUHU0?=
 =?big5?B?ZkFGTkoxY1RlUXBJeDljVis1cHlzVjMwSGFNYklia2hvZ3pQWm1hdkZqRjNVOVZx?=
 =?big5?B?RmFMSG1YZDN6b3RhSUJWOFcrVHNaS0NGMkZiN3JibkZYcHR5d29WV2tGMm90Tlh2?=
 =?big5?Q?vEIdv6xzbC975+M0?=
Content-Type: multipart/alternative;
	boundary="_000_PSAPR06MB494959EA1822E0DE5AEF36CD89802PSAPR06MB4949apcp_"
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4949.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 954e2ef0-17af-4408-da2d-08dcbcd9102b
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2024 03:19:24.4607
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dfHnRqkhgArUJHXcc9s4T6yN7wj++xB2krZEmSIuFMJgHhdZCmkC5/oOs8z3JnvsUJ1dQBFpISlW4Jao/llNJuIh21hVxDSJlylGfj65+VQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB7043
X-Mailman-Approved-At: Tue, 20 Aug 2024 09:56:01 +1000
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

--_000_PSAPR06MB494959EA1822E0DE5AEF36CD89802PSAPR06MB4949apcp_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGkgS3J6aywNCg0KPj4gU3VwcG9ydCBmb3IgdGhlIEFzcGVlZCBJbnRlcnJ1cHQgQ29udHJvbGxl
ciBmb3VuZCBvbiBBc3BlZWQgN3RoIEdlcmF0aW9uIFNpbGljb24NCj4+IFNvQ3MuDQo+Pg0KPj4g
QVNQRUVEIGludGVycnVwdCBjb250cm9sbGVyKElOVEMpIG1hcHMgdGhlIGludGVybmFsIGludGVy
cnVwdCBzb3VyY2VzIG9mDQo+PiB0aGUgQVNUMjdYWCBkZXZpY2VzIHRvIGFuIHBhcmVudCBpbnRl
cnJ1cHQgY29udHJvbGxlci4NCj4+DQo+PiBDaGFuZ2VzIHNpbmNlIHYyOg0KPj4gQ29tYmluZSB0
aGUgYXNwZWVkX2ludGNfaWNfb2ZfaW5pdCBhbmQgYXNwZWVkX2ludGNfaWNfb2ZfaW5pdF92Mi4N
Cj4+IFN3aXRjaCByYXdfc3Bpbl9sb2NrX2lycXNhdmUgdG8gc2NvcGVkX2d1YXJkIGFuZCBndWFy
ZC4NCj4+IEZpeCB0aGUgZXJyb3Igb2YgbWFrZSBkdF9iaW5kaW5nX2NoZWNrLg0KPj4gUmVmaW5l
IHRoZSBhc3BlZWQsYXN0MjcwMC1pbnRjLnlhbWwuDQo+DQo+SXQgc2VlbXMgdGhhdCBlbnRpcmUg
QXNwZWVkIGhhcyB0cm91YmxlcyB3b3JraW5nIHdpdGggcGVvcGxlIGluIHRoZQ0KPmNvbW11bml0
eS4gWW91IGRvIG5vdCBhZGRyZXNzIGZlZWRiYWNrLCB5b3UgaWdub3JlIGl0IGFuZCBhc2tzIHVz
IHRvDQo+cmUtcmV2aWV3IHRoZSBzYW1lIGNyYXAuDQpTb3JyeS4NCg0KPkJlZm9yZSB3ZSBwcm9j
ZWVkIGZ1cnRoZXI6DQo+MS4gQW5zd2VyLCBpbmxpbmUsIHdpdGhvdXQgY29uZmlkZW50aWFsaXR5
IG5vdGljZSAoYWZ0ZXIgYXNraW5nIHlvdSB0aGlzDQo+NSB0aW1lcywgSSB0aGluayB5b3Ugc2hv
dWxkIGZpeCBpdCBmaW5hbGx5KSB0aGF0IHlvdToNCj4gLSBhZ3JlZSAoYWNrL29rL2FncmVlKQ0K
PiAtIGRpc2FncmVlIHdpdGggZXhwbGFuYXRpb24gd2h5DQpBZ3JlZSwgSSB3aWxsIHJlcGx5IGFs
bCBwcmV2aW91cyBmZWVkYmFja3MuIFNvcnJ5IHRvIGJvdGhlciB5b3UgZm9yIHByZXZpb3VzIG5l
dyBwYXRjaGVzIHdpaG91dCBmZWVkYmFjay4NCg0KPjIuIFRoZW4gZG91YmxlIGNoZWNrIHRoYXQg
eW91ciBuZXcgdmVyc2lvbiBpbXBsZW1lbnRzIGV2ZXJ5dGhpbmcgYWJvdmUuDQpBZ3JlZQ0KDQo+
My4gVGhlbiBzZW5kIG5ldyB2ZXJzaW9uIChtYXggb25jZSBwZXIgMjRoKSB3aXRoIGNoYW5nZWxv
ZyBhbmQNCj52ZXJzaW9uaW5nIChqdXN0IHVzZSBgYjRgKS4NCkkgd2lsbCB0cnkgdG8gdXNlIGI0
LCBidXQgSSBuZWVkIHRvIGNoZWNrIHRoZSB1c2FnZSB3aXRoIG91ciBBU1BFRUQgTUlTLg0KSSBz
dHVkaWVkIHRoZSBiNCBhcyB0aGUgZm9sbG93aW5nOg0KIyBmaXJzdCBwYXRjaGVzDQpiNCBwcmVw
IC1uIGFzdDI3eHgtaW50Yw0KYjQgc2VuZCAtbyAvdG1wL3Rvc2VuZA0KYjQgcHJlcCAtLWF1dG8t
dG8tY2MNCmI0IHByZXAgLS1lZGl0LWNvdmVyDQpiNCBzZW5kIC1vIC90bXAvdG9zZW5kDQouL3Nj
cmlwdHMvY2hlY2twYXRjaC5wbCAvdG1wL3Rvc2VuZC94eHgucGF0Y2gNCmI0IHNlbmQgLS1yZWZs
ZWN0DQpiNCBzZW5kIC0td2ViLWF1dGgtbmV3DQpiNCBzZW5kIC0td2ViLWF1dGgtdmVyaWZ5IHh4
eA0KYjQgc2VuZA0KIyBuZXcgcGF0Y2hlcw0KYjQgcHJlcCAtLWVkaXQtY292ZXINCmI0IHNlbmQg
djINCg0KDQo+SWYgeW91IGtlZXAgaWdub3Jpbmcgc3RlcCAxIGFuZCAyLCB5b3Ugd2lsbCBhbm5v
eSByZXZpZXdlcnMgdXAgdG8gdGhlDQo+cG9pbnQgb2YgYXV0b21hdGljIE5BSyBvciBiZWluZyBp
Z25vcmVkLg0KSSB3aWxsIGZvbGxvdyB0aGUgcnVsZXMuIFRoYW5rcyBmb3IgeW91ciBraW5kIHJl
bWluZGVyLg0KDQotLQ0KQmVzdCBSZWdhcmRzLA0KS2V2aW4uIENoZW4NCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fDQqxSKXzqsw6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2Vy
bmVsLm9yZz4NCrFIpfOk6bTBOiAyMDI0pn44pOsxNKTpIKRVpMggMTE6MTQNCqaspfOqzDogS2V2
aW4gQ2hlbiA8a2V2aW5fY2hlbkBhc3BlZWR0ZWNoLmNvbT47IHRnbHhAbGludXRyb25peC5kZSA8
dGdseEBsaW51dHJvbml4LmRlPjsgcm9iaEBrZXJuZWwub3JnIDxyb2JoQGtlcm5lbC5vcmc+OyBr
cnprK2R0QGtlcm5lbC5vcmcgPGtyemsrZHRAa2VybmVsLm9yZz47IGNvbm9yK2R0QGtlcm5lbC5v
cmcgPGNvbm9yK2R0QGtlcm5lbC5vcmc+OyBqb2VsQGptcy5pZC5hdSA8am9lbEBqbXMuaWQuYXU+
OyBhbmRyZXdAY29kZWNvbnN0cnVjdC5jb20uYXUgPGFuZHJld0Bjb2RlY29uc3RydWN0LmNvbS5h
dT47IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcgPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5l
bC5vcmc+OyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyA8ZGV2aWNldHJlZUB2Z2VyLmtlcm5l
bC5vcmc+OyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcgPGxpbnV4LWFybS1r
ZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz47IGxpbnV4LWFzcGVlZEBsaXN0cy5vemxhYnMub3Jn
IDxsaW51eC1hc3BlZWRAbGlzdHMub3psYWJzLm9yZz4NCqVEpq46IFJlOiBbUEFUQ0ggdjIgMC8y
XSBBZGQgc3VwcG9ydCBmb3IgQVNUMjcwMCBJTlRDDQoNCk9uIDE0LzA4LzIwMjQgMTM6NDEsIEtl
dmluIENoZW4gd3JvdGU6DQo+IFN1cHBvcnQgZm9yIHRoZSBBc3BlZWQgSW50ZXJydXB0IENvbnRy
b2xsZXIgZm91bmQgb24gQXNwZWVkIDd0aCBHZXJhdGlvbiBTaWxpY29uDQo+IFNvQ3MuDQo+DQo+
IEFTUEVFRCBpbnRlcnJ1cHQgY29udHJvbGxlcihJTlRDKSBtYXBzIHRoZSBpbnRlcm5hbCBpbnRl
cnJ1cHQgc291cmNlcyBvZg0KPiB0aGUgQVNUMjdYWCBkZXZpY2VzIHRvIGFuIHBhcmVudCBpbnRl
cnJ1cHQgY29udHJvbGxlci4NCj4NCj4gQ2hhbmdlcyBzaW5jZSB2MjoNCj4gQ29tYmluZSB0aGUg
YXNwZWVkX2ludGNfaWNfb2ZfaW5pdCBhbmQgYXNwZWVkX2ludGNfaWNfb2ZfaW5pdF92Mi4NCj4g
U3dpdGNoIHJhd19zcGluX2xvY2tfaXJxc2F2ZSB0byBzY29wZWRfZ3VhcmQgYW5kIGd1YXJkLg0K
PiBGaXggdGhlIGVycm9yIG9mIG1ha2UgZHRfYmluZGluZ19jaGVjay4NCj4gUmVmaW5lIHRoZSBh
c3BlZWQsYXN0MjcwMC1pbnRjLnlhbWwuDQoNCkl0IHNlZW1zIHRoYXQgZW50aXJlIEFzcGVlZCBo
YXMgdHJvdWJsZXMgd29ya2luZyB3aXRoIHBlb3BsZSBpbiB0aGUNCmNvbW11bml0eS4gWW91IGRv
IG5vdCBhZGRyZXNzIGZlZWRiYWNrLCB5b3UgaWdub3JlIGl0IGFuZCBhc2tzIHVzIHRvDQpyZS1y
ZXZpZXcgdGhlIHNhbWUgY3JhcC4NCg0KQmVmb3JlIHdlIHByb2NlZWQgZnVydGhlcjoNCjEuIEFu
c3dlciwgaW5saW5lLCB3aXRob3V0IGNvbmZpZGVudGlhbGl0eSBub3RpY2UgKGFmdGVyIGFza2lu
ZyB5b3UgdGhpcw0KNSB0aW1lcywgSSB0aGluayB5b3Ugc2hvdWxkIGZpeCBpdCBmaW5hbGx5KSB0
aGF0IHlvdToNCiAtIGFncmVlIChhY2svb2svYWdyZWUpDQogLSBkaXNhZ3JlZSB3aXRoIGV4cGxh
bmF0aW9uIHdoeQ0KDQoyLiBUaGVuIGRvdWJsZSBjaGVjayB0aGF0IHlvdXIgbmV3IHZlcnNpb24g
aW1wbGVtZW50cyBldmVyeXRoaW5nIGFib3ZlLg0KDQozLiBUaGVuIHNlbmQgbmV3IHZlcnNpb24g
KG1heCBvbmNlIHBlciAyNGgpIHdpdGggY2hhbmdlbG9nIGFuZA0KdmVyc2lvbmluZyAoanVzdCB1
c2UgYGI0YCkuDQoNCklmIHlvdSBrZWVwIGlnbm9yaW5nIHN0ZXAgMSBhbmQgMiwgeW91IHdpbGwg
YW5ub3kgcmV2aWV3ZXJzIHVwIHRvIHRoZQ0KcG9pbnQgb2YgYXV0b21hdGljIE5BSyBvciBiZWlu
ZyBpZ25vcmVkLg0KDQpCZXN0IHJlZ2FyZHMsDQpLcnp5c3p0b2YNCg0KKioqKioqKioqKioqKiBF
bWFpbCBDb25maWRlbnRpYWxpdHkgTm90aWNlICoqKioqKioqKioqKioqKioqKioqDQqnS7NkwW6p
+joNCqW7q0il8yipzqjkqv6l8ymlaa/gpV2ndL73sUu46rBUoUGow6j8qmur36tPxUChQ6ZwIKV4
ut2rRKv8qXekp6aspfOqzKFBvdClSLlxpGy2bKXzs3GqvqW7uXGkbLZspfOkp7VvsGWqzCwgqMO9
0KXfp1mnUrCjpbu5caRstmyl86TOqOSq/qXzqU2+ULe0qdKms73Gpkyl86FDwcLBwrF6qrqmWKdA
IQ0KDQpESVNDTEFJTUVSOg0KVGhpcyBtZXNzYWdlIChhbmQgYW55IGF0dGFjaG1lbnRzKSBtYXkg
Y29udGFpbiBsZWdhbGx5IHByaXZpbGVnZWQgYW5kL29yIG90aGVyIGNvbmZpZGVudGlhbCBpbmZv
cm1hdGlvbi4gSWYgeW91IGhhdmUgcmVjZWl2ZWQgaXQgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkg
dGhlIHNlbmRlciBieSByZXBseSBlLW1haWwgYW5kIGltbWVkaWF0ZWx5IGRlbGV0ZSB0aGUgZS1t
YWlsIGFuZCBhbnkgYXR0YWNobWVudHMgd2l0aG91dCBjb3B5aW5nIG9yIGRpc2Nsb3NpbmcgdGhl
IGNvbnRlbnRzLiBUaGFuayB5b3UuDQo=

--_000_PSAPR06MB494959EA1822E0DE5AEF36CD89802PSAPR06MB4949apcp_
Content-Type: text/html; charset="big5"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dbig5">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
Hi Krzk,</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
&gt;&gt; Support for the Aspeed Interrupt Controller found on Aspeed 7th Ge=
ration Silicon</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
&gt;&gt; SoCs.</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
&gt;&gt;</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
&gt;&gt; ASPEED interrupt controller(INTC) maps the internal interrupt sour=
ces of</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
&gt;&gt; the AST27XX devices to an parent interrupt controller.</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
&gt;&gt;</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
&gt;&gt; Changes since v2:</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
&gt;&gt; Combine the aspeed_intc_ic_of_init and aspeed_intc_ic_of_init_v2.<=
/div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
&gt;&gt; Switch raw_spin_lock_irqsave to scoped_guard and guard.</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
&gt;&gt; Fix the error of make dt_binding_check.</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
&gt;&gt; Refine the aspeed,ast2700-intc.yaml.</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
&gt;</div>
<div class=3D"elementToProof" style=3D"direction: ltr; font-family: Aptos, =
Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; fo=
nt-size: 11pt; color: rgb(0, 0, 0);">
&gt;It seems that entire Aspeed has troubles working with people in the</di=
v>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
&gt;community. You do not address feedback, you ignore it and asks us to</d=
iv>
<div class=3D"elementToProof" style=3D"direction: ltr; font-family: Aptos, =
Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; fo=
nt-size: 11pt; color: rgb(0, 0, 0);">
&gt;re-review the same crap.</div>
<div class=3D"elementToProof" style=3D"direction: ltr; font-family: Aptos, =
Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; fo=
nt-size: 11pt; color: rgb(0, 0, 0);">
Sorry.</div>
<div class=3D"elementToProof" style=3D"direction: ltr; font-family: Aptos, =
Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; fo=
nt-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
&gt;Before we proceed further:</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
&gt;1. Answer, inline, without confidentiality notice (after asking you thi=
s</div>
<div class=3D"elementToProof" style=3D"direction: ltr; font-family: Aptos, =
Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; fo=
nt-size: 11pt; color: rgb(0, 0, 0);">
&gt;5 times, I think you should fix it finally) that you:</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
&gt; - agree (ack/ok/agree)</div>
<div class=3D"elementToProof" style=3D"direction: ltr; font-family: Aptos, =
Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; fo=
nt-size: 11pt; color: rgb(0, 0, 0);">
&gt; - disagree with explanation why</div>
<div class=3D"elementToProof" style=3D"direction: ltr; font-family: Aptos, =
Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; fo=
nt-size: 11pt; color: rgb(0, 0, 0);">
Agree, I will reply all previous feedbacks. Sorry to bother you for previou=
s new patches wihout feedback.</div>
<div class=3D"elementToProof" style=3D"direction: ltr; font-family: Aptos, =
Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; fo=
nt-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
&gt;2. Then double check that your new version implements everything above.=
</div>
<div class=3D"elementToProof" style=3D"direction: ltr; font-family: Aptos, =
Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; fo=
nt-size: 11pt; color: rgb(0, 0, 0);">
Agree</div>
<div class=3D"elementToProof" style=3D"direction: ltr; font-family: Aptos, =
Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; fo=
nt-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
&gt;3. Then send new version (max once per 24h) with changelog and</div>
<div class=3D"elementToProof" style=3D"direction: ltr; font-family: Aptos, =
Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; fo=
nt-size: 11pt; color: rgb(0, 0, 0);">
&gt;versioning (just use `b4`).</div>
<div class=3D"elementToProof" style=3D"direction: ltr; font-family: Aptos, =
Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; fo=
nt-size: 11pt; color: rgb(0, 0, 0);">
I will try to use b4, but I need to check the usage with our ASPEED MIS.&nb=
sp;</div>
<div class=3D"elementToProof" style=3D"direction: ltr; font-family: Aptos, =
Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; fo=
nt-size: 11pt; color: rgb(0, 0, 0);">
I studied the b4&nbsp;as the following:</div>
<table data-editing-info=3D"{&quot;topBorderColor&quot;:&quot;#ABABAB&quot;=
,&quot;bottomBorderColor&quot;:&quot;#ABABAB&quot;,&quot;verticalBorderColo=
r&quot;:&quot;#ABABAB&quot;,&quot;hasHeaderRow&quot;:false,&quot;hasFirstCo=
lumn&quot;:false,&quot;hasBandedRows&quot;:false,&quot;hasBandedColumns&quo=
t;:false,&quot;bgColorEven&quot;:null,&quot;bgColorOdd&quot;:&quot;#ABABAB2=
0&quot;,&quot;headerRowColor&quot;:&quot;#ABABAB&quot;,&quot;tableBorderFor=
mat&quot;:0,&quot;verticalAlign&quot;:&quot;top&quot;}" style=3D"box-sizing=
: border-box; border-collapse: collapse; border-spacing: 0px;">
<tbody>
<tr>
<td style=3D"width: 314.625px; height: 22px; border-width: 1px; border-styl=
e: solid; border-color: rgb(171, 171, 171); vertical-align: top; box-sizing=
: border-box;">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
# first patches<br>
b4 prep -n ast27xx-intc</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
b4 send -o /tmp/tosend</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
b4 prep --auto-to-cc</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
b4 prep --edit-cover</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
b4 send -o /tmp/tosend</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
./scripts/checkpatch.pl /tmp/tosend/xxx.patch</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
b4 send --reflect</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
b4 send --web-auth-new</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
b4 send --web-auth-verify xxx</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
b4 send<br>
# new patches<br>
b4 prep --edit-cover</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
b4 send v2</div>
</td>
</tr>
</tbody>
</table>
<div class=3D"elementToProof" style=3D"direction: ltr; font-family: Aptos, =
Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; fo=
nt-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
&gt;If you keep ignoring step 1 and 2, you will annoy reviewers up to the</=
div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
&gt;point of automatic NAK or being ignored.</div>
<div id=3D"x_appendonsend"></div>
<div class=3D"elementToProof" style=3D"direction: ltr; font-family: Aptos, =
Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; fo=
nt-size: 11pt; color: rgb(0, 0, 0);">
I will follow the rules. Thanks for your kind reminder.</div>
<div class=3D"elementToProof" style=3D"direction: ltr; font-family: Aptos, =
Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; fo=
nt-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"direction: ltr; font-family: Aptos, =
Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; fo=
nt-size: 11pt; color: rgb(0, 0, 0);">
--</div>
<div class=3D"elementToProof" style=3D"direction: ltr; font-family: Aptos, =
Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; fo=
nt-size: 11pt; color: rgb(0, 0, 0);">
Best Regards,</div>
<div class=3D"elementToProof" style=3D"direction: ltr; font-family: Aptos, =
Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; fo=
nt-size: 11pt; color: rgb(0, 0, 0);">
Kevin. Chen</div>
<hr style=3D"direction: ltr; display: inline-block; width: 98%;">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><span style=3D"font-family: Calibri=
, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);"><b>=B1H=A5=F3=AA=CC:</=
b>&nbsp;Krzysztof Kozlowski &lt;krzk@kernel.org&gt;<br>
<b>=B1H=A5=F3=A4=E9=B4=C1:</b>&nbsp;2024=A6~8=A4=EB14=A4=E9 =A4U=A4=C8 11:1=
4<br>
<b>=A6=AC=A5=F3=AA=CC:</b>&nbsp;Kevin Chen &lt;kevin_chen@aspeedtech.com&gt=
;; tglx@linutronix.de &lt;tglx@linutronix.de&gt;; robh@kernel.org &lt;robh@=
kernel.org&gt;; krzk+dt@kernel.org &lt;krzk+dt@kernel.org&gt;; conor+dt@ker=
nel.org &lt;conor+dt@kernel.org&gt;; joel@jms.id.au &lt;joel@jms.id.au&gt;;=
 andrew@codeconstruct.com.au
 &lt;andrew@codeconstruct.com.au&gt;; linux-kernel@vger.kernel.org &lt;linu=
x-kernel@vger.kernel.org&gt;; devicetree@vger.kernel.org &lt;devicetree@vge=
r.kernel.org&gt;; linux-arm-kernel@lists.infradead.org &lt;linux-arm-kernel=
@lists.infradead.org&gt;; linux-aspeed@lists.ozlabs.org
 &lt;linux-aspeed@lists.ozlabs.org&gt;<br>
<b>=A5D=A6=AE:</b>&nbsp;Re: [PATCH v2 0/2] Add support for AST2700 INTC</sp=
an>
<div>&nbsp;</div>
</div>
<div style=3D"direction: ltr; font-size: 11pt;">On 14/08/2024 13:41, Kevin =
Chen wrote:<br>
&gt; Support for the Aspeed Interrupt Controller found on Aspeed 7th Gerati=
on Silicon<br>
&gt; SoCs.<br>
&gt;<br>
&gt; ASPEED interrupt controller(INTC) maps the internal interrupt sources =
of<br>
&gt; the AST27XX devices to an parent interrupt controller.<br>
&gt;<br>
&gt; Changes since v2:<br>
&gt; Combine the aspeed_intc_ic_of_init and aspeed_intc_ic_of_init_v2.<br>
&gt; Switch raw_spin_lock_irqsave to scoped_guard and guard.<br>
&gt; Fix the error of make dt_binding_check.<br>
&gt; Refine the aspeed,ast2700-intc.yaml.<br>
<br>
It seems that entire Aspeed has troubles working with people in the<br>
community. You do not address feedback, you ignore it and asks us to<br>
re-review the same crap.<br>
<br>
Before we proceed further:<br>
1. Answer, inline, without confidentiality notice (after asking you this<br=
>
5 times, I think you should fix it finally) that you:<br>
&nbsp;- agree (ack/ok/agree)<br>
&nbsp;- disagree with explanation why<br>
<br>
2. Then double check that your new version implements everything above.<br>
<br>
3. Then send new version (max once per 24h) with changelog and<br>
versioning (just use `b4`).<br>
<br>
If you keep ignoring step 1 and 2, you will annoy reviewers up to the<br>
point of automatic NAK or being ignored.<br>
<br>
Best regards,<br>
Krzysztof<br>
<br>
</div>
************* Email Confidentiality Notice ********************<br>
=A7K=B3d=C1n=A9=FA:<br>
=A5=BB=ABH=A5=F3(=A9=CE=A8=E4=AA=FE=A5=F3)=A5i=AF=E0=A5]=A7t=BE=F7=B1K=B8=
=EA=B0T=A1A=A8=C3=A8=FC=AAk=AB=DF=ABO=C5@=A1C=A6p =A5x=BA=DD=ABD=AB=FC=A9w=
=A4=A7=A6=AC=A5=F3=AA=CC=A1A=BD=D0=A5H=B9q=A4l=B6l=A5=F3=B3q=AA=BE=A5=BB=B9=
q=A4l=B6l=A5=F3=A4=A7=B5o=B0e=AA=CC, =A8=C3=BD=D0=A5=DF=A7Y=A7R=B0=A3=A5=BB=
=B9q=A4l=B6l=A5=F3=A4=CE=A8=E4=AA=FE=A5=F3=A9M=BEP=B7=B4=A9=D2=A6=B3=BD=C6=
=A6L=A5=F3=A1C=C1=C2=C1=C2=B1z=AA=BA=A6X=A7@!<br>
<br>
DISCLAIMER:<br>
This message (and any attachments) may contain legally privileged and/or ot=
her confidential information. If you have received it in error, please noti=
fy the sender by reply e-mail and immediately delete the e-mail and any att=
achments without copying or disclosing
 the contents. Thank you.
</body>
</html>

--_000_PSAPR06MB494959EA1822E0DE5AEF36CD89802PSAPR06MB4949apcp_--
