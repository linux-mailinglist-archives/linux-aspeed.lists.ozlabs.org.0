Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C862F9579FF
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:59:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqL12mw7z2xCd
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:58:17 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=bT/WMyf+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:2011::700; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=kevin_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20700.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WjnnD0cHVz2xSM
	for <linux-aspeed@lists.ozlabs.org>; Tue, 13 Aug 2024 20:34:22 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VFKxAhXo/2hxzZYZ4MxrSODTllldiKYQoY3d+GynP8r/whNcAmvL1pKq6DPiVDrD6LEsZeeEiEoVPDZBEB5avc35jU/5JPE6wW5hnsNBbxq01aXav68Yvk9w1Uw1GewjBRwySZyxZjp1nbmKtzJ49LIzyOoU3yLCMBGQTh+qgC91wiOozGoXC3aWTxy5UJ9Z7lbGzAbmjiqNo0bqVoYBJvXz/QNkpdYqENdKboCxNYZD1BH7TgvjU3CGSb+sjLN0En7KE1QiB2g08+rbYM6vYIyM/tKP3/i1SRALWDNpSMI56pHoQEofavzhxb9ztOW+G1CGRUeqfvGuZiqMSKyQlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vOWIhQcV/Hx/2V5sRDmfFCMqw2W1vwBXnrVEJWp+Fkw=;
 b=mRv3HDrC9R+NEcjfLAIIL5qD0Mbr1t/TLG0X/9DTARfO4U95vsmANy4WinLYi11UF73HSm7LfzrgJMNUXOUG11uojQnOP+fgpfEMB6QbVCw3MptJ1tW4YCEV86e8GwU418ZRKpXzlpQBpwWSrvIZ60ClbopJsJoSIW3WGdxe4+j405kbk8am6SF9vS5P2myaVhjGmP0EhCJzunyu3Bckehl7v95WHk4eW1pr+fXdMiVyMacf7cgSsotkT0s9jljxEoscYdj/4iiosBeOnPx84/3FQ0fRd508+PzGbo+9YFRFw73mVEZez2dvs/+OWjvKr8QAtx/UK+v+5uML8eogcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vOWIhQcV/Hx/2V5sRDmfFCMqw2W1vwBXnrVEJWp+Fkw=;
 b=bT/WMyf+DFRap0C3dfwVinxNBsHcsA1r7ZS95+t9n9xz3znqvgHAOLbzMW+YH7J7OJPZMMfp8Ppsgp+SEC+80fL0hjo/fHMFDyr+ZMhqwMnLCKqZr+m8kqhbCkgnohPotvPiFwhlaiLtWiu2FQf3odDhlkbOVBpoAIBCkIFmL/TvDU1oiixQp7XD18C29imYb/MknHtdTEzlubCs5Hh9/ZA+QmNnlNbVRGEY/XyQubOEAVfDHVoU3rUopuVniFwcDYWoAS7u3YkP/aDUJhg1J6LhxWr7UH7jkTD7Ky2KgcJl4IUftFiaQ9okdGWuRKcCB7LBuuUaQMFnZlqbCxXGUg==
Received: from PSAPR06MB4949.apcprd06.prod.outlook.com (2603:1096:301:ad::9)
 by TYZPR06MB7120.apcprd06.prod.outlook.com (2603:1096:405:b5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Tue, 13 Aug
 2024 10:33:59 +0000
Received: from PSAPR06MB4949.apcprd06.prod.outlook.com
 ([fe80::7bdd:639a:6b94:37bf]) by PSAPR06MB4949.apcprd06.prod.outlook.com
 ([fe80::7bdd:639a:6b94:37bf%6]) with mapi id 15.20.7849.021; Tue, 13 Aug 2024
 10:33:59 +0000
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
Subject:  =?big5?B?pl7C0Dogpl7C0DogW1BBVENIIHYxIDIvMl0gaXJxY2hpcC9hc3BlZWQtaW50Yzog?=
 =?big5?B?QWRkIHN1cHBvcnQgZm9yIDEwIElOVEMgaW50ZXJydXB0cyBvbiBBU1QyN1hYIHBs?=
 =?big5?Q?atforms?=
Thread-Topic:  =?big5?B?pl7C0DogW1BBVENIIHYxIDIvMl0gaXJxY2hpcC9hc3BlZWQtaW50YzogQWRkIHN1?=
 =?big5?Q?pport_for_10_INTC_interrupts_on_AST27XX_platforms?=
Thread-Index: AQHa7VSHSw8wQLr8FkWU5QCTbIfyFLIk4RKAgAAJDOqAAAcgAIAAA1wz
Date: Tue, 13 Aug 2024 10:33:59 +0000
Message-ID:  <PSAPR06MB494928071577A5A8E537BF0189862@PSAPR06MB4949.apcprd06.prod.outlook.com>
References: <20240813074338.969883-1-kevin_chen@aspeedtech.com>
 <20240813074338.969883-3-kevin_chen@aspeedtech.com>
 <315f9095-8928-44a9-bab7-a924a070eded@kernel.org>
 <PSAPR06MB4949680EBF66DCD47F2B4CF889862@PSAPR06MB4949.apcprd06.prod.outlook.com>
 <13e6625f-9f62-4973-b8f2-e825bd7665ee@kernel.org>
In-Reply-To: <13e6625f-9f62-4973-b8f2-e825bd7665ee@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR06MB4949:EE_|TYZPR06MB7120:EE_
x-ms-office365-filtering-correlation-id: 56e2b6d0-779e-46e3-9847-08dcbb83712c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020|38070700018;
x-microsoft-antispam-message-info:  =?big5?B?VnJXUG02UmtWSTZmd01QUnY3a1VjUXRHZWVHWXUwYzNrU05hSi9Jek9VTlgrUy9k?=
 =?big5?B?Z09YSXJhZlFxV0lhK1FGNmxzRnVzQm4rVEdOUTNLbU5CRUZ6OHYwelRodEp0RXky?=
 =?big5?B?REN1OVpuRXdHWDdJbnFIcm9VTjRYd1l2c1ZodUIrREYyMDhvMWl6aGZicTZMS0xr?=
 =?big5?B?aURPNGY5SVBib2pNSVFPTW1LVHJUTHhXSlNuaGZrWUZHUml2dUxkcUlGd3BFRERt?=
 =?big5?B?aXBLNzBTOHFxNkFVU2ZncW5vSGg2amgyUERLR0dwOCttRjRDK0JIOExmVWhib3d4?=
 =?big5?B?VS9ZNENkZ3JVS2dxZGFKUk1HaGxrbWtSVU5pZ3Z6bjFXcTdLQUhXdUgxNVF6M1Za?=
 =?big5?B?elpkTTlGbGhKQ1IrRDdMSDhqL0FYa1ZMYksyZHNMb1paSkhnRzBwSjBQU1VaTFVj?=
 =?big5?B?R1I2eFpMZFQwNWFsamVkaGFiL0luZDRmRVVlUk5LTHBCZTFnRlJKTE5KL2FlRkp1?=
 =?big5?B?djJoaDhzTWpobTNuTlArWXVwZHBEM0hZWEpSQktVK3NuYWs5RlRxSjNXbFB0bUN3?=
 =?big5?B?YU1nWW5LR29GK210ZURGaTA4UXZEL1lFVmpMNy9zUWc3R29pcmhsYmlNbEltZTlx?=
 =?big5?B?YzYrU0c1Wjl5TmVkK1pBTUVzdUVCaDRONUVITWV5OHl5cS9LS2pjQXNoS3JlbFZo?=
 =?big5?B?V0VXSUFEZG1BaUlFeTViOFh6SDRwTm53TVVuVUtjQ25Yam9lU3dqQ2NCa0IwMXhU?=
 =?big5?B?dDVmUmNlMGZGcitENi9YR2hqcFRQaFFXZy9sMExtQXVtVlRrOFV0VlgxTkNuU2tT?=
 =?big5?B?VXNLbS85NHBsS1FqeEF3dDNXeWVjRit2ZnpqbmZYeC9uRnRRZzc2TmhDT1Fic3M0?=
 =?big5?B?ekFwWTRxSDVQY2hIM3NFaWtPdVFWV0ZteTlDWERETSszZ2RoMDQ1QW56MmRDYUJX?=
 =?big5?B?UUNFaEZMLzhlUlg5OG4zOVFNa0orY0hsZEg3bXRHckxWb2R5NU56eHlJRms4Rzd1?=
 =?big5?B?c3lOK3JEdDRoMWVXR20yc0FhUHVsTlNCZkc1bFl5OTlaT2lnWHhYU0FFWnBncE1x?=
 =?big5?B?czdDcnVmbktGRnVhTWtSUWFEeUtCQlQxSHNQRzYyenQ2YmZpckZsMFhZSDU4Snpj?=
 =?big5?B?UWpxb2xZOFFiSnloS0UvY1FYTE8zMktsOXRpdTRkbDFoYmZRdTMxZUdrTDJIOEJs?=
 =?big5?B?c3E3bVorUjVKREpmS21VNDdzN3RlUUVvaDlSK1UySUxxeU1oZFBETVFSY1lPdDIx?=
 =?big5?B?d1I0UnBURVZXZnNxbkhFUkRwSUpDTDNKWUU3V1J5cEFTWHVLVlJ6U1JjWlVacDFP?=
 =?big5?B?cVZEWXNCanNVd2dkRUdNWUFnSWxmaDlGSGsySUFUcC9ZTHRFaUZTcHVOYXB2YUgw?=
 =?big5?B?OElXWTcrODlZa0p3VFJZeWM3Y25SM05STG9CTnZ3aHkrcGcxYTZoUTJ6MzFRVWRS?=
 =?big5?B?MnFySDY5YlVYWkJ3KzM2aDNEZjhQWVB0MnVwUFhub0ZwdXpEUGJkSjdFV21PbXZu?=
 =?big5?B?Qk5zRi9nN0RlUEdxdUY3RnBXRi9EWG16cXNZR1p2OFhoTUVIdlgzMlYydXIzSDM0?=
 =?big5?B?Sjc2cDhlTlpBbWlMZkczRTlmZndsS2dkekRjc2d2VmR6dytuQUQ5ZUNsRnlMSW9F?=
 =?big5?B?ZVJPckJyZWRwTnhnQlVjbkpSWTRHZTNNZVR3bVNyMTdpcU1tdE93K3lkUFNUY3lT?=
 =?big5?B?S0kzN0lQeXNzK0twNUNSZXd1TnN6SmdnRzZ5QnY1UFJvWEtvTmpZNHc1dDdJekxH?=
 =?big5?B?NVZCcUxOOEE1RlF5OVRwZi9ObU52emtXZUE1T1p6NEpTWVBBQmtBViswOHNyellJ?=
 =?big5?Q?LyLGrNWz6X4tiCNV?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR06MB4949.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?big5?B?VTM3RWFrQXo4WWxXcnhabTlhMVJXVFZ6QW5rc05qUm5BU1c1bFFtb3c3aG5ybmR4?=
 =?big5?B?NDR2T3ZScUEwOHowSm1jT2JDZ2Yvek9GMkRsTTdpd21PODBSS0x4R0R2U1psTDl6?=
 =?big5?B?azl4dUo2Mjl0c1ZjdTB5NzhyZi9hOFAvQ1doME9rZ2RMNVYzRGRlbUFRYm9aS2Fz?=
 =?big5?B?d3FTTFY5NzV1NWVqejUvZ1ozYUw5MnVQaW1EOWJTVTFiMWdESCtXbHRkbVJSVno3?=
 =?big5?B?NFdaVjZvK2ZvSVRJODM1bFdkUVFIUXRwSENjbFJsak9UaDNQQWRBMnRvMTVNcEEy?=
 =?big5?B?aHBaUUdFRkNoNzFtWVdOczFwQTJFTnI0ZlJFTk1naVFhenFpQnFabFFSNEV5bW9q?=
 =?big5?B?R29HUmdoN3ZtSE0zWHI5cyt1TTFkSXZPbTkxY05ueW8rczBJUzViQTZaUzJldEhl?=
 =?big5?B?cVpITGtodUZDRU1sWnpzRlgyNUF1TU9CK1RDWDFLSUNmcmFGbkdPYkZXMTJUVWlC?=
 =?big5?B?WG5neHdRMUlxSlg4bTk0dHJWaS9ZK09iQUQxay9rU3VQbEt5SkczMldZWDZSVllH?=
 =?big5?B?RnQzOFNwSkpqMUtLeldWeCtPMjlCd1VnclhnZWxsZUVmdS9KOFBJY1BycjhHUjZ3?=
 =?big5?B?YW9Tdk4wNWVlUUZLYnJZbGpYUHpkYVp2VWFOOGxkTGNDUWxlN1ZWREowdzdOSXNh?=
 =?big5?B?d3JoU0hPbnUzNHAwUjh6Vk1EcXpjRFM2RzhLQXZwaVBnU1V5ZHZLVElCQm11OVRZ?=
 =?big5?B?aklYSFk1cVZOSnRLd0J5dHFOd0hSZWl1eUE0dmJ3UXRKN0wvMFN1dklxTzA2d2Fy?=
 =?big5?B?cDJyeHYxTzYvaENNNkROZnZxZ3BpZXZ2eG1hNWwzZUMrYTdKYW1ZTlJTU0tOTXQ0?=
 =?big5?B?WCtsK3FsOFBuOGF4aGxTUTdXYW1xcW1rTlJhV0IxMzRxR0dreW04VkhKWFlZamJx?=
 =?big5?B?Nm9rU0tKNWhWc01Fc04vblVOOHBNdzhBWXhLa2l6Ynhpem8rNWZvOVFTUGh3cDdC?=
 =?big5?B?SVM4ektaeHA2eXgvVmVsK3ZFTkhZcjMzV2xaUVdQNFNHUHJoQ0lGL1lVRTE4WEtG?=
 =?big5?B?VlozbUJtMXFmbHRrQ2gva1B5TE9tVU9EWm1CL29sajJONmRVbkdRMjNTTlFadi8w?=
 =?big5?B?UGR1dk1mZFN2SWk0czJBdmVpWVEyWGVTTVdXYXRFeFZIb3dZYkhyMlBiNEhPeERG?=
 =?big5?B?bEpUbG9MeGFydGpCUzRSUmZ1ZGppQTlON3NGbkRRSUQ3SG41VUEzSHBXTjZtVURk?=
 =?big5?B?UHl3dXRTTlZnY09vSDNrL1hMdHM3cG4rWENRcnhUeVJSb2hXUlZEZG5FL3VqWFlO?=
 =?big5?B?QXEvaUgwZlJIWDFiUzJpanZOa0JrWWxNKzQvZitsYi9sYXV0M1E0YjhqTmVYdGdz?=
 =?big5?B?VWhlMVR1M09xY1VRZXI2UXNxbThCdW1qZWJsV3J2ZEExVCtyQ0J3TENsbGhyNFE0?=
 =?big5?B?VHRsQVlHeWxsM2Q3K3dUNlhnaFVpd2RrQmx6Rm0yU3F2NERsbEd4VGQvRUZ0SVYw?=
 =?big5?B?QmNzSGRnQ0EvUTBuZlZ4YUE2OGl6U3lJNUVKcFNtQnVvRk9yTy9idUdxNE5IVWlO?=
 =?big5?B?V1hsWDlzMmYva0x5eGRsdmdRZHpGdmRvSHVlWWxxUzJnQWI4TG5RWHUxYi95QXQz?=
 =?big5?B?NFlHdzJQbVF5TlFuNEZ5YkdRcUhRWGtFVHVSUFBmcy8veE9SM2NmZFVRb2hzTnEv?=
 =?big5?B?VHR3eDcxb084UVpnQm1xZ1MwL0czN1AyMGlOS3krYzF6eGVkYTNxWmRFNnVWMjNG?=
 =?big5?B?ZWFSU3FnTTFZY29mc21OQVdJbW1jSWlzSHRBYVFiVnZyZ3pCa1p1Q2pkZjJFSmxK?=
 =?big5?B?VnIwVENPMDVIZ1FKWjNhS09Oa2RlQk45dGVlY0E3djNZSVBpWVUwazd0MkRvcE9h?=
 =?big5?B?M2kxRC9Xc1hnYWxtVjVUSUxpYnQzNHhlMW1sdTk2cTI0ZXVtNnlMM2JRd0o3UE1w?=
 =?big5?B?WmZQZmV6M2N6ZUdQVERnV29VVkRFNU5KR3hqQnhaYTgvSFhZUWdlZFRveGdRNlVw?=
 =?big5?B?SkdPM3lmNEM3RGw1cXF1c1dSbkRsbFNXWGtwV094WHJCNEwwUTlVRVBjR0NhR3ZS?=
 =?big5?Q?1MINsw/Zn0xvoPEp?=
Content-Type: multipart/alternative;
	boundary="_000_PSAPR06MB494928071577A5A8E537BF0189862PSAPR06MB4949apcp_"
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4949.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56e2b6d0-779e-46e3-9847-08dcbb83712c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2024 10:33:59.3291
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e9aq4/ksfFLva8cbEQ6r1rWC60Lvc/Uvb6wzy4aSNCWETAEZbYRFJsBKJ7LHucwtS1lFaxVNMYB60IAeH76EFPu8q/qVEFQeCC9r8pAdUuQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB7120
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

--_000_PSAPR06MB494928071577A5A8E537BF0189862PSAPR06MB4949apcp_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGkgS3J6aywNCg0KPj4gSGkgS3J6aywNCj4+DQo+PiBJbiBBU1BFRUQsIGFzdDI0MDAvMjUwMC8y
NjAwIHVzZSBhcm0gYXJjaGl0ZWN0dXJlIHdpdGggS0NPTkZJR19BUkNIX0FTUEVFRCB3aGljaCBz
bGVjdCBNQUNIX0FTUEVFRF9HNC9HNS9HNiBpbiBhcmNoL2FybS9tYWNoLWFzcGVlZC9LY29uZmln
Lg0KPj4gSW4gdGhlIGZ1cmV0dXJlLCB0aGVyZSB3b3VsZCBiZSBhc3QyODAwLzI5MDAvLi4uIHVz
aW5nIGFybTY0LiBXZSBuZWVkIHRvIGNsYXJpZnkgdGhlIElDIGdlbmVyYXRpb24gYmV0d2VlbiA3
dGgvOHRoLzl0aC8uLi4uDQo+Pg0KPj4gTWF5YmUgY2hhbmdlIEFSQ0hfQVNQRUVEL01BQ0hfQVNQ
RUVERzcgdG8gQVJDSF9BU1BFRUQgZmlyc3QuDQo+PiBPciwgZG8geW91IGhhdmUgYmV0dGVyIEtj
b25maWcgdXNhZ2U/DQo+DQo+Rml4IHlvdXIgcXVvdGVzIGFuZCBkbyBub3QgdG9wLXBvc3QuDQo+
DQo+UGxlYXNlIHJlc3BvbmQgaW5saW5lLCBpbnN0ZWFkIG9mIHRvcC1wb3N0aW5nLCBiZWNhdXNl
IGl0IG1ha2VzIHlvdXINCj5lbWFpbHMgaGFyZCB0byBmb2xsb3cuDQo+aHR0cHM6Ly9lbGl4aXIu
Ym9vdGxpbi5jb20vbGludXgvdjYuOC1yYzcvc291cmNlL0RvY3VtZW50YXRpb24vcHJvY2Vzcy9z
dWJtaXR0aW5nLXBhdGNoZXMucnN0I0wzNDANCj4NCj4+DQo+Pg0KPj4+ICtjb25maWcgQVJDSF9B
U1BFRUQNCj4+PiArICAgICBib29sICJBc3BlZWQgU29DIGZhbWlseSINCj4+PiArICAgICBzZWxl
Y3QgTUFDSF9BU1BFRURfRzcNCj4+PiArICAgICBoZWxwDQo+Pj4gKyAgICAgICBTYXkgeWVzIGlm
IHlvdSBpbnRlbmQgdG8gcnVuIG9uIGFuIEFzcGVlZCBhc3QyNzAwIG9yIHNpbWlsYXINCj4+PiAr
ICAgICAgIHNldmVudGggZ2VuZXJhdGlvbiBBc3BlZWQgQk1Dcy4NCj4+PiArDQo+Pj4gK2NvbmZp
ZyBNQUNIX0FTUEVFRF9HNw0KPj4+ICsgICAgIGJvb2wgIkFzcGVlZCBTb0MgQVNUMjcwMCINCj4+
DQo+PiBUaGVyZSBhcmUgbm8gTUFDSGluZXMgZm9yIGFybTY0LiBMb29rIGF0IHRoaXMgY29kZS4g
RG8geW91IHNlZSBNQUNIDQo+PiBhbnl3aGVyZSBlbHNlPyBOby4gVGhlbiB3aHkgQXNwZWVkIG11
c3QgYmUgZGlmZmVyZW50Pw0KPg0KPldoYXQgaXMgdGhpcz8NCg0KT0suIEkgd2lsbCByZW1vdmUg
TUFDSF9BU1BFRURfRzcgYW5kICBzYXZlIEFSQ0hfQVNQRUVEIGZvciB1c2UuDQoNCi0tDQpCZXN0
IFJlZ2FyZHMsDQpLZXZpbi4gQ2hlbg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xw0KsUil86rMOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+DQqxSKXzpOm0
wTogMjAyNKZ+OKTrMTOk6SCkVaTIIDA1OjQ4DQqmrKXzqsw6IEtldmluIENoZW4gPGtldmluX2No
ZW5AYXNwZWVkdGVjaC5jb20+OyB0Z2x4QGxpbnV0cm9uaXguZGUgPHRnbHhAbGludXRyb25peC5k
ZT47IHJvYmhAa2VybmVsLm9yZyA8cm9iaEBrZXJuZWwub3JnPjsga3J6aytkdEBrZXJuZWwub3Jn
IDxrcnprK2R0QGtlcm5lbC5vcmc+OyBjb25vcitkdEBrZXJuZWwub3JnIDxjb25vcitkdEBrZXJu
ZWwub3JnPjsgam9lbEBqbXMuaWQuYXUgPGpvZWxAam1zLmlkLmF1PjsgYW5kcmV3QGNvZGVjb25z
dHJ1Y3QuY29tLmF1IDxhbmRyZXdAY29kZWNvbnN0cnVjdC5jb20uYXU+OyBsaW51eC1rZXJuZWxA
dmdlci5rZXJuZWwub3JnIDxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnPjsgZGV2aWNldHJl
ZUB2Z2VyLmtlcm5lbC5vcmcgPGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnPjsgbGludXgtYXJt
LWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnIDxsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJh
ZGVhZC5vcmc+OyBsaW51eC1hc3BlZWRAbGlzdHMub3psYWJzLm9yZyA8bGludXgtYXNwZWVkQGxp
c3RzLm96bGFicy5vcmc+DQqlRKauOiBSZTogpl7C0DogW1BBVENIIHYxIDIvMl0gaXJxY2hpcC9h
c3BlZWQtaW50YzogQWRkIHN1cHBvcnQgZm9yIDEwIElOVEMgaW50ZXJydXB0cyBvbiBBU1QyN1hY
IHBsYXRmb3Jtcw0KDQpPbiAxMy8wOC8yMDI0IDExOjQ0LCBLZXZpbiBDaGVuIHdyb3RlOg0KPiBI
aSBLcnprLA0KPg0KPiBJbiBBU1BFRUQsIGFzdDI0MDAvMjUwMC8yNjAwIHVzZSBhcm0gYXJjaGl0
ZWN0dXJlIHdpdGggS0NPTkZJR19BUkNIX0FTUEVFRCB3aGljaCBzbGVjdCBNQUNIX0FTUEVFRF9H
NC9HNS9HNiBpbiBhcmNoL2FybS9tYWNoLWFzcGVlZC9LY29uZmlnLg0KPiBJbiB0aGUgZnVyZXR1
cmUsIHRoZXJlIHdvdWxkIGJlIGFzdDI4MDAvMjkwMC8uLi4gdXNpbmcgYXJtNjQuIFdlIG5lZWQg
dG8gY2xhcmlmeSB0aGUgSUMgZ2VuZXJhdGlvbiBiZXR3ZWVuIDd0aC84dGgvOXRoLy4uLi4NCj4N
Cj4gTWF5YmUgY2hhbmdlIEFSQ0hfQVNQRUVEL01BQ0hfQVNQRUVERzcgdG8gQVJDSF9BU1BFRUQg
Zmlyc3QuDQo+IE9yLCBkbyB5b3UgaGF2ZSBiZXR0ZXIgS2NvbmZpZyB1c2FnZT8NCg0KRml4IHlv
dXIgcXVvdGVzIGFuZCBkbyBub3QgdG9wLXBvc3QuDQoNClBsZWFzZSByZXNwb25kIGlubGluZSwg
aW5zdGVhZCBvZiB0b3AtcG9zdGluZywgYmVjYXVzZSBpdCBtYWtlcyB5b3VyDQplbWFpbHMgaGFy
ZCB0byBmb2xsb3cuDQpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni44LXJjNy9z
b3VyY2UvRG9jdW1lbnRhdGlvbi9wcm9jZXNzL3N1Ym1pdHRpbmctcGF0Y2hlcy5yc3QjTDM0MA0K
DQo+DQo+DQo+PiArY29uZmlnIEFSQ0hfQVNQRUVEDQo+PiArICAgICBib29sICJBc3BlZWQgU29D
IGZhbWlseSINCj4+ICsgICAgIHNlbGVjdCBNQUNIX0FTUEVFRF9HNw0KPj4gKyAgICAgaGVscA0K
Pj4gKyAgICAgICBTYXkgeWVzIGlmIHlvdSBpbnRlbmQgdG8gcnVuIG9uIGFuIEFzcGVlZCBhc3Qy
NzAwIG9yIHNpbWlsYXINCj4+ICsgICAgICAgc2V2ZW50aCBnZW5lcmF0aW9uIEFzcGVlZCBCTUNz
Lg0KPj4gKw0KPj4gK2NvbmZpZyBNQUNIX0FTUEVFRF9HNw0KPj4gKyAgICAgYm9vbCAiQXNwZWVk
IFNvQyBBU1QyNzAwIg0KPg0KPiBUaGVyZSBhcmUgbm8gTUFDSGluZXMgZm9yIGFybTY0LiBMb29r
IGF0IHRoaXMgY29kZS4gRG8geW91IHNlZSBNQUNIDQo+IGFueXdoZXJlIGVsc2U/IE5vLiBUaGVu
IHdoeSBBc3BlZWQgbXVzdCBiZSBkaWZmZXJlbnQ/DQoNCldoYXQgaXMgdGhpcz8NCg0KPg0KPiAt
LQ0KPiBCZXN0IFJlZ2FyZHMsDQo+IEtldmluLiBDaGVuDQo+DQo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fDQo+ILFIpfOqzDogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJu
ZWwub3JnPg0KPiCxSKXzpOm0wTogMjAyNKZ+OKTrMTOk6SCkVaTIIDA0OjUwDQo+IKaspfOqzDog
S2V2aW4gQ2hlbiA8a2V2aW5fY2hlbkBhc3BlZWR0ZWNoLmNvbT47IHRnbHhAbGludXRyb25peC5k
ZSA8dGdseEBsaW51dHJvbml4LmRlPjsgcm9iaEBrZXJuZWwub3JnIDxyb2JoQGtlcm5lbC5vcmc+
OyBrcnprK2R0QGtlcm5lbC5vcmcgPGtyemsrZHRAa2VybmVsLm9yZz47IGNvbm9yK2R0QGtlcm5l
bC5vcmcgPGNvbm9yK2R0QGtlcm5lbC5vcmc+OyBqb2VsQGptcy5pZC5hdSA8am9lbEBqbXMuaWQu
YXU+OyBhbmRyZXdAY29kZWNvbnN0cnVjdC5jb20uYXUgPGFuZHJld0Bjb2RlY29uc3RydWN0LmNv
bS5hdT47IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcgPGxpbnV4LWtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmc+OyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyA8ZGV2aWNldHJlZUB2Z2VyLmtl
cm5lbC5vcmc+OyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcgPGxpbnV4LWFy
bS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz47IGxpbnV4LWFzcGVlZEBsaXN0cy5vemxhYnMu
b3JnIDxsaW51eC1hc3BlZWRAbGlzdHMub3psYWJzLm9yZz4NCj4gpUSmrjogUmU6IFtQQVRDSCB2
MSAyLzJdIGlycWNoaXAvYXNwZWVkLWludGM6IEFkZCBzdXBwb3J0IGZvciAxMCBJTlRDIGludGVy
cnVwdHMgb24gQVNUMjdYWCBwbGF0Zm9ybXMNCj4NCg0KLi4uDQoNCj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2lycWNoaXAvTWFrZWZpbGUgYi9kcml2ZXJzL2lycWNoaXAvTWFrZWZpbGUNCj4+IGlu
ZGV4IDE1NjM1ODEyYjJkNi4uZDJmZTY4NmFlMDE4IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9p
cnFjaGlwL01ha2VmaWxlDQo+PiArKysgYi9kcml2ZXJzL2lycWNoaXAvTWFrZWZpbGUNCj4+IEBA
IC04NCw2ICs4NCw3IEBAIG9iai0kKENPTkZJR19NVkVCVV9TRUkpICAgICAgICAgICAgICAgICAg
ICAgKz0gaXJxLW12ZWJ1LXNlaS5vDQo+PiAgb2JqLSQoQ09ORklHX0xTX0VYVElSUSkgICAgICAg
ICAgICAgICAgICAgICAgKz0gaXJxLWxzLWV4dGlycS5vDQo+PiAgb2JqLSQoQ09ORklHX0xTX1ND
RkdfTVNJKSAgICAgICAgICAgICs9IGlycS1scy1zY2ZnLW1zaS5vDQo+PiAgb2JqLSQoQ09ORklH
X0FSQ0hfQVNQRUVEKSAgICAgICAgICAgICs9IGlycS1hc3BlZWQtdmljLm8gaXJxLWFzcGVlZC1p
MmMtaWMubyBpcnEtYXNwZWVkLXNjdS1pYy5vDQo+PiArb2JqLSQoQ09ORklHX01BQ0hfQVNQRUVE
X0c3KSAgICAgICAgICs9IGlycS1hc3BlZWQtaW50Yy5vDQo+DQo+IFRoZXJlIGlzIG5vIHN1Y2gg
dGhpbmcgYXMgQ09ORklHX01BQ0hfQVNQRUVEX0c3LiBBbmQgdGhlcmUgd2lsbCBuZXZlciBiZS4N
Cj4NCj4gWW91IGFscmVhZHkgcmVjZWl2ZWQgZmVlZGJhY2sgb24gdGhpcywgc28gd2h5IGRvIHlv
dSBrZWVwIHB1c2hpbmcgeW91cg0KPiBzb2x1dGlvbj8gWW91IGRpZCBub3QgcmVzcG9uZCB0byBh
bnkgZmVlZGJhY2sgZ2l2ZW4sIGp1c3Qgc2VuZCB0aGUgc2FtZQ0KPiBhbmQgdGhlIHNhbWUgdGls
bCB3ZSBhZ3JlZT8NCj4NCj4gTkFLLg0KDQpBbmQgdGhpcz8NCg0KPg0KPj4gIG9iai0kKENPTkZJ
R19TVE0zMk1QX0VYVEkpICAgICAgICAgICArPSBpcnEtc3RtMzJtcC1leHRpLm8NCj4+ICBvYmot
JChDT05GSUdfU1RNMzJfRVhUSSkgICAgICAgICAgICAgICs9IGlycS1zdG0zMi1leHRpLm8NCj4+
ICBvYmotJChDT05GSUdfUUNPTV9JUlFfQ09NQklORVIpICAgICAgICAgICAgICArPSBxY29tLWly
cS1jb21iaW5lci5vDQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pcnFjaGlwL2lycS1hc3BlZWQt
aW50Yy5jIGIvZHJpdmVycy9pcnFjaGlwL2lycS1hc3BlZWQtaW50Yy5jDQo+PiBuZXcgZmlsZSBt
b2RlIDEwMDY0NA0KPj4gaW5kZXggMDAwMDAwMDAwMDAwLi43MTQwNzQ3NWZiMjcNCj4NCg0KLi4u
DQoNCj4NCj4gKioqKioqKioqKioqKiBFbWFpbCBDb25maWRlbnRpYWxpdHkgTm90aWNlICoqKioq
KioqKioqKioqKioqKioqDQo+IKdLs2TBbqn6Og0KPiClu6tIpfMoqc6o5Kr+pfMppWmv4KVdp3S+
97FLuOqwVKFBqMOo/Kprq9+rT8VAoUOmcCCleLrdq0Sr/Kl3pKemrKXzqsyhQb3QpUi5caRstmyl
87Nxqr6lu7lxpGy2bKXzpKe1b7BlqswsIKjDvdCl36dZp1Kwo6W7uXGkbLZspfOkzqjkqv6l86lN
vlC3tKnSprO9xqZMpfOhQ8HCwcKxeqq6plinQCENCj4NCj4gRElTQ0xBSU1FUjoNCj4gVGhpcyBt
ZXNzYWdlIChhbmQgYW55IGF0dGFjaG1lbnRzKSBtYXkgY29udGFpbiBsZWdhbGx5IHByaXZpbGVn
ZWQgYW5kL29yIG90aGVyIGNvbmZpZGVudGlhbCBpbmZvcm1hdGlvbi4gSWYgeW91IGhhdmUgcmVj
ZWl2ZWQgaXQgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciBieSByZXBseSBlLW1h
aWwgYW5kIGltbWVkaWF0ZWx5IGRlbGV0ZSB0aGUgZS1tYWlsIGFuZCBhbnkgYXR0YWNobWVudHMg
d2l0aG91dCBjb3B5aW5nIG9yIGRpc2Nsb3NpbmcgdGhlIGNvbnRlbnRzLiBUaGFuayB5b3UuDQoN
Ck1heWJlIEkgYW0gdGhlIGludGVuZGVkIHJlY2lwaWVudCBvZiB5b3VyIG1lc3NhZ2UsIG1heWJl
IG5vdC4gSSBkb24ndA0Kd2FudCB0byBoYXZlIGFueSBsZWdhbCBxdWVzdGlvbnMgcmVnYXJkaW5n
IHVwc3RyZWFtLCBwdWJsaWMNCmNvbGxhYm9yYXRpb24sIHRodXMgcHJvYmFibHkgSSBzaG91bGQg
anVzdCByZW1vdmUgeW91ciBtZXNzYWdlcy4NCg0KUGxlYXNlIHRhbGsgd2l0aCB5b3VyIElUIHRo
YXQgc3VjaCBkaXNjbGFpbWVycyBpbiBvcGVuLXNvdXJjZSBhcmUgbm90DQpkZXNpcmVkIChhbmQg
bWF5YmUgZXZlbiBoYXJtZnVsKS4NCklmIHlvdSBkbyBub3QgdW5kZXJzdGFuZCB3aHksIHBsZWFz
ZSBhbHNvIHNlZToNCmh0dHBzOi8vd3d3LnlvdXR1YmUuY29tL2xpdmUvZk1lSDd3cU93WEE/c2k9
R1k3aWdmYmRhNnZualhsSiZ0PTgzNQ0KDQpJZiB5b3UgbmVlZCB0byBnbyBhcm91bmQgY29tcGFu
eSBTTVRQIHNlcnZlciwgdGhlbiBjb25zaWRlciB1c2luZyBiNA0Kd2ViLXJlbGF5OiBodHRwczov
L2I0LmRvY3Mua2VybmVsLm9yZy9lbi9sYXRlc3QvY29udHJpYnV0b3Ivc2VuZC5odG1sDQoNClBs
ZWFzZSBiZSBpbmZvcm1lZCB0aGF0IGJ5IHJlc3BvbmRpbmcgdG8gdGhpcyBlbWFpbCB5b3UgYWdy
ZWUgdGhhdCBhbGwNCmNvbW11bmljYXRpb25zIGZyb20geW91IGFuZC9vciB5b3VyIGNvbXBhbnkg
aXMgbWFkZSBwdWJsaWMuIEluIG90aGVyDQp3b3JkcywgYWxsIG1lc3NhZ2VzIG9yaWdpbmF0aW5n
IGZyb20geW91IGFuZC9vciB5b3VyIGNvbXBhbnkgd2lsbCBiZQ0KbWFkZSBwdWJsaWMuDQoNCllv
dSBhbHJlYWR5IHJlY2VpdmVkIGV4YWN0bHkgdGhpcyBmZWVkYmFjay4gQXJvdW5kIHRocmVlIHRp
bWVzLiBJZiB5b3UNCmtlZXAgaWdub3JpbmcgZmVlZGJhY2ssIEkgd2lsbCBrZWVwIE5BS2luZyB5
b3VyIHBhdGNoZXMuDQoNCkJlc3QgcmVnYXJkcywNCktyenlzenRvZg0KDQoqKioqKioqKioqKioq
IEVtYWlsIENvbmZpZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioqKioqKioqKioNCqdLs2TB
bqn6Og0KpburSKXzKKnOqOSq/qXzKaVpr+ClXad0vvexS7jqsFShQajDqPyqa6vfq0/FQKFDpnAg
pXi63atEq/ypd6Snpqyl86rMoUG90KVIuXGkbLZspfOzcaq+pbu5caRstmyl86SntW+wZarMLCCo
w73Qpd+nWadSsKOlu7lxpGy2bKXzpM6o5Kr+pfOpTb5Qt7Sp0qazvcamTKXzoUPBwsHCsXqquqZY
p0AhDQoNCkRJU0NMQUlNRVI6DQpUaGlzIG1lc3NhZ2UgKGFuZCBhbnkgYXR0YWNobWVudHMpIG1h
eSBjb250YWluIGxlZ2FsbHkgcHJpdmlsZWdlZCBhbmQvb3Igb3RoZXIgY29uZmlkZW50aWFsIGlu
Zm9ybWF0aW9uLiBJZiB5b3UgaGF2ZSByZWNlaXZlZCBpdCBpbiBlcnJvciwgcGxlYXNlIG5vdGlm
eSB0aGUgc2VuZGVyIGJ5IHJlcGx5IGUtbWFpbCBhbmQgaW1tZWRpYXRlbHkgZGVsZXRlIHRoZSBl
LW1haWwgYW5kIGFueSBhdHRhY2htZW50cyB3aXRob3V0IGNvcHlpbmcgb3IgZGlzY2xvc2luZyB0
aGUgY29udGVudHMuIFRoYW5rIHlvdS4NCg==

--_000_PSAPR06MB494928071577A5A8E537BF0189862PSAPR06MB4949apcp_
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
&gt;&gt; Hi Krzk,<br>
&gt;&gt;<br>
&gt;&gt; In ASPEED, ast2400/2500/2600 use arm architecture with KCONFIG_ARC=
H_ASPEED which slect MACH_ASPEED_G4/G5/G6 in arch/arm/mach-aspeed/Kconfig.<=
br>
&gt;&gt; In the fureture, there would be ast2800/2900/... using arm64. We n=
eed to clarify the IC generation between 7th/8th/9th/....<br>
&gt;&gt;<br>
&gt;&gt; Maybe change ARCH_ASPEED/MACH_ASPEEDG7 to ARCH_ASPEED first.<br>
&gt;&gt; Or, do you have better Kconfig usage?<br>
&gt;<br>
&gt;Fix your quotes and do not top-post.<br>
&gt;<br>
&gt;Please respond inline, instead of top-posting, because it makes your<br=
>
&gt;emails hard to follow.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&gt;<a href=3D"https://elixir.bootlin.com/linux/v6.8-rc7/source/Documentati=
on/process/submitting-patches.rst#L340" id=3D"OWA6b9aa407-24c4-b656-1346-da=
fd6a770860" class=3D"OWAAutoLink" data-auth=3D"NotApplicable" style=3D"marg=
in: 0px; text-align: left;">https://elixir.bootlin.com/linux/v6.8-rc7/sourc=
e/Documentation/process/submitting-patches.rst#L340</a></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;&gt; +config ARCH_ASPEED<br>
&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;Aspeed SoC family&quot;<b=
r>
&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; select MACH_ASPEED_G7<br>
&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; help<br>
&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Say yes if you intend to=
 run on an Aspeed ast2700 or similar<br>
&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; seventh generation Aspee=
d BMCs.<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +config MACH_ASPEED_G7<br>
&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;Aspeed SoC AST2700&quot;<=
br>
&gt;&gt;<br>
&gt;&gt; There are no MACHines for arm64. Look at this code. Do you see MAC=
H<br>
&gt;&gt; anywhere else? No. Then why Aspeed must be different?<br>
&gt;<br>
&gt;What is this?</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
OK. I will remove MACH_ASPEED_G7 and&nbsp; save ARCH_ASPEED for use.</div>
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
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><span style=3D"font-family: Calibri, =
sans-serif; font-size: 11pt; color: rgb(0, 0, 0);"><b>=B1H=A5=F3=AA=CC:</b>=
&nbsp;Krzysztof Kozlowski &lt;krzk@kernel.org&gt;<br>
<b>=B1H=A5=F3=A4=E9=B4=C1:</b>&nbsp;2024=A6~8=A4=EB13=A4=E9 =A4U=A4=C8 05:4=
8<br>
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
<b>=A5D=A6=AE:</b>&nbsp;Re: =A6^=C2=D0: [PATCH v1 2/2] irqchip/aspeed-intc:=
 Add support for 10 INTC interrupts on AST27XX platforms</span>
<div>&nbsp;</div>
</div>
<div style=3D"font-size: 11pt;">On 13/08/2024 11:44, Kevin Chen wrote:<br>
&gt; Hi Krzk,<br>
&gt;<br>
&gt; In ASPEED, ast2400/2500/2600 use arm architecture with KCONFIG_ARCH_AS=
PEED which slect MACH_ASPEED_G4/G5/G6 in arch/arm/mach-aspeed/Kconfig.<br>
&gt; In the fureture, there would be ast2800/2900/... using arm64. We need =
to clarify the IC generation between 7th/8th/9th/....<br>
&gt;<br>
&gt; Maybe change ARCH_ASPEED/MACH_ASPEEDG7 to ARCH_ASPEED first.<br>
&gt; Or, do you have better Kconfig usage?<br>
<br>
Fix your quotes and do not top-post.<br>
<br>
Please respond inline, instead of top-posting, because it makes your<br>
emails hard to follow.<br>
<a href=3D"https://elixir.bootlin.com/linux/v6.8-rc7/source/Documentation/p=
rocess/submitting-patches.rst#L340" id=3D"OWA95b769b0-2b77-2b75-8819-22130c=
99a81b" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">https://elixir.bo=
otlin.com/linux/v6.8-rc7/source/Documentation/process/submitting-patches.rs=
t#L340</a><br>
<br>
&gt;<br>
&gt;<br>
&gt;&gt; +config ARCH_ASPEED<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;Aspeed SoC family&quot;<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; select MACH_ASPEED_G7<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; help<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Say yes if you intend to run=
 on an Aspeed ast2700 or similar<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; seventh generation Aspeed BM=
Cs.<br>
&gt;&gt; +<br>
&gt;&gt; +config MACH_ASPEED_G7<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;Aspeed SoC AST2700&quot;<br>
&gt;<br>
&gt; There are no MACHines for arm64. Look at this code. Do you see MACH<br=
>
&gt; anywhere else? No. Then why Aspeed must be different?<br>
<br>
What is this?<br>
<br>
&gt;<br>
&gt; --<br>
&gt; Best Regards,<br>
&gt; Kevin. Chen<br>
&gt;<br>
&gt; ________________________________<br>
&gt; =B1H=A5=F3=AA=CC: Krzysztof Kozlowski &lt;krzk@kernel.org&gt;<br>
&gt; =B1H=A5=F3=A4=E9=B4=C1: 2024=A6~8=A4=EB13=A4=E9 =A4U=A4=C8 04:50<br>
&gt; =A6=AC=A5=F3=AA=CC: Kevin Chen &lt;kevin_chen@aspeedtech.com&gt;; tglx=
@linutronix.de &lt;tglx@linutronix.de&gt;; robh@kernel.org &lt;robh@kernel.=
org&gt;; krzk+dt@kernel.org &lt;krzk+dt@kernel.org&gt;; conor+dt@kernel.org=
 &lt;conor+dt@kernel.org&gt;; joel@jms.id.au &lt;joel@jms.id.au&gt;; andrew=
@codeconstruct.com.au
 &lt;andrew@codeconstruct.com.au&gt;; linux-kernel@vger.kernel.org &lt;linu=
x-kernel@vger.kernel.org&gt;; devicetree@vger.kernel.org &lt;devicetree@vge=
r.kernel.org&gt;; linux-arm-kernel@lists.infradead.org &lt;linux-arm-kernel=
@lists.infradead.org&gt;; linux-aspeed@lists.ozlabs.org
 &lt;linux-aspeed@lists.ozlabs.org&gt;<br>
&gt; =A5D=A6=AE: Re: [PATCH v1 2/2] irqchip/aspeed-intc: Add support for 10=
 INTC interrupts on AST27XX platforms<br>
&gt;<br>
<br>
...<br>
<br>
&gt;&gt; diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile<b=
r>
&gt;&gt; index 15635812b2d6..d2fe686ae018 100644<br>
&gt;&gt; --- a/drivers/irqchip/Makefile<br>
&gt;&gt; +++ b/drivers/irqchip/Makefile<br>
&gt;&gt; @@ -84,6 +84,7 @@ obj-$(CONFIG_MVEBU_SEI)&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; +=3D irq-mvebu-sei.o<br>
&gt;&gt;&nbsp; obj-$(CONFIG_LS_EXTIRQ)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; +=3D irq-ls-extirq.o<br>
&gt;&gt;&nbsp; obj-$(CONFIG_LS_SCFG_MSI)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; +=3D irq-ls-scfg-msi.o<br>
&gt;&gt;&nbsp; obj-$(CONFIG_ARCH_ASPEED)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; +=3D irq-aspeed-vic.o irq-aspeed-i2c-ic.o i=
rq-aspeed-scu-ic.o<br>
&gt;&gt; +obj-$(CONFIG_MACH_ASPEED_G7)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; +=3D irq-aspeed-intc.o<br>
&gt;<br>
&gt; There is no such thing as CONFIG_MACH_ASPEED_G7. And there will never =
be.<br>
&gt;<br>
&gt; You already received feedback on this, so why do you keep pushing your=
<br>
&gt; solution? You did not respond to any feedback given, just send the sam=
e<br>
&gt; and the same till we agree?<br>
&gt;<br>
&gt; NAK.<br>
<br>
And this?<br>
<br>
&gt;<br>
&gt;&gt;&nbsp; obj-$(CONFIG_STM32MP_EXTI)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; +=3D irq-stm32mp-exti.o<br>
&gt;&gt;&nbsp; obj-$(CONFIG_STM32_EXTI)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; +=3D irq-stm32-exti.o<br>
&gt;&gt;&nbsp; obj-$(CONFIG_QCOM_IRQ_COMBINER)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; +=3D qcom-irq-combiner.o<=
br>
&gt;&gt; diff --git a/drivers/irqchip/irq-aspeed-intc.c b/drivers/irqchip/i=
rq-aspeed-intc.c<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 000000000000..71407475fb27<br>
&gt;<br>
<br>
...<br>
<br>
&gt;<br>
&gt; ************* Email Confidentiality Notice ********************<br>
&gt; =A7K=B3d=C1n=A9=FA:<br>
&gt; =A5=BB=ABH=A5=F3(=A9=CE=A8=E4=AA=FE=A5=F3)=A5i=AF=E0=A5]=A7t=BE=F7=B1K=
=B8=EA=B0T=A1A=A8=C3=A8=FC=AAk=AB=DF=ABO=C5@=A1C=A6p =A5x=BA=DD=ABD=AB=FC=
=A9w=A4=A7=A6=AC=A5=F3=AA=CC=A1A=BD=D0=A5H=B9q=A4l=B6l=A5=F3=B3q=AA=BE=A5=
=BB=B9q=A4l=B6l=A5=F3=A4=A7=B5o=B0e=AA=CC, =A8=C3=BD=D0=A5=DF=A7Y=A7R=B0=A3=
=A5=BB=B9q=A4l=B6l=A5=F3=A4=CE=A8=E4=AA=FE=A5=F3=A9M=BEP=B7=B4=A9=D2=A6=B3=
=BD=C6=A6L=A5=F3=A1C=C1=C2=C1=C2=B1z=AA=BA=A6X=A7@!<br>
&gt;<br>
&gt; DISCLAIMER:<br>
&gt; This message (and any attachments) may contain legally privileged and/=
or other confidential information. If you have received it in error, please=
 notify the sender by reply e-mail and immediately delete the e-mail and an=
y attachments without copying or disclosing
 the contents. Thank you.<br>
<br>
Maybe I am the intended recipient of your message, maybe not. I don't<br>
want to have any legal questions regarding upstream, public<br>
collaboration, thus probably I should just remove your messages.<br>
<br>
Please talk with your IT that such disclaimers in open-source are not<br>
desired (and maybe even harmful).<br>
If you do not understand why, please also see:<br>
<a href=3D"https://www.youtube.com/live/fMeH7wqOwXA?si=3DGY7igfbda6vnjXlJ&a=
mp;t=3D835" id=3D"OWAc263736f-4270-8e2c-08f5-9dff08073e5e" class=3D"OWAAuto=
Link" data-auth=3D"NotApplicable">https://www.youtube.com/live/fMeH7wqOwXA?=
si=3DGY7igfbda6vnjXlJ&amp;t=3D835</a><br>
<br>
If you need to go around company SMTP server, then consider using b4<br>
web-relay: <a href=3D"https://b4.docs.kernel.org/en/latest/contributor/send=
.html" id=3D"OWA671c3a5a-885a-7218-8417-418f46e7a831" class=3D"OWAAutoLink"=
 data-auth=3D"NotApplicable">
https://b4.docs.kernel.org/en/latest/contributor/send.html</a><br>
<br>
Please be informed that by responding to this email you agree that all<br>
communications from you and/or your company is made public. In other<br>
words, all messages originating from you and/or your company will be<br>
made public.<br>
<br>
You already received exactly this feedback. Around three times. If you<br>
keep ignoring feedback, I will keep NAKing your patches.<br>
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

--_000_PSAPR06MB494928071577A5A8E537BF0189862PSAPR06MB4949apcp_--
