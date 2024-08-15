Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 734D8957A0E
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:59:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqL52nXlz3bqq
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:58:21 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feae::702; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=kevin_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20702.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::702])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WkvPB4hpxz2yQJ
	for <linux-aspeed@lists.ozlabs.org>; Thu, 15 Aug 2024 15:50:54 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wwh2H3gg+QsZ8jtK29kNyq8K5OUmYmIosXvJzAlxVRfMsaUFF33Eow04X0bJDot2Y+ZblaCmPjhgMDG8bYCSgoJM99833aiC0hJZ+ZbyWvoKK9stNIxd64y+RhsYkIIBJLHcstsFAlG+tBiKlKI8Py835xPI5wwHIu5sUS/ox1S9j2aX67KY0sbLQl71CPQdavLke9oux3dZBNVVlLb2xlaLkHmdbobGhbvTKSHJxKzgeQFcQBq6bKStgciXHj+6QQgBnGIoUrjCy27Fe0djJYibN13WAsjG35pKo5byvjnjSRj4KZqvv2iPj5JcGKWqDHM+n+48JOzdHYMkvp3F2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rgAUhEa7wdnzihgxZ48eSYvx4wdbeaGfmRFztzj7cMc=;
 b=w8vXLgXCpsQKPwG16ouZcp7bOEg2HD+fUXwdCCbmU4RRrU6kpUzTveSFoPsJwcVKzvLKB0JdyN+84+XZ0TBoLhqJ9EkyXV+wgGddOaeqcgBJHuhdJaOCNoeYapCj1OO5vAAUyTyMmuJxAcx6ovm49fBw51YiWIt3LBVbKBsr9JZJiIk4is92O1MDAMQjlzUATrkg71XqcUYp0KwAp8MdgUFXvvw3NCCZvivSIpvOmtvLPsF17xrXesmvoPw+APFYVKTSy1rr0WfZLliCFgXHIXP/6nXPjB5mWw27n8z6yMIHADS7o+lURfZSO8b6wuWHVp3VeaB81Oer7VcDYfNXoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rgAUhEa7wdnzihgxZ48eSYvx4wdbeaGfmRFztzj7cMc=;
 b=rB8DGuKm4P7uDJMC+o4I6Tkh32kSZHVpJSyjFpxr5FKP+IAn/DHysyA2C2Ca2jHhRwHKeqY+ZBrDImWKYiukIpjVEKHrs/r28jkOR9CtAeKbK70Ukvbyp8Kg90KZSsp7wi2Pt+LZ9x+k7/KRh017EyNtRwFnhvaHhe1CFa6yscoOPLHtaBmhYaHbEsqeDGOI+cJJd5RcN2f9ha4OsasyX0g6Nj63D56Zb3VY0b6ye1UaHuj0N8i8hEeVZs3qoGOibY9NGdvDJOX9k/mwlVd97UAh0ODOYHhk/BJcb0nEMIIiU+aQs7VZIH861Eae3UGSbmSotsdjx4TO9ZdSsv4eKg==
Received: from PSAPR06MB4949.apcprd06.prod.outlook.com (2603:1096:301:ad::9)
 by SEYPR06MB7000.apcprd06.prod.outlook.com (2603:1096:101:1e3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.16; Thu, 15 Aug
 2024 05:50:30 +0000
Received: from PSAPR06MB4949.apcprd06.prod.outlook.com
 ([fe80::7bdd:639a:6b94:37bf]) by PSAPR06MB4949.apcprd06.prod.outlook.com
 ([fe80::7bdd:639a:6b94:37bf%7]) with mapi id 15.20.7875.016; Thu, 15 Aug 2024
 05:50:30 +0000
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
Subject:  =?big5?B?pl7C0DogW1BBVENIIHYxIDAzLzEwXSBjbGs6IGFzdDI3MDA6IGFkZCBjbG9jayBj?=
 =?big5?Q?ontroller?=
Thread-Topic: [PATCH v1 03/10] clk: ast2700: add clock controller
Thread-Index: AQHa30uJFTBC1kHXk02g5GjokodakLII2w8AgB7tKAw=
Date: Thu, 15 Aug 2024 05:50:30 +0000
Message-ID:  <PSAPR06MB4949585D1558386AC9FC463E89802@PSAPR06MB4949.apcprd06.prod.outlook.com>
References: <20240726110355.2181563-1-kevin_chen@aspeedtech.com>
 <20240726110355.2181563-4-kevin_chen@aspeedtech.com>
 <fb3489cf-b288-426e-ace0-abf1d6b0fe0c@kernel.org>
In-Reply-To: <fb3489cf-b288-426e-ace0-abf1d6b0fe0c@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR06MB4949:EE_|SEYPR06MB7000:EE_
x-ms-office365-filtering-correlation-id: f2b19b54-64db-49a2-b539-08dcbcee2be0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|1800799024|366016|376014|7416014|921020|38070700018;
x-microsoft-antispam-message-info:  =?big5?B?elNNNWNBS0xXRUJLT1NabGNqMjR1c1l2TStTVmNVUEVKRWpaeXlrSVZhcXVtUzBS?=
 =?big5?B?RXAyWGcxa0lOZGdadUdON0tYVi8ranAvc2wwcStBMGdFaFpuLzczdXVxM0tBc1hG?=
 =?big5?B?YkxtVnVwV0VNQnQwcHFoYUlSaVBlK0p5Ni8yS0FPa0Z0VnJaOWE1TDdId0Zuc0Z4?=
 =?big5?B?QWlRM2FiK1dxdHU2UU5icnBzdkhoKzJlYkR6Y2syRWFMRmlCZ0wyS1BWYjVscHVj?=
 =?big5?B?LzY3cVNBck1BcnZYWndSWFl4MHM2eDE4ZWtteExiclZhQU9ramVyMHEzNkFxRTRo?=
 =?big5?B?ZXhnbHJGMnh4SkIvRHkxSE0xRVJDNGJqaEVFV3NMT3Nhei82dCt4MC94MlMycEpL?=
 =?big5?B?TVVFWjFFcmFEblY4aGM2SFlWM3YxQmg2bG1WWHBVTTRaMkVTMGpTclpBaDN2MG1F?=
 =?big5?B?cjhPd1QvdVNWVFU5YWJFRlRJeDFjRjBUSHczRG5wUDh3RUZqQnZRUkM2MEtnL2xP?=
 =?big5?B?OE5sR2liLzJjYmRGSG1heW1pWk9kWE1xL1A0WGh4dXgxSTNsd2FDTkM3UUd4SHJ4?=
 =?big5?B?ZUw5MmJRVzhib1J1eDFjbnhGbGNGdFVSN3B0bnVqeFdaejFybXNoQ1ZWQ1VZVXRa?=
 =?big5?B?SWY4RnhrM1l3NkcreDQ0bllGQ1kvRnZLT1I0cS9sYTJrSk5xZDVVWEozZUszb21H?=
 =?big5?B?V3FJMmZabm1MMVExODRkdVRIMHlsQjRaVW43TmpsWllDcytTakdxZCtJWlNRWkNy?=
 =?big5?B?aXZyR0xTZUJ6MTk1TTVEbGowQzArbEg2Yy9oamFmdWhMeFJMdU1WbzZ1RWNvMzhZ?=
 =?big5?B?ak4vWDZNc21VNHZmMW9Pc2JmdjE0QWQ0cno2WkVvYnVaNE9KSHI5QmdkS1VWb2Ju?=
 =?big5?B?Qmx5Q1dINk1mVTlTNnMwWFhHY1loNkVmMXVYVVV6bFZJeU1XMEpNcGpPbk5na3F6?=
 =?big5?B?dzUxNVl0TTBHVFo3MCtOOUx6ekhDK2VmWmk5eS9kU3ArWlpWSXYya2pzUXFZMU1h?=
 =?big5?B?RzBEcXdCMXJlamFPNTZBNkwzM3FRaTVkYkF5NEFuVmN2WXVEWG5ZcXZPeHcvRDNZ?=
 =?big5?B?R0xzaC9UOWhGQzlvZ0IvU2NoUnBNcDhRT280NFNWdHhMQ1ZPREVQRTJOMzBzcGMv?=
 =?big5?B?NGNYSExhVmRWRFVuKzFLZUk0MktGV1NVRXZMMW9Zdk43SUJrRkxiR1pTRHo0Nmpp?=
 =?big5?B?YmpQeUp1SWRwRW9kMUVQL25BV09YVEh0S0FJYjRIVUIyVkZDR1ZqblZTYjFSclZi?=
 =?big5?B?dUExQSt6ZTM1ZHNFTlBDSFQrMHRhN2dzVkgvSUxtTWo4VG1vcDhUNXdPeU1XaEtC?=
 =?big5?B?RDAxV3gySjZsVFdHVGZ4SFp3bkRNM2VmbWpQUzFsdjlPcEVaNmM2ZG13SG1GUHpR?=
 =?big5?B?OUMxb05EL2VCaDVESnNEMjBpb2JMZFNOUW1qQ1RWcHd0QWdKVkU3UlFaMENoY2N6?=
 =?big5?B?bzZWNlh0dElWcVRwZmlsd1RTdWVMZGhvYm5YajBlSERZVmtXUFJ6ais3WjJQWFRL?=
 =?big5?B?WUN0bjBjeGxYODdYbXA2L012TjA5MG5zc1E3a1Y4VVlFZzB5TGkyTFMxWVJFZytL?=
 =?big5?B?WEo3eWVVTHRlSDQweTkxYkFaZDBtdkJuVTdNZkdyVmordDNwekVMWmZHWkkyM3l1?=
 =?big5?B?NjgwREQrME9kTG5TSnNibU1hV0V0d2Zsc2RnLzdFcXBhc2pVZy9uL0VIMnpmWjla?=
 =?big5?B?ZUVDeXlSVEJ1ZUxPajFWcGZIQm5haDlTcXpjWWVHQ1NhVUU5Z1NQZkpGWE13TXZS?=
 =?big5?B?SWg5TEVpV3BxcThEandaSGYxNC9BeEFWNlhHdG43RkFoamxydTJqU2xBbVJQOC82?=
 =?big5?B?K3QzeEFNN2ZFWitKYXpERjd6dCtGVnpYN0ROSlcyR0N0dW1hVWI3eDNjRy8wQWNR?=
 =?big5?Q?eNHjcwasSsE=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR06MB4949.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?big5?B?NjFaRFovVXJjWW1sNzFDcFVQYitqVDMxOGJ5SGhFb2dDTHJxUzZmNXh5ZHZhU3Vv?=
 =?big5?B?RTFQSW4yaFhFcWcySmt3UXZwZVB6cHJLeDR1UEM4bzF4WXk0UHAvY1Zsd2JVbTRQ?=
 =?big5?B?U1p6VWtDQmhRQkdyVEF3RldaMEU3QmlYc1Y0TmMrSGlobGY4N002NFNBZExZZ2dT?=
 =?big5?B?bFBlK2ZWTEtPUkk0N0xTUGQxeWV2MStIMEJlS1JubkdhSGhuYTVMU3FGcGJuK2dx?=
 =?big5?B?M0I4dmNzdHlFdWF1YkRmU2phTm5ReExyNHBnaUFQOVN2UXhlblV3MWdpbGhiN2ZV?=
 =?big5?B?Y3RjL21pcURydHpuRHQ4M1ZSZmg0d20xdHcrTGFHdVpSdHNrWG9MblM1ZGVJVWhS?=
 =?big5?B?d2RmNkdXd3RMOWlKMWJmdHVvYjJ6bmxHMG1DUHVQTEVZNEY4VTBqMDQ2d0pxNVpV?=
 =?big5?B?QThwM1VBKzFuaVdNbUJNV24rRnB5SHRGbzhGZnU2M1NiSU5ENTQzVnFFRjNTWkJt?=
 =?big5?B?TmtmRG4yMCs0SzNWczhXemhZalFxRm1ocWpFWUFYZm5oVjhabE5OUXBub1RVcita?=
 =?big5?B?aTFRT0FFZm53UU13Ukd0eU9qVHVmaWxTeTVMRzRSbzlaQ0tIaG9LRUk2elRyclhN?=
 =?big5?B?bUw1TEtyRko0MTkwc0N5TXpHdkQ2Zkh0eE9xVGcwcnZlc1gzS3VNcDlZUERsRTFm?=
 =?big5?B?R0lmYzlDSFFkYmthOWRnYlVzNTU0aTQyaWlmemFqcjdDcmJ2WGpMcFZySEtrOU9D?=
 =?big5?B?QTZnYlFJZ2xISm0zaGMrcktXSDhiaXlnQkRHVHByZXprbTlPV0tORW9JZ0VkK0pY?=
 =?big5?B?T3g2aXVRNnVJblJyTzJiT0pkQnBmbFhvVW9KMzU3S1JlUjBVOURIK1YrOUZEbEhr?=
 =?big5?B?VGlLY0tiUFh3eTVuRFRGWDkzZ09vR0wvQ2xnWXoxN1BXYzNXL2E0MEMxS2cvM0U5?=
 =?big5?B?c29XSDVDcGJlMk02aGpWbFI2YXNlc1JWQi9JLzhObE1pa3dwRnE1QWwrTXBmeENJ?=
 =?big5?B?aVRnQVFpNnFEYnNROXpaSE9WdW1nZWJvaHNjNWtkbEVYbnowNmI1aWRtVEdiSGVS?=
 =?big5?B?R1BwWjAvRUlkUlZCcFRSTlpvK1JiQ3hZVmZOaHNCNXJUK2VndnZTUlpPUVFyZk9o?=
 =?big5?B?R0FYTVRpWFdtbzZTVmFkN0tLblI4MGFVS3B2Z1RFV0hBeUNPcm1zOGpXNjdwYXln?=
 =?big5?B?OVVJdDJYVjZ1MUdSekJDc08ydk9POWw3RVpPYlpoaXBHOFVPV0poTVUrVEVUck9U?=
 =?big5?B?NnBUZVp0SlU2N2N2eElXR09qTDFzOGlyRjhZZk9oaXdpMGRyL0FiVkc5Y005am8r?=
 =?big5?B?R0dVNUJCNHZHTUl1eU9MajdkdFVQbnVjdlUySXNHalZSN2oyOVgyM3F6dThGVVQx?=
 =?big5?B?eWE5UlAvempOdVgxejBSdmxnYnlqQ3lSYlFPdE5ZNUVWaDlLQTdrd3J2YWdWU2VY?=
 =?big5?B?L2g2MGNNbElQY25CbE5wV1hjbWtmUHlWdGVMc2VHWlgyTFVJb2J1bWNZVHVpRGdi?=
 =?big5?B?RFdPZC9wYmNyeTFBUTZnSkwvVnhyOUFxWXJkZ2c1azA2MzVvc1hkUjg1V1VUYXow?=
 =?big5?B?OGkvbmd6dDQ1SlFHL3RLSnRrMVFqb3VxdVNreEF4WmlIUTU3dnhlb2JrUWdtQnFh?=
 =?big5?B?dmRwTFBQTldMVzRERlpXYTVHSzBUcEIrQ2M2a2pKRjY0bkFEWk0yenFDcHNPVmlM?=
 =?big5?B?bDRmQkxOMmVId0toaE1jek5WejdybUlnMTNaT0dnZWo5UTBDNEhGa0tiSUJhcUF4?=
 =?big5?B?cHlNUzQ0RUk2YUhYbm1HTG5UYnp0VGdYaHVLdllrSklXMnpCdHR3dmJDMGFtT3l1?=
 =?big5?B?Tk5icGswZHk1N2NmL3FPbG1EWWsrdEx3NFVRZS9MUWwyMkZ4UVpmLzZUN1FaeFpj?=
 =?big5?B?cnBFRkdYMTlNUWVuZW9PWlpSSHlzck04SE9pUUt5S2pldzM3SDdPMkkzRUdaNnhK?=
 =?big5?B?SFo1Y3ZyUkYwSjQxVUkwd2Vma1hKd0dpcitGTGxxa2tYTmtFVlFONGpPWm9JbkdE?=
 =?big5?B?OWRaRmdBaXBLcEI0eDJkajR1VFp5MW93SzA1Q2RXMWxSWUNvdzYrdnFqV2ZCczFz?=
 =?big5?Q?LWObeO0c2kUTsBi4?=
Content-Type: multipart/alternative;
	boundary="_000_PSAPR06MB4949585D1558386AC9FC463E89802PSAPR06MB4949apcp_"
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4949.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2b19b54-64db-49a2-b539-08dcbcee2be0
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2024 05:50:30.3708
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QlU1ifSi2v+MMmKZsVlONspAPLpW/k01JTKeiB0zauowk3Sv4Z+MkVTW+ZG5de4V1wMZ4PftMejAlnPPGY+/TMRYDZ2MTktqA6EOBTZI5DI=
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

--_000_PSAPR06MB4949585D1558386AC9FC463E89802PSAPR06MB4949apcp_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGkgS3J6aywNCg0KSSB3aWxsIHNwZXBlcmF0ZSBjbG9jayBwYXJ0IGluIHRoZSB2MyBwYXRjaCBp
bnRvIFJ5YW4ncyBjbG9jayBzZXJpZXMuDQoNCg0KPlNvIHlvdSBkaWQgbm90IHdyaXRlIGNvbW1p
dCBtc2dzIHRvIG5vbmUgb2YgdGhlIGNvbW1pdHM/DQo+DQo+PiAtLS0NCj4+ICBkcml2ZXJzL2Ns
ay9NYWtlZmlsZSAgICAgIHwgICAgMSArDQo+PiAgZHJpdmVycy9jbGsvY2xrLWFzdDI3MDAuYyB8
IDExNjYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPj4gIDIgZmlsZXMg
Y2hhbmdlZCwgMTE2NyBpbnNlcnRpb25zKCspDQo+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZl
cnMvY2xrL2Nsay1hc3QyNzAwLmMNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvTWFr
ZWZpbGUgYi9kcml2ZXJzL2Nsay9NYWtlZmlsZQ0KPj4gaW5kZXggZjc5M2ExNmNhZDQwLi4wZDU5
OTJlYTBmYTQgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2Nsay9NYWtlZmlsZQ0KPj4gKysrIGIv
ZHJpdmVycy9jbGsvTWFrZWZpbGUNCj4+IEBAIC0zOCw2ICszOCw3IEBAIG9iai0kKENPTkZJR19D
T01NT05fQ0xLX0ZTTF9TQUkpICAgICs9IGNsay1mc2wtc2FpLm8NCj4+ICBvYmotJChDT05GSUdf
Q09NTU9OX0NMS19HRU1JTkkpICAgICAgICAgICAgICArPSBjbGstZ2VtaW5pLm8NCj4+ICBvYmot
JChDT05GSUdfQ09NTU9OX0NMS19BU1BFRUQpICAgICAgICAgICAgICArPSBjbGstYXNwZWVkLm8N
Cj4+ICBvYmotJChDT05GSUdfTUFDSF9BU1BFRURfRzYpICAgICAgICAgKz0gY2xrLWFzdDI2MDAu
bw0KPj4gK29iai0kKENPTkZJR19NQUNIX0FTUEVFRF9HNykgICAgICAgICArPSBjbGstYXN0Mjcw
MC5vDQo+DQo+Li4uDQo+DQo+PiArDQo+PiArc3RhdGljIGNvbnN0IGNoYXIgKmNvbnN0IHBzcGNs
a19zZWxbXSA9IHsNCj4+ICsgICAgICJzb2MwLW1wbGwiLA0KPj4gKyAgICAgInNvYzAtaHBsbCIs
DQo+PiArfTsNCj4+ICsNCj4+ICtzdGF0aWMgY29uc3QgY2hhciAqY29uc3Qgc29jMF91YXJ0Y2xr
X3NlbFtdID0gew0KPj4gKyAgICAgInNvYzAtY2xrMjRNaHoiLA0KPj4gKyAgICAgInNvYzAtY2xr
MTkyTWh6IiwNCj4+ICt9Ow0KPj4gKw0KPj4gK3N0YXRpYyBjb25zdCBjaGFyICpjb25zdCBlbW1j
Y2xrX3NlbFtdID0gew0KPj4gKyAgICAgInNvYzAtbXBsbF9kaXY0IiwNCj4+ICsgICAgICJzb2Mw
LWhwbGxfZGl2NCIsDQo+PiArfTsNCj4+ICsNCj4+ICtzdGF0aWMgaW50IGFzdDI3MDBfc29jMF9j
bGtfaW5pdChzdHJ1Y3QgZGV2aWNlX25vZGUgKnNvYzBfbm9kZSkNCj4+ICt7DQo+PiArICAgICBz
dHJ1Y3QgY2xrX2h3X29uZWNlbGxfZGF0YSAqY2xrX2RhdGE7DQo+PiArICAgICB2b2lkIF9faW9t
ZW0gKmNsa19iYXNlOw0KPj4gKyAgICAgc3RydWN0IGFzdDI3MDBfcmVzZXQgKnJlc2V0Ow0KPj4g
KyAgICAgc3RydWN0IGNsa19odyAqKmNsa3M7DQo+PiArICAgICBpbnQgZGl2Ow0KPj4gKyAgICAg
dTMyIHZhbDsNCj4+ICsgICAgIGludCByZXQ7DQo+PiArDQo+PiArICAgICBjbGtfZGF0YSA9IGt6
YWxsb2Moc3RydWN0X3NpemUoY2xrX2RhdGEsIGh3cywgU09DMF9OVU1fQ0xLUyksIEdGUF9LRVJO
RUwpOw0KPj4gKyAgICAgaWYgKCFjbGtfZGF0YSkNCj4+ICsgICAgICAgICAgICAgcmV0dXJuIC1F
Tk9NRU07DQo+PiArDQo+PiArICAgICBjbGtfZGF0YS0+bnVtID0gU09DMF9OVU1fQ0xLUzsNCj4+
ICsgICAgIGNsa3MgPSBjbGtfZGF0YS0+aHdzOw0KPj4gKw0KPj4gKyAgICAgY2xrX2Jhc2UgPSBv
Zl9pb21hcChzb2MwX25vZGUsIDApOw0KPj4gKyAgICAgaWYgKFdBUk5fT04oSVNfRVJSKGNsa19i
YXNlKSkpDQo+DQo+RHJvcCBXQVJOX09ODQpJIHJlbWluZCBSeWFuIGZvciB0aGlzIGZpeC4gSGUg
d2lsbCByZXBseSBpbiB0aGVzZSBzZXJpZXMuDQpbNC80XSBkdC1iaW5kaW5nczogY2xvY2s6IEFk
ZCBBU1QyNzAwIGNsb2NrIGJpbmRpbmdzIC0gUGF0Y2h3b3JrIChrZXJuZWwub3JnKTxodHRwczov
L3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtY2xrL3BhdGNoLzIwMjQwODA4MDc1
OTM3LjI3NTY3MzMtNS1yeWFuX2NoZW5AYXNwZWVkdGVjaC5jb20vPg0KDQoNCj4+ICsgICAgICAg
ICAgICAgcmV0dXJuIFBUUl9FUlIoY2xrX2Jhc2UpOw0KPj4gKw0KPj4gKyAgICAgcmVzZXQgPSBr
emFsbG9jKHNpemVvZigqcmVzZXQpLCBHRlBfS0VSTkVMKTsNCj4+ICsgICAgIGlmICghcmVzZXQp
DQo+PiArICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOw0KPj4gKw0KPj4gKyAgICAgcmVzZXQt
PmJhc2UgPSBjbGtfYmFzZTsNCj4+ICsNCj4+ICsgICAgIHJlc2V0LT5yY2Rldi5vd25lciA9IFRI
SVNfTU9EVUxFOw0KPj4gKyAgICAgcmVzZXQtPnJjZGV2Lm5yX3Jlc2V0cyA9IFNPQzBfUkVTRVRf
TlVNUzsNCj4+ICsgICAgIHJlc2V0LT5yY2Rldi5vcHMgPSAmYXN0MjcwMF9yZXNldF9vcHM7DQo+
PiArICAgICByZXNldC0+cmNkZXYub2Zfbm9kZSA9IHNvYzBfbm9kZTsNCj4+ICsNCj4+ICsgICAg
IHJldCA9IHJlc2V0X2NvbnRyb2xsZXJfcmVnaXN0ZXIoJnJlc2V0LT5yY2Rldik7DQo+PiArICAg
ICBpZiAocmV0KSB7DQo+PiArICAgICAgICAgICAgIHByX2Vycigic29jMCBmYWlsZWQgdG8gcmVn
aXN0ZXIgcmVzZXQgY29udHJvbGxlclxuIik7DQo+PiArICAgICAgICAgICAgIHJldHVybiByZXQ7
DQo+PiArICAgICB9DQo+PiArDQo+PiArICAgICAvL3JlZmNsaw0KPg0KPldlaXJkIGNvbW1lbnQu
IFBsZWFzZSByZWFkIENvZGluZyBTdHlsZS4NCkkgcmVtaW5kIFJ5YW4gZm9yIHRoaXMgZml4LiBI
ZSB3aWxsIHJlcGx5IGluIHRoZXNlIHNlcmllcy4NCls0LzRdIGR0LWJpbmRpbmdzOiBjbG9jazog
QWRkIEFTVDI3MDAgY2xvY2sgYmluZGluZ3MgLSBQYXRjaHdvcmsgKGtlcm5lbC5vcmcpPGh0dHBz
Oi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1jbGsvcGF0Y2gvMjAyNDA4MDgw
NzU5MzcuMjc1NjczMy01LXJ5YW5fY2hlbkBhc3BlZWR0ZWNoLmNvbS8+DQoNCj4NCj4NCj4+ICsg
ICAgIGNsa3NbU0NVMF9DTEtJTl0gPQ0KPj4gKyAgICAgICAgICAgICBjbGtfaHdfcmVnaXN0ZXJf
Zml4ZWRfcmF0ZShOVUxMLCAic29jMC1jbGtpbiIsIE5VTEwsIDAsIFNDVV9DTEtfMjVNSFopOw0K
Pj4gKw0KPj4gKyAgICAgY2xrc1tTQ1UwX0NMS18yNE1dID0NCj4+ICsgICAgICAgICAgICAgY2xr
X2h3X3JlZ2lzdGVyX2ZpeGVkX3JhdGUoTlVMTCwgInNvYzAtY2xrMjRNaHoiLCBOVUxMLCAwLCBT
Q1VfQ0xLXzI0TUhaKTsNCj4+ICsNCj4+ICsgICAgIGNsa3NbU0NVMF9DTEtfMTkyTV0gPQ0KPj4g
KyAgICAgICAgICAgICBjbGtfaHdfcmVnaXN0ZXJfZml4ZWRfcmF0ZShOVUxMLCAic29jMC1jbGsx
OTJNaHoiLCBOVUxMLCAwLCBTQ1VfQ0xLXzE5Mk1IWik7DQo+PiArDQo+PiArICAgICAvL2hwbGwN
Cj4+ICsgICAgIHZhbCA9IHJlYWRsKGNsa19iYXNlICsgU0NVMF9IV1NUUkFQMSk7DQo+PiArICAg
ICBpZiAoKHZhbCAmIEdFTk1BU0soMywgMikpICE9IDApIHsNCj4+ICsgICAgICAgICAgICAgc3dp
dGNoICgodmFsICYgR0VOTUFTSygzLCAyKSkgPj4gMikgew0KPj4gKyAgICAgICAgICAgICBjYXNl
IDE6DQo+PiArICAgICAgICAgICAgICAgICAgICAgY2xrc1tTQ1UwX0NMS19IUExMXSA9DQo+PiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjbGtfaHdfcmVnaXN0ZXJfZml4ZWRfcmF0ZShO
VUxMLCAic29jMC1ocGxsIiwgTlVMTCwgMCwgMTkwMDAwMDAwMCk7DQo+PiArICAgICAgICAgICAg
ICAgICAgICAgYnJlYWs7DQo+PiArICAgICAgICAgICAgIGNhc2UgMjoNCj4+ICsgICAgICAgICAg
ICAgICAgICAgICBjbGtzW1NDVTBfQ0xLX0hQTExdID0NCj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGNsa19od19yZWdpc3Rlcl9maXhlZF9yYXRlKE5VTEwsICJzb2MwLWhwbGwiLCBO
VUxMLCAwLCAxODAwMDAwMDAwKTsNCj4+ICsgICAgICAgICAgICAgICAgICAgICBicmVhazsNCj4+
ICsgICAgICAgICAgICAgY2FzZSAzOg0KPj4gKyAgICAgICAgICAgICAgICAgICAgIGNsa3NbU0NV
MF9DTEtfSFBMTF0gPQ0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY2xrX2h3X3Jl
Z2lzdGVyX2ZpeGVkX3JhdGUoTlVMTCwgInNvYzAtaHBsbCIsIE5VTEwsIDAsIDE3MDAwMDAwMDAp
Ow0KPj4gKyAgICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KPj4gKyAgICAgICAgICAgICB9DQo+
PiArICAgICB9IGVsc2Ugew0KPj4gKyAgICAgICAgICAgICB2YWwgPSByZWFkbChjbGtfYmFzZSAr
IFNDVTBfSFBMTF9QQVJBTSk7DQo+PiArICAgICAgICAgICAgIGNsa3NbU0NVMF9DTEtfSFBMTF0g
PSBhc3QyNzAwX3NvYzBfaHdfcGxsKCJzb2MwLWhwbGwiLCAic29jMC1jbGtpbiIsIHZhbCk7DQo+
PiArICAgICB9DQo+PiArICAgICBjbGtzW1NDVTBfQ0xLX0hQTExfRElWMl0gPSBjbGtfaHdfcmVn
aXN0ZXJfZml4ZWRfZmFjdG9yKE5VTEwsICJzb2MwLWhwbGxfZGl2MiIsICJzb2MwLWhwbGwiLCAw
LCAxLCAyKTsNCj4+ICsgICAgIGNsa3NbU0NVMF9DTEtfSFBMTF9ESVY0XSA9IGNsa19od19yZWdp
c3Rlcl9maXhlZF9mYWN0b3IoTlVMTCwgInNvYzAtaHBsbF9kaXY0IiwgInNvYzAtaHBsbCIsIDAs
IDEsIDQpOw0KPj4gKw0KPj4gKyAgICAgLy9kcGxsDQo+DQoNCi0tDQpCZXN0IFJlZ2FyZHMsDQpL
ZXZpbi4gQ2hlbg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KsUil86rMOiBL
cnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+DQqxSKXzpOm0wTogMjAyNKZ+N6Tr
Mjak6SCkVaTIIDA3OjEzDQqmrKXzqsw6IEtldmluIENoZW4gPGtldmluX2NoZW5AYXNwZWVkdGVj
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
b3JnIDxsaW51eC1jbGtAdmdlci5rZXJuZWwub3JnPg0KpUSmrjogUmU6IFtQQVRDSCB2MSAwMy8x
MF0gY2xrOiBhc3QyNzAwOiBhZGQgY2xvY2sgY29udHJvbGxlcg0KDQpPbiAyNi8wNy8yMDI0IDEz
OjAzLCBLZXZpbiBDaGVuIHdyb3RlOg0KPiBTaWduZWQtb2ZmLWJ5OiBLZXZpbiBDaGVuIDxrZXZp
bl9jaGVuQGFzcGVlZHRlY2guY29tPg0KDQpTbyB5b3UgZGlkIG5vdCB3cml0ZSBjb21taXQgbXNn
cyB0byBub25lIG9mIHRoZSBjb21taXRzPw0KDQo+IC0tLQ0KPiAgZHJpdmVycy9jbGsvTWFrZWZp
bGUgICAgICB8ICAgIDEgKw0KPiAgZHJpdmVycy9jbGsvY2xrLWFzdDI3MDAuYyB8IDExNjYgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAx
MTY3IGluc2VydGlvbnMoKykNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2Nsay9jbGst
YXN0MjcwMC5jDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9NYWtlZmlsZSBiL2RyaXZl
cnMvY2xrL01ha2VmaWxlDQo+IGluZGV4IGY3OTNhMTZjYWQ0MC4uMGQ1OTkyZWEwZmE0IDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL2Nsay9NYWtlZmlsZQ0KPiArKysgYi9kcml2ZXJzL2Nsay9NYWtl
ZmlsZQ0KPiBAQCAtMzgsNiArMzgsNyBAQCBvYmotJChDT05GSUdfQ09NTU9OX0NMS19GU0xfU0FJ
KSAgICArPSBjbGstZnNsLXNhaS5vDQo+ICBvYmotJChDT05GSUdfQ09NTU9OX0NMS19HRU1JTkkp
ICAgICAgICAgICAgICArPSBjbGstZ2VtaW5pLm8NCj4gIG9iai0kKENPTkZJR19DT01NT05fQ0xL
X0FTUEVFRCkgICAgICAgICAgICAgICs9IGNsay1hc3BlZWQubw0KPiAgb2JqLSQoQ09ORklHX01B
Q0hfQVNQRUVEX0c2KSAgICAgICAgICs9IGNsay1hc3QyNjAwLm8NCj4gK29iai0kKENPTkZJR19N
QUNIX0FTUEVFRF9HNykgICAgICAgICArPSBjbGstYXN0MjcwMC5vDQoNCi4uLg0KDQo+ICsNCj4g
K3N0YXRpYyBjb25zdCBjaGFyICpjb25zdCBwc3BjbGtfc2VsW10gPSB7DQo+ICsgICAgICJzb2Mw
LW1wbGwiLA0KPiArICAgICAic29jMC1ocGxsIiwNCj4gK307DQo+ICsNCj4gK3N0YXRpYyBjb25z
dCBjaGFyICpjb25zdCBzb2MwX3VhcnRjbGtfc2VsW10gPSB7DQo+ICsgICAgICJzb2MwLWNsazI0
TWh6IiwNCj4gKyAgICAgInNvYzAtY2xrMTkyTWh6IiwNCj4gK307DQo+ICsNCj4gK3N0YXRpYyBj
b25zdCBjaGFyICpjb25zdCBlbW1jY2xrX3NlbFtdID0gew0KPiArICAgICAic29jMC1tcGxsX2Rp
djQiLA0KPiArICAgICAic29jMC1ocGxsX2RpdjQiLA0KPiArfTsNCj4gKw0KPiArc3RhdGljIGlu
dCBhc3QyNzAwX3NvYzBfY2xrX2luaXQoc3RydWN0IGRldmljZV9ub2RlICpzb2MwX25vZGUpDQo+
ICt7DQo+ICsgICAgIHN0cnVjdCBjbGtfaHdfb25lY2VsbF9kYXRhICpjbGtfZGF0YTsNCj4gKyAg
ICAgdm9pZCBfX2lvbWVtICpjbGtfYmFzZTsNCj4gKyAgICAgc3RydWN0IGFzdDI3MDBfcmVzZXQg
KnJlc2V0Ow0KPiArICAgICBzdHJ1Y3QgY2xrX2h3ICoqY2xrczsNCj4gKyAgICAgaW50IGRpdjsN
Cj4gKyAgICAgdTMyIHZhbDsNCj4gKyAgICAgaW50IHJldDsNCj4gKw0KPiArICAgICBjbGtfZGF0
YSA9IGt6YWxsb2Moc3RydWN0X3NpemUoY2xrX2RhdGEsIGh3cywgU09DMF9OVU1fQ0xLUyksIEdG
UF9LRVJORUwpOw0KPiArICAgICBpZiAoIWNsa19kYXRhKQ0KPiArICAgICAgICAgICAgIHJldHVy
biAtRU5PTUVNOw0KPiArDQo+ICsgICAgIGNsa19kYXRhLT5udW0gPSBTT0MwX05VTV9DTEtTOw0K
PiArICAgICBjbGtzID0gY2xrX2RhdGEtPmh3czsNCj4gKw0KPiArICAgICBjbGtfYmFzZSA9IG9m
X2lvbWFwKHNvYzBfbm9kZSwgMCk7DQo+ICsgICAgIGlmIChXQVJOX09OKElTX0VSUihjbGtfYmFz
ZSkpKQ0KDQpEcm9wIFdBUk5fT04NCg0KPiArICAgICAgICAgICAgIHJldHVybiBQVFJfRVJSKGNs
a19iYXNlKTsNCj4gKw0KPiArICAgICByZXNldCA9IGt6YWxsb2Moc2l6ZW9mKCpyZXNldCksIEdG
UF9LRVJORUwpOw0KPiArICAgICBpZiAoIXJlc2V0KQ0KPiArICAgICAgICAgICAgIHJldHVybiAt
RU5PTUVNOw0KPiArDQo+ICsgICAgIHJlc2V0LT5iYXNlID0gY2xrX2Jhc2U7DQo+ICsNCj4gKyAg
ICAgcmVzZXQtPnJjZGV2Lm93bmVyID0gVEhJU19NT0RVTEU7DQo+ICsgICAgIHJlc2V0LT5yY2Rl
di5ucl9yZXNldHMgPSBTT0MwX1JFU0VUX05VTVM7DQo+ICsgICAgIHJlc2V0LT5yY2Rldi5vcHMg
PSAmYXN0MjcwMF9yZXNldF9vcHM7DQo+ICsgICAgIHJlc2V0LT5yY2Rldi5vZl9ub2RlID0gc29j
MF9ub2RlOw0KPiArDQo+ICsgICAgIHJldCA9IHJlc2V0X2NvbnRyb2xsZXJfcmVnaXN0ZXIoJnJl
c2V0LT5yY2Rldik7DQo+ICsgICAgIGlmIChyZXQpIHsNCj4gKyAgICAgICAgICAgICBwcl9lcnIo
InNvYzAgZmFpbGVkIHRvIHJlZ2lzdGVyIHJlc2V0IGNvbnRyb2xsZXJcbiIpOw0KPiArICAgICAg
ICAgICAgIHJldHVybiByZXQ7DQo+ICsgICAgIH0NCj4gKw0KPiArICAgICAvL3JlZmNsaw0KDQpX
ZWlyZCBjb21tZW50LiBQbGVhc2UgcmVhZCBDb2RpbmcgU3R5bGUuDQoNCg0KPiArICAgICBjbGtz
W1NDVTBfQ0xLSU5dID0NCj4gKyAgICAgICAgICAgICBjbGtfaHdfcmVnaXN0ZXJfZml4ZWRfcmF0
ZShOVUxMLCAic29jMC1jbGtpbiIsIE5VTEwsIDAsIFNDVV9DTEtfMjVNSFopOw0KPiArDQo+ICsg
ICAgIGNsa3NbU0NVMF9DTEtfMjRNXSA9DQo+ICsgICAgICAgICAgICAgY2xrX2h3X3JlZ2lzdGVy
X2ZpeGVkX3JhdGUoTlVMTCwgInNvYzAtY2xrMjRNaHoiLCBOVUxMLCAwLCBTQ1VfQ0xLXzI0TUha
KTsNCj4gKw0KPiArICAgICBjbGtzW1NDVTBfQ0xLXzE5Mk1dID0NCj4gKyAgICAgICAgICAgICBj
bGtfaHdfcmVnaXN0ZXJfZml4ZWRfcmF0ZShOVUxMLCAic29jMC1jbGsxOTJNaHoiLCBOVUxMLCAw
LCBTQ1VfQ0xLXzE5Mk1IWik7DQo+ICsNCj4gKyAgICAgLy9ocGxsDQo+ICsgICAgIHZhbCA9IHJl
YWRsKGNsa19iYXNlICsgU0NVMF9IV1NUUkFQMSk7DQo+ICsgICAgIGlmICgodmFsICYgR0VOTUFT
SygzLCAyKSkgIT0gMCkgew0KPiArICAgICAgICAgICAgIHN3aXRjaCAoKHZhbCAmIEdFTk1BU0so
MywgMikpID4+IDIpIHsNCj4gKyAgICAgICAgICAgICBjYXNlIDE6DQo+ICsgICAgICAgICAgICAg
ICAgICAgICBjbGtzW1NDVTBfQ0xLX0hQTExdID0NCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgY2xrX2h3X3JlZ2lzdGVyX2ZpeGVkX3JhdGUoTlVMTCwgInNvYzAtaHBsbCIsIE5VTEws
IDAsIDE5MDAwMDAwMDApOw0KPiArICAgICAgICAgICAgICAgICAgICAgYnJlYWs7DQo+ICsgICAg
ICAgICAgICAgY2FzZSAyOg0KPiArICAgICAgICAgICAgICAgICAgICAgY2xrc1tTQ1UwX0NMS19I
UExMXSA9DQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNsa19od19yZWdpc3Rlcl9m
aXhlZF9yYXRlKE5VTEwsICJzb2MwLWhwbGwiLCBOVUxMLCAwLCAxODAwMDAwMDAwKTsNCj4gKyAg
ICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KPiArICAgICAgICAgICAgIGNhc2UgMzoNCj4gKyAg
ICAgICAgICAgICAgICAgICAgIGNsa3NbU0NVMF9DTEtfSFBMTF0gPQ0KPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBjbGtfaHdfcmVnaXN0ZXJfZml4ZWRfcmF0ZShOVUxMLCAic29jMC1o
cGxsIiwgTlVMTCwgMCwgMTcwMDAwMDAwMCk7DQo+ICsgICAgICAgICAgICAgICAgICAgICBicmVh
azsNCj4gKyAgICAgICAgICAgICB9DQo+ICsgICAgIH0gZWxzZSB7DQo+ICsgICAgICAgICAgICAg
dmFsID0gcmVhZGwoY2xrX2Jhc2UgKyBTQ1UwX0hQTExfUEFSQU0pOw0KPiArICAgICAgICAgICAg
IGNsa3NbU0NVMF9DTEtfSFBMTF0gPSBhc3QyNzAwX3NvYzBfaHdfcGxsKCJzb2MwLWhwbGwiLCAi
c29jMC1jbGtpbiIsIHZhbCk7DQo+ICsgICAgIH0NCj4gKyAgICAgY2xrc1tTQ1UwX0NMS19IUExM
X0RJVjJdID0gY2xrX2h3X3JlZ2lzdGVyX2ZpeGVkX2ZhY3RvcihOVUxMLCAic29jMC1ocGxsX2Rp
djIiLCAic29jMC1ocGxsIiwgMCwgMSwgMik7DQo+ICsgICAgIGNsa3NbU0NVMF9DTEtfSFBMTF9E
SVY0XSA9IGNsa19od19yZWdpc3Rlcl9maXhlZF9mYWN0b3IoTlVMTCwgInNvYzAtaHBsbF9kaXY0
IiwgInNvYzAtaHBsbCIsIDAsIDEsIDQpOw0KPiArDQo+ICsgICAgIC8vZHBsbA0KDQoNCg0KQmVz
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

--_000_PSAPR06MB4949585D1558386AC9FC463E89802PSAPR06MB4949apcp_
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
<div style=3D"margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MS=
FontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0,=
 0, 0);">
I will speperate clock part in the v3 patch into Ryan's clock series.</div>
<div style=3D"margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MS=
FontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0,=
 0, 0);">
<br>
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&gt;So you did not write commit msgs to none of the commits?</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; ---</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp;drivers/clk/Makefile &nbsp; &nbsp; &nbsp;| &nbsp; &nbsp;1 +<=
/div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp;drivers/clk/clk-ast2700.c | 1166 +++++++++++++++++++++++++++=
++++++++++</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp;2 files changed, 1167 insertions(+)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp;create mode 100644 drivers/clk/clk-ast2700.c</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; index f793a16cad40..0d5992ea0fa4 100644</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; --- a/drivers/clk/Makefile</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; +++ b/drivers/clk/Makefile</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; @@ -38,6 +38,7 @@ obj-$(CONFIG_COMMON_CLK_FSL_SAI) &nbsp; &nbsp;+=
=3D clk-fsl-sai.o</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp;obj-$(CONFIG_COMMON_CLK_GEMINI) &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;+=3D clk-gemini.o</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp;obj-$(CONFIG_COMMON_CLK_ASPEED) &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;+=3D clk-aspeed.o</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp;obj-$(CONFIG_MACH_ASPEED_G6) &nbsp; &nbsp; &nbsp; &nbsp; +=
=3D clk-ast2600.o</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; +obj-$(CONFIG_MACH_ASPEED_G7) &nbsp; &nbsp; &nbsp; &nbsp; +=3D clk=
-ast2700.o</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;...</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; +static const char *const pspclk_sel[] =3D {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &quot;soc0-mpll&quot;,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &quot;soc0-hpll&quot;,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; +};</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; +static const char *const soc0_uartclk_sel[] =3D {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &quot;soc0-clk24Mhz&quot;,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &quot;soc0-clk192Mhz&quot;,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; +};</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; +static const char *const emmcclk_sel[] =3D {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &quot;soc0-mpll_div4&quot;,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &quot;soc0-hpll_div4&quot;,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; +};</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; +static int ast2700_soc0_clk_init(struct device_node *soc0_node)</=
div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; +{</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; struct clk_hw_onecell_data *clk_data;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; void __iomem *clk_base;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; struct ast2700_reset *reset;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; struct clk_hw **clks;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; int div;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; u32 val;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; int ret;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; clk_data =3D kzalloc(struct_size(clk_data, hws, SO=
C0_NUM_CLKS), GFP_KERNEL);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; if (!clk_data)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return -ENOMEM;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; clk_data-&gt;num =3D SOC0_NUM_CLKS;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; clks =3D clk_data-&gt;hws;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; clk_base =3D of_iomap(soc0_node, 0);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; if (WARN_ON(IS_ERR(clk_base)))</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;Drop WARN_ON</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
I remind Ryan for this fix. He will reply in these series.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<a href=3D"https://patchwork.kernel.org/project/linux-clk/patch/20240808075=
937.2756733-5-ryan_chen@aspeedtech.com/" id=3D"OWAb71c9975-6163-984c-09f3-6=
224bf53cede" class=3D"OWAAutoLink">[4/4] dt-bindings: clock: Add AST2700 cl=
ock bindings - Patchwork (kernel.org)</a></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return PTR_ERR(clk_bas=
e);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; reset =3D kzalloc(sizeof(*reset), GFP_KERNEL);</di=
v>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; if (!reset)</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return -ENOMEM;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; reset-&gt;base =3D clk_base;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; reset-&gt;rcdev.owner =3D THIS_MODULE;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; reset-&gt;rcdev.nr_resets =3D SOC0_RESET_NUMS;</di=
v>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; reset-&gt;rcdev.ops =3D &amp;ast2700_reset_ops;</d=
iv>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; reset-&gt;rcdev.of_node =3D soc0_node;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; ret =3D reset_controller_register(&amp;reset-&gt;r=
cdev);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; if (ret) {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; pr_err(&quot;soc0 fail=
ed to register reset controller\n&quot;);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return ret;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; }</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; //refclk</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&gt;Weird comment. Please read Coding Style.</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, C=
alibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
I remind Ryan for this fix. He will reply in these series.</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, C=
alibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<a href=3D"https://patchwork.kernel.org/project/linux-clk/patch/20240808075=
937.2756733-5-ryan_chen@aspeedtech.com/" id=3D"OWA704b0821-8f44-4ea3-d387-0=
cf0ee8d11df" class=3D"OWAAutoLink" style=3D"margin: 0px;">[4/4] dt-bindings=
: clock: Add AST2700 clock bindings - Patchwork
 (kernel.org)</a></div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, C=
alibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; clks[SCU0_CLKIN] =3D</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; clk_hw_register_fixed_=
rate(NULL, &quot;soc0-clkin&quot;, NULL, 0, SCU_CLK_25MHZ);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; clks[SCU0_CLK_24M] =3D</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; clk_hw_register_fixed_=
rate(NULL, &quot;soc0-clk24Mhz&quot;, NULL, 0, SCU_CLK_24MHZ);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; clks[SCU0_CLK_192M] =3D</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; clk_hw_register_fixed_=
rate(NULL, &quot;soc0-clk192Mhz&quot;, NULL, 0, SCU_CLK_192MHZ);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; //hpll</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; val =3D readl(clk_base + SCU0_HWSTRAP1);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; if ((val &amp; GENMASK(3, 2)) !=3D 0) {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; switch ((val &amp; GEN=
MASK(3, 2)) &gt;&gt; 2) {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; case 1:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; clks[SCU0_CLK_HPLL] =3D</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; clk_hw_register_fixed_rate(NULL, &quot;so=
c0-hpll&quot;, NULL, 0, 1900000000);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; break;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; case 2:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; clks[SCU0_CLK_HPLL] =3D</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; clk_hw_register_fixed_rate(NULL, &quot;so=
c0-hpll&quot;, NULL, 0, 1800000000);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; break;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; case 3:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; clks[SCU0_CLK_HPLL] =3D</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; clk_hw_register_fixed_rate(NULL, &quot;so=
c0-hpll&quot;, NULL, 0, 1700000000);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; break;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; } else {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; val =3D readl(clk_base=
 + SCU0_HPLL_PARAM);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; clks[SCU0_CLK_HPLL] =
=3D ast2700_soc0_hw_pll(&quot;soc0-hpll&quot;, &quot;soc0-clkin&quot;, val)=
;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; }</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; clks[SCU0_CLK_HPLL_DIV2] =3D clk_hw_register_fixed=
_factor(NULL, &quot;soc0-hpll_div2&quot;, &quot;soc0-hpll&quot;, 0, 1, 2);<=
/div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; clks[SCU0_CLK_HPLL_DIV4] =3D clk_hw_register_fixed=
_factor(NULL, &quot;soc0-hpll_div4&quot;, &quot;soc0-hpll&quot;, 0, 1, 4);<=
/div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; //dpll</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&gt;</div>
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
3<br>
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
<b>=A5D=A6=AE:</b>&nbsp;Re: [PATCH v1 03/10] clk: ast2700: add clock contro=
ller</span>
<div>&nbsp;</div>
</div>
<div style=3D"font-size: 11pt;">On 26/07/2024 13:03, Kevin Chen wrote:<br>
&gt; Signed-off-by: Kevin Chen &lt;kevin_chen@aspeedtech.com&gt;<br>
<br>
So you did not write commit msgs to none of the commits?<br>
<br>
&gt; ---<br>
&gt;&nbsp; drivers/clk/Makefile&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;=
&nbsp; 1 +<br>
&gt;&nbsp; drivers/clk/clk-ast2700.c | 1166 +++++++++++++++++++++++++++++++=
++++++<br>
&gt;&nbsp; 2 files changed, 1167 insertions(+)<br>
&gt;&nbsp; create mode 100644 drivers/clk/clk-ast2700.c<br>
&gt;<br>
&gt; diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile<br>
&gt; index f793a16cad40..0d5992ea0fa4 100644<br>
&gt; --- a/drivers/clk/Makefile<br>
&gt; +++ b/drivers/clk/Makefile<br>
&gt; @@ -38,6 +38,7 @@ obj-$(CONFIG_COMMON_CLK_FSL_SAI)&nbsp;&nbsp;&nbsp; +=
=3D clk-fsl-sai.o<br>
&gt;&nbsp; obj-$(CONFIG_COMMON_CLK_GEMINI)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; +=3D clk-gemini.o<br>
&gt;&nbsp; obj-$(CONFIG_COMMON_CLK_ASPEED)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; +=3D clk-aspeed.o<br>
&gt;&nbsp; obj-$(CONFIG_MACH_ASPEED_G6)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; +=3D clk-ast2600.o<br>
&gt; +obj-$(CONFIG_MACH_ASPEED_G7)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; +=3D clk-ast2700.o<br>
<br>
...<br>
<br>
&gt; +<br>
&gt; +static const char *const pspclk_sel[] =3D {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; &quot;soc0-mpll&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; &quot;soc0-hpll&quot;,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static const char *const soc0_uartclk_sel[] =3D {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; &quot;soc0-clk24Mhz&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; &quot;soc0-clk192Mhz&quot;,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static const char *const emmcclk_sel[] =3D {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; &quot;soc0-mpll_div4&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; &quot;soc0-hpll_div4&quot;,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static int ast2700_soc0_clk_init(struct device_node *soc0_node)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct clk_hw_onecell_data *clk_data;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; void __iomem *clk_base;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct ast2700_reset *reset;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct clk_hw **clks;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int div;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; u32 val;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; clk_data =3D kzalloc(struct_size(clk_data, h=
ws, SOC0_NUM_CLKS), GFP_KERNEL);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (!clk_data)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return -ENOMEM;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; clk_data-&gt;num =3D SOC0_NUM_CLKS;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; clks =3D clk_data-&gt;hws;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; clk_base =3D of_iomap(soc0_node, 0);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (WARN_ON(IS_ERR(clk_base)))<br>
<br>
Drop WARN_ON<br>
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return PTR_ERR(clk_base);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; reset =3D kzalloc(sizeof(*reset), GFP_KERNEL=
);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (!reset)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return -ENOMEM;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; reset-&gt;base =3D clk_base;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; reset-&gt;rcdev.owner =3D THIS_MODULE;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; reset-&gt;rcdev.nr_resets =3D SOC0_RESET_NUM=
S;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; reset-&gt;rcdev.ops =3D &amp;ast2700_reset_o=
ps;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; reset-&gt;rcdev.of_node =3D soc0_node;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ret =3D reset_controller_register(&amp;reset=
-&gt;rcdev);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (ret) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; pr_err(&quot;soc0 failed to register reset controller\n&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return ret;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; //refclk<br>
<br>
Weird comment. Please read Coding Style.<br>
<br>
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; clks[SCU0_CLKIN] =3D<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; clk_hw_register_fixed_rate(NULL, &quot;soc0-clkin&quot;, NULL, 0, SCU_C=
LK_25MHZ);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; clks[SCU0_CLK_24M] =3D<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; clk_hw_register_fixed_rate(NULL, &quot;soc0-clk24Mhz&quot;, NULL, 0, SC=
U_CLK_24MHZ);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; clks[SCU0_CLK_192M] =3D<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; clk_hw_register_fixed_rate(NULL, &quot;soc0-clk192Mhz&quot;, NULL, 0, S=
CU_CLK_192MHZ);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; //hpll<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; val =3D readl(clk_base + SCU0_HWSTRAP1);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if ((val &amp; GENMASK(3, 2)) !=3D 0) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; switch ((val &amp; GENMASK(3, 2)) &gt;&gt; 2) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; case 1:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; clks[SCU0_CLK_HPLL] =3D=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; clk_hw_register_fixed_rate(NULL, &quot;soc0-hpll&q=
uot;, NULL, 0, 1900000000);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; case 2:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; clks[SCU0_CLK_HPLL] =3D=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; clk_hw_register_fixed_rate(NULL, &quot;soc0-hpll&q=
uot;, NULL, 0, 1800000000);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; case 3:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; clks[SCU0_CLK_HPLL] =3D=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; clk_hw_register_fixed_rate(NULL, &quot;soc0-hpll&q=
uot;, NULL, 0, 1700000000);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; val =3D readl(clk_base + SCU0_HPLL_PARAM);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; clks[SCU0_CLK_HPLL] =3D ast2700_soc0_hw_pll(&quot;soc0-hpll&quot;, &quo=
t;soc0-clkin&quot;, val);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; clks[SCU0_CLK_HPLL_DIV2] =3D clk_hw_register=
_fixed_factor(NULL, &quot;soc0-hpll_div2&quot;, &quot;soc0-hpll&quot;, 0, 1=
, 2);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; clks[SCU0_CLK_HPLL_DIV4] =3D clk_hw_register=
_fixed_factor(NULL, &quot;soc0-hpll_div4&quot;, &quot;soc0-hpll&quot;, 0, 1=
, 4);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; //dpll<br>
<br>
<br>
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

--_000_PSAPR06MB4949585D1558386AC9FC463E89802PSAPR06MB4949apcp_--
