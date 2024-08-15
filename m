Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24492957A15
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:59:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqL76Gq5z7BbQ
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:58:23 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=oVoyFvPV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feae::729; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=kevin_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20729.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::729])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WkvPP5yGhz2yWK
	for <linux-aspeed@lists.ozlabs.org>; Thu, 15 Aug 2024 15:51:05 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QZDoZFX5olihASMfTtqxNfJYITw+f/WVIdmsvthS5ryVfUCcefhT9AexrmaEw5bRheJrP38JpBvJ3UCS2QnOUbWH6cAN7k7QIDpVKKyeqEahokLf2wQdkm+bW4gx2Rob+qeUrHKDM63LyTXV9BPKjij3OlyV8swOnMwj8bhDLyhFWfr04RXqnVpviD9cn9oohiqziQ85gPNBPYD98Many2Zp1152TFvXBHw798P3bluxtjdXSTzL3MROzxMKXATQHi33gkD4hM0fSrvFVanZcacpUR9obfqPnBkoauMpDed6BPPyKzb2ofT7AeSRY5+V5j+S4xG0zCKuTpMk1S44eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NgDTQGRYGd16HzOwlfnOfYktkklMkTpH0GbNRvXLLlQ=;
 b=ysmXp9Hb5Hsfy00xQy742YUw2S0Tjyc3CccnfNFWt9MTVeHU6/HQsiOBua8RVd2vAIc81Z6VPWeiYF9Vfn29Mv+kYSNlwyO39j6bpNQLl77DQaOXicReUstO7FC/DMVVVEEyUTNFUiLBAgkQAEOw5sk3qb+wFA2QezHS9LPwixpjMQqDkNWKMYncSfxh4q+B3Vz3aSPovU4oS0wyjQHIROSlxKOHmuZR/PVsa6EzVMRTUG1ImYjlA62cIE8nXHsgTax45MB1kPkSdAIacpx1a0+Uege0q9F8p/vvuEvpB5ssbYpLqOOtm7AQefPfCMjKdOMjkiiJNRapWkGfYW7lpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NgDTQGRYGd16HzOwlfnOfYktkklMkTpH0GbNRvXLLlQ=;
 b=oVoyFvPVJkYwD5fiaSXmfwE8yGmhfJfXa3d/raMTPuljucitM3zNK+2tG0yoan/fiba4SvE0J/UH8rtdvXrCxvGwGMY2gqop7auYcG0IquIm2jnP+AycGSail/GIrnqJP9kEg3DwyTJua06B+s4APqns6N//GczIJRX8bOHERy/y21W4/Egb/T4mICLyV4o0k22N8RG9TVQXyGclYxBcdjBh+gQAKj9E243EbLqC2fBKPCocAhaURgMZZmJy3WZud9Uld8E2B8me7jzzYTlvEOFa2WBG+TxjENJYCRyvV3CEMkNOUkuIXR6ZVF7zhCAMCb9JUgaqt3weQNsQjYAEOA==
Received: from PSAPR06MB4949.apcprd06.prod.outlook.com (2603:1096:301:ad::9)
 by SEYPR06MB7000.apcprd06.prod.outlook.com (2603:1096:101:1e3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.16; Thu, 15 Aug
 2024 05:50:20 +0000
Received: from PSAPR06MB4949.apcprd06.prod.outlook.com
 ([fe80::7bdd:639a:6b94:37bf]) by PSAPR06MB4949.apcprd06.prod.outlook.com
 ([fe80::7bdd:639a:6b94:37bf%7]) with mapi id 15.20.7875.016; Thu, 15 Aug 2024
 05:50:20 +0000
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
Subject:  =?big5?B?pl7C0DogW1BBVENIIHYxIDAyLzEwXSBkdC1iaW5kaW5nOiBjbGs6IGFzdDI3MDA6?=
 =?big5?Q?_Add_binding_for_Aspeed_AST27xx_Clock?=
Thread-Topic: [PATCH v1 02/10] dt-binding: clk: ast2700: Add binding for
 Aspeed AST27xx Clock
Thread-Index: AQHa30uIzhKcxQKQN0uLSEZ15MV2a7II2ogAgB7tDRA=
Date: Thu, 15 Aug 2024 05:50:20 +0000
Message-ID:  <PSAPR06MB49495961B7AEDE4AE26F8ED389802@PSAPR06MB4949.apcprd06.prod.outlook.com>
References: <20240726110355.2181563-1-kevin_chen@aspeedtech.com>
 <20240726110355.2181563-3-kevin_chen@aspeedtech.com>
 <e13c16db-e1a7-4ee0-867b-b184d421de7f@kernel.org>
In-Reply-To: <e13c16db-e1a7-4ee0-867b-b184d421de7f@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR06MB4949:EE_|SEYPR06MB7000:EE_
x-ms-office365-filtering-correlation-id: c0ccb5d2-d265-4b8b-5f9b-08dcbcee25f4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|1800799024|366016|376014|7416014|921020|38070700018;
x-microsoft-antispam-message-info:  =?big5?B?QmRHa0o4SzF1U3JERzFWb1VmbmhCWSt6U05PSVJLK1pPUml6eFRXNG53OVNzWDFt?=
 =?big5?B?U2NOQ2Z6RFkzTVpPMGdEclRYMWFweDZGRDVKbkZmWFFQZFVmc2R1cUhaVGwwTGRP?=
 =?big5?B?VERtVTJKVlBMQlFMRXRZTWRZd0dHZWkzdVU5Vk0zU1lPYWp2VzBVd2d1N3FHOUVv?=
 =?big5?B?M0E5VFZHVTBIdjJ6NEdoNUJTYkN6RGNYRHVlYXpQUTR4UUlKVnZ5YjdyQnd5cStp?=
 =?big5?B?dm5ob1JySWhiK1dncWdnUC9nUk1kQzdaZVpLUWl2azkxeUpMR2ZtSlNwd2I0TVBV?=
 =?big5?B?bDViYVlacUhmR1FuOHdLWjRtMk8vdUtmNTFDOEpqZHJHNjd1Vit3bStselJ1d0hZ?=
 =?big5?B?Mks2TFNPSHpiNEhBTHRyN0xYTU5Vc2daN2dKL1dtaUlGR1FiNG4wbGZkbElUOElx?=
 =?big5?B?MnY5WjlmNDZCNGxWVDFaS0FwTjU4elZYWXQrNU1OYTRsTU5lczRCWEZVQ1JSeXBx?=
 =?big5?B?Q1FLU2E4ZFYyRVBEM3FpYnF5RDdtZHJrUVo1WHkvM2ZhcWlYZ3RtM2RtN01Wd2d2?=
 =?big5?B?cCtSOC9YZUsyMW5yQTIyUWwvUTg5YzdxNjVSWG5RMndackdvVHNSS2JPNTVia3Vx?=
 =?big5?B?TnlXYlJENnRuODdLQm9uc1duN1BsdTdHUnJvK0Q4ZnFQVXFwK3RGb2JmdWpORU9C?=
 =?big5?B?OXpobEZscUtQYlV4aTlPTU91cUZSY1VGeTVVUytWQUFVNHlqTWFFb3RTYUxrMHB6?=
 =?big5?B?KzlFUWREWklvcVMwOFp1T2swNHloWkxGRlJ6MjJ1aXVpVEZ1cytjcDR3V1hJclh5?=
 =?big5?B?dFdkUWpGbVZHN1RDYXRlWWJYNVdhTkk0bVE2UzZydEtYZWNlWlpEMHpmUkYrMk83?=
 =?big5?B?UTRkM3hNbFVDdjNBYVZXOXdSVk1PcEFLTnY1dSs5WGQ4OEtITG4xeGtxWGQ2ckIr?=
 =?big5?B?T3BHclZzbnNTUWJLbkxRMEZYc3Y0dlVWQ3lQUVlJT1J0N0tFUVU5UkF0QnB4ajRC?=
 =?big5?B?TTl5T2RQeXJ4VVoyUTlicFNtSmhmR0d4YjNkd1pRaElXeW9LUjR4bmtaRDd5cFpV?=
 =?big5?B?UmFkWHNOR3JSQncxK2Z1dWptb24zVXR2RGo1WThyNGc4R1RVMEE4Y1ZtbS9ZR2Zz?=
 =?big5?B?MXJlQ1cwelI2MlFKYUhFQW5LVGwyeWV0ZTdiMUFpZHVIbFhsVStkQkVvOWYvYXd5?=
 =?big5?B?bnFoZTUrWTZiQytabEdOSW1yNlF0ZkQwcmkzQnV2SExBRTlGRjdCczNnRDJWK1Ev?=
 =?big5?B?ZmNOSHFKUVhRUEtvTURXc1JqNkRuVnBWQXMrcmw3TnhNWHNoRW9iUTFlaEFzaElo?=
 =?big5?B?TWs4Sjd0Y1ZXbHN4T0RyQXVOVEY2VloyK1N3MVFhY3M1a0tVYUtXWWs5SjlYTkQ1?=
 =?big5?B?dWVGRUZhYVhMLzNQbzJZc3luYTM3VjNZUTJGZDNkczBXQ1BKeGEzaFNwZEhCYTY1?=
 =?big5?B?VmpaY0Z4VW50UWVjcW15Nld3RjdBZjFGbi9IUjJsR2ptZ1ZiK0NUVDJQTDFrbnVv?=
 =?big5?B?UGgxdHllcmxaTFVwMlNHellrZEZ6MVhlb0hlVXFlV255TUlMQktZdUQzUm55amhG?=
 =?big5?B?OW1hcHFocktmbEtLL0ZRMDhGUGJUQTRrUm9QZXFUYjcrUXlDakVFR2t0ZkhTa2Qx?=
 =?big5?B?d2IwZkFldlRBY2ZvaEhEcElNQ3k1Q1JUeWpBMVVmOVRxOUNGN3hoWUlZWXBuM2hY?=
 =?big5?B?Y2t1TC8xS3hYbkREM2NvY0xZSHlsZXp5UzN0R0ZRcmlZVjBiZ3RVa1FCRFFRMUdO?=
 =?big5?B?c0F3WDJsMjl6c2Y1SlgweFNXaTNRREhQSDhadEFxOHl3V3hJc3lWNXA3cjJWc1hs?=
 =?big5?Q?e12TKQ1m8vHniITE?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR06MB4949.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?big5?B?OTlzMnNCdU11akk2M3pUdmtKU24yQ1hyK3BqVHU4UkxpZjN0T0Q3V3Fhby9JUVU4?=
 =?big5?B?Uk5jbXhCcUlIQUJYWjgwajdRdTJXcXRSYktmYkZFbldnSUNRY1Yzd29KeWoxVXpO?=
 =?big5?B?NE5PemU2YkJwRkNrZ3AwUkZPdUw5ZzBKNU5McFcweDl3NmU4Vkw0SHQ5LzcvVExX?=
 =?big5?B?VU5vRmkzb04wYklWaEd3a3ZwdWR3bjNMMjk1OU5LVEZYQWdsMWVTUmxrRkJ4aHE1?=
 =?big5?B?NjgwanEybmZ4d3BiOXpvL2R4MDhBSjdTSnpQcmR4NXlvNVIyUzI0NmJVcmxac0ZR?=
 =?big5?B?VDcxZVFmV2Y4ZTVVUXZtbTUxRXhrSjltQmdqTVpwTlhUb3hjTkkwQ1dVTlFCMC9E?=
 =?big5?B?SEdFOEZoOENpZjIvbjByY3E2VnE5TUFZYmZOc1REcWdwTERsVGFPbTNnZjdsTm05?=
 =?big5?B?ZUMxcTQ5K0tXOVFNdUM5SjdIakRqaHArTmV6YVU4RmIxRnlLc1ZOcGVlOU5VdklW?=
 =?big5?B?MklUN3l0T3IrMTBKaUtFcFlEOW9KSHZxZWpzemc5VXVFa2d3N2VuekdpNUVhZ1JI?=
 =?big5?B?d01oZUM4KzFUUkFLWHVWOTRsbHV2dHZyVzhkU0FGaGh2VXFTVUwxeFNyOHJBUUc2?=
 =?big5?B?QnFNRkVidVJqWUp6ZE1lUUpicm80UUkzY29XeC95Yi9wdGMwajF6c0RGQ2JHdHBL?=
 =?big5?B?TXdQeVFjekxrT1dzTUdLVVB6VzdPcXB4UWtTVmg0UVFhaUpSSDdLeFU4RkJOMDh3?=
 =?big5?B?TEl5T1hxTHVRbGRLOTIrZnRlbzZFUjRYZFMrelY4bmIwWk1YRzdWeS9xV0Q3dDBJ?=
 =?big5?B?ak44T2NnUVNjdFNCR3dUS09lcnJmRi9NZmdwbkNlcFAxVUdrUWVXZFVYOWpGdHkr?=
 =?big5?B?NVc0Q3ZWcllpTXNjS2EyVjlnNEx5NHRZbENDY0JMK21VWGtBd20wQW9TSVdWZ1dm?=
 =?big5?B?cWJQc2hlSGZUTDBMQ3pncTVUaTlUQ0l6ZmJSTHl5ZnVnSVBBVGU3aTN1WWNSdVFF?=
 =?big5?B?Wko4RmpUUzNraENBWDV1MXdFTDIzUDBnZ3Z3cjIzcVVYMnp2UXBYS2pKVnR3MmxL?=
 =?big5?B?WTNsS1UwVTYzK3Q2NlpCZ0dINVNSWGNmazRGeU94N1hidkR6USsxK283V0dOQ1pk?=
 =?big5?B?aVlLWjNPajZlTkVWZHlVL1lKT1lVeWJ4YStVK1N1SkZKMHpiNytPbDAzWFhPaXla?=
 =?big5?B?aXNRQ1BsdzFtNXE3bnl2RFd2bWhSNW5hZncrTC8zK2lFN0xDaGI5VEpjNGNCblZU?=
 =?big5?B?YVFRRkd0Lzl2U1JuYy9VV040cWRpYVU3bTNuanBGMjFJMlpTQnRrL0lBcjFIeTIx?=
 =?big5?B?ck9zbG1RemRUN3pKb0IxR2pqdFR4T1NUb2IwNmFCdXk5TlgzSldCd3NheWNXN3ZP?=
 =?big5?B?YUdaYlIwYWJISkFWME92c0lQUFM4Q2xjMzV2b01VaEkxcENtVWR6MStEcFZrMWdU?=
 =?big5?B?TS9ZM080UXRQcWNuQmlxMHgzMVFScndQZXB5MWlRTytiKzBYc1ptMTNEa0ZtZ2Vv?=
 =?big5?B?b0hMdFdYSW4vZk9NZStmRjBwR0p3allCZ0c1RkpOMHRZNUJyazNPUU8zSXI2QzBC?=
 =?big5?B?RVJRdkdBdTY0L2lramEwSFBnRlJoNnFKYlpON3VSdXVaaXFoUGtESk9rZ2c1UlE0?=
 =?big5?B?R0tSVnI0S05ZUFpWUHVqWXZxV0Jncjd1L3gvdk5oNEhkdFZiZGNQN0ZJdi9tbUcw?=
 =?big5?B?TU5vLzJyRWY4MFpCUXlneWpuR0M2N2JNY0plZmZtSjhseXd5eHZzMHNYbmhPLzlL?=
 =?big5?B?a0pqTmJKTUpsQm10NHR6eXkyZC9rTktaSnlWY3FSVzB0Y0trR0pRZkxqeXdoUFZq?=
 =?big5?B?bUQ5SVNrb3l5aDZ4V3MxRERiUUM4N21UM0Ntb1lnK3lKWGZ1eXJqVFNBUk0vRjZO?=
 =?big5?B?RW9laEJsZGhWZWxUUk5PNTNxSktzUkZZUnhzMWpCaStkbjBLVXhpRTNJWXRUc01z?=
 =?big5?B?Ymt5Z2dzNUFIU2hsbWE3RktIZmo5UlhVNjNPR3VpNEJnRHJQc3pJOXlxSHFuamNV?=
 =?big5?B?SFM4dWp4RTl6ZFNWSmlJUzhjeXVQYTY5K29lVmxndkYvV3FVdDJpejF6K0EzOEZM?=
 =?big5?Q?W/mlDFyTG3R1kdQ5?=
Content-Type: multipart/alternative;
	boundary="_000_PSAPR06MB49495961B7AEDE4AE26F8ED389802PSAPR06MB4949apcp_"
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4949.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0ccb5d2-d265-4b8b-5f9b-08dcbcee25f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2024 05:50:20.4404
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oieVhDmGcnOUKEzjfIO+XN0kSBFc7m7whfI8eCR1vPK6t7HtXbk4r8WHDKsEiXP2oHpmRCTXjQoqShXO5g33ZU+lpElVn/PdXHuriBTGUVU=
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

--_000_PSAPR06MB49495961B7AEDE4AE26F8ED389802PSAPR06MB4949apcp_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGkgS3J6aywNCg0KPk1pc3NpbmcgY29tbWl0IG1zZy4NCj4NCj5BIG5pdCwgc3ViamVjdDogZHJv
cCBzZWNvbmQvbGFzdCwgcmVkdW5kYW50ICJiaW5kaW5ncyIuIFRoZQ0KPiJkdC1iaW5kaW5ncyIg
cHJlZml4IGlzIGFscmVhZHkgc3RhdGluZyB0aGF0IHRoZXNlIGFyZSBiaW5kaW5ncy4NCj5TZWUg
YWxzbzoNCj5odHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni43LXJjOC9zb3VyY2Uv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3N1Ym1pdHRpbmctcGF0Y2hlcy5yc3Qj
TDE4DQo+DQo+UGxlYXNlIHVzZSBzdWJqZWN0IHByZWZpeGVzIG1hdGNoaW5nIHRoZSBzdWJzeXN0
ZW0uIFlvdSBjYW4gZ2V0IHRoZW0gZm9yDQo+ZXhhbXBsZSB3aXRoIGBnaXQgbG9nIC0tb25lbGlu
ZSAtLSBESVJFQ1RPUllfT1JfRklMRWAgb24gdGhlIGRpcmVjdG9yeQ0KPnlvdXIgcGF0Y2ggaXMg
dG91Y2hpbmcuIEZvciBiaW5kaW5ncywgdGhlIHByZWZlcnJlZCBzdWJqZWN0cyBhcmUNCj5leHBs
YWluZWQgaGVyZToNCj5odHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL2xhdGVzdC9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3N1Ym1pdHRpbmctcGF0Y2hlcy5odG1sI2ktZm9yLXBhdGNoLXN1Ym1p
dHRlcnMNCkFncmVlLCBhbHJlYWR5IGZpeGVkIGluIGFub3RoZXIgY29tbWl0IGluIFJ5YW4ncyBz
ZXJpZXMuDQpbMy80XSBkdC1iaW5kaW5nczogY2xvY2s6IEFkZCBBU1QyNzAwIGNsb2NrIGJpbmRp
bmdzIC0gUGF0Y2h3b3JrIChrZXJuZWwub3JnKTxodHRwczovL3BhdGNod29yay5rZXJuZWwub3Jn
L3Byb2plY3QvbGludXgtY2xrL3BhdGNoLzIwMjQwODA4MDc1OTM3LjI3NTY3MzMtNC1yeWFuX2No
ZW5AYXNwZWVkdGVjaC5jb20vPg0KDQotLQ0KQmVzdCBSZWdhcmRzLA0KS2V2aW4uIENoZW4NCg0K
DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQqxSKXzqsw6IEtyenlzenRvZiBL
b3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4NCrFIpfOk6bTBOiAyMDI0pn43pOsyNqTpIKRVpMgg
MDc6MTENCqaspfOqzDogS2V2aW4gQ2hlbiA8a2V2aW5fY2hlbkBhc3BlZWR0ZWNoLmNvbT47IHJv
YmhAa2VybmVsLm9yZyA8cm9iaEBrZXJuZWwub3JnPjsga3J6aytkdEBrZXJuZWwub3JnIDxrcnpr
K2R0QGtlcm5lbC5vcmc+OyBjb25vcitkdEBrZXJuZWwub3JnIDxjb25vcitkdEBrZXJuZWwub3Jn
Pjsgam9lbEBqbXMuaWQuYXUgPGpvZWxAam1zLmlkLmF1PjsgYW5kcmV3QGNvZGVjb25zdHJ1Y3Qu
Y29tLmF1IDxhbmRyZXdAY29kZWNvbnN0cnVjdC5jb20uYXU+OyBsZWVAa2VybmVsLm9yZyA8bGVl
QGtlcm5lbC5vcmc+OyBjYXRhbGluLm1hcmluYXNAYXJtLmNvbSA8Y2F0YWxpbi5tYXJpbmFzQGFy
bS5jb20+OyB3aWxsQGtlcm5lbC5vcmcgPHdpbGxAa2VybmVsLm9yZz47IGFybmRAYXJuZGIuZGUg
PGFybmRAYXJuZGIuZGU+OyBvbG9mQGxpeG9tLm5ldCA8b2xvZkBsaXhvbS5uZXQ+OyBzb2NAa2Vy
bmVsLm9yZyA8c29jQGtlcm5lbC5vcmc+OyBtdHVycXVldHRlQGJheWxpYnJlLmNvbSA8bXR1cnF1
ZXR0ZUBiYXlsaWJyZS5jb20+OyBzYm95ZEBrZXJuZWwub3JnIDxzYm95ZEBrZXJuZWwub3JnPjsg
cC56YWJlbEBwZW5ndXRyb25peC5kZSA8cC56YWJlbEBwZW5ndXRyb25peC5kZT47IHF1aWNfYmpv
cmFuZGVAcXVpY2luYy5jb20gPHF1aWNfYmpvcmFuZGVAcXVpY2luYy5jb20+OyBnZWVydCtyZW5l
c2FzQGdsaWRlci5iZSA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+OyBkbWl0cnkuYmFyeXNoa292
QGxpbmFyby5vcmcgPGRtaXRyeS5iYXJ5c2hrb3ZAbGluYXJvLm9yZz47IHNoYXduZ3VvQGtlcm5l
bC5vcmcgPHNoYXduZ3VvQGtlcm5lbC5vcmc+OyBuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnIDxu
ZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPjsgbS5zenlwcm93c2tpQHNhbXN1bmcuY29tIDxtLnN6
eXByb3dza2lAc2Ftc3VuZy5jb20+OyBuZnJhcHJhZG9AY29sbGFib3JhLmNvbSA8bmZyYXByYWRv
QGNvbGxhYm9yYS5jb20+OyB1LWt1bWFyMUB0aS5jb20gPHUta3VtYXIxQHRpLmNvbT47IGRldmlj
ZXRyZWVAdmdlci5rZXJuZWwub3JnIDxkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZz47IGxpbnV4
LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZyA8bGludXgtYXJtLWtlcm5lbEBsaXN0cy5p
bmZyYWRlYWQub3JnPjsgbGludXgtYXNwZWVkQGxpc3RzLm96bGFicy5vcmcgPGxpbnV4LWFzcGVl
ZEBsaXN0cy5vemxhYnMub3JnPjsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZyA8bGludXgt
a2VybmVsQHZnZXIua2VybmVsLm9yZz47IGxpbnV4LWNsa0B2Z2VyLmtlcm5lbC5vcmcgPGxpbnV4
LWNsa0B2Z2VyLmtlcm5lbC5vcmc+DQqlRKauOiBSZTogW1BBVENIIHYxIDAyLzEwXSBkdC1iaW5k
aW5nOiBjbGs6IGFzdDI3MDA6IEFkZCBiaW5kaW5nIGZvciBBc3BlZWQgQVNUMjd4eCBDbG9jaw0K
DQpPbiAyNi8wNy8yMDI0IDEzOjAzLCBLZXZpbiBDaGVuIHdyb3RlOg0KPiBTaWduZWQtb2ZmLWJ5
OiBLZXZpbiBDaGVuIDxrZXZpbl9jaGVuQGFzcGVlZHRlY2guY29tPg0KDQpNaXNzaW5nIGNvbW1p
dCBtc2cuDQoNCkEgbml0LCBzdWJqZWN0OiBkcm9wIHNlY29uZC9sYXN0LCByZWR1bmRhbnQgImJp
bmRpbmdzIi4gVGhlDQoiZHQtYmluZGluZ3MiIHByZWZpeCBpcyBhbHJlYWR5IHN0YXRpbmcgdGhh
dCB0aGVzZSBhcmUgYmluZGluZ3MuDQpTZWUgYWxzbzoNCmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4u
Y29tL2xpbnV4L3Y2LjctcmM4L3NvdXJjZS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3Mvc3VibWl0dGluZy1wYXRjaGVzLnJzdCNMMTgNCg0KUGxlYXNlIHVzZSBzdWJqZWN0IHByZWZp
eGVzIG1hdGNoaW5nIHRoZSBzdWJzeXN0ZW0uIFlvdSBjYW4gZ2V0IHRoZW0gZm9yDQpleGFtcGxl
IHdpdGggYGdpdCBsb2cgLS1vbmVsaW5lIC0tIERJUkVDVE9SWV9PUl9GSUxFYCBvbiB0aGUgZGly
ZWN0b3J5DQp5b3VyIHBhdGNoIGlzIHRvdWNoaW5nLiBGb3IgYmluZGluZ3MsIHRoZSBwcmVmZXJy
ZWQgc3ViamVjdHMgYXJlDQpleHBsYWluZWQgaGVyZToNCmh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcv
ZG9jL2h0bWwvbGF0ZXN0L2RldmljZXRyZWUvYmluZGluZ3Mvc3VibWl0dGluZy1wYXRjaGVzLmh0
bWwjaS1mb3ItcGF0Y2gtc3VibWl0dGVycw0KDQo+IC0tLQ0KPiAgLi4uL2R0LWJpbmRpbmdzL2Ns
b2NrL2FzcGVlZCxhc3QyNzAwLWNsay5oICAgIHwgMTgwICsrKysrKysrKysrKysrKysrKw0KDQpU
aGlzIGlzIHN1cHBvc2VkIHRvIGJlIHBhcnQgb2YgYmluZGluZ3MgYWRkaW5nIHRoZSBjbG9jayBj
b250cm9sbGVyLg0KDQo+ICAxIGZpbGUgY2hhbmdlZCwgMTgwIGluc2VydGlvbnMoKykNCj4gIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL2FzcGVlZCxhc3QyNzAw
LWNsay5oDQo+DQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL2FzcGVl
ZCxhc3QyNzAwLWNsay5oIGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9hc3BlZWQsYXN0Mjcw
MC1jbGsuaA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwMDAuLjVj
YTg1NTAzNzM2ZA0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL2luY2x1ZGUvZHQtYmluZGluZ3Mv
Y2xvY2svYXNwZWVkLGFzdDI3MDAtY2xrLmgNCj4gQEAgLTAsMCArMSwxODAgQEANCj4gKy8qIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkgKi8N
Cj4gKy8qDQo+ICsgKiBEZXZpY2UgVHJlZSBiaW5kaW5nIGNvbnN0YW50cyBmb3IgQVNUMjcwMCBj
bG9jayBjb250cm9sbGVyLg0KPiArICoNCj4gKyAqIENvcHlyaWdodCAoYykgMjAyMyBBc3BlZWQg
VGVjaG5vbG9neSBJbmMuDQo+ICsgKi8NCj4gKw0KPiArI2lmbmRlZiBfX0RUX0JJTkRJTkdTX0NM
T0NLX0FTVDI3MDBfSA0KPiArI2RlZmluZSBfX0RUX0JJTkRJTkdTX0NMT0NLX0FTVDI3MDBfSA0K
PiArDQo+ICsvKiBTT0MwIGNsay1nYXRlICovDQo+ICsjZGVmaW5lIFNDVTBfQ0xLX0dBVEVfTUNM
SyAgICgwKQ0KPiArI2RlZmluZSBTQ1UwX0NMS19HQVRFX0VDTEsgICAoMSkNCg0KRHJvcCBhbGwg
KCkuIE5vdCBuZWVkZWQsIG5vdCB1c2VmdWwuDQoNCj4gKyNkZWZpbmUgU0NVMF9DTEtfR0FURV9H
Q0xLICAgKDIpDQo+ICsjZGVmaW5lIFNDVTBfQ0xLX0dBVEVfVkNMSyAgICgzKQ0KPiArI2RlZmlu
ZSBTQ1UwX0NMS19HQVRFX0JDTEsgICAoNCkNCj4gKyNkZWZpbmUgU0NVMF9DTEtfR0FURV9EMUNM
SyAgKDUpDQo+ICsjZGVmaW5lIFNDVTBfQ0xLX0dBVEVfUkVGQ0xLICg2KQ0KPiArI2RlZmluZSBT
Q1UwX0NMS19HQVRFX1VTQjBDTEsgICAgICAgICg3KQ0KPiArI2RlZmluZSBTQ1UwX0NMS19HQVRF
X1JTVjggICAoOCkNCj4gKyNkZWZpbmUgU0NVMF9DTEtfR0FURV9VU0IxQ0xLICAgICAgICAoOSkN
Cj4gKyNkZWZpbmUgU0NVMF9DTEtfR0FURV9EMkNMSyAgKDEwKQ0KPiArI2RlZmluZSBTQ1UwX0NM
S19HQVRFX1JTVjExICAoMTEpDQo+ICsjZGVmaW5lIFNDVTBfQ0xLX0dBVEVfUlNWMTIgICgxMikN
Cj4gKyNkZWZpbmUgU0NVMF9DTEtfR0FURV9ZQ0xLICAgKDEzKQ0KPiArI2RlZmluZSBTQ1UwX0NM
S19HQVRFX1VTQjJDTEsgICAgICAgICgxNCkNCj4gKyNkZWZpbmUgU0NVMF9DTEtfR0FURV9VQVJU
NENMSyAgICAgICAoMTUpDQo+ICsjZGVmaW5lIFNDVTBfQ0xLX0dBVEVfU0xJQ0xLICgxNikNCj4g
KyNkZWZpbmUgU0NVMF9DTEtfR0FURV9EQUNDTEsgKDE3KQ0KPiArI2RlZmluZSBTQ1UwX0NMS19H
QVRFX0RQICAgICAoMTgpDQo+ICsjZGVmaW5lIFNDVTBfQ0xLX0dBVEVfUlNWMTkgICgxOSkNCj4g
KyNkZWZpbmUgU0NVMF9DTEtfR0FURV9DUlQxQ0xLICAgICAgICAoMjApDQo+ICsjZGVmaW5lIFND
VTBfQ0xLX0dBVEVfQ1JUMkNMSyAgICAgICAgKDIxKQ0KPiArI2RlZmluZSBTQ1UwX0NMS19HQVRF
X1ZMQ0xLICAoMjIpDQo+ICsjZGVmaW5lIFNDVTBfQ0xLX0dBVEVfRUNDQ0xLICgyMykNCj4gKyNk
ZWZpbmUgU0NVMF9DTEtfR0FURV9SU0FDTEsgKDI0KQ0KPiArI2RlZmluZSBTQ1UwX0NMS19HQVRF
X1JWQVMwQ0xLICAgICAgICgyNSkNCj4gKyNkZWZpbmUgU0NVMF9DTEtfR0FURV9VRlNDTEsgKDI2
KQ0KPiArI2RlZmluZSBTQ1UwX0NMS19HQVRFX0VNTUNDTEsgICAgICAgICgyNykNCj4gKyNkZWZp
bmUgU0NVMF9DTEtfR0FURV9SVkFTMUNMSyAgICAgICAoMjgpDQo+ICsvKiByZXNlcnZlZCAyOSB+
IDMxKi8NCg0KSURzIGNhbm5vdCBiZSByZXNlcnZlZC4gSXQgaXMgYSBiaW5kaW5nLCBub3QgYSBo
YXJkd2FyZSBudW1iZXIuDQoNCj4gKyNkZWZpbmUgU09DMF9DTEtfR0FURV9OVU0gICAgKFNDVTBf
Q0xLX0dBVEVfUlZBUzFDTEsgKyAxKQ0KDQpObyBkcm9wLiBPdGhlcnMgYXMgd2VsbC4NCg0KQmVz
dCByZWdhcmRzLA0KS3J6eXN6dG9mDQoNCioqKioqKioqKioqKiogRW1haWwgQ29uZmlkZW50aWFs
aXR5IE5vdGljZSAqKioqKioqKioqKioqKioqKioqKg0Kp0uzZMFuqfo6DQqlu6tIpfMoqc6o5Kr+
pfMppWmv4KVdp3S+97FLuOqwVKFBqMOo/Kprq9+rT8VAoUOmcCCleLrdq0Sr/Kl3pKemrKXzqsyh
Qb3QpUi5caRstmyl87Nxqr6lu7lxpGy2bKXzpKe1b7BlqswsIKjDvdCl36dZp1Kwo6W7uXGkbLZs
pfOkzqjkqv6l86lNvlC3tKnSprO9xqZMpfOhQ8HCwcKxeqq6plinQCENCg0KRElTQ0xBSU1FUjoN
ClRoaXMgbWVzc2FnZSAoYW5kIGFueSBhdHRhY2htZW50cykgbWF5IGNvbnRhaW4gbGVnYWxseSBw
cml2aWxlZ2VkIGFuZC9vciBvdGhlciBjb25maWRlbnRpYWwgaW5mb3JtYXRpb24uIElmIHlvdSBo
YXZlIHJlY2VpdmVkIGl0IGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgYnkgcmVw
bHkgZS1tYWlsIGFuZCBpbW1lZGlhdGVseSBkZWxldGUgdGhlIGUtbWFpbCBhbmQgYW55IGF0dGFj
aG1lbnRzIHdpdGhvdXQgY29weWluZyBvciBkaXNjbG9zaW5nIHRoZSBjb250ZW50cy4gVGhhbmsg
eW91Lg0K

--_000_PSAPR06MB49495961B7AEDE4AE26F8ED389802PSAPR06MB4949apcp_
Content-Type: text/html; charset="big5"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dbig5">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Hi Krzk,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&gt;Missing commit msg.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;A nit, subject: drop second/last, redundant &quot;bindings&quot;. The</=
div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&quot;dt-bindings&quot; prefix is already stating that these are bindin=
gs.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;See also:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetr=
ee/bindings/submitting-patches.rst#L18</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;Please use subject prefixes matching the subsystem. You can get them fo=
r</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory<=
/div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;your patch is touching. For bindings, the preferred subjects are</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;explained here:</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&gt;https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-p=
atches.html#i-for-patch-submitters</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, C=
alibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Agree, already fixed in another commit in Ryan's series.</div>
<div style=3D"text-align: left; text-indent: 0px; margin: 0px; font-family:=
 Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
<a href=3D"https://patchwork.kernel.org/project/linux-clk/patch/20240808075=
937.2756733-4-ryan_chen@aspeedtech.com/" id=3D"OWA575e1ac2-732e-ed9d-38b7-6=
4545afc5721" class=3D"OWAAutoLink" style=3D"margin: 0px;">[3/4] dt-bindings=
: clock: Add AST2700 clock bindings - Patchwork
 (kernel.org)</a></div>
<div style=3D"text-align: left; text-indent: 0px; margin: 0px; font-family:=
 Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
--</div>
<div style=3D"text-align: left; text-indent: 0px; margin: 0px; font-family:=
 Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
Best Regards,</div>
<div style=3D"text-align: left; text-indent: 0px; margin: 0px; font-family:=
 Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
Kevin. Chen</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
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
1<br>
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
<b>=A5D=A6=AE:</b>&nbsp;Re: [PATCH v1 02/10] dt-binding: clk: ast2700: Add =
binding for Aspeed AST27xx Clock</span>
<div>&nbsp;</div>
</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
margin: 0px; font-size: 11pt;">
On 26/07/2024 13:03, Kevin Chen wrote:<br>
&gt; Signed-off-by: Kevin Chen &lt;kevin_chen@aspeedtech.com&gt;<br>
<br>
Missing commit msg.<br>
<br>
A nit, subject: drop second/last, redundant &quot;bindings&quot;. The<br>
&quot;dt-bindings&quot; prefix is already stating that these are bindings.<=
br>
See also:<br>
<a href=3D"https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/d=
evicetree/bindings/submitting-patches.rst#L18" id=3D"OWAc765d41d-a0f9-b0c5-=
baad-2beae5ea4795" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">https:=
//elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/binding=
s/submitting-patches.rst#L18</a><br>
<br>
Please use subject prefixes matching the subsystem. You can get them for<br=
>
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory<br>
your patch is touching. For bindings, the preferred subjects are<br>
explained here:<br>
<a href=3D"https://www.kernel.org/doc/html/latest/devicetree/bindings/submi=
tting-patches.html#i-for-patch-submitters" id=3D"OWA57550013-5513-06f9-de43=
-2148e49c0b37" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">https://ww=
w.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-=
for-patch-submitters</a><br>
<br>
&gt; ---<br>
&gt;&nbsp; .../dt-bindings/clock/aspeed,ast2700-clk.h&nbsp;&nbsp;&nbsp; | 1=
80 ++++++++++++++++++<br>
<br>
This is supposed to be part of bindings adding the clock controller.<br>
<br>
&gt;&nbsp; 1 file changed, 180 insertions(+)<br>
&gt;&nbsp; create mode 100644 include/dt-bindings/clock/aspeed,ast2700-clk.=
h<br>
&gt;<br>
&gt; diff --git a/include/dt-bindings/clock/aspeed,ast2700-clk.h b/include/=
dt-bindings/clock/aspeed,ast2700-clk.h<br>
&gt; new file mode 100644<br>
&gt; index 000000000000..5ca85503736d<br>
&gt; --- /dev/null<br>
&gt; +++ b/include/dt-bindings/clock/aspeed,ast2700-clk.h<br>
&gt; @@ -0,0 +1,180 @@<br>
&gt; +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */<br>
&gt; +/*<br>
&gt; + * Device Tree binding constants for AST2700 clock controller.<br>
&gt; + *<br>
&gt; + * Copyright (c) 2023 Aspeed Technology Inc.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#ifndef __DT_BINDINGS_CLOCK_AST2700_H<br>
&gt; +#define __DT_BINDINGS_CLOCK_AST2700_H<br>
&gt; +<br>
&gt; +/* SOC0 clk-gate */<br>
&gt; +#define SCU0_CLK_GATE_MCLK&nbsp;&nbsp; (0)<br>
&gt; +#define SCU0_CLK_GATE_ECLK&nbsp;&nbsp; (1)<br>
<br>
Drop all (). Not needed, not useful.<br>
<br>
&gt; +#define SCU0_CLK_GATE_GCLK&nbsp;&nbsp; (2)<br>
&gt; +#define SCU0_CLK_GATE_VCLK&nbsp;&nbsp; (3)<br>
&gt; +#define SCU0_CLK_GATE_BCLK&nbsp;&nbsp; (4)<br>
&gt; +#define SCU0_CLK_GATE_D1CLK&nbsp; (5)<br>
&gt; +#define SCU0_CLK_GATE_REFCLK (6)<br>
&gt; +#define SCU0_CLK_GATE_USB0CLK&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; (7)<br>
&gt; +#define SCU0_CLK_GATE_RSV8&nbsp;&nbsp; (8)<br>
&gt; +#define SCU0_CLK_GATE_USB1CLK&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; (9)<br>
&gt; +#define SCU0_CLK_GATE_D2CLK&nbsp; (10)<br>
&gt; +#define SCU0_CLK_GATE_RSV11&nbsp; (11)<br>
&gt; +#define SCU0_CLK_GATE_RSV12&nbsp; (12)<br>
&gt; +#define SCU0_CLK_GATE_YCLK&nbsp;&nbsp; (13)<br>
&gt; +#define SCU0_CLK_GATE_USB2CLK&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; (14)<br>
&gt; +#define SCU0_CLK_GATE_UART4CLK&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (1=
5)<br>
&gt; +#define SCU0_CLK_GATE_SLICLK (16)<br>
&gt; +#define SCU0_CLK_GATE_DACCLK (17)<br>
&gt; +#define SCU0_CLK_GATE_DP&nbsp;&nbsp;&nbsp;&nbsp; (18)<br>
&gt; +#define SCU0_CLK_GATE_RSV19&nbsp; (19)<br>
&gt; +#define SCU0_CLK_GATE_CRT1CLK&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; (20)<br>
&gt; +#define SCU0_CLK_GATE_CRT2CLK&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; (21)<br>
&gt; +#define SCU0_CLK_GATE_VLCLK&nbsp; (22)<br>
&gt; +#define SCU0_CLK_GATE_ECCCLK (23)<br>
&gt; +#define SCU0_CLK_GATE_RSACLK (24)<br>
&gt; +#define SCU0_CLK_GATE_RVAS0CLK&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (2=
5)<br>
&gt; +#define SCU0_CLK_GATE_UFSCLK (26)<br>
&gt; +#define SCU0_CLK_GATE_EMMCCLK&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; (27)<br>
&gt; +#define SCU0_CLK_GATE_RVAS1CLK&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (2=
8)<br>
&gt; +/* reserved 29 ~ 31*/<br>
<br>
IDs cannot be reserved. It is a binding, not a hardware number.<br>
<br>
&gt; +#define SOC0_CLK_GATE_NUM&nbsp;&nbsp;&nbsp; (SCU0_CLK_GATE_RVAS1CLK +=
 1)<br>
<br>
No drop. Others as well.<br>
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

--_000_PSAPR06MB49495961B7AEDE4AE26F8ED389802PSAPR06MB4949apcp_--
