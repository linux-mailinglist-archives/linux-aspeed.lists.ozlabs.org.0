Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1495B957A0F
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:59:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqL5603Dz87wY
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:58:21 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=ja6TvroQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feae::702; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=kevin_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20702.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::702])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WkvPJ1cPXz2yQJ
	for <linux-aspeed@lists.ozlabs.org>; Thu, 15 Aug 2024 15:51:00 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LQ7PPHycxc35XWWL7vET7TSrbJD9Lr6tHGfwcfJ13nvaAcOykwFEAZ6b6gY9AJjG7zjHIbdv2esg+V1InMwolXWPGT6Bd7FewILc+6JKqWOp1tUU/0FHVDlxx4agd3d1UCffP/a6x5YQaX/pOmLKBbevt7cq7Hr6fhl1jEnLdNiJbLhUQdCUW7KIMuT7w+OHrWvKCyTDtMOB+QQggltyx2YsHZinqLJrYzJNXBs22WLzDVXlDsT+5VZivGgioCLQ+ZXPUebBGJsXefpD8SHsUGB0bgxzLNE2A1GquJFhl7OXQVIW3Q7prl3N6oWsmxwBpTlM0HpuupEW1kFuir3ibg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wo8RgTIiAM6WdRDKyhBsH7AozJfgXJHAn2HNOxXYxqM=;
 b=q4T36+JEO/8NaHbtR86W6tE7J+D/NNMrgmI0wZoK31ovwLtKtiSha3Gy2bVpgz5hEugKPfVt7Ejux1NUDe+88LpdmOZ2f3icnX6zhj2KYPlKrydOcptq2a9b+YGotHOcnOj536+t1+ce2DXrcX6bObjA7GLFiRqUq9HBO6xnMVkpLtcSOSD1Y+EvueZe/npVLAZCOXC3WiCs0zSXXs4jj4l9kXYd4tfSXn7giWwhtGOR1GuDv9/rw+Qljzf0FwXO2FLGx7UKmHBNLIqkjELnUKwgLEG/bSVoOWd9incXe9nHo6DQdQMMZ9cy0wm7+8Owkms1WTc6Memo+kaHiwErCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wo8RgTIiAM6WdRDKyhBsH7AozJfgXJHAn2HNOxXYxqM=;
 b=ja6TvroQXZiNjoohPKs1RSj6NscG+4mHzp/pxNmRKL0uD1JUk+mKulHkAiuInzsCvCga5Nqw8hGBMtNqRvJT7EqF4V5UpPUaSCC9gyrd4+EZkfYajHtvs0prvLvDLYDOvb/SeidQ1Klsv3wijk+xH+iC30cPHqkr7nlHBkQvNe2HGPrLeRaMbhL9D6RcciqpsIS3tQZWVqG6Pso/aQAEqw7O5RtwxDIOSJhIuteZs9iqoQrA3iEIsrRrr+EhJz6JPaC4tcy0nvTHrft5zqWm6FnEgz88F+YQMDt3YdKnvrRKMZRj7LksvyHylSAd95SYlrT+k3W/+wig792jYIt87g==
Received: from PSAPR06MB4949.apcprd06.prod.outlook.com (2603:1096:301:ad::9)
 by SEYPR06MB7000.apcprd06.prod.outlook.com (2603:1096:101:1e3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.16; Thu, 15 Aug
 2024 05:50:34 +0000
Received: from PSAPR06MB4949.apcprd06.prod.outlook.com
 ([fe80::7bdd:639a:6b94:37bf]) by PSAPR06MB4949.apcprd06.prod.outlook.com
 ([fe80::7bdd:639a:6b94:37bf%7]) with mapi id 15.20.7875.016; Thu, 15 Aug 2024
 05:50:34 +0000
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
Subject:  =?big5?B?pl7C0DogW1BBVENIIHYxIDA1LzEwXSBkdC1iaW5kaW5nczogYXJtOiBhc3BlZWQ6?=
 =?big5?Q?_Add_maintainer?=
Thread-Topic: [PATCH v1 05/10] dt-bindings: arm: aspeed: Add maintainer
Thread-Index: AQHa30uLS7p8iSeFD0em3skhlhDe/rII23QAgB7v8HY=
Date: Thu, 15 Aug 2024 05:50:34 +0000
Message-ID:  <PSAPR06MB4949A015CE90F8FA538B106A89802@PSAPR06MB4949.apcprd06.prod.outlook.com>
References: <20240726110355.2181563-1-kevin_chen@aspeedtech.com>
 <20240726110355.2181563-6-kevin_chen@aspeedtech.com>
 <7f3f7255-e177-4689-a2f1-b5f3196ed1a5@kernel.org>
In-Reply-To: <7f3f7255-e177-4689-a2f1-b5f3196ed1a5@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR06MB4949:EE_|SEYPR06MB7000:EE_
x-ms-office365-filtering-correlation-id: 08789be7-c7db-4091-fe41-08dcbcee2e6d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|1800799024|366016|376014|7416014|921020|38070700018;
x-microsoft-antispam-message-info:  =?big5?B?d2Q2dkt5YU1teEFvWDdndmhXRzc0bWNXSDZ0OVlSODdmeGNXRlJsVEtKbjhya0dL?=
 =?big5?B?a1pqdVV1QkcyZXdzb1hyamtobm5mKytRNW1QamJuUWRVY0dtZUNrYVBDQU1sOWxP?=
 =?big5?B?OG51MkhYNXRLam5UeVA4T0pRdHQ1WDNCT1JyN2xkSXh1a21jMWdtNWtWWTV2QjI2?=
 =?big5?B?MmZVc3kxWU9IOUsvZmJqSTIyb2lHMUdhODhCSmhXWFh2U2N1UVVnTk1OR1ArN0NJ?=
 =?big5?B?WEFSZmh1Z0JRRFpQcURKYzRXdmNmME9jZVZkbXZ1Y05iQzRGZHc0ckRnU0M5cWtN?=
 =?big5?B?NEs1MkNDbGFlakY0eFY3MDE5NzZxL3VYVTZKTDQ3YVh2VDNoMmF0MzRweEdacG1D?=
 =?big5?B?emphdkdpbng1bkw0b0NSaEd3UVBvLzBlcmhQa3A0UlRoQ2JOL0JvYis3NWorb2ZX?=
 =?big5?B?dTNDSWUyREE3K2dUVS9qTkJGN3dIMXFUS1VWYkdLbitlQy95QURzc2h2cFEzVEdM?=
 =?big5?B?OU01NU04NXgzeGRDak1jbm90WEpzQm9Ma29zTWlhblVBQzUrTTU2MjM5c2lhVWFi?=
 =?big5?B?WFJwNFM2Zms2T2k4T3k0QVI0Yjc2cktEcVZKbi9QNUgySDlpb0hNN2NyU1NScXN1?=
 =?big5?B?MU9HL3dvVDlCRURyTG8yekF2YVFpL2FZTUsyS1hLb3k0SENCZTlEYThCYlhCQVdW?=
 =?big5?B?ZldRNHV1Wk1FZmdoRkZlL0VPNS9QVFhwWmZHem4vVjU2Zk1ZTG9HZlFIbFNPcFp1?=
 =?big5?B?NVpXM0UrdmFXUHlPQU82bE85eDR5RDVqT3Z5UnVNM0RmeXp2UGpHS2lWQ0JaT2dV?=
 =?big5?B?YllTTURNa25mNFBwUlFaZkdYekwrL0ZEQStuRFVYaGVSRVRydGFhb3RSOVA0a0dM?=
 =?big5?B?VUl6WC9DeFk1K3dJVEFUZlZ5UnhqSEJ3T25Mc0w4aG00cnBvS3ZSamhqaTlkSFR3?=
 =?big5?B?cSt5V0RJUEpCZ01yVjlseUtWSUg1RCt5Z3FnRzd3TnFiYWphbGIyeEJzZmZCRExQ?=
 =?big5?B?NXp0UHdIMEY1T1YyTEt5L3dISEFnemNvREg2S0pBc2k1N3NLU0pXRjRCRDhEamVj?=
 =?big5?B?cnRLN3RWMEQxWkJZNmk1b2traTYwcmJWbTg0ejUwYXk2ZTVMTWVCWDdWS1ZVdEI0?=
 =?big5?B?dEN6bDk5dGFrSThOOGtYUGMzVjhyQ2szWkFod2RkTFQyT2RwVDFnL2srbHVjQ0c2?=
 =?big5?B?WDZlTW1QR0FrNjMyNXhSN1MrTnhCelUzZGYyeExxMEdjWm01Wkw0NWgyZVFWNUtR?=
 =?big5?B?MjAxMG9HeFdpVFYrQW5nMm8rZGhoVzFqaUZtY0d0Q1VZVjltTStzNUhuS1duVExC?=
 =?big5?B?SzVZSHJORHgrdlU5RDhPdnkyVzg4L0pyZzlFR1hRUUczVmdLT1ROTnQ4ZFc0Z0VH?=
 =?big5?B?TlJ0UTB4VXVnYVlGT2c0YmZ2UGNSdGFoRmdxLzBLdWpJZWZ4cy9ZRGZTSUtjckdL?=
 =?big5?B?OWo2VGQ5cGFUUEhOMzV0VVdvT1dVSjgzMDk3STc0WDFDdnZNRG9lVUg5UTBubWkr?=
 =?big5?B?Yjh1MHVHOGlZZWErRFhnTDdDd0xnMW5pNyt6dTlMMWtaYUNocFA2bDgxNUR0QkJ0?=
 =?big5?B?bUMvemtxeDZGSnAxYy9ENmhIZnhoc09TK3lSeGlvYVBvVjRnUkpNekV0ZHJERnVY?=
 =?big5?B?TklKQnJyaEdxTWg4eThSNFJGT0puckFJOVFDaXJaNlVKZ2R5clBTaCtNMHMzNUZs?=
 =?big5?B?VFlvdGs4S1pOeHdSY0dmVzNPNVJBLzRPZGxtTlZYRDVWblNxcVJCMDhDallMaVdQ?=
 =?big5?B?dHJVK050cTA2WjN0Nm9rOEtIRUdWbUgxNHZ2b0VGT2lsc2NmaTFTSnlDb0lRdkJI?=
 =?big5?B?ZEEwd2tzSVFpSzZlcTFiK2xDZWFmQm9seldJQzZyTXM5Z0RLVWtCcXZDTzAzd1JC?=
 =?big5?Q?W8V2i6MEjFo=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR06MB4949.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?big5?B?MFpDcFljbEl4OHcyZ3NWNlBxY3hYeFAvQlJCTkYyVkFyeXVVbHdhWWJpRWh4aStT?=
 =?big5?B?ZEg3aHhiaGNhdE96QnNaU2ljTnhrSGtnaG0vN1BHTzhLNXE2VmorMVZ4cmhsR2Fz?=
 =?big5?B?dlRzdHFOajkzQWFHK2NiVUJqTlMwOVp6MGE2REYyL01EVDZWdk53Si9Oczd2djJv?=
 =?big5?B?RWhVTWhjMzNoRkQzOXlVbjZKZWxmby9CQVZhQWhVeTRJdEJyY0t1UDd4cTRzbHRk?=
 =?big5?B?djdqTWxaR3JPN1p3VitpWUI4VW5kck8vNW5EQ0tCbmltWG1WQSsvUEd6UE5qQlZ3?=
 =?big5?B?TGxYWm9JRWRMcFRvOVFOYWFOVE1Dc0xFb0hzY2NiOWNkK1VBNUt4d25BSTNmMnBJ?=
 =?big5?B?SElXdFNvakp6ako5cklMOEVVMmxNNVgrd08rZHBWS3RqQ3BKczhpOXBjdWszSFpj?=
 =?big5?B?aWlONDlDUnh2ZWNSQlNvcDY3MG8yUXUyMWQ1c1hVOTFzRUwrbWN4dVU1WE5xazVr?=
 =?big5?B?M2lwMGl6UDNFdHFSdVVKQnVrbnV1QzdZTCtEZXpseUExQVpkbTVVdThDV3FjSjdw?=
 =?big5?B?eU5PV1RLL1hNWXF1TWR0Qm5scEFtcHZPejNLRG0yV3JVVkpUYXd1UFVJS1VReUd6?=
 =?big5?B?T1liMHlYc1hSQkZscUtOdmJXV2trQ3dLeElCdjFnSjhpU1c5ZkpHdkxHUjM5ZHRW?=
 =?big5?B?bllhdHpicVM4RCtoaFZ2RWgyYVkzWTF1dGxNZzBHMGQyQ3F6ZmgxQ2VJNUdlYmIx?=
 =?big5?B?UnRDalg2L3g1NGNQbk5iOG5CdkJVVlNnaUdGK1l0b3I4aHFZYmVWR0E3WDhNcVVQ?=
 =?big5?B?KzNUbndRZUJkMzB0Ylo3dDd1RFVHNlVwSDNXQVludnV2NkVOeWE2TlFOSXJlcGJM?=
 =?big5?B?L1pRWjZtNlE5NmxXcU9ad0UyZUc2V2tvVnQ5UGJxbkZrd3AxR05vUklnbmZwaHNL?=
 =?big5?B?RUFEcUFLbmxTR3ErL3JVZHl1ZTF1M01ZUHZkWDhxd3ZwVStMNzJVZVNQdXcvd0Jo?=
 =?big5?B?WTJwcTVFRzlZV0J5c1dHc3hiZlBTOUd4MjNvdHM1K3lBbDRvcDVPMHNpVUkwa1p4?=
 =?big5?B?eVgxRFRrdWZHaUpUMU1QdDUvN2dob1gzMk5VS3IzbU5TcXBlZ2VtOURVdmpYVE41?=
 =?big5?B?STJmREZyeWxwaFZ4eTlOZDZCMEZqdUF5OG5zUjIvTmRGV281UjJ1ZVBRV1BPWDhj?=
 =?big5?B?SC83WjgyRi9SbVhWei8xY01VUHBteTNUelpTa2VDZDcrZkw5bTZZRW0zWkh1c3JM?=
 =?big5?B?ZDdtZEZJaWx6dHVOaExFWnN0ZzN3MngxN2MydWpDNjlsN05VdEFYcHMxaCtRSlcv?=
 =?big5?B?d2VYMGNwLzQ0RjVjYWY1TGo4KzNBcVk3VGhZQzBRNlg0YVRxU2hCY2JUVURMdGVh?=
 =?big5?B?Tm5wanBmMDQ5YUxLelh0TnRLckkrS09wcGpJRlE1RWVNaVFlNnpoVVdjQnByOVNi?=
 =?big5?B?ZDFMRFpNTmphczFiaVhJSzMwaUEyTmJkV2l3QXZrNyt1emgzZ2cwM3MvQk9oR3E4?=
 =?big5?B?Y1ZiYkxoUHQrQ01uTXMrUVcyVi9uZHRWMmo5cXZFUHNReEllblN6elhEMW5mMU5P?=
 =?big5?B?dDRZcGhZK3J6d1hNRVkyVkdlVS85dXozbWd1dTE3S3JpdVp1NytJeVFrY3hoRVBy?=
 =?big5?B?ajJDL3NUcDdJcklVdXV4RWF6cVBZQ0JUR1lScytpbkFNOHBLU25oL3pEdzN5N0Rh?=
 =?big5?B?L3dLeEpLcmwyQkNYall2NHF1V3pFMCtVUGV3WWNNOWE5T1VmMGFLMmloaGduM0Rh?=
 =?big5?B?dFZqWi9FSVVLK0o1ckdwbzlVTUZlYXRYMysxaUZRU0kyaVN6b1ZuU2plajFWTGRm?=
 =?big5?B?Ty83eGpiRDBFUmRaL3pWZTZibTBDb3JPcHhUK1F6N1Bza1poWkRpdnFMSHZNMzY3?=
 =?big5?B?OTFxQS9sOW5KcVpNcHZJUE1DN0ZiRDdHTy9HTWI5NFVWMUFrVWZCbGY0QVVucmlL?=
 =?big5?B?UFVHL1Q5UG9OV2Y1dUpaK3ZzSkdNdHNIMzg1eS9XVW92dEdldE5HcHZsTEFiVUFE?=
 =?big5?B?eTNFVFhuRlNSNUthRE0rbURPN1QvV2F2VkZ5b1lla2RybVQrNXl1dnk2NnE1NWgy?=
 =?big5?Q?kw1QKi/eDVFxpJHf?=
Content-Type: multipart/alternative;
	boundary="_000_PSAPR06MB4949A015CE90F8FA538B106A89802PSAPR06MB4949apcp_"
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4949.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08789be7-c7db-4091-fe41-08dcbcee2e6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2024 05:50:34.6759
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yjqwetVeUx+EUB+CNyASv0DtVaFIfbzN4G9R6dYvhNUE86HpFj4i4pxasq/E8BrpWEt/CkXOFXB6U7mpdIO1pJDKO3hmtd4cDUvyJkQnXII=
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

--_000_PSAPR06MB4949A015CE90F8FA538B106A89802PSAPR06MB4949apcp_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGkgS3J6aywNCg0KPldoeT8NCj4NCj4+IC0tLQ0KPj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9hcm0vYXNwZWVkL2FzcGVlZC55YW1sIHwgMSArDQo+PiAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspDQpBZ3JlZSwgSSB3aWxsIHJlbW92ZSBpdC4NCg0KLS0NCkJlc3Qg
UmVnYXJkcywNCktldmluLiBDaGVuDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
DQqxSKXzqsw6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4NCrFIpfOk6bTB
OiAyMDI0pn43pOsyNqTpIKRVpMggMDc6MTQNCqaspfOqzDogS2V2aW4gQ2hlbiA8a2V2aW5fY2hl
bkBhc3BlZWR0ZWNoLmNvbT47IHJvYmhAa2VybmVsLm9yZyA8cm9iaEBrZXJuZWwub3JnPjsga3J6
aytkdEBrZXJuZWwub3JnIDxrcnprK2R0QGtlcm5lbC5vcmc+OyBjb25vcitkdEBrZXJuZWwub3Jn
IDxjb25vcitkdEBrZXJuZWwub3JnPjsgam9lbEBqbXMuaWQuYXUgPGpvZWxAam1zLmlkLmF1Pjsg
YW5kcmV3QGNvZGVjb25zdHJ1Y3QuY29tLmF1IDxhbmRyZXdAY29kZWNvbnN0cnVjdC5jb20uYXU+
OyBsZWVAa2VybmVsLm9yZyA8bGVlQGtlcm5lbC5vcmc+OyBjYXRhbGluLm1hcmluYXNAYXJtLmNv
bSA8Y2F0YWxpbi5tYXJpbmFzQGFybS5jb20+OyB3aWxsQGtlcm5lbC5vcmcgPHdpbGxAa2VybmVs
Lm9yZz47IGFybmRAYXJuZGIuZGUgPGFybmRAYXJuZGIuZGU+OyBvbG9mQGxpeG9tLm5ldCA8b2xv
ZkBsaXhvbS5uZXQ+OyBzb2NAa2VybmVsLm9yZyA8c29jQGtlcm5lbC5vcmc+OyBtdHVycXVldHRl
QGJheWxpYnJlLmNvbSA8bXR1cnF1ZXR0ZUBiYXlsaWJyZS5jb20+OyBzYm95ZEBrZXJuZWwub3Jn
IDxzYm95ZEBrZXJuZWwub3JnPjsgcC56YWJlbEBwZW5ndXRyb25peC5kZSA8cC56YWJlbEBwZW5n
dXRyb25peC5kZT47IHF1aWNfYmpvcmFuZGVAcXVpY2luYy5jb20gPHF1aWNfYmpvcmFuZGVAcXVp
Y2luYy5jb20+OyBnZWVydCtyZW5lc2FzQGdsaWRlci5iZSA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIu
YmU+OyBkbWl0cnkuYmFyeXNoa292QGxpbmFyby5vcmcgPGRtaXRyeS5iYXJ5c2hrb3ZAbGluYXJv
Lm9yZz47IHNoYXduZ3VvQGtlcm5lbC5vcmcgPHNoYXduZ3VvQGtlcm5lbC5vcmc+OyBuZWlsLmFy
bXN0cm9uZ0BsaW5hcm8ub3JnIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPjsgbS5zenlwcm93
c2tpQHNhbXN1bmcuY29tIDxtLnN6eXByb3dza2lAc2Ftc3VuZy5jb20+OyBuZnJhcHJhZG9AY29s
bGFib3JhLmNvbSA8bmZyYXByYWRvQGNvbGxhYm9yYS5jb20+OyB1LWt1bWFyMUB0aS5jb20gPHUt
a3VtYXIxQHRpLmNvbT47IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnIDxkZXZpY2V0cmVlQHZn
ZXIua2VybmVsLm9yZz47IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZyA8bGlu
dXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnPjsgbGludXgtYXNwZWVkQGxpc3RzLm96
bGFicy5vcmcgPGxpbnV4LWFzcGVlZEBsaXN0cy5vemxhYnMub3JnPjsgbGludXgta2VybmVsQHZn
ZXIua2VybmVsLm9yZyA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz47IGxpbnV4LWNsa0B2
Z2VyLmtlcm5lbC5vcmcgPGxpbnV4LWNsa0B2Z2VyLmtlcm5lbC5vcmc+DQqlRKauOiBSZTogW1BB
VENIIHYxIDA1LzEwXSBkdC1iaW5kaW5nczogYXJtOiBhc3BlZWQ6IEFkZCBtYWludGFpbmVyDQoN
Ck9uIDI2LzA3LzIwMjQgMTM6MDMsIEtldmluIENoZW4gd3JvdGU6DQoNCldoeT8NCg0KPiAtLS0N
Cj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYXNwZWVkL2FzcGVlZC55
YW1sIHwgMSArDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCkJlc3QgcmVnYXJk
cywNCktyenlzenRvZg0KDQoqKioqKioqKioqKioqIEVtYWlsIENvbmZpZGVudGlhbGl0eSBOb3Rp
Y2UgKioqKioqKioqKioqKioqKioqKioNCqdLs2TBbqn6Og0KpburSKXzKKnOqOSq/qXzKaVpr+Cl
Xad0vvexS7jqsFShQajDqPyqa6vfq0/FQKFDpnAgpXi63atEq/ypd6Snpqyl86rMoUG90KVIuXGk
bLZspfOzcaq+pbu5caRstmyl86SntW+wZarMLCCow73Qpd+nWadSsKOlu7lxpGy2bKXzpM6o5Kr+
pfOpTb5Qt7Sp0qazvcamTKXzoUPBwsHCsXqquqZYp0AhDQoNCkRJU0NMQUlNRVI6DQpUaGlzIG1l
c3NhZ2UgKGFuZCBhbnkgYXR0YWNobWVudHMpIG1heSBjb250YWluIGxlZ2FsbHkgcHJpdmlsZWdl
ZCBhbmQvb3Igb3RoZXIgY29uZmlkZW50aWFsIGluZm9ybWF0aW9uLiBJZiB5b3UgaGF2ZSByZWNl
aXZlZCBpdCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIGJ5IHJlcGx5IGUtbWFp
bCBhbmQgaW1tZWRpYXRlbHkgZGVsZXRlIHRoZSBlLW1haWwgYW5kIGFueSBhdHRhY2htZW50cyB3
aXRob3V0IGNvcHlpbmcgb3IgZGlzY2xvc2luZyB0aGUgY29udGVudHMuIFRoYW5rIHlvdS4NCg==

--_000_PSAPR06MB4949A015CE90F8FA538B106A89802PSAPR06MB4949apcp_
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
&gt;Why?</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; ---</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp;Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1=
 +</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&gt;&gt; &nbsp;1 file changed, 1 insertion(+)</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Agree, I will remove it.</div>
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
4<br>
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
<b>=A5D=A6=AE:</b>&nbsp;Re: [PATCH v1 05/10] dt-bindings: arm: aspeed: Add =
maintainer</span>
<div>&nbsp;</div>
</div>
<div style=3D"font-size: 11pt;">On 26/07/2024 13:03, Kevin Chen wrote:<br>
<br>
Why?<br>
<br>
&gt; ---<br>
&gt;&nbsp; Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +<b=
r>
&gt;&nbsp; 1 file changed, 1 insertion(+)<br>
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

--_000_PSAPR06MB4949A015CE90F8FA538B106A89802PSAPR06MB4949apcp_--
