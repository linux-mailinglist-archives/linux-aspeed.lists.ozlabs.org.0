Return-Path: <linux-aspeed+bounces-1015-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C40CA6621C
	for <lists+linux-aspeed@lfdr.de>; Mon, 17 Mar 2025 23:56:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZGr1W5Qbcz2yqQ;
	Tue, 18 Mar 2025 09:56:15 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2011::723" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742203714;
	cv=pass; b=OCwKgUH10mFBZxzZnW31iliB8JHRnUKBSQkAatLXhomGXSeUDAdMaCcgFhV3KtZ6rYZ4qwR9PxkN453rQu3jyBBwUgZ1J3zHLiGy+pypIcjEk6IaEe+97jqtKoPdeFie2Mkyws5lW9t3odwcsYe/WI9wLyhn1jLpYpuj4EVO0EOtng3FQq8npPG2lZaFV9NUzykOQeY0/1jNJqEZbHSiujUjw+jPodjuaZnV6AHBiw9iwXtVUJDiGBYWU8IKbFM4nLRdRELaV0WyCCDPziMMzqptzF2CO3SSegTkwRdZ1nnQlVs33jUodENhyXkNTqbQ9F4TV7TgFXIvGZ5lV9Ysog==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742203714; c=relaxed/relaxed;
	bh=P78rIANl55XJcI13I31SoMPmQvTgvmgZvQNjFAaSXek=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Qh+ZpIoYhpkrY3HB8MWJJPYH0FnzBHYKlRveDe373Svi43uDgtqam7GVv4yxaz2goPOGgoMlx9uJZPR5+fje4fZqEBXFCEwcQDu3T8ws4Ql+TI3P/TXXbszjqWyTrcivY1LzsRDgIxl4OZu9q8It3jPNWXuwZFnJ/FSY5kc5lkcUAC/Fid9rx4GQ/IojjnORTlbP0OA+P/nwomSYMvkmd6VWNAvRx8N3LQjcVJl969W8pP/BUUpcKhaH08fSlsQjw13NABNcq414pZ/OjT1ExqsxttgvDDitr1qjJomMdt9Eypo+hiIicEYv5wKTzwiHK+jxqqUhxnU9iYY3L60PbA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=jSLGieOe; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2011::723; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=jSLGieOe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:2011::723; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20723.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::723])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZGV5Z09Xnz2ygD
	for <linux-aspeed@lists.ozlabs.org>; Mon, 17 Mar 2025 20:28:33 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jgjQwxPPC6vDfIkhGdFZZDmyY7wgJN2WBGJMVcAC09WPXCdo1BnCnJGvE5jrTUFa9bftKpAN43eBTSqV0tmvxA4d6Ckw+pZ58mhecMhzAnEY5pvx+kHveLOsLcWUX0NvTqECnjA19ZC02QoR8FJ6NlvFOoW8DZUKLPi1rrRqOIkT45HS+z+FBqSOiIl5yPFYrKnzoC7ysU15B10etabzQGfUHIbJe2Dc3egtZrUeHSeyLHc978uD54lMzGuwn9X7F/HuCOhtySONn6NpWxJTvg+BwU5JQOpvjRVy8T3ieHROTX9WZhh+PubopU8HhRvFRNaPeG9nOoUro3NxwZny/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P78rIANl55XJcI13I31SoMPmQvTgvmgZvQNjFAaSXek=;
 b=joJnfcPbs1aEqEutCxtNziRjFStU9xj3wlWghmS69dQV2L49Wly49T0Qyd06a1T8aj7u/GZEn43+122Ai68gQ4MNSJtoMJk4/UlhalZU6WCjpSlMgBpKA+0gPNCR+qCSn5ohIyRM608rURMPgSVFUa3Z11p23kSd/R3QcGmm7Hsrn1DJ6/Yo5kzo1H1YEd2cCAj3RmAVs8jRdAGJ++9G66s+Af5JocZEfby3ULHa5cxRem/4LoD4yF6c+b3BCZxKgd+rbeCf1QiJwYqMEK1AOXeUpZ7HTBTQGGBO48hfEP08KE7M/GC85NcgSK/W38L+o/44Wl60fAL+WK4BDVMVLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P78rIANl55XJcI13I31SoMPmQvTgvmgZvQNjFAaSXek=;
 b=jSLGieOe+9bJdSabaiqYr3dma3X11CsmmOBaPVX3IeZ7YieyW5w90w0Nf66S9hZ+uRBAHz1XohbKX+AeufAXnXKCCwHU2hY1D9/8KdRcabfIPAFx9ODIIsExwYL7GM9gM97ZsghGB1EzylgKniU6ARLyjCHgMvrh8ZsrKSYYukDb5GPOfo0H5RAtzCfkyvC2WXp9RAB5U664NBd8A+9bqJSXmK7lL43zMdzyrwgSXoP5o7XqMzyEqXML0voLt5A+LpnVcUR3k5jl7dK1gtdUzqeOWy6RGWxcnG4p8J5daObHijTuhgAc/uVJtYa449GP9dk0xx1oP6ij27emx3sRPg==
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com (2603:1096:101:5a::12)
 by SEYPR06MB6824.apcprd06.prod.outlook.com (2603:1096:101:1a4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 09:28:12 +0000
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28]) by SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28%4]) with mapi id 15.20.8511.028; Mon, 17 Mar 2025
 09:28:12 +0000
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
CC: "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "davem@davemloft.net"
	<davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"joel@jms.id.au" <joel@jms.id.au>, "andrew@codeconstruct.com.au"
	<andrew@codeconstruct.com.au>, "ratbert@faraday-tech.com"
	<ratbert@faraday-tech.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, BMC-SW <BMC-SW@aspeedtech.com>
Subject:
 =?big5?B?pl7C0DogW25ldC1uZXh0IDQvNF0gbmV0OiBmdGdtYWMxMDA6IGFkZCBSR01JSSBk?=
 =?big5?Q?elay_for_AST2600?=
Thread-Topic: [net-next 4/4] net: ftgmac100: add RGMII delay for AST2600
Thread-Index: AQHbluibt/La9I2bwU+d8Trs1O9LmLN3Bk6AgAAF1lA=
Date: Mon, 17 Mar 2025 09:28:12 +0000
Message-ID:
 <SEYPR06MB51346129A2D6A5BD1753C4D39DDF2@SEYPR06MB5134.apcprd06.prod.outlook.com>
References: <20250317025922.1526937-1-jacky_chou@aspeedtech.com>
	<20250317025922.1526937-5-jacky_chou@aspeedtech.com>
 <20250317095229.6f8754dd@fedora.home>
In-Reply-To: <20250317095229.6f8754dd@fedora.home>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB5134:EE_|SEYPR06MB6824:EE_
x-ms-office365-filtering-correlation-id: 55e60876-511b-4864-9771-08dd653609e6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?big5?B?TVd1cHMzV2RHaE03b25KN1hZR2hFRUI1SFBubytPdVBUVldtRXZFTEdIM1lPV0ZI?=
 =?big5?B?dFdScUNnQm1mZldIME92MUpZQkZWQklrbC9XZGtBN3VKSjZ6RlMxZEQzM2hjVDJN?=
 =?big5?B?ck5VbzNvZkwxRFZMWS9MUG4wNXAybFZmNTdpU0hhbUVkWE5lcVNZbEZCc2IvdThN?=
 =?big5?B?a2w0ZVZYb0orVkY5dURjcXdqa3h0SEM0YWxyUUZlOFMyczVEMHZKdXJnL09NNStN?=
 =?big5?B?dTJuaEFlMjhZd1NLNWFhVHRGK0dNUzVlTURWaGNwSGhvSmZjRkpsa1FvU0lnRWJ5?=
 =?big5?B?SHRoZEF2TDFCc3hhZzFxT1F3cmp1Ukt5ZDYzZVg1eHMwcTFDQ3BMMG5kOTQzVkN6?=
 =?big5?B?dXlmUHM0NDBXU1ZaZGVBNGZSQThZWENTL0Z6NzFpSEgvemgwK2RDQmUyaFBoS0U5?=
 =?big5?B?eE8wVC92dnYwYnJxd3JxMFNoWGlOZUdSNkJzaXRuTktYd1c0Tm9yQU1hL2pIbFN5?=
 =?big5?B?dkpBa2E2clJyMC9XWEV3czNBUFpTUHU5TVllQ2NtUnNqN09YUnNaYk1ncCtDMk4x?=
 =?big5?B?eWxpV3FXSkZoWTNMK1MwbUNHbmloY0lVS2dkei82L1k1eU41VS9oc0UrY3Y4SG1F?=
 =?big5?B?bkJVczhHK3lDRUZudXRIOWw2OW00MFpUMUVDL0lhbHI5Q1Y5UWxlTE40Y2JQYXc2?=
 =?big5?B?NmpxY3d1MTE1blFmeEpPb0E2S1BNK2NKZjV4RTFKd2JjUEJUS2V2aGo0UmRqdDRt?=
 =?big5?B?MU41emxVampPNlgzd2NpaDRoMysrQ1lwVWcwVzJ2MVFpMHcvYlUzMzNZcmdLUDdE?=
 =?big5?B?SU03WjU5Y0I0cHZoNjYxanJpRHQydFdMQi9IdGo5VFR6MlVvSmFwU09haFcwZm9R?=
 =?big5?B?VFIzUXMwRjVJU1hLeDZnZ3BiWWxtekNkYUdDQ0JGaXg3Ykc3ZUp4d2FGWkpUakdG?=
 =?big5?B?TGZNUFlhRithMFRjTnRwOXdLbForVGp4SlpKTTU0WXpxbTU3SWovMjFSVEtoV3Vv?=
 =?big5?B?ZlJSZ21hY1ZJT3lOQk8xVFVLMnV2WVFiWUU1akFUL1BueVZleE4ydzNuMUc1WFZW?=
 =?big5?B?QndLK0lWNmVkUDNnZnNPNFBsQUhJdkF4Q1E2dmdieFp2WjdVWktwM2RYanZJSnVl?=
 =?big5?B?UVplS2htNGxaNUZZU0J5azVvN2NWZEFxM2NlSU5hQmRUS2YzcG9kWTVsa0JONzZO?=
 =?big5?B?bkFXOGdidEtQME9FUm1Za3VaQmRBaDl2VElITmd0Vy9rYUlsY3FSd3hsaEt4bE16?=
 =?big5?B?R0twM2VmOHBIMFhTS3hZRFMyYkJCdG8yRGcvak9GeWlPZjQ4SklERFZGU1dUZkIx?=
 =?big5?B?QVMzMEVxYzA4NFdhaDYzTGI4VEZKaHJIR1Z6ZG9KMk90QzExYnFWclJFQjQ3MEx2?=
 =?big5?B?dDN3T3hKVmZFZVRIbU9WZDBOODJnQVZ1NEF5Y0xYaCtzMWRLYmdyT3oxTmM0TmZJ?=
 =?big5?B?SnR6Ump1VEx1SUEyT09KUnVtZDZRdWlqQWV3V0lsbDd4NzJoYm1zSktHUWRkbE92?=
 =?big5?B?SmNKMGE3L0pNU0pkSW9jMUF2T1AxQkQyemZxK1FrbFMwaUtTd29LS2hURVFNZG56?=
 =?big5?B?YzB6a2Fta2lzM1Y5TzIyS2taMUtIUnF3Yy9jT1AySktJL0l4UEJmM0dKSkZ0YVho?=
 =?big5?B?TzNFNGlPR0h2eEgwWmtkL21pQWV1UTNCbm9HWGlvaWhiaW1PeHZmYjhMck0zMDN3?=
 =?big5?B?UEwxZGZ6V1Ywc0xHYjlpeVNQTENNbGJCN1Z5SVZsOWxmZUFPWGF1K2Jpc3J5dWlS?=
 =?big5?B?UVN4TGM3Wnc3VS9HUm1tY09VTW5qUGN4dzdRSTUwS3cwOGV1Y1FzSno1NXlwNTdM?=
 =?big5?B?NkJhczMyTUorUFRXbWFQT3FvcXkybkVNV0dZcGJEYWRnQVdNOWc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB5134.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?big5?B?bjZTMlNpc3NuT0FXZU8wSEFJOEo2NEc0UHdiOXAwQ3gvQ0UzUDY0M0VvRHpvTHBD?=
 =?big5?B?ODZGYUxwVTQ0RXc0WmkyZVhvb3VOcmlLMGY0U0RXYVJRUnlOcDVveHRsYjJkaDE4?=
 =?big5?B?Zmt5WGwxTnFLd3lzU3lrNFMzd0l6U0c1bC85QW5SZ3pxcE14YUpoWC9ZQTdGSXli?=
 =?big5?B?NGFTZk1pQ2hHS1JybVVjbWdmWHRLbWh0eGRxQUlDRU80MTg5dThqM0Fia0hwRk1D?=
 =?big5?B?WWU0bTRQWmNQOWhWWFNKMXJ6ODhtUnkwRlMrRGZmWDMvaVhFL2ZNYk1nWlV3dTRr?=
 =?big5?B?N2ZPUUlFWjVKRldBb0IrRHFFM2c4RElLSGhiWlA2QkJkUjdQSllmakVPVDNSUk5p?=
 =?big5?B?MVUrVmpUUWtsaUVYemxqcVZPcU5DNTh1U2wvOXBZblBxRktCQVFCdjdCWFhyT212?=
 =?big5?B?NTA5SnpMcjQ4ckhUOUE0Y3dzUUN6MitYYnNuU1dSODFhbkJabmdZK3ZjcDlUdUQ1?=
 =?big5?B?VVRJMzVLdEJYUjA4bGlwdzNoRkUzLzdjYkxBWm5Jc05iMVRSWHhpRXhYNlA0aW4r?=
 =?big5?B?UXpnWXpTd3VPcytERllyUWZuWU5EMHZsUFZNbnpuVUpxWEZ0T1c1bUV2Zk9GK2xh?=
 =?big5?B?aG5CT0FaUEM1cjFRZkVrRU91aGxWWmdhdWFUMDQ5ZGthUVRmL0tGRFFmd01hV0RX?=
 =?big5?B?Z0pObEV6aUIzTnp4WUhZUk5rbm44MVRrU3hSYk4xNWV0dmxnN0M0aTNuK2hZL1Ft?=
 =?big5?B?MUZlM0VwSkZwd21HelNzeGNVL3BtakhYaWViQ2Vra0Y0WUtZWW02OXFDOXNXb0Zm?=
 =?big5?B?T1Y3c0NsSDU4d2YvVFBwalBqR0NNdVc3cVZVQlBUUzEzQ0s4WFRwdDMzWHE5MnFI?=
 =?big5?B?SWlTcVVmUlNWSVM5MU8xRGZiSHlhbkNmTEtRQXFOT3ZYMTQyeGNBckptY295V0NB?=
 =?big5?B?MlFLZTBTY2J3M0w2cHRPdG8veWNrZWtwNTVkVnJpY05kYkxvRnh1WUlJdjFqT0xP?=
 =?big5?B?RzFtQll3N2FYVWNxK2FmTGREZzk0UDdDQjZXN3E0OTN1bEtXNHJ0T0Y4Rit2akNi?=
 =?big5?B?dFFVZDlJV1JMeDZpRFYrc000RVFUMVJhQWxZaEIxZUJwcTdnMGowN2poTWFORWtv?=
 =?big5?B?cURZOTNNcFJkeWU3UE5IeE9Nd1VOVy9KaGlhTzRvYXVJN0hDYXc1Uzd3c0lyWWxu?=
 =?big5?B?aVplSkhOb2FIRnRuUk40M2FxeEw3RHN0VStZdDZka2wrQmNYM2JHcW1UQVRDVnk2?=
 =?big5?B?K1lrdVk4UTc4K1hDQlVSYmJpR1l0cmdlZEdPK2lyN1pGZmpaS1lPYllEQkIzeHUy?=
 =?big5?B?cVluRW1DOHVQcW44b294akJFNG0rNGJMb1dxNFRmZ1RQdDlRcDhMTUNuM0tNQkgz?=
 =?big5?B?OG5paFJDTUdUNmZpRFRLN1U5YytINHcwbk9TSjhvZVRPdWlOYi9FbEM2NDcvTWll?=
 =?big5?B?YWVTQzcreHVVd2FyU1FsTzkxNG90VmZ1anJVU2p2dCtWVWJTZXlGNmZZdXB1bFZH?=
 =?big5?B?TjNwbUdwZm9zRC9NMkR0WGdFWGVGY3gxWmtuUlNiM3k3cWt2WUJkZVB1UGdsWDJh?=
 =?big5?B?aWRydStyVnRINFBtdFFJNDVDSVl4QU45ZEkveExQR0REbTFjWFFGMlFHZWhYL1VH?=
 =?big5?B?SWxJWTQvbXBwd0d6akJYR1ZYZE5EYzcrYnpnZlVURUV4Zk9nbmFidjNXWDFwbHVY?=
 =?big5?B?S2tTaERneDZOVzBIVlpNdGxyWVh0N1hwSjEyMnU3cm9odnZ2QllxNGZOSW9jWFQ2?=
 =?big5?B?cEQ5UTcvbnkyazA2SVFSN2tPbHdlcXhnTnR2SmYvNU9zL3grR1VGL09iL1pFV3p0?=
 =?big5?B?TFM0VElBSGxUUGRlMXNXcmVFaWxGRW9LZEtNZUM2cWZCSkRZYVpUNmx6QUd4alBN?=
 =?big5?B?bmlseEhraE81Mk1Hb0VxOEF1Q1lzUnk1S2ZpcURQK1UzNWF1VDZSVEM2Z2IvZkNR?=
 =?big5?B?UWxPTGpHY20va3ViUHZGK1JIVlJGNFNTWGM3Rmk4cHV3WTduZHNYWG90S3M1a2w2?=
 =?big5?B?Q2trVUZVM0ZlOTRndEpvc1oxMnk0SXdpRmdSWkFobFNWV3pGUktxbWJ0T2NwQU5Q?=
 =?big5?Q?6scBgYQVpkh4y4LK?=
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
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
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR06MB5134.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55e60876-511b-4864-9771-08dd653609e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2025 09:28:12.4853
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qTqru8PaIJbjjTt7r37lrGiFUeIR1zksYyXv9OTaVy1Yjtqke5VMZjSc6o+TuhhKtt1Lyt0ksk0KILXhlOH2+0TCqxqfg4ZD4Rf/ThcTm6M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6824
X-Spam-Status: No, score=-0.3 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

PiA+ICtzdGF0aWMgdm9pZCBmdGdtYWMxMDBfc2V0X2ludGVybmFsX2RlbGF5KHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UNCj4gPiArKnBkZXYpIHsNCj4gPiArCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAg
PSBwZGV2LT5kZXYub2Zfbm9kZTsNCj4gPiArCXN0cnVjdCBuZXRfZGV2aWNlICpuZXRkZXY7DQo+
ID4gKwlzdHJ1Y3QgZnRnbWFjMTAwICpwcml2Ow0KPiA+ICsJc3RydWN0IHJlZ21hcCAqc2N1Ow0K
PiA+ICsJdTMyIHJnbWlpX3R4X2RlbGF5LCByZ21paV9yeF9kZWxheTsNCj4gPiArCXUzMiBkbHlf
cmVnLCB0eF9kbHlfbWFzaywgcnhfZGx5X21hc2s7DQo+ID4gKwlpbnQgdHgsIHJ4Ow0KPiANCj4g
UGxlYXNlIHVzZSB0aGUgcmV2ZXJzZSBjaHJpc3RtYXMgdHJlZSBub3RhdGlvbiwgc29ydGluZyBk
ZWNsYXJhdGlvbnMgYnkNCj4gZGVzY2VuZGluZyBsaW5lIGxlbmd0aA0KDQpHb3QgaXQuIEkgd2ls
bCBtb2RpZnkgdGhlc2UgaW4gbmV4dCB2ZXJzaW9uLg0KDQo+ID4gKwluZXRkZXYgPSBwbGF0Zm9y
bV9nZXRfZHJ2ZGF0YShwZGV2KTsNCj4gPiArCXByaXYgPSBuZXRkZXZfcHJpdihuZXRkZXYpOw0K
PiA+ICsNCj4gPiArCXR4ID0gb2ZfcHJvcGVydHlfcmVhZF91MzIobnAsICJ0eC1pbnRlcm5hbC1k
ZWxheS1wcyIsICZyZ21paV90eF9kZWxheSk7DQo+ID4gKwlyeCA9IG9mX3Byb3BlcnR5X3JlYWRf
dTMyKG5wLCAicngtaW50ZXJuYWwtZGVsYXktcHMiLA0KPiA+ICsmcmdtaWlfcnhfZGVsYXkpOw0K
PiA+ICsNCj4gPiArCWlmIChvZl9kZXZpY2VfaXNfY29tcGF0aWJsZShucCwgImFzcGVlZCxhc3Qy
NjAwLW1hYyIpKSB7DQo+ID4gKwkJLyogQWNjb3JkaW5nIHRvIG1hYyBiYXNlIGFkZHJlc3MgdG8g
Z2V0IG1hYyBpbmRleCAqLw0KPiA+ICsJCXN3aXRjaCAocHJpdi0+cmVzLT5zdGFydCkgew0KPiA+
ICsJCWNhc2UgMHgxZTY2MDAwMDoNCj4gPiArCQkJZGx5X3JlZyA9IEFTVDI2MDBfTUFDMTJfQ0xL
X0RMWTsNCj4gPiArCQkJdHhfZGx5X21hc2sgPSBBU1QyNjAwX01BQzFfVFhfRExZOw0KPiA+ICsJ
CQlyeF9kbHlfbWFzayA9IEFTVDI2MDBfTUFDMV9SWF9ETFk7DQo+ID4gKwkJCXJnbWlpX3R4X2Rl
bGF5ID0gRklFTERfUFJFUChBU1QyNjAwX01BQzFfVFhfRExZLA0KPiByZ21paV90eF9kZWxheSk7
DQo+ID4gKwkJCXJnbWlpX3J4X2RlbGF5ID0gRklFTERfUFJFUChBU1QyNjAwX01BQzFfUlhfRExZ
LA0KPiByZ21paV9yeF9kZWxheSk7DQo+ID4gKwkJCWJyZWFrOw0KPiA+ICsJCWNhc2UgMHgxZTY4
MDAwMDoNCj4gPiArCQkJZGx5X3JlZyA9IEFTVDI2MDBfTUFDMTJfQ0xLX0RMWTsNCj4gPiArCQkJ
dHhfZGx5X21hc2sgPSBBU1QyNjAwX01BQzJfVFhfRExZOw0KPiA+ICsJCQlyeF9kbHlfbWFzayA9
IEFTVDI2MDBfTUFDMl9SWF9ETFk7DQo+ID4gKwkJCXJnbWlpX3R4X2RlbGF5ID0gRklFTERfUFJF
UChBU1QyNjAwX01BQzJfVFhfRExZLA0KPiByZ21paV90eF9kZWxheSk7DQo+ID4gKwkJCXJnbWlp
X3J4X2RlbGF5ID0gRklFTERfUFJFUChBU1QyNjAwX01BQzJfUlhfRExZLA0KPiByZ21paV9yeF9k
ZWxheSk7DQo+ID4gKwkJCWJyZWFrOw0KPiA+ICsJCWNhc2UgMHgxZTY3MDAwMDoNCj4gPiArCQkJ
ZGx5X3JlZyA9IEFTVDI2MDBfTUFDMzRfQ0xLX0RMWTsNCj4gPiArCQkJdHhfZGx5X21hc2sgPSBB
U1QyNjAwX01BQzNfVFhfRExZOw0KPiA+ICsJCQlyeF9kbHlfbWFzayA9IEFTVDI2MDBfTUFDM19S
WF9ETFk7DQo+ID4gKwkJCXJnbWlpX3R4X2RlbGF5ID0gRklFTERfUFJFUChBU1QyNjAwX01BQzNf
VFhfRExZLA0KPiByZ21paV90eF9kZWxheSk7DQo+ID4gKwkJCXJnbWlpX3J4X2RlbGF5ID0gRklF
TERfUFJFUChBU1QyNjAwX01BQzNfUlhfRExZLA0KPiByZ21paV9yeF9kZWxheSk7DQo+ID4gKwkJ
CWJyZWFrOw0KPiA+ICsJCWNhc2UgMHgxZTY5MDAwMDoNCj4gPiArCQkJZGx5X3JlZyA9IEFTVDI2
MDBfTUFDMzRfQ0xLX0RMWTsNCj4gPiArCQkJdHhfZGx5X21hc2sgPSBBU1QyNjAwX01BQzRfVFhf
RExZOw0KPiA+ICsJCQlyeF9kbHlfbWFzayA9IEFTVDI2MDBfTUFDNF9SWF9ETFk7DQo+ID4gKwkJ
CXJnbWlpX3R4X2RlbGF5ID0gRklFTERfUFJFUChBU1QyNjAwX01BQzRfVFhfRExZLA0KPiByZ21p
aV90eF9kZWxheSk7DQo+ID4gKwkJCXJnbWlpX3J4X2RlbGF5ID0gRklFTERfUFJFUChBU1QyNjAw
X01BQzRfUlhfRExZLA0KPiByZ21paV9yeF9kZWxheSk7DQo+ID4gKwkJCWJyZWFrOw0KPiA+ICsJ
CWRlZmF1bHQ6DQo+ID4gKwkJCWRldl93YXJuKCZwZGV2LT5kZXYsICJJbnZhbGlkIG1hYyBiYXNl
IGFkZHJlc3MiKTsNCj4gPiArCQkJcmV0dXJuOw0KPiANCj4gVGhlcmUgaGFzIHRvIGJlIGEgYmV0
dGVyIHdheSB0aGF0IGRpcmVjdGx5IGxvb2tpbmcgdXAgdGhlIGJhc2UgYWRkcmVzcy4NCj4gTWF5
YmUgeW91IG5lZWQgYW4gZXh0cmEgRFQgcHJvcGVydHkgPw0KDQpJIHVzZSB0aGUgYmFzZSBhZGRy
ZXNzIHRvIGlkZW50aWZ5IHRoZSBNQUMgaW5kZXggYmVjYXVzZSBpdCBpcyB0aGUgb25seSBmaXhl
ZCB2YWx1ZSANCnRoYXQgaXMgcGFpcmVkIHdpdGggdGhlIE1BQy4NCklmIEkgY3JlYXRlIGEgcHJv
cGVydHkgdG8gaWRlbnRpZnkgdGhlIE1BQyBpbmRleCBhbmQgc29tZW9uZSB1c2UgdGhlIHdyb25n
IHZhbHVlLCANCnRoZSBkcml2ZXIgd2lsbCBjb25maWd1cmUgdGhlIHdyb25nIHJlZ2lzdGVyIGZp
ZWxkLg0KVGhlcmVmb3JlLCBJIHVzZSB0aGUgYmFzZSBhZGRyZXNzIGFzIE1BQyBpbmRleCwgYW5k
IGl0IGlzIHZlcnkgY2xlYXIgd2hpY2ggTUFDIGlzIA0KY29uZmlndXJlZC4NCg0KPiANCj4gPiAr
CQl9DQo+ID4gKwl9IGVsc2Ugew0KPiA+ICsJCXJldHVybjsNCj4gPiArCX0NCj4gPiArDQo+ID4g
KwlzY3UgPSBzeXNjb25fcmVnbWFwX2xvb2t1cF9ieV9waGFuZGxlKG5wLCAic2N1Iik7DQo+ID4g
KwlpZiAoSVNfRVJSKHNjdSkpIHsNCj4gPiArCQlkZXZfd2FybigmcGRldi0+ZGV2LCAiZmFpbGVk
IHRvIG1hcCBzY3UgYmFzZSIpOw0KPiA+ICsJCXJldHVybjsNCj4gPiArCX0NCj4gPiArDQo+ID4g
KwlpZiAoIXR4KSB7DQo+ID4gKwkJLyogVXNlIHR4LWludGVybmFsLWRlbGF5LXBzIGFzIGluZGV4
IHRvIGNvbmZpZ3VyZSB0eCBkZWxheQ0KPiA+ICsJCSAqIGludG8gc2N1IHJlZ2lzdGVyLg0KPiA+
ICsJCSAqLw0KPiANCj4gU28gdGhpcyBnb2VzIGNvbXBsZXRlbHkgYWdhaW5zdCB0aGUgbmFtaW5n
IG9mIHRoZSBwcm9wZXJ0eS4gSXQgaGFzIHRoZSAtcHMgc3VmZml4LA0KPiBzbyB5b3Ugd291bGQg
ZXhwZWN0IHRvIGhhdmUgcGljb3NlY29uZHMgdmFsdWVzIHBhc3NlZCwgYW5kIG5vdCBhbiBhcmJp
cmF0eQ0KPiBpbmRleC4NCj4gDQo+IFRha2UgYSBsb29rIGF0IG90aGVyIGRyaXZlcnMsIHlvdSBz
aG91bGQgYWNjZXB0IHBpY3NlY29uZHMgdmFsdWVzIGZyb20gdGhlc2UNCj4gcHJvcGVydGllcywg
dGhlbiBjb21wdXRlIHRoZSByZWxldmFudCBpbmRleCBpbiB0aGUgZHJpdmVyLiBUaGF0IGluZGV4
IHNob3VsZCBiZQ0KPiBzb21ldGhpbmcgaW50ZXJuYWwgdG8geW91ciBkcml2ZXIuDQo+IA0KPiBB
biBleGFtcGxlIGhlcmUgOg0KPiANCj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgv
djYuMTQtcmM2L3NvdXJjZS9kcml2ZXJzL25ldC9ldGhlcm5ldC9taWNyb2NoaQ0KPiBwL3NwYXJ4
NS9sYW45Njl4L2xhbjk2OXhfcmdtaWkuYyNMNTENCj4gDQoNCkFncmVlZC4gVGhhbmsgeW91IGZv
ciB5b3VyIGluZm9ybWF0aW9uLg0KSSB3aWxsIGFkanVzdCB0aGlzIHBhcnQgdG8gdXNlIHBzIHVu
aXQgdG8gdHJhbnNsYXRlIHRvIHRoZSByZWxldmFudCBpbmRleCBpbiBuZXh0IHZlcnNpb24uDQoN
CkphY2t5DQo=

