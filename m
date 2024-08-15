Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC41957A10
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:59:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqL616Vdz3vkv
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:58:22 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=I3A96dBO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feae::702; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=kevin_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20702.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::702])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WkvPN3yPmz2yQJ
	for <linux-aspeed@lists.ozlabs.org>; Thu, 15 Aug 2024 15:51:04 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IS5ryUmp1h9x5txfkhtSn559JwUsj1xP74LqkT6rmSqCMUfbE1WjqKb3QcwCRtwgNQ9lsi0jAqj0AwoC77XnNIvE8v76mlK6EcL3mEI1GtqnUQuw6ABOhxdj9AW9ZwUFbcSR8n/G3dwlzvct9GCgNPxWbnBzcXL+Qlh3mbAHvU1+H4enKcT+sV5koB1yEWMS58qj6Jhb2r3QZ4zW8/mZ23MYMQIzLimiidwvghn58rsUCTCdy6Gq0bTPM7y2rd2DELNUCQOId9k8aqRn/nLmq2QUJqitwzpWvvGOHHfI9RHV4Mkld72mSNoDodx9z8ebLf6zpN+E2QxxjoJQHSOwrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=09G/w6tGfhhcVevLCPaunD3UfBWyMmtA9PW7fw5VQK8=;
 b=nqh98NWijGsgI72nTAxAUak/pXnJ4OQEPGhiS89NaYmiPMlOkCvENE6TYn5Aexv84B4mor2DXGHaERLcyEyJo2x1WL6mJuT8yeW+js6z/+0+4JOWvfjiGv5rdZLgOuzC+axPEP4x0FSmRoVYGfVQ/q3J/+ir6Csz7bYzy5/i0ux+YzXLP59YoWAiR1z6ox7TP0kFQZlrlQ/sVHeIM+zxW9xePf773ylIc+anKqDOlSiI9PaN1gPpZqej5Y8BvRXv+9dt/yeUx1gNgQF7/CYLzK7HhcS8pTn6nm5MeZuoPW4aPwIDXcRDzqm3gZV9XsFWBX35Fb56R3UCzD4haWdIAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=09G/w6tGfhhcVevLCPaunD3UfBWyMmtA9PW7fw5VQK8=;
 b=I3A96dBO7qm/WnRHG5nCFvkZR/JTlP1SwQ/gj4gx/0jLAG1QZsW4H2+SUijkEUn85otqXWXg+fFJUXy1CmbMMDz9U8eARXIU4gB7/AxcEo7t8iS0HGbf04QB5WEtcXXuB7AGPp4gX1q03Ad/IXVkf/0pwLcZeTY5Y2ArI3BsvIec+PmOLLwA4vljE8tWcv802jBBsG3ftnc2y/c1Q6OPiJ8uDg1ZDCVDLSbU4Nk4gRjqsDwM7vCLLX2tj3awrosA1bYCau0/oPqLjEWR7HLItj3hILoE5wgkh9Y3Y7TGph3P+72mfAEwS0mwKIMOh2pMUXLZkF1VtAIJtseRFcbswA==
Received: from PSAPR06MB4949.apcprd06.prod.outlook.com (2603:1096:301:ad::9)
 by SEYPR06MB7000.apcprd06.prod.outlook.com (2603:1096:101:1e3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.16; Thu, 15 Aug
 2024 05:50:39 +0000
Received: from PSAPR06MB4949.apcprd06.prod.outlook.com
 ([fe80::7bdd:639a:6b94:37bf]) by PSAPR06MB4949.apcprd06.prod.outlook.com
 ([fe80::7bdd:639a:6b94:37bf%7]) with mapi id 15.20.7875.016; Thu, 15 Aug 2024
 05:50:39 +0000
From: Kevin Chen <kevin_chen@aspeedtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "joel@jms.id.au"
	<joel@jms.id.au>, "andrew@codeconstruct.com.au"
	<andrew@codeconstruct.com.au>, "lee@kernel.org" <lee@kernel.org>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will@kernel.org"
	<will@kernel.org>, "arnd@arndb.de" <arnd@arndb.de>, "olof@lixom.net"
	<olof@lixom.net>, "soc@kernel.org" <soc@kernel.org>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"quic_bjorande@quicinc.com" <quic_bjorande@quicinc.com>,
	"geert+renesas@glider.be" <geert+renesas@glider.be>,
	"dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "neil.armstrong@linaro.org"
	<neil.armstrong@linaro.org>, "m.szyprowski@samsung.com"
	<m.szyprowski@samsung.com>, "nfraprado@collabora.com"
	<nfraprado@collabora.com>, "u-kumar1@ti.com" <u-kumar1@ti.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>
Subject:  =?big5?B?pl7C0DogW1BBVENIIHYxIDA2LzEwXSBkdC1iaW5kaW5nczogYXJtOiBhc3BlZWQ6?=
 =?big5?Q?_Add_aspeed,ast2700-evb_compatible_string?=
Thread-Topic: [PATCH v1 06/10] dt-bindings: arm: aspeed: Add
 aspeed,ast2700-evb compatible string
Thread-Index: AQHa30uNq/e/f5bPiEuBrDgfXf+vPLII244AgB7wUUQ=
Date: Thu, 15 Aug 2024 05:50:39 +0000
Message-ID:  <PSAPR06MB4949967385040FAC98C809D789802@PSAPR06MB4949.apcprd06.prod.outlook.com>
References: <20240726110355.2181563-1-kevin_chen@aspeedtech.com>
 <20240726110355.2181563-7-kevin_chen@aspeedtech.com>
 <371a7c7b-de32-4f97-b4c7-3c0ad0732e1a@kernel.org>
In-Reply-To: <371a7c7b-de32-4f97-b4c7-3c0ad0732e1a@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR06MB4949:EE_|SEYPR06MB7000:EE_
x-ms-office365-filtering-correlation-id: a320b15f-6f85-47d7-7740-08dcbcee3115
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|1800799024|366016|376014|7416014|921020|38070700018;
x-microsoft-antispam-message-info:  =?big5?B?am4xaE1kQjc3dXc4OU95YnUzMHZRRElNZ2NYSks0eWl5UzdKNHhKWll3SnJxUm54?=
 =?big5?B?SS82KzBYak1ERDVaaXlXcThEbWpCV05iYkQyZTF6SXlmZUdETEJ4QjEzbXk0MC9T?=
 =?big5?B?cjNyL2lMaEFOUkR5QS9FVCtSU1BkSjE4R2phaVJzNzl4bk9oKzMzVXFzRTNkbmNv?=
 =?big5?B?V0lDQzZ1RU9nZVhWZFJmeTgxYUd2akR0L1oxVVB3dWN3SUNLUEUxbm43ejQzS3Rh?=
 =?big5?B?NGJ1aENMeXlmQXpDRUlGa3lpcWl5RGwwT2RxOXlmUFdYMFBvaUh4aWFQdVR3ajZT?=
 =?big5?B?SFhqOXR5REQwOWgweUU5QXpDNWFJSzZINDF5UGl1N3hMK29pSnl1SDdKWXJiYVAz?=
 =?big5?B?L1NKamllQnNDcEpBZCsvYlJ6ano4WXJ1d3ByVGxjNVhRMWpma0J1cWpQd283NWxO?=
 =?big5?B?UHpqb1g5U0ZVNGlYcCtGdlhVMVBUdjlFVkNEWDduZXMyL2pnTDBpUWN1WWNpRXBO?=
 =?big5?B?blNaTUFjTXNnQ2pTeFp6WjFkdllORTdBZzdqdkhneWZLbWJvYW9PYmdNWm5pNzVW?=
 =?big5?B?cmJ5YzNTRENyWjdtWkt5b2gvcnZxc0ZMbjhnb3M1QXZDNXJMSzZwMDJ1RnBoVm9V?=
 =?big5?B?ajhDbEtiSC9PSm5sRjlEaTlnaTc4RVZ3TTVITWxPMXhWWDIxam9GOEhkZDZsMXZR?=
 =?big5?B?d2Q1ejJhWmtnZW4yTk5ibWZBVjFjeUxCblFITFdad0xHZXArYWpoT1BCZXFZTUN5?=
 =?big5?B?czJBY3RYMS9qWkE0WC9kTWVQcHV3SjZhbFdIcitCUTFBY1VZQXNGWGRXYjA3RXpU?=
 =?big5?B?L1JOekVLeHYyeExjdmJtU005N09wT09ma0VXWkJCWkxUV0FodG5lZGgwVXQrcFNJ?=
 =?big5?B?ZkpQYnQwNlNhOHE3Zm1kcFFSb3NVMjEydjNuU0VPeXVyVkNUeTR5MDBWUm9ZY0Jq?=
 =?big5?B?cWIxVDlRd1pIQVVWOU5LalNrZmUyT2QwT2MrUDFKVUJDaUFTNVZjQTFJTE5DYTRL?=
 =?big5?B?SGx2ajgzWHV5cTI0VGtHdzFNbS9EdE1Gd01yb3FzTlFlOThOVDdTemdHQmI5dXJt?=
 =?big5?B?bTEwZnowalNSSmI4eU5IMDJwUW1rL0ViaEc5TTdkTE1UdDk0VjBqMGJQams3dW5T?=
 =?big5?B?RnBCRjNBRFBKRkdtRktkL0xYQVYyYWZIR2pDMXQybHRFZGQvcXFDU0NUQnhyQXFy?=
 =?big5?B?VnR0R1pkWC9NRUE3MGVaRjVIcmJqRDJtRVRmd3lqblBsc2lVaXBDbG9sZ001VE9m?=
 =?big5?B?NWdBb29WWjBVQ0dKc2ozQUVNMlVJWGt0a1JObWRRcGY2WWpNeGxIOW41bnliazhw?=
 =?big5?B?RDFIV0tnR3RtbVlsVjJxdU5PNjZBV1pQcW1GaUJBa0tNNnlFWWlWT09EblJpK0V1?=
 =?big5?B?K3BNOVYrQnVmeFFMZmRPbG5DMlFqYUtyUHNSRnZRS3pFaDdMQzA0ZE1zbWZlS294?=
 =?big5?B?Y04xRjBrZVZhWTYwTVo1ZXM0MGQzbWFaaXR4TURJZ1l4MEN6VnZyMUlRc01na1Fw?=
 =?big5?B?UFhvekRnbVlFNTIwOU84VEgxbjRmRDlNYjN2VWw1RE52UzJ6dEwwRStYVkRINFF1?=
 =?big5?B?Nlc1ZnRDQURhNDF0TlgvRGF0M1NEa0JaMHBJNFUraW1JTzVFU1lUN3Avc1FUZXd5?=
 =?big5?B?bFZLWkNheFM0VWxrRk5FYnN6ZGJpTjNNR1gyVlhrT1NySTV0TG9QTkdremNWdjBL?=
 =?big5?B?WUMzWnByMXo2ZlQ5NWRhaDJuSVhrLzRtaG50UVcrbUZUZVd2d3E1cEhRc0liWm9V?=
 =?big5?B?RkNydW4ybTNUOG80S0hQR2YwRGE5eWdWdTFXN0hHTmpwNkJ0cTlXUXNKSWJmU0hp?=
 =?big5?B?d3NXb1ZhYjZkdk9EK3JZdjJxc0FrVmluc3ZydTBvanQrOUdNd2k1cHdxcTdPUVBX?=
 =?big5?Q?cUZHLvRnvYE=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR06MB4949.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?big5?B?cUx3MXVFNmZrRXlCclR2K0s0ZGFucmIzWnNiTUNqWU1OTi9wWDBIZlRGRXRNdy9L?=
 =?big5?B?R2FYZStYY1lONStXNkYrdXRkRGZBeldYVzBiNlVaWmgzdnd2OFFoV3NEMW9aSGx4?=
 =?big5?B?c3k2V1NXaWtqR2JmWWRuNHVoK0lCQWlLcFMxb3NRTW4rZDJvNFBXdkhVOXhyV2FO?=
 =?big5?B?aW44Ujd1REc1WEhPZkwwQXJyVmxwWkRMNW1MWGlSRmRxVWttYVdEQzNxODBVZEdH?=
 =?big5?B?blpURVBiZ0dpWU13cnU0QlhnOXhjcFhyejNwaWJyVlpCemw2dUtSeHFyamJwUnlx?=
 =?big5?B?SkJ2S2p5TjVoa0dsY0J1U0dEZnJFU0l4TVB2cGFiVVVBbTdZS1VEaDlQZXZjL1k5?=
 =?big5?B?dkoyVHRyVGFVMGdsQ0NJTjh6eWJPc2ZwTEFpcVBqQzdaUFllTm8vMnIwbnpkWlN6?=
 =?big5?B?dFhpYkhvdWoxamVwNXZDNkd5K3A1Qmwxd2JGUUsyTUxWclB6dlpZekFyNGw5dTBI?=
 =?big5?B?ZHBwSkp6dnRKZS9OZU5wS0tCcFNsSHZLRjgrMXNnOGV5aCtMVXduZVlhaS80eXRs?=
 =?big5?B?Y2N4UGdlTTRYdnY3K05lNEYraDRJUlJBcFVtcDgzUzdmVjFhcVhBYlBHZm5OWXR0?=
 =?big5?B?Qi9ZemxRTXovWTA0M25qWGRIMTNmUWJvdDZjOFJXZXF3ajhsTDZWaXV2dmIzcWYy?=
 =?big5?B?NzdFYi9SanBTSXM2d295S3dOVFd5SzJBK1FEOWczdEJzb1lOSzYrZHMxelhZbUxJ?=
 =?big5?B?ZmNxb2Vqa3FIYjVZeHIzY2w1QlMvN3lPM1AyREk3RG9UU2tlNHlFUkhPRzg2aTVT?=
 =?big5?B?dUdoRklYRktjUFFWOHdpY2hBZzFoY3hUL2ZwaVVvMzNuOXFrTTk1KzRYcmRZL0NQ?=
 =?big5?B?QzZxL0RZNkU4SnJtcEpEMGFqN2V4UnI0SHFvVk1BN1NvWVVEOTBneU03Vjg0SWE4?=
 =?big5?B?aE5IZ0llSTJlMTkxMDZoRW1NemhaOWpESzFuS1N6bzAxc1dHUEpjbG1jOVFSSWk2?=
 =?big5?B?SXlwWk9LRkhqS1c5dWFCZzJJSVpUR2dKNDFzdnlaNVZwMm5qZUpzdFg3MlVCN0JI?=
 =?big5?B?WEhnV0JPbW5nUVUwaUtzM3V4eFRUWVU2Wm5mTkk4bHZnNzhvcE5MNXQzdFNqS0dl?=
 =?big5?B?dHV4YXJ4MkhMRng0NlNHNXJwSFZzT3V3a0NWbEk3RDY0a2NKVmszM2tpcVZPeW1V?=
 =?big5?B?dXp6anNLMVczTzhMTVJhQm14OGlNSFlmTjluWGN5YTVNNkZYZXZiY3FCSkhTanRa?=
 =?big5?B?M0FjTlVoQkVpTnY2SnRrTnoyd0lZaDU4OXNxcTcxQ0psNlFITWdIeGh4S1JVYzBy?=
 =?big5?B?R0k5ZmhwdzJiWE11cWlVeU13NXdpOTFrVVhuWWFUWjdoTHZDa3FoZmFSR2pTaXNZ?=
 =?big5?B?UWlnWW45SkpFVkt0NUZ2c1lHdDdFU1JrTmNYVlk1Q0JqOXBJY29ScWdPbEhiYzlR?=
 =?big5?B?OXVBd1pzWE5ZTndmaGQxRXZYa2pySjNYdUFGNjlOekJoOTUvS0RaZ1JpeHhhU0VQ?=
 =?big5?B?a3FCamg5UERGdkt3VGZrekNLbTBPTG5wWFRpVkdUVHhCMy85NVU5MmNtSEZCOXR1?=
 =?big5?B?azFkMFpOeTlPS09Xdm9lam1LVWVmN2lqSmhsWitsSHo0VUxMSDR1YVFFaUxUeElK?=
 =?big5?B?TzZzMTRUSkZUZ3ZMNUh3dU1IZDFJZjlVWVdQN0dzWEYwT2FLOG5CZ1lOMFd0bjhu?=
 =?big5?B?OWNwYWNwakh4UDVocVJlQ2t0UU1qVEYxYjRKbnNtY1c4VmlsUjZsYUZBR3FkVlMv?=
 =?big5?B?MXdacitkZk1ZdDhXdzFuemFWcDdtZUtQcHlIeUw2SEFpZDN3U1FXQVQrZFQrc3ZT?=
 =?big5?B?ekp3Um1DQklTeWNsWmh3V1lVdkVFNVJFWkY0RjlMZUc0dEtHVncvWXgxcTFuVDZw?=
 =?big5?B?b0R5NGZqK3d1RFJtMUw0VTIwVVlXQVRYVUhtUmd1OWptSTNHamRreEFWeEhDeDVu?=
 =?big5?B?L3pncDc2YmFhbktKeWVQS0o3YlZWR2hMT0h1NTRuUExsNHVlKzBNU3RBUUZVbmhU?=
 =?big5?B?aTVHZkhTS0QwdXp5azJDT0VkMWJvcE1uaXAwMFpqcm44eDNrOVpuTTFrb0gydFVY?=
 =?big5?Q?IaEeMh/b4UB5Dsmi?=
Content-Type: multipart/alternative;
	boundary="_000_PSAPR06MB4949967385040FAC98C809D789802PSAPR06MB4949apcp_"
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4949.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a320b15f-6f85-47d7-7740-08dcbcee3115
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2024 05:50:39.1225
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: syszVaOUw/S/wCrlkCsTZN8VMbfREQcFPMwty+j8h1dBd+vVaz8dMXGeJxA0rtyUQAnXhjlnO5mTLfuSPqHiH8Jz/US11K7j4eUzgg9vecQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB7000
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

--_000_PSAPR06MB4949967385040FAC98C809D789802PSAPR06MB4949apcp_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGkgS3J6aywNCg0KPj4gLS0tDQo+PiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2FybS9hc3BlZWQvYXNwZWVkLnlhbWwgfCA1ICsrKysrDQo+PiAgMSBmaWxlIGNoYW5nZWQsIDUg
aW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvYXJtL2FzcGVlZC9hc3BlZWQueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9hcm0vYXNwZWVkL2FzcGVlZC55YW1sDQo+PiBpbmRleCA3MWMzMWMwOGE4
YWQuLmIyMTU1MTgxN2Y0NCAxMDA2NDQNCj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9hcm0vYXNwZWVkL2FzcGVlZC55YW1sDQo+PiArKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2FzcGVlZC9hc3BlZWQueWFtbA0KPj4gQEAgLTk5LDQg
Kzk5LDkgQEAgcHJvcGVydGllczoNCj4+ICAgICAgICAgICAgICAgIC0gdWZpc3BhY2UsbmNwbGl0
ZS1ibWMNCj4+ICAgICAgICAgICAgLSBjb25zdDogYXNwZWVkLGFzdDI2MDANCj4+DQo+PiArICAg
ICAgLSBkZXNjcmlwdGlvbjogQVNUMjcwMCBiYXNlZCBib2FyZHMNCj4+ICsgICAgICAgIGl0ZW1z
Og0KPj4gKyAgICAgICAgICAtIGVudW06DQo+PiArICAgICAgICAgICAgICAtIGFzcGVlZCxhc3Qy
NzAwLWV2Yg0KPg0KPk5BSywgdGhpcyBjYW5ub3QgYmUgYWxvbmUuIExvb2sgYXQgYWxsIG90aGVy
IGV4YW1wbGVzLiBXaHkgYXJlIHlvdSBkb2luZw0KPnRoaW5ncyBkaWZmZXJlbnRseT8NCkRpc2Fn
cmVlLCBhc3QyNzAwLWV2YiBpcyA3dGggZ2VuZXJhdGlvbiBJQyBpbiBBU1BFRUQuIEl0IG5vdCBp
biB0aGUgc3ViLXNldCBvZiBBU1QyNDAwL0FTVDI1MDAvQVNUMjYwMCBiYXNlZCBib2FyZHMuDQoN
Ci0tDQpCZXN0IFJlZ2FyZHMsDQpLZXZpbi4gQ2hlbg0KDQoNCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fDQqxSKXzqsw6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9y
Zz4NCrFIpfOk6bTBOiAyMDI0pn43pOsyNqTpIKRVpMggMDc6MTUNCqaspfOqzDogS2V2aW4gQ2hl
biA8a2V2aW5fY2hlbkBhc3BlZWR0ZWNoLmNvbT47IHJvYmhAa2VybmVsLm9yZyA8cm9iaEBrZXJu
ZWwub3JnPjsga3J6aytkdEBrZXJuZWwub3JnIDxrcnprK2R0QGtlcm5lbC5vcmc+OyBjb25vcitk
dEBrZXJuZWwub3JnIDxjb25vcitkdEBrZXJuZWwub3JnPjsgam9lbEBqbXMuaWQuYXUgPGpvZWxA
am1zLmlkLmF1PjsgYW5kcmV3QGNvZGVjb25zdHJ1Y3QuY29tLmF1IDxhbmRyZXdAY29kZWNvbnN0
cnVjdC5jb20uYXU+OyBsZWVAa2VybmVsLm9yZyA8bGVlQGtlcm5lbC5vcmc+OyBjYXRhbGluLm1h
cmluYXNAYXJtLmNvbSA8Y2F0YWxpbi5tYXJpbmFzQGFybS5jb20+OyB3aWxsQGtlcm5lbC5vcmcg
PHdpbGxAa2VybmVsLm9yZz47IGFybmRAYXJuZGIuZGUgPGFybmRAYXJuZGIuZGU+OyBvbG9mQGxp
eG9tLm5ldCA8b2xvZkBsaXhvbS5uZXQ+OyBzb2NAa2VybmVsLm9yZyA8c29jQGtlcm5lbC5vcmc+
OyBtdHVycXVldHRlQGJheWxpYnJlLmNvbSA8bXR1cnF1ZXR0ZUBiYXlsaWJyZS5jb20+OyBzYm95
ZEBrZXJuZWwub3JnIDxzYm95ZEBrZXJuZWwub3JnPjsgcC56YWJlbEBwZW5ndXRyb25peC5kZSA8
cC56YWJlbEBwZW5ndXRyb25peC5kZT47IHF1aWNfYmpvcmFuZGVAcXVpY2luYy5jb20gPHF1aWNf
YmpvcmFuZGVAcXVpY2luYy5jb20+OyBnZWVydCtyZW5lc2FzQGdsaWRlci5iZSA8Z2VlcnQrcmVu
ZXNhc0BnbGlkZXIuYmU+OyBkbWl0cnkuYmFyeXNoa292QGxpbmFyby5vcmcgPGRtaXRyeS5iYXJ5
c2hrb3ZAbGluYXJvLm9yZz47IHNoYXduZ3VvQGtlcm5lbC5vcmcgPHNoYXduZ3VvQGtlcm5lbC5v
cmc+OyBuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3Jn
PjsgbS5zenlwcm93c2tpQHNhbXN1bmcuY29tIDxtLnN6eXByb3dza2lAc2Ftc3VuZy5jb20+OyBu
ZnJhcHJhZG9AY29sbGFib3JhLmNvbSA8bmZyYXByYWRvQGNvbGxhYm9yYS5jb20+OyB1LWt1bWFy
MUB0aS5jb20gPHUta3VtYXIxQHRpLmNvbT47IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnIDxk
ZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZz47IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFk
ZWFkLm9yZyA8bGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnPjsgbGludXgtYXNw
ZWVkQGxpc3RzLm96bGFicy5vcmcgPGxpbnV4LWFzcGVlZEBsaXN0cy5vemxhYnMub3JnPjsgbGlu
dXgta2VybmVsQHZnZXIua2VybmVsLm9yZyA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz47
IGxpbnV4LWNsa0B2Z2VyLmtlcm5lbC5vcmcgPGxpbnV4LWNsa0B2Z2VyLmtlcm5lbC5vcmc+DQql
RKauOiBSZTogW1BBVENIIHYxIDA2LzEwXSBkdC1iaW5kaW5nczogYXJtOiBhc3BlZWQ6IEFkZCBh
c3BlZWQsYXN0MjcwMC1ldmIgY29tcGF0aWJsZSBzdHJpbmcNCg0KT24gMjYvMDcvMjAyNCAxMzow
MywgS2V2aW4gQ2hlbiB3cm90ZToNCj4gLS0tDQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvYXJtL2FzcGVlZC9hc3BlZWQueWFtbCB8IDUgKysrKysNCj4gIDEgZmlsZSBjaGFu
Z2VkLCA1IGluc2VydGlvbnMoKykNCj4NCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9hcm0vYXNwZWVkL2FzcGVlZC55YW1sIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9hc3BlZWQvYXNwZWVkLnlhbWwNCj4gaW5kZXggNzFjMzFj
MDhhOGFkLi5iMjE1NTE4MTdmNDQgMTAwNjQ0DQo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9hcm0vYXNwZWVkL2FzcGVlZC55YW1sDQo+ICsrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYXNwZWVkL2FzcGVlZC55YW1sDQo+IEBAIC05OSw0
ICs5OSw5IEBAIHByb3BlcnRpZXM6DQo+ICAgICAgICAgICAgICAgIC0gdWZpc3BhY2UsbmNwbGl0
ZS1ibWMNCj4gICAgICAgICAgICAtIGNvbnN0OiBhc3BlZWQsYXN0MjYwMA0KPg0KPiArICAgICAg
LSBkZXNjcmlwdGlvbjogQVNUMjcwMCBiYXNlZCBib2FyZHMNCj4gKyAgICAgICAgaXRlbXM6DQo+
ICsgICAgICAgICAgLSBlbnVtOg0KPiArICAgICAgICAgICAgICAtIGFzcGVlZCxhc3QyNzAwLWV2
Yg0KDQpOQUssIHRoaXMgY2Fubm90IGJlIGFsb25lLiBMb29rIGF0IGFsbCBvdGhlciBleGFtcGxl
cy4gV2h5IGFyZSB5b3UgZG9pbmcNCnRoaW5ncyBkaWZmZXJlbnRseT8NCg0KQmVzdCByZWdhcmRz
LA0KS3J6eXN6dG9mDQoNCioqKioqKioqKioqKiogRW1haWwgQ29uZmlkZW50aWFsaXR5IE5vdGlj
ZSAqKioqKioqKioqKioqKioqKioqKg0Kp0uzZMFuqfo6DQqlu6tIpfMoqc6o5Kr+pfMppWmv4KVd
p3S+97FLuOqwVKFBqMOo/Kprq9+rT8VAoUOmcCCleLrdq0Sr/Kl3pKemrKXzqsyhQb3QpUi5caRs
tmyl87Nxqr6lu7lxpGy2bKXzpKe1b7BlqswsIKjDvdCl36dZp1Kwo6W7uXGkbLZspfOkzqjkqv6l
86lNvlC3tKnSprO9xqZMpfOhQ8HCwcKxeqq6plinQCENCg0KRElTQ0xBSU1FUjoNClRoaXMgbWVz
c2FnZSAoYW5kIGFueSBhdHRhY2htZW50cykgbWF5IGNvbnRhaW4gbGVnYWxseSBwcml2aWxlZ2Vk
IGFuZC9vciBvdGhlciBjb25maWRlbnRpYWwgaW5mb3JtYXRpb24uIElmIHlvdSBoYXZlIHJlY2Vp
dmVkIGl0IGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgYnkgcmVwbHkgZS1tYWls
IGFuZCBpbW1lZGlhdGVseSBkZWxldGUgdGhlIGUtbWFpbCBhbmQgYW55IGF0dGFjaG1lbnRzIHdp
dGhvdXQgY29weWluZyBvciBkaXNjbG9zaW5nIHRoZSBjb250ZW50cy4gVGhhbmsgeW91Lg0K

--_000_PSAPR06MB4949967385040FAC98C809D789802PSAPR06MB4949apcp_
Content-Type: text/html; charset="big5"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dbig5">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"margin: 0px; font-family: Aptos, Apt=
os_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-=
size: 11pt; color: rgb(0, 0, 0);">
Hi Krzk,</div>
<div style=3D"margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MS=
FontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0,=
 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"margin: 0px; font-family: Aptos, Apt=
os_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-=
size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; ---</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp;Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 5=
 +++++</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp;1 file changed, 5 insertions(+)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.y=
aml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; index 71c31c08a8ad..b21551817f44 100644</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; --- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml</di=
v>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; +++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml</di=
v>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; @@ -99,4 +99,9 @@ properties:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;- ufispace,=
ncplite-bmc</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;- const: aspeed,ast2600</=
div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp;- description: AST2700 based boards</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp;items:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;- enum:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;- aspeed,ast2700=
-evb</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;NAK, this cannot be alone. Look at all other examples. Why are you doin=
g</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&gt;things differently?</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Disagree, ast2700-evb is 7<sup>th</sup>&nbsp;generation IC in ASPEED. It no=
t in the sub-set of AST2400/AST2500/AST2600 based boards.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
--</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Best Regards,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Kevin. Chen</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><span style=3D"font-family: Calibri, =
sans-serif; font-size: 11pt; color: rgb(0, 0, 0);"><b>=B1H=A5=F3=AA=CC:</b>=
&nbsp;Krzysztof Kozlowski &lt;krzk@kernel.org&gt;<br>
<b>=B1H=A5=F3=A4=E9=B4=C1:</b>&nbsp;2024=A6~7=A4=EB26=A4=E9 =A4U=A4=C8 07:1=
5<br>
<b>=A6=AC=A5=F3=AA=CC:</b>&nbsp;Kevin Chen &lt;kevin_chen@aspeedtech.com&gt=
;; robh@kernel.org &lt;robh@kernel.org&gt;; krzk+dt@kernel.org &lt;krzk+dt@=
kernel.org&gt;; conor+dt@kernel.org &lt;conor+dt@kernel.org&gt;; joel@jms.i=
d.au &lt;joel@jms.id.au&gt;; andrew@codeconstruct.com.au &lt;andrew@codecon=
struct.com.au&gt;;
 lee@kernel.org &lt;lee@kernel.org&gt;; catalin.marinas@arm.com &lt;catalin=
.marinas@arm.com&gt;; will@kernel.org &lt;will@kernel.org&gt;; arnd@arndb.d=
e &lt;arnd@arndb.de&gt;; olof@lixom.net &lt;olof@lixom.net&gt;; soc@kernel.=
org &lt;soc@kernel.org&gt;; mturquette@baylibre.com &lt;mturquette@baylibre=
.com&gt;;
 sboyd@kernel.org &lt;sboyd@kernel.org&gt;; p.zabel@pengutronix.de &lt;p.za=
bel@pengutronix.de&gt;; quic_bjorande@quicinc.com &lt;quic_bjorande@quicinc=
.com&gt;; geert+renesas@glider.be &lt;geert+renesas@glider.be&gt;; dmitry.b=
aryshkov@linaro.org &lt;dmitry.baryshkov@linaro.org&gt;; shawnguo@kernel.or=
g
 &lt;shawnguo@kernel.org&gt;; neil.armstrong@linaro.org &lt;neil.armstrong@=
linaro.org&gt;; m.szyprowski@samsung.com &lt;m.szyprowski@samsung.com&gt;; =
nfraprado@collabora.com &lt;nfraprado@collabora.com&gt;; u-kumar1@ti.com &l=
t;u-kumar1@ti.com&gt;; devicetree@vger.kernel.org &lt;devicetree@vger.kerne=
l.org&gt;;
 linux-arm-kernel@lists.infradead.org &lt;linux-arm-kernel@lists.infradead.=
org&gt;; linux-aspeed@lists.ozlabs.org &lt;linux-aspeed@lists.ozlabs.org&gt=
;; linux-kernel@vger.kernel.org &lt;linux-kernel@vger.kernel.org&gt;; linux=
-clk@vger.kernel.org &lt;linux-clk@vger.kernel.org&gt;<br>
<b>=A5D=A6=AE:</b>&nbsp;Re: [PATCH v1 06/10] dt-bindings: arm: aspeed: Add =
aspeed,ast2700-evb compatible string</span>
<div>&nbsp;</div>
</div>
<div style=3D"font-size: 11pt;">On 26/07/2024 13:03, Kevin Chen wrote:<br>
&gt; ---<br>
&gt;&nbsp; Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 5 +++=
++<br>
&gt;&nbsp; 1 file changed, 5 insertions(+)<br>
&gt;<br>
&gt; diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml =
b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml<br>
&gt; index 71c31c08a8ad..b21551817f44 100644<br>
&gt; --- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml<br>
&gt; +++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml<br>
&gt; @@ -99,4 +99,9 @@ properties:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; - ufispace,ncplite-bmc<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - co=
nst: aspeed,ast2600<br>
&gt;&nbsp;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - description: AST2700 based boards<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; items:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - enum:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; - aspeed,ast2700-evb<br>
<br>
NAK, this cannot be alone. Look at all other examples. Why are you doing<br=
>
things differently?<br>
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

--_000_PSAPR06MB4949967385040FAC98C809D789802PSAPR06MB4949apcp_--
