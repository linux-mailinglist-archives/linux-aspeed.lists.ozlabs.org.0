Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB327957A16
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:59:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqL81h9Cz87yr
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:58:24 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=BzzaTxnx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:2011::700; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=kevin_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20700.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WkvPw1gr9z2yNR
	for <linux-aspeed@lists.ozlabs.org>; Thu, 15 Aug 2024 15:51:31 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hl3+skAaKY3/Z/Tyo+/dGTpssDrdT2afVJKCTGzF2lb7COfUhi7oFCLNXzapdFR1kdvKlXOsC3JtI+Wvcaog6jvXltv3ZpeIOXsoSOGe4crTz+v+Nm0K91sJNMQOE+u95znTdf/oUrA5D5Yb9aqeUuYxSyQWXcmrP/UV5Z2IA5ekBhoah7JEYaNPwsHrhPdqe/VeKZKppkKBfXpdCNttiYVxiJIz3p+ZXXHWU0i+JijSsIZEk5vL9ZdbaHiyh7n+Y4dcfNyCKM8yy0bJG+rx5twFWuQ3B+XcGLBviTRgRaLWt03KJdtzbBOxtJFTk6yElfmoYlkKHNAXbFndO89SBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OmRYhgYHHQpbUViJh60+nCqAcDfOqskUaZT2KO14cMs=;
 b=Yiy5r/GCbiohKOlEduDlI/bR3M3xc5PXSEEdr69VH2IaNMGdCnauZ7n7KgucLrJSMiA0Woa+k/U7t7K0oqPlKxbK7ai7AOvwIeSl7DNpb+tRaMZSqjeUF2X9HUNgBAJ6qpxwM0xpayE/GfDJDi33vEm9AETx/vAcfAS0YAZVuPeLsEP0mRutIahPxt35CyRdHmfjZjCXU7vJeMTtu2+f+TBBYaW2lPzmqdvecbfzw/IAA2qTGlRnPx0TA5g+LKgoBjKf7mqY7VmtVq9S/tAEhxYORUIBcvH0Yn2uXTPtmsKOntXkJ5rRn/U3KNs1XTcXsRJcSkci5/gVibtOo5HMtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OmRYhgYHHQpbUViJh60+nCqAcDfOqskUaZT2KO14cMs=;
 b=BzzaTxnx4MwWiwtZGewoEC7G1X4+HFXVxQZ73SE2ontlg5TREB0HCw4R9C7gYNpOJKgVAnwm70ZvMHdTwfkF7denosA1Z6ptdEFDVipY9j4iIwkmnoOL/fV180PkqgMomjZv7wuiG99Wr5FkoZHScTIhr94BsjPz8afI0OjmvjyMxXkLWiv+C3VRW9qT6YlrGPcWyKmhu5xzKXfxO/R7N2y6Kp8sjl3QcxpNjcNmtpB+pma/JJxcMAvdnViWjrNeTzndPurCgad0fofPsnVp9xsYdWygGh6Ef46Lb2U6SEzHTycDQxSDK2Vx+srbypqFOebT+JeL84PvzFCupLhRtA==
Received: from PSAPR06MB4949.apcprd06.prod.outlook.com (2603:1096:301:ad::9)
 by SEYPR06MB7000.apcprd06.prod.outlook.com (2603:1096:101:1e3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.16; Thu, 15 Aug
 2024 05:51:13 +0000
Received: from PSAPR06MB4949.apcprd06.prod.outlook.com
 ([fe80::7bdd:639a:6b94:37bf]) by PSAPR06MB4949.apcprd06.prod.outlook.com
 ([fe80::7bdd:639a:6b94:37bf%7]) with mapi id 15.20.7875.016; Thu, 15 Aug 2024
 05:51:12 +0000
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
Subject:  =?big5?B?pl7C0DogW1BBVENIIHYxIDA3LzEwXSBhcm02NDogYXNwZWVkOiBBZGQgc3VwcG9y?=
 =?big5?Q?t_for_ASPEED_AST2700_BMC_SoC?=
Thread-Topic: [PATCH v1 07/10] arm64: aspeed: Add support for ASPEED AST2700
 BMC SoC
Thread-Index: AQHa30uNgfdNeqemVUaxz4JUd+v/wrII29uAgB7x/oQ=
Date: Thu, 15 Aug 2024 05:51:12 +0000
Message-ID:  <PSAPR06MB4949A8DCD5B085514A9E710389802@PSAPR06MB4949.apcprd06.prod.outlook.com>
References: <20240726110355.2181563-1-kevin_chen@aspeedtech.com>
 <20240726110355.2181563-8-kevin_chen@aspeedtech.com>
 <b7b3cbc2-5f20-4a78-b189-b509acfee3ac@kernel.org>
In-Reply-To: <b7b3cbc2-5f20-4a78-b189-b509acfee3ac@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR06MB4949:EE_|SEYPR06MB7000:EE_
x-ms-office365-filtering-correlation-id: 05d7e92c-502f-4124-f542-08dcbcee44df
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|1800799024|366016|376014|7416014|921020|38070700018;
x-microsoft-antispam-message-info:  =?big5?B?SjArYm5LaGxoRFM4dkhPNnI0ZXpWdGVaaVJlOW1KR0NPWUtnMkRGT1NQd1dJYjhN?=
 =?big5?B?ZStvamRPM3YwRTJZUksveGM5eVdacFMra0FCRE5qWkNOOEIxcTF5ZEdrY2RJWDNJ?=
 =?big5?B?MVNVN3JiNCtJdC8zNERwU2s2YklXRDNzemFMQzF5SWUxVjRML1kvSFkvdFV4OHor?=
 =?big5?B?czVHREZZcVBmL3g4UTllMlU5VmMwcFJEOTV1dFNCUDBybjFFTjR4VWFEQ2g3YmNh?=
 =?big5?B?QVF5cFlzaUZMR3pMTkgyNlVBcmlVQzFkVlhCTE1GK0U4Zm5laFlIN2Y5TXdvYXYr?=
 =?big5?B?L0JHSGtCc3ltMTZxMmhxY3dGc3BVUklydzBENjUzOGsyblNGM3BCa1ZsMEsrSndh?=
 =?big5?B?L2I4TDZGeTZZdmhCWkMva0dBSWFydnhocHJnMXVvUnk1OWVDaXNpY08yS3ZrUGhx?=
 =?big5?B?eUxNQzVnTE9VNkhRTXAxOTRmTFlabjREd0lrSVBnTVZMUTM4YXE0YWxNekRKVy9t?=
 =?big5?B?b3ZvMjFPRFVadnE1aG5ReTFqRFFwVG04SHlBSUpMTUY2SHlybkxTTEx2dDUyb1pp?=
 =?big5?B?cTlNLzViaWVGRVdDM1lncG0ydmloSTBHMDM1OGthZUhLbUd1QVVEWFNIMmJEekxr?=
 =?big5?B?N2xaZ28yNkZiQmZpQ0hLR1N5ZmgzZGtuNW5iM2YybUc3MGdWSmQ0c3UrYzZCVWtS?=
 =?big5?B?U0FvWFlCbmRwc1l3dUduUThwb3lidjUvbllPMzUzZjhPbXkrbmFUaEQ2dUlKRGhu?=
 =?big5?B?aHVCejVYeGtDc2VtcEVtZmpCSGprbXRrUDV4cyt1UGUySWpRZXVuRWEyWU5TOXM3?=
 =?big5?B?ems1RlFQSWlobjhxTlljcTl0ZUYySUV2eEdtMWI5bnhud0gvQ205b3dyeDBhZmYz?=
 =?big5?B?elVmRFNHWFZCNy9HV0tIV1ZCTmdCdEZpOG55Ujlockt6dzIyWHRQbkZXN1R4dFN2?=
 =?big5?B?UVB5aGtQQUhKYjBLV3hsQ2w3b2lkcE9NSnJKU0RlM050dXFEZzRmbU5WN2xXNUtW?=
 =?big5?B?NzNIT1hObndpL0R5RmpQY3l0R3prZytheXBjd1VQRDBRSWp5aUZyZjM5M2JMVkR2?=
 =?big5?B?bXRMUmlRNnorcktWeHI1ZkJlNzUvK1pTWDVwUHZaemtqUVVoWnFwVUZxd21QTktx?=
 =?big5?B?MDVqTWZ5NG9LTWhsa1ZpRS9DVUkvaE9ZRTFrMlU3a2M0TFpSVEtlQmZmQ0ZSbEZX?=
 =?big5?B?UzRqVUEwWWdPQnlna2Z0NDJEZHhpak9WWmUwNHdWOStFNnBKTVhWUzhhazViTndk?=
 =?big5?B?OGE5cGY1ZEcxUXNGcHlsdE15ZjlMNTZ2S1JieEhVL0pUcUhKYXhEME83MVQ2blQy?=
 =?big5?B?RUQ5cnBoL3pSSURkZHZtSy9uS1RVeXdwUGZKUkJ3bEI1MHNNTEJpQVU4SmxTRERH?=
 =?big5?B?M1hndjNnSWJadXJNUE1TajNJVVdSWVdzcVF1RE9RSVpkUXNBUDBxeVVFZUpaYWdF?=
 =?big5?B?VDZBTGN0ZHpINnNCU1ZuZ3JtNUhkR0RCVUNUZjBnMmNUMFlObUFIMUxUbEc4TWVQ?=
 =?big5?B?VEtSa0YxWlZTZ2JselFzVE1wcDJXdjY4YnJxNFcxcHhCUEh6Y3J4ZWphOFVFOHpp?=
 =?big5?B?OXpQMGFZclVGZVlMbGFabWdCaVVpaXJRd2loY0tHeFludTIrazg0TjU4bWNpRWNJ?=
 =?big5?B?NE1FNGhzSEtTMy95VUZkY2k4S3liQktRdzBSb0hWa1RkN0NtN1E4NE1VSmRMWk8r?=
 =?big5?B?YXhzVVhBUG5NYXVTbnBocVIyTTlSSlFsYzhpUnpZWkt6RmhLd3BqeGlOcXZsck53?=
 =?big5?B?WmNkczFGS3R3RE9EZzlTbjRCMHkzMUJZOStLNVQ1ZTRiQVhBcWMyQVAybzNNT25J?=
 =?big5?B?RTU0VlJRZE5tcGhBZlpmVkpRM1lybnA2bmsvM3Bod2p6YkJxS3UvMkpwWWxJTWs1?=
 =?big5?Q?m83mhmKeXcQ=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR06MB4949.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?big5?B?SVp1SlNSZk9DMk1EN2pld3hrZUlCa29GNWtBY3JDWitLNkt3a1krNCtxbGFQSVZo?=
 =?big5?B?eWFjdWtXSHpoQ0dmemVmRy8rYnBOaFhINGZiN2FqbEtvYlJINEdYSWJPaDV4dGNk?=
 =?big5?B?NG80T1cwRGpwdTVFbXBWOHZLc25yM0JXUWoyaGE5N3ZRYUgyRytlYmNZdEJEaXFy?=
 =?big5?B?U2pIclF6SVo1c2d5czFpNGVEMTZDU3p6bG1mYWpNMFJ2MkVZZ09yMzMxWTN5ZEFD?=
 =?big5?B?eVJBYlFOVys4K3NNZFI0YjlwaEI4UW9Rb0xIcERjNElNZktESmI2VCtTMG1HSTFO?=
 =?big5?B?akYzZDZaSVg4VEI4VkFBZ1RZeHFVdXFDVTJYblZ3Wlp5d1JFcnI4Vm5YcDRRbmpm?=
 =?big5?B?UHdKQ0puRVdsTUJiZWFpRitVYTFjeTFRanNwMDBmYkRNWkNkbFpEMzdaRzI4M0dt?=
 =?big5?B?M1ZjQ09nclhxZUV4OG43RGR6dzlYT01OakNwdk1OODNrWG1YeXl6QWU0aUluNW1o?=
 =?big5?B?STBVWVdBQ2pXczI5QUpoa1hPNlk0YzdxaUhoZDBTWFZKUnRGUUluWU5xSldGWnA2?=
 =?big5?B?OXVVUkJKWkUrd1lsOHN5Si94Tk55RTZMRU9WQkJVY29YNDg5SlN5WFNvVzBmL3lh?=
 =?big5?B?U0xpMkI4ZzBhMVF2eWhHZTRnNFpFYnBZYzhjbitpRHBNSGV1K29RSkN4aHdaWEVW?=
 =?big5?B?SGt1cVFzSnV5N2wwTng1UHJXaDZaZW9hdTZ4SlB1dWQzbDR0bnpoTi9rQnVBaW1V?=
 =?big5?B?eHpla3V3YWNGRU5pYjJ4K0Rrd1h2ZUxjRk10ak9XYjZrODA2cTlVUzJndTN0bTdu?=
 =?big5?B?UTNOZkJ5WnVGNVhNeitPZHFUWUlSNXo3eXJ2MXFSMFgvT0lZMG9ROHF2YkhBMFBx?=
 =?big5?B?bG9GOXBISnZsWGhlME8rSDU2VWhRWUFBNlBYWlZGbUp2enovKzZFaVhMOUMyTHB1?=
 =?big5?B?ZUc4L2hQeDA1cmRtTUpqMC9ZK2h3YUs1b25jMUw0Yy9NTmRqTlhOUnpuektWM1ho?=
 =?big5?B?ZkZ5c1pud3BRMWlybi92a2hidHZqTmQwNkRzY3d0N21DMFJNUVRVNEdSbnR4ZExl?=
 =?big5?B?OWFQMWNQUTY3OWlzVHpkcjZUa3Z1MTBVbkovcFBoQlI3cHZyb0s1Q0ROaC9laWRT?=
 =?big5?B?NVYxTjlRdmdxbzVpanBqd2xaYVZSNkQwTUZnYVZKODRaZ2RQSnVKRmFyeldaUTI4?=
 =?big5?B?RFlGUzBjcFFOcDRJSmtXZ0ZmM1pHMFpBVkdRV3hoRXppMUJ3NXhkNmcyamZGMjI2?=
 =?big5?B?eFY0S3p6Y2xNaHhEU2hSQ1ZlWDVqOUxMTkNVNGlmQWNhUHdVQjhscmRVb04zUzZE?=
 =?big5?B?ZndZb09mbmRUUWZCZDBjOXJuQ1M2czdNS1JGTmZycHZramZaOTBOMUNrcHBDc0ZV?=
 =?big5?B?Vm9iQ1d0TndqYUhVVW93Nll4cVpJNWtxb0k2VjdMSEZCUDB6YUhMUG9EN0FnUG1v?=
 =?big5?B?QVdqUTlJZ0Y3dUU4U25kQlpUYU1iMG5peWxvaFhNWVlOdEdIWlBkcGo4Y3phcWFk?=
 =?big5?B?U25xQ0J1cjRsdXZ3MENWZnFOZ2xybFNINmhtcVRubmd0QlVKK2R0MVlEeUhRTWhZ?=
 =?big5?B?VmgwYVFZZUhCTDVrbkVoYm1QQUFNdkFoQkVJdGMzcy9nVENSY0VVTWdYbVF2aHNn?=
 =?big5?B?ZnVDNklHQjUzSEVNTnpLU2NCSmxtL0ZqSmtrRjVMS2J6Um9BMFZ4dkJUbFVqaFd3?=
 =?big5?B?UGNYbGpnTVVsZGw5UG53R0JJd2JUWHpBSUUzNXdVQXBwSDNGbzBpMVc5YnpYeElM?=
 =?big5?B?WXRzWGRrbzhKSy9sNlM1MWNlV1I4TFl6M00zSmsxWHFzWWVIOE5ISjAwSnA1UXlq?=
 =?big5?B?L1VNZmozcmRPemlBdGMxUkJJYUE4ckg0Q1V6dkk3Q0M0bUdLUHZYVFVDUVJTSndB?=
 =?big5?B?ZUx6bEt6aDlSdHVhTElCc1Q5TVQ3L3Q0NXlwaDNqb0NOdlc2clYwVFNNUVlJUDU4?=
 =?big5?B?ekMyYlplZkdVQm5xK1ovbERGL0NPVmo5TUpkdUhiQlpvQjdsdFhWT0xsbmx2YVNq?=
 =?big5?B?WWp2MFRmem5NZTFGZXdrNnZLRmZqR1o3ZitJRXh2YTdjT20rVS9YelhjTEZOdWI5?=
 =?big5?Q?DZ9iN2vdd5VFvv/9?=
Content-Type: multipart/alternative;
	boundary="_000_PSAPR06MB4949A8DCD5B085514A9E710389802PSAPR06MB4949apcp_"
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4949.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05d7e92c-502f-4124-f542-08dcbcee44df
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2024 05:51:12.2999
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wX3DRaSeORRUY3frSXD1OcDmHAtB0sGrLnPf8C8thRGgG7uEKjri1YbifPQd19vnB9uCs86ezmAZKnW44G97NsyjAjJmFo6r2upYpRYG3a0=
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

--_000_PSAPR06MB4949A8DCD5B085514A9E710389802PSAPR06MB4949apcp_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGkgS3J6aywNCg0KPj4gLS0tDQo+PiAgTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICB8ICAz
ICsrKw0KPj4gIGFyY2gvYXJtNjQvS2NvbmZpZy5wbGF0Zm9ybXMgfCAxNCArKysrKysrKysrKysr
Kw0KPj4gIDIgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1n
aXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTDQo+PiBpbmRleCBjMGEzZDllOTM2ODkuLjA4
NjA5NDMwY2ZlMCAxMDA2NDQNCj4+IC0tLSBhL01BSU5UQUlORVJTDQo+PiArKysgYi9NQUlOVEFJ
TkVSUw0KPj4gQEAgLTIxMjEsNyArMjEyMSwxMCBAQCBROiAgICAgaHR0cHM6Ly9wYXRjaHdvcmsu
b3psYWJzLm9yZy9wcm9qZWN0L2xpbnV4LWFzcGVlZC9saXN0Lw0KPj4gIFQ6ICAgZ2l0IGdpdDov
L2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9qb2VsL2JtYy5naXQNCj4+
ICBGOiAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYXNwZWVkLw0KPj4g
IEY6ICAgYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLw0KPj4gK0Y6ICAgYXJjaC9hcm02NC9ib290
L2R0cy9hc3BlZWQvDQo+PiAgRjogICBhcmNoL2FybS9tYWNoLWFzcGVlZC8NCj4+ICtGOiAgIGlu
Y2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svYXNwZWVkLGFzdDI3MDAtY2xrLmgNCj4+ICtGOiAgIGlu
Y2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQvYXNwZWVkLGFzdDI3MDAtcmVzZXQuaA0KPj4gIE46ICAg
YXNwZWVkDQo+Pg0KPj4gIEFSTS9BWE0gTFNJIFNPQw0KPj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJt
NjQvS2NvbmZpZy5wbGF0Zm9ybXMgYi9hcmNoL2FybTY0L0tjb25maWcucGxhdGZvcm1zDQo+PiBp
bmRleCA2YzZkMTE1MzZiNDIuLjFkYjdiNmYxZWUwYSAxMDA2NDQNCj4+IC0tLSBhL2FyY2gvYXJt
NjQvS2NvbmZpZy5wbGF0Zm9ybXMNCj4+ICsrKyBiL2FyY2gvYXJtNjQvS2NvbmZpZy5wbGF0Zm9y
bXMNCj4+IEBAIC00MCw2ICs0MCwyMCBAQCBjb25maWcgQVJDSF9BUFBMRQ0KPj4gICAgICAgICAg
VGhpcyBlbmFibGVzIHN1cHBvcnQgZm9yIEFwcGxlJ3MgaW4taG91c2UgQVJNIFNvQyBmYW1pbHks
IHN0YXJ0aW5nDQo+PiAgICAgICAgICB3aXRoIHRoZSBBcHBsZSBNMS4NCj4+DQo+PiArY29uZmln
IEFSQ0hfQVNQRUVEDQo+PiArICAgICBib29sICJBc3BlZWQgU29DIGZhbWlseSINCj4+ICsgICAg
IHNlbGVjdCBNQUNIX0FTUEVFRF9HNw0KPj4gKyAgICAgaGVscA0KPj4gKyAgICAgICBTYXkgeWVz
IGlmIHlvdSBpbnRlbmQgdG8gcnVuIG9uIGFuIEFzcGVlZCBhc3QyNzAwIG9yIHNpbWlsYXINCj4+
ICsgICAgICAgc2V2ZW50aCBnZW5lcmF0aW9uIEFzcGVlZCBCTUNzLg0KPj4gKw0KPj4gK2NvbmZp
ZyBNQUNIX0FTUEVFRF9HNw0KPj4gKyAgICAgYm9vbCAiQXNwZWVkIFNvQyBBU1QyNzAwIg0KPg0K
PlRoZXJlIGFyZSBubyBNQUNIaW5lcyBmb3IgYXJtNjQuIExvb2sgYXQgdGhpcyBjb2RlLiBEbyB5
b3Ugc2VlIE1BQ0gNCj5hbnl3aGVyZSBlbHNlPyBOby4gVGhlbiB3aHkgQXNwZWVkIG11c3QgYmUg
ZGlmZmVyZW50Pw0KPg0KPk5vLiBEcm9wLg0KQWdyZWUuDQoNCi0tDQpCZXN0IFJlZ2FyZHMsDQpL
ZXZpbi4gQ2hlbg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KsUil86rMOiBL
cnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+DQqxSKXzpOm0wTogMjAyNKZ+N6Tr
Mjak6SCkVaTIIDA3OjE2DQqmrKXzqsw6IEtldmluIENoZW4gPGtldmluX2NoZW5AYXNwZWVkdGVj
aC5jb20+OyByb2JoQGtlcm5lbC5vcmcgPHJvYmhAa2VybmVsLm9yZz47IGtyemsrZHRAa2VybmVs
Lm9yZyA8a3J6aytkdEBrZXJuZWwub3JnPjsgY29ub3IrZHRAa2VybmVsLm9yZyA8Y29ub3IrZHRA
a2VybmVsLm9yZz47IGpvZWxAam1zLmlkLmF1IDxqb2VsQGptcy5pZC5hdT47IGFuZHJld0Bjb2Rl
Y29uc3RydWN0LmNvbS5hdSA8YW5kcmV3QGNvZGVjb25zdHJ1Y3QuY29tLmF1PjsgbGVlQGtlcm5l
bC5vcmcgPGxlZUBrZXJuZWwub3JnPjsgY2F0YWxpbi5tYXJpbmFzQGFybS5jb20gPGNhdGFsaW4u
bWFyaW5hc0Bhcm0uY29tPjsgd2lsbEBrZXJuZWwub3JnIDx3aWxsQGtlcm5lbC5vcmc+OyBhcm5k
QGFybmRiLmRlIDxhcm5kQGFybmRiLmRlPjsgb2xvZkBsaXhvbS5uZXQgPG9sb2ZAbGl4b20ubmV0
Pjsgc29jQGtlcm5lbC5vcmcgPHNvY0BrZXJuZWwub3JnPjsgbXR1cnF1ZXR0ZUBiYXlsaWJyZS5j
b20gPG10dXJxdWV0dGVAYmF5bGlicmUuY29tPjsgc2JveWRAa2VybmVsLm9yZyA8c2JveWRAa2Vy
bmVsLm9yZz47IHAuemFiZWxAcGVuZ3V0cm9uaXguZGUgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+
OyBxdWljX2Jqb3JhbmRlQHF1aWNpbmMuY29tIDxxdWljX2Jqb3JhbmRlQHF1aWNpbmMuY29tPjsg
Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmUgPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPjsgZG1pdHJ5
LmJhcnlzaGtvdkBsaW5hcm8ub3JnIDxkbWl0cnkuYmFyeXNoa292QGxpbmFyby5vcmc+OyBzaGF3
bmd1b0BrZXJuZWwub3JnIDxzaGF3bmd1b0BrZXJuZWwub3JnPjsgbmVpbC5hcm1zdHJvbmdAbGlu
YXJvLm9yZyA8bmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZz47IG0uc3p5cHJvd3NraUBzYW1zdW5n
LmNvbSA8bS5zenlwcm93c2tpQHNhbXN1bmcuY29tPjsgbmZyYXByYWRvQGNvbGxhYm9yYS5jb20g
PG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tPjsgdS1rdW1hcjFAdGkuY29tIDx1LWt1bWFyMUB0aS5j
b20+OyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyA8ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5v
cmc+OyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcgPGxpbnV4LWFybS1rZXJu
ZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz47IGxpbnV4LWFzcGVlZEBsaXN0cy5vemxhYnMub3JnIDxs
aW51eC1hc3BlZWRAbGlzdHMub3psYWJzLm9yZz47IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5v
cmcgPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+OyBsaW51eC1jbGtAdmdlci5rZXJuZWwu
b3JnIDxsaW51eC1jbGtAdmdlci5rZXJuZWwub3JnPg0KpUSmrjogUmU6IFtQQVRDSCB2MSAwNy8x
MF0gYXJtNjQ6IGFzcGVlZDogQWRkIHN1cHBvcnQgZm9yIEFTUEVFRCBBU1QyNzAwIEJNQyBTb0MN
Cg0KT24gMjYvMDcvMjAyNCAxMzowMywgS2V2aW4gQ2hlbiB3cm90ZToNCj4gLS0tDQo+ICBNQUlO
VEFJTkVSUyAgICAgICAgICAgICAgICAgIHwgIDMgKysrDQo+ICBhcmNoL2FybTY0L0tjb25maWcu
cGxhdGZvcm1zIHwgMTQgKysrKysrKysrKysrKysNCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTcgaW5z
ZXJ0aW9ucygrKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUw0K
PiBpbmRleCBjMGEzZDllOTM2ODkuLjA4NjA5NDMwY2ZlMCAxMDA2NDQNCj4gLS0tIGEvTUFJTlRB
SU5FUlMNCj4gKysrIGIvTUFJTlRBSU5FUlMNCj4gQEAgLTIxMjEsNyArMjEyMSwxMCBAQCBROiAg
ICAgaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2xpbnV4LWFzcGVlZC9saXN0
Lw0KPiAgVDogICBnaXQgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L2pvZWwvYm1jLmdpdA0KPiAgRjogICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvYXJtL2FzcGVlZC8NCj4gIEY6ICAgYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLw0KPiArRjog
ICBhcmNoL2FybTY0L2Jvb3QvZHRzL2FzcGVlZC8NCj4gIEY6ICAgYXJjaC9hcm0vbWFjaC1hc3Bl
ZWQvDQo+ICtGOiAgIGluY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svYXNwZWVkLGFzdDI3MDAtY2xr
LmgNCj4gK0Y6ICAgaW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNldC9hc3BlZWQsYXN0MjcwMC1yZXNl
dC5oDQo+ICBOOiAgIGFzcGVlZA0KPg0KPiAgQVJNL0FYTSBMU0kgU09DDQo+IGRpZmYgLS1naXQg
YS9hcmNoL2FybTY0L0tjb25maWcucGxhdGZvcm1zIGIvYXJjaC9hcm02NC9LY29uZmlnLnBsYXRm
b3Jtcw0KPiBpbmRleCA2YzZkMTE1MzZiNDIuLjFkYjdiNmYxZWUwYSAxMDA2NDQNCj4gLS0tIGEv
YXJjaC9hcm02NC9LY29uZmlnLnBsYXRmb3Jtcw0KPiArKysgYi9hcmNoL2FybTY0L0tjb25maWcu
cGxhdGZvcm1zDQo+IEBAIC00MCw2ICs0MCwyMCBAQCBjb25maWcgQVJDSF9BUFBMRQ0KPiAgICAg
ICAgICBUaGlzIGVuYWJsZXMgc3VwcG9ydCBmb3IgQXBwbGUncyBpbi1ob3VzZSBBUk0gU29DIGZh
bWlseSwgc3RhcnRpbmcNCj4gICAgICAgICAgd2l0aCB0aGUgQXBwbGUgTTEuDQo+DQo+ICtjb25m
aWcgQVJDSF9BU1BFRUQNCj4gKyAgICAgYm9vbCAiQXNwZWVkIFNvQyBmYW1pbHkiDQo+ICsgICAg
IHNlbGVjdCBNQUNIX0FTUEVFRF9HNw0KPiArICAgICBoZWxwDQo+ICsgICAgICAgU2F5IHllcyBp
ZiB5b3UgaW50ZW5kIHRvIHJ1biBvbiBhbiBBc3BlZWQgYXN0MjcwMCBvciBzaW1pbGFyDQo+ICsg
ICAgICAgc2V2ZW50aCBnZW5lcmF0aW9uIEFzcGVlZCBCTUNzLg0KPiArDQo+ICtjb25maWcgTUFD
SF9BU1BFRURfRzcNCj4gKyAgICAgYm9vbCAiQXNwZWVkIFNvQyBBU1QyNzAwIg0KDQpUaGVyZSBh
cmUgbm8gTUFDSGluZXMgZm9yIGFybTY0LiBMb29rIGF0IHRoaXMgY29kZS4gRG8geW91IHNlZSBN
QUNIDQphbnl3aGVyZSBlbHNlPyBOby4gVGhlbiB3aHkgQXNwZWVkIG11c3QgYmUgZGlmZmVyZW50
Pw0KDQpOby4gRHJvcC4NCg0KQmVzdCByZWdhcmRzLA0KS3J6eXN6dG9mDQoNCioqKioqKioqKioq
KiogRW1haWwgQ29uZmlkZW50aWFsaXR5IE5vdGljZSAqKioqKioqKioqKioqKioqKioqKg0Kp0uz
ZMFuqfo6DQqlu6tIpfMoqc6o5Kr+pfMppWmv4KVdp3S+97FLuOqwVKFBqMOo/Kprq9+rT8VAoUOm
cCCleLrdq0Sr/Kl3pKemrKXzqsyhQb3QpUi5caRstmyl87Nxqr6lu7lxpGy2bKXzpKe1b7Blqsws
IKjDvdCl36dZp1Kwo6W7uXGkbLZspfOkzqjkqv6l86lNvlC3tKnSprO9xqZMpfOhQ8HCwcKxeqq6
plinQCENCg0KRElTQ0xBSU1FUjoNClRoaXMgbWVzc2FnZSAoYW5kIGFueSBhdHRhY2htZW50cykg
bWF5IGNvbnRhaW4gbGVnYWxseSBwcml2aWxlZ2VkIGFuZC9vciBvdGhlciBjb25maWRlbnRpYWwg
aW5mb3JtYXRpb24uIElmIHlvdSBoYXZlIHJlY2VpdmVkIGl0IGluIGVycm9yLCBwbGVhc2Ugbm90
aWZ5IHRoZSBzZW5kZXIgYnkgcmVwbHkgZS1tYWlsIGFuZCBpbW1lZGlhdGVseSBkZWxldGUgdGhl
IGUtbWFpbCBhbmQgYW55IGF0dGFjaG1lbnRzIHdpdGhvdXQgY29weWluZyBvciBkaXNjbG9zaW5n
IHRoZSBjb250ZW50cy4gVGhhbmsgeW91Lg0K

--_000_PSAPR06MB4949A8DCD5B085514A9E710389802PSAPR06MB4949apcp_
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
<div class=3D"elementToProof" style=3D"margin: 0px; font-family: Aptos, Apt=
os_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-=
size: 11pt; color: rgb(0, 0, 0);">
<br>
&gt;&gt; ---</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp;MAINTAINERS &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;| &nbsp;3 +++</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp;arch/arm64/Kconfig.platforms | 14 ++++++++++++++</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp;2 files changed, 17 insertions(+)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; diff --git a/MAINTAINERS b/MAINTAINERS</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; index c0a3d9e93689..08609430cfe0 100644</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; --- a/MAINTAINERS</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; +++ b/MAINTAINERS</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; @@ -2121,7 +2121,10 @@ Q: &nbsp; &nbsp; https://patchwork.ozlabs.o=
rg/project/linux-aspeed/list/</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp;T: &nbsp; git git://git.kernel.org/pub/scm/linux/kernel/git/=
joel/bmc.git</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp;F: &nbsp; Documentation/devicetree/bindings/arm/aspeed/</div=
>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp;F: &nbsp; arch/arm/boot/dts/aspeed/</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; +F: &nbsp; arch/arm64/boot/dts/aspeed/</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp;F: &nbsp; arch/arm/mach-aspeed/</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; +F: &nbsp; include/dt-bindings/clock/aspeed,ast2700-clk.h</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; +F: &nbsp; include/dt-bindings/reset/aspeed,ast2700-reset.h</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp;N: &nbsp; aspeed</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp;ARM/AXM LSI SOC</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.pla=
tforms</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; index 6c6d11536b42..1db7b6f1ee0a 100644</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; --- a/arch/arm64/Kconfig.platforms</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; +++ b/arch/arm64/Kconfig.platforms</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; @@ -40,6 +40,20 @@ config ARCH_APPLE</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;This enables support for Apple's=
 in-house ARM SoC family, starting</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;with the Apple M1.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; +config ARCH_ASPEED</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; bool &quot;Aspeed SoC family&quot;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; select MACH_ASPEED_G7</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; help</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; Say yes if you intend to run on an Aspeed a=
st2700 or similar</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; seventh generation Aspeed BMCs.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; +config MACH_ASPEED_G7</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; bool &quot;Aspeed SoC AST2700&quot;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;There are no MACHines for arm64. Look at this code. Do you see MACH</di=
v>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;anywhere else? No. Then why Aspeed must be different?</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&gt;No. Drop.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Agree.</div>
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
6<br>
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
<b>=A5D=A6=AE:</b>&nbsp;Re: [PATCH v1 07/10] arm64: aspeed: Add support for=
 ASPEED AST2700 BMC SoC</span>
<div>&nbsp;</div>
</div>
<div style=3D"font-size: 11pt;">On 26/07/2024 13:03, Kevin Chen wrote:<br>
&gt; ---<br>
&gt;&nbsp; MAINTAINERS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 3 +++<br>
&gt;&nbsp; arch/arm64/Kconfig.platforms | 14 ++++++++++++++<br>
&gt;&nbsp; 2 files changed, 17 insertions(+)<br>
&gt;<br>
&gt; diff --git a/MAINTAINERS b/MAINTAINERS<br>
&gt; index c0a3d9e93689..08609430cfe0 100644<br>
&gt; --- a/MAINTAINERS<br>
&gt; +++ b/MAINTAINERS<br>
&gt; @@ -2121,7 +2121,10 @@ Q:&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"https://p=
atchwork.ozlabs.org/project/linux-aspeed/list/" id=3D"OWA810ba2e5-5289-1fdd=
-7a05-0fa291e8f353" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
https://patchwork.ozlabs.org/project/linux-aspeed/list/</a><br>
&gt;&nbsp; T:&nbsp;&nbsp; git git://git.kernel.org/pub/scm/linux/kernel/git=
/joel/bmc.git<br>
&gt;&nbsp; F:&nbsp;&nbsp; Documentation/devicetree/bindings/arm/aspeed/<br>
&gt;&nbsp; F:&nbsp;&nbsp; arch/arm/boot/dts/aspeed/<br>
&gt; +F:&nbsp;&nbsp; arch/arm64/boot/dts/aspeed/<br>
&gt;&nbsp; F:&nbsp;&nbsp; arch/arm/mach-aspeed/<br>
&gt; +F:&nbsp;&nbsp; include/dt-bindings/clock/aspeed,ast2700-clk.h<br>
&gt; +F:&nbsp;&nbsp; include/dt-bindings/reset/aspeed,ast2700-reset.h<br>
&gt;&nbsp; N:&nbsp;&nbsp; aspeed<br>
&gt;&nbsp;<br>
&gt;&nbsp; ARM/AXM LSI SOC<br>
&gt; diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platfor=
ms<br>
&gt; index 6c6d11536b42..1db7b6f1ee0a 100644<br>
&gt; --- a/arch/arm64/Kconfig.platforms<br>
&gt; +++ b/arch/arm64/Kconfig.platforms<br>
&gt; @@ -40,6 +40,20 @@ config ARCH_APPLE<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; This enables sup=
port for Apple's in-house ARM SoC family, starting<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; with the Apple M=
1.<br>
&gt;&nbsp;<br>
&gt; +config ARCH_ASPEED<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;Aspeed SoC family&quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; select MACH_ASPEED_G7<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; help<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Say yes if you intend to run on =
an Aspeed ast2700 or similar<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; seventh generation Aspeed BMCs.<=
br>
&gt; +<br>
&gt; +config MACH_ASPEED_G7<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;Aspeed SoC AST2700&quot;<br>
<br>
There are no MACHines for arm64. Look at this code. Do you see MACH<br>
anywhere else? No. Then why Aspeed must be different?<br>
<br>
No. Drop.<br>
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

--_000_PSAPR06MB4949A8DCD5B085514A9E710389802PSAPR06MB4949apcp_--
