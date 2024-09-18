Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AF197C232
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Sep 2024 01:37:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X8FRQ2PDvz2yFJ
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Sep 2024 09:36:50 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feab::600" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726624410;
	cv=pass; b=XdkVvfNkOXLQX6BAUMsdgrcRgCok/PajO8cVcif5fNg7RA1cusZ/pJETMJPv0IXkU9ox2UUygInERKgjZIshBUA5ricSVsmqsXS9CNBK9Zhp+Mu1MxEHLigkS5OBl3+Y/gyaT7X/VWwOTs4tgxW0HXJWUxFy+zK3Efkp/sAsEV+TUeFincUj1OIlDF9AgOw+4yKvw8SpkaMNUvFe2FgT+mVEWLFpXoeQD/q1AouIWNU+NRfOiFMNd5S0FNCdYvMRB/GiYfLp8oGXIw1+aS30Sf5Qd4o/H1BoyT//QL8Z9A8hu6/+gIlACB6FVo70QrPdoHJDHCeRRWUQsbe5pXAnvQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726624410; c=relaxed/relaxed;
	bh=1AW672R+VpzgQqas9/APVCJXmmgbxwspfauGXjAZhZI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CRbaYxmhCP0PkiTDs4xpI3wjWZxvzX5dAChg/H2O0HSMHtVDEXUkxCT/AkK9ELHyzYmz0CQUBarKx4I5nJiabKX1JVAzG8jqBTkejqPu+WuuwBE9n3+LGmBiUk5uh1EcSC4ls3ga6G9G7rPMqJ9PTi7ETW1tWDI0Tqa62OoDerU9uLVT+PHCCEi9Yv9YD9bOnHVtNW7xJjE8TrBiQ3AWeVQW8K0e+OrBIogy2rnXyEe6kjfXlnc9AN0t20xnviAQLPSD10VjvIUBm0zEai6m75rKP1ywS32rZxNLpwJFwCF0r1qk0MJMfpPoSdL4SE5vKXi+AgznyOIxcxO0pb2WwQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=voJ7DCYi; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f400:feab::600; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=ricky_cx_wu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=voJ7DCYi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::600; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=ricky_cx_wu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20600.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X7hWY4hdyz2yFJ
	for <linux-aspeed@lists.ozlabs.org>; Wed, 18 Sep 2024 11:53:29 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gd+hHfaHLCERW315650zdmtUoaYr5BwGwdejoYqxKK6E7dtsb9rxkXJCDl7fX2KAEev1pRItQv8xps5pGHqjsvZmHsL/Aam5oQdws8SteFb6/0flTo6jdkJlRKHTFU6Z+9yS5lAKo0esKjFsuvEbzPErSCsrlK1G2orFr/BwkHUYp7V/qrfxwMPFDuT87BKIVEo9qBdzNWFGT2qZysPGwdxdW+4J9AK3hjl5UTCcSyAf3n0jbxCnKujVL0lMuXTjpcRGem0MIPr0XIpQBTcX7A+AwPRIBSl4f6/IOWKGin5zDrM+Zd44ce9gYzbvlq3KRHHrUcF39ALfVO3AD4IEZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1AW672R+VpzgQqas9/APVCJXmmgbxwspfauGXjAZhZI=;
 b=r7qVi0npWbqtxfl19D9oJhhiQX0z/fgvXoNczBqOIsKRr6ktNbA2wWZbjFR6h3aahPXw5MyBS6akEpxoKT0KevFvQGQfVYUW1sFw/6TZbh6XEMLSSKqFt/0TgTZQVq+fSEwpB96mPV64tzW4NGLmePkkKvISZK78wSMowqXJZFrlfGOljKeGU9QmEt0PAJ5DaUgDFNtsroH981rsjw47hoNgqxp19kUFacyJsruRRZySfxEspcUk5s24s+c5+JlkP81i8TBjh89AajdEVHw9R4Avs8x/Y8lF6ACctElLhdVqVN5og14vCPN60Pb+D04ZKGzBmVIHjm7/9UPU2/rHzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiwynn.com; dmarc=pass action=none header.from=wiwynn.com;
 dkim=pass header.d=wiwynn.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1AW672R+VpzgQqas9/APVCJXmmgbxwspfauGXjAZhZI=;
 b=voJ7DCYiH7fzPw5Qe/65turZStTEgg7PGjZm1deBPA1CutMnEy71pRm+7J8Z2NIOYdWEHhJeFpq86XxHjJU5Xm89/AKZlXsAOoorHf0taAxu+wDVVXyIOcPWhZzD2OO5yal0jq9CrphFsICL2S1Ilg6JNerZvNqT6b2FdLx8w6DhQPoMCxYCnbZdezKtqaiB67zSROi+sIAOdjCsAHHl9s2HvG06O6cpeC5K+wcHRb7/GWP47bY1FI7K2ZuKEZDQGpHlgtuD/cmjaBVUqw9TbljZ4pCEoLsOSzrIsvM99XoYBjSStLxYPQat8rKNPtKZ1G1jur1JryLpOqTyMqT9Rw==
Received: from TYZPR04MB5853.apcprd04.prod.outlook.com (2603:1096:400:1f3::5)
 by SEZPR04MB7700.apcprd04.prod.outlook.com (2603:1096:101:1ee::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Wed, 18 Sep
 2024 01:53:04 +0000
Received: from TYZPR04MB5853.apcprd04.prod.outlook.com
 ([fe80::ae7d:7486:9319:8d96]) by TYZPR04MB5853.apcprd04.prod.outlook.com
 ([fe80::ae7d:7486:9319:8d96%6]) with mapi id 15.20.7962.022; Wed, 18 Sep 2024
 01:53:04 +0000
From: Ricky CX Wu/WYHQ/Wiwynn <Ricky_CX_Wu@wiwynn.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, Delphine_CC_Chiu/WYHQ/Wiwynn
	<Delphine_CC_Chiu@wiwynn.com>, "patrick@stwcx.xyz" <patrick@stwcx.xyz>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Subject: RE: [PATCH v1 2/2] ARM: dts: aspeed: yosemite4: Add gpio pca9506 for
 CPLD IOE
Thread-Topic: [PATCH v1 2/2] ARM: dts: aspeed: yosemite4: Add gpio pca9506 for
 CPLD IOE
Thread-Index: AQHbA0UHYnKTipIy9EyxznCx6Ypb1bJTa20AgAGQKZCAABa04IAEsbUAgAMP/dA=
Date: Wed, 18 Sep 2024 01:53:04 +0000
Message-ID:  <TYZPR04MB5853E773E757FC608AF62B61D6622@TYZPR04MB5853.apcprd04.prod.outlook.com>
References: <20240910054751.2943217-1-Delphine_CC_Chiu@wiwynn.com>
	 <20240910054751.2943217-3-Delphine_CC_Chiu@wiwynn.com>
	 <ccef1d90b9a7eb343e99afa2c6cd6ea7407b0541.camel@codeconstruct.com.au>
	 <TYZPR04MB5853B6611AF9AA5C3E5AE778D6652@TYZPR04MB5853.apcprd04.prod.outlook.com>
	 <TYZPR04MB5853062387962EB4CA08A366D6652@TYZPR04MB5853.apcprd04.prod.outlook.com>
 <a18eff1095e1ddffa8eb44fb4a76a0b458213a62.camel@codeconstruct.com.au>
In-Reply-To:  <a18eff1095e1ddffa8eb44fb4a76a0b458213a62.camel@codeconstruct.com.au>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiwynn.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR04MB5853:EE_|SEZPR04MB7700:EE_
x-ms-office365-filtering-correlation-id: 06d93f8b-5a0e-485a-a231-08dcd784a2a9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:  =?utf-8?B?THk1RVV4dXdsRU1wcGlSRWJnclRHbVp5ei8yNHQxWTluMmFyMm1pY3Y2dE5y?=
 =?utf-8?B?bjlmT2dtMVFDVXhjVVJBcS94aGc5Skc2aUdiNDd0RkMvWHhUYmVXdnppL0Zp?=
 =?utf-8?B?RnVBUUlKdkVmU3piUEpoNWlFM2pnMFVlSXhTTkhlSjFHdzFDbTZ1WHN1RFV5?=
 =?utf-8?B?dlNOaitGc0luVmpFNmdYNGxmelBEZTNOUkF5bWh3SmkxVUNrVkM4WFFHUkY4?=
 =?utf-8?B?SkFwRW5uRDA4d2lTczRnMXE4NCtIRmZzaE9kOHo1eTY3SGhRcXUzTGFwZlkv?=
 =?utf-8?B?ZGhvazQza3gwTExnOWVTSlR3ZlN5eGQwczNtcnpsQUwyRE84cUUvVENaYkcr?=
 =?utf-8?B?Qkd6OVlPOUVoazdQbkptdlNoTGhkMVZSTHREU29waFVBdDMwL3RMREdKSG9Z?=
 =?utf-8?B?MEp5QXNtT1J6OWJxdzI0b3BRVnlHcEk1SldZUkNlcWtoT0EyVmtXSmVuakNB?=
 =?utf-8?B?cm5WaUdGdGlQYlBsckF2MGJhMXF2ZHhxNzRaeVlEcjRuWXVPN2NaNkxFQ1Bt?=
 =?utf-8?B?QTdMY3A1QVlRUDQ5b21vRUtTTU56QTBDc1NsM1JyeVBIZmZLdTFja0pJc3Vq?=
 =?utf-8?B?cmgwSlZTazRDUk9uQmhIdy9NMk00YmNJK1NEZytjcFRISFp3U00ySnR4MXZw?=
 =?utf-8?B?VVlJQlNHUGF5aHREeThUa1dCc0tFellFWkJxY0QyZzBRSEg1R3JmZytWUWNX?=
 =?utf-8?B?WWdzKzNZM21Lbmw0UTRsZVdNdUdTblllY2NvOU9tVHkxWTFHTTV2NUV4U0RE?=
 =?utf-8?B?Y2hkcVVRdXNoQlpsRUluQjhrZ0FIak9tYmhvS3E3WHpMZ1pkQWJ4RFIrd3pI?=
 =?utf-8?B?b29SOGhPL3Nyam9tYXJzdWRpZHk2T1ZwTDNhUDFGV1BSWEVyNEdETzhuUmVh?=
 =?utf-8?B?UnNUOW0rZGJkV3ZJSlVHWjUxeVNhbG9TOXFXR2NoM3ZoUTZCN2JIWjdLVVZQ?=
 =?utf-8?B?ZDFNNXVVQU1pK3g0S3R1N2wxbHN3YTNQS2NYNWFXVnpFL0dMVHBzV2ZTVy9F?=
 =?utf-8?B?WVlzRkN1VUtzZ0p6ZXViWnExVUFvTW0xaCtLL2Z3T0JBK04yMkZzMjZmdTgv?=
 =?utf-8?B?d2VHbDV6NlJXN1N3d29pMUpzUTg2dDYzdlhaZ1J4YTdBWEFDbWpyQlF1cHM0?=
 =?utf-8?B?SDFCY0NEZlJUOURBWjI1V0RnOUJEaTU3ZGVMczRUbTc3V0VJelZZeFljcmlU?=
 =?utf-8?B?aVJ2dmRLTkNqTFk2OGJOSytXSHJNb3NpNlJCbWUvWGJ5ZENPd1VmK1Eyd0RR?=
 =?utf-8?B?MUFuV1dGVDdRL0xvVlM3QmFYRk0xNHlHYVQ3eVYwUW13anNvb0FmOGdlc0ls?=
 =?utf-8?B?S3hZV2hnTzVLS3orVFdtVWZ2R2xxeEZBa0NmbUx4YlBtMmFDOHYraHhOTkZo?=
 =?utf-8?B?T3Q4a1FYaktGRHdoNlFXWStscHdleVp4cE5QcGE4QUVna0tkR3h3VXluWEo0?=
 =?utf-8?B?VDA5Z3p5NFZoc3lyM0oxQlR0dVNOZHpCTHdqRnY0a2p0WGM4UG9Da3VTSGdW?=
 =?utf-8?B?MloxcTV6VlJ1MXJXdDlzZ0RPRUJqY2VaQjRySk1SM3BkcUd0MUR1aGpQTGQ1?=
 =?utf-8?B?M20zRWo3TUxkMW9NeTlKV1JlR1cvdHNyTGlSaEpXWWh3bnZTMUpzd1FXUU9m?=
 =?utf-8?B?djRyYUhkMXJIaUhablRuRCsreXNSR2xOWFUvZmZWVCsyd3ZKbWk1dVNjVWpX?=
 =?utf-8?B?ajVsU3NoN3BaQkNUalhTNUwzQXVyWnFUQmcyVmdvb3NwSW1uNjJrK1kwZEtz?=
 =?utf-8?B?UGpVY2JTaW1zaHFCTnByaS81ckxNMmkvQThJK2FkOWpGaXVmcDBJcjhxbjBT?=
 =?utf-8?B?Tm9oVDc3VXgzS2IxRTgyUT09?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR04MB5853.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?bDBnWlFtM0t2cDNjWlpRTVNTY2FRNnk1V3hhU0F1czZ2Q2tudlJuZzErSCta?=
 =?utf-8?B?YTBudjVlSHRxa1ZkRk5rKzcvWGtjdDB5ZUFSVHBNM3QvUmt0V3VrNk5DMGNh?=
 =?utf-8?B?L2c2RGgzc0RrVmJRbFdGV1pFNmZ0YUhIUUc5WHNlbFJLcGl4eG9kMjlzTXNV?=
 =?utf-8?B?bGN0L1VzY3Z1em9WWWtnQmlkb0pnaUN3MEplNmVjSzdBeTlsSnFHeTExRjhW?=
 =?utf-8?B?MVRMR0FUNXBMblJQREpqMnMwMUkyUnc0MXNEYXZtSlpZUTFZTi9jODhtdlA0?=
 =?utf-8?B?dmtmSkZzOFhGU2kzaE8vMTE1RzVMSEhuMXRvaU41NVJYMTZtQW5aN3JZOEYw?=
 =?utf-8?B?RXN1T1lzeHZRT0lmczFUdjBtMHphZUIzangrRFZqUzBoeEhyM1MrOGY1Sk5I?=
 =?utf-8?B?UEtzdGI1Y2pUcVdESTdlWXArT0xyQjA1c2d2TnpUNFc3Z0g3WWdPeEk1SWQ3?=
 =?utf-8?B?MXkybUlTYjdkOE1OVnNYN1Z1bWlpV01TQXhCQnZxQm1kMzBhMTJHRkhwQTl0?=
 =?utf-8?B?NzVtaTRaejMvTWNJNmljS2ZGa1d1eExxNllqOUNBc1pDbkVwWW9rWFYyWU9D?=
 =?utf-8?B?Q01ONkRrK3BFSkNQcGRmaFpvM0d2L3B0WTlBM0w0VnlnTFo5bFNZeFdSS1kr?=
 =?utf-8?B?QWxmdlprT0VkaUhrdm43M3ZweGhXbS9ENnEyTHdzeU4veGcyc3NoUUJUT0lS?=
 =?utf-8?B?M1htTGdhbkVGKzhMSkcxVE9YSnlwbldEbFFiNEI1ZEZwTlNqVVJXWUpBMzNz?=
 =?utf-8?B?blVScjV6TDNJSjRCQlFTMGFkRFAwc05SMmdTUDZMdTM2c0x5bjFHaVpZOTM0?=
 =?utf-8?B?Y1ZacXAwSkNIY2FpOXlnMEdjcEVwblhNR1BPRXBDOXZIOUJienZaZko4bzZS?=
 =?utf-8?B?V3Y0K2hURFloblNtdml3RExCR1o3aTFlUHhvOU92SzZlQkg1aDJac3RXQWI2?=
 =?utf-8?B?M0xYWnBEQTlRc01tdVNVeC9pQTQ0QmtNYXg1Rk1yT0NPazJJdXZwdDlwSHVl?=
 =?utf-8?B?eEJkbHdwYml5dFo0VUxaNDVac0s3K1U0SFVrVjhJNklhaUpFbms3UFdTOTZE?=
 =?utf-8?B?YnJsditqSGd2SFMzOGtLN1BybEhXeGNlN3pycTZwcGJnbEEzb2hTREgzQlJC?=
 =?utf-8?B?S2lQckdTSENQaElZclZkTEVWdUptM0NOc0NrZmVBTVBzVk9FZTFWeDhzN0Q3?=
 =?utf-8?B?ZnR4c0JGbXZVUy9kNklZNjFBcXZEV0dIc21tRW9HVUdWK01BOEN4bERwNDVM?=
 =?utf-8?B?K2R0eUllYlRBSEZhcG9XYVgwc0tvQ283ZC91YWV3eTVkaVdlbGVaaVBRZ0pq?=
 =?utf-8?B?YkZPSk1ZWjRvWmdpeS9JbkRGbWUwazVNTTFRejdYYWFZaWE0Q2F2RDZTdnp2?=
 =?utf-8?B?U0NsdnBRMGpjS25pN1FiQjI4TzRVbGtVMk9qTlIzdXJkcnVPRWpzUEdla1hQ?=
 =?utf-8?B?aDBpalcrdnlBd2NObUllSE9ONGY4d3psank3YlZSbEtsSVM4QS9ZSC9KVFFJ?=
 =?utf-8?B?c2xuOTNVTlRINWZVVWFYKysvY3doNUQrK1pFUkh4OXlFb3V5OUY3Z1U2djQ5?=
 =?utf-8?B?MEtNMmQvVitHQzBzaWQxM1pabFRKQXpVa0dUZ1J3OTlLNEt5YlZ3b0Ryd3Bp?=
 =?utf-8?B?VTJPZEN5M3RCdTdtNHhNQmJWazdBMFVSRjBqYVV5NUtXVzM2SHlKUVpTY1JO?=
 =?utf-8?B?Q0wzRG5wc1pMQkdNSDFpek0rRlZ2MnhQVXBZbEIzTDFIOWhMamU0MG5Wb2dQ?=
 =?utf-8?B?QjdOWW1tMVRZaVIvdHYwQ3J5U0w1b3orMS9CV0FWajcvT3Q3dkZGU1Y1aGx4?=
 =?utf-8?B?OTVrTVl3bmhTUnQzZVErSzE2b0VTSGpXNkhYQkxadXAvUmwwc2lIaWNDMUJp?=
 =?utf-8?B?aTltSkpEc0ZUeWdnTUcwWk9UeTBuT01peWJhT3RMWmxyaHNLYmpwNndWWjV6?=
 =?utf-8?B?UUR3WWxpSGlEb2pJYTdFWElpa21hT0M4QjI4dWpVVGxZV3F5M0hJeXNXSjZ6?=
 =?utf-8?B?QnZHUm5TeW4zMFo4WkZyTmlZeGJMOHROa1k5NW9qQ0FsQlIxODJXTzFoVE00?=
 =?utf-8?B?VW1XdldRaUlNc1J4UXM5bVRwai9EaGdObXNlMEhpUVFXR0JNdWpjYXZaL2Jr?=
 =?utf-8?Q?O/UnkDwQ7vuUAvzEPxX2F8Zfp?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR04MB5853.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06d93f8b-5a0e-485a-a231-08dcd784a2a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2024 01:53:04.4241
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6OpBGURXV5SytAgKKx7+ix/b6Rpt6NhwPfjFp/CNs91a/L81zKY7BEsCd6jOK6yHuzaxBzrdxMpZREB4jsM0sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB7700
X-Mailman-Approved-At: Thu, 19 Sep 2024 09:36:48 +1000
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5kcmV3IEplZmZlcnkg
PGFuZHJld0Bjb2RlY29uc3RydWN0LmNvbS5hdT4NCj4gU2VudDogTW9uZGF5LCBTZXB0ZW1iZXIg
MTYsIDIwMjQgMTE6MDUgQU0NCj4gVG86IERlbHBoaW5lX0NDX0NoaXUvV1lIUS9XaXd5bm4gPERl
bHBoaW5lX0NDX0NoaXVAd2l3eW5uLmNvbT47DQo+IHBhdHJpY2tAc3R3Y3gueHl6OyBSb2IgSGVy
cmluZyA8cm9iaEBrZXJuZWwub3JnPjsgS3J6eXN6dG9mIEtvemxvd3NraQ0KPiA8a3J6aytkdEBr
ZXJuZWwub3JnPjsgQ29ub3IgRG9vbGV5IDxjb25vcitkdEBrZXJuZWwub3JnPjsgSm9lbCBTdGFu
bGV5DQo+IDxqb2VsQGptcy5pZC5hdT4NCj4gQ2M6IFJpY2t5IENYIFd1IDxyaWNreS5jeC53dS53
aXd5bm5AZ21haWwuY29tPjsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFy
bS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsNCj4gbGludXgtYXNwZWVkQGxpc3RzLm96bGFi
cy5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2MSAyLzJdIEFSTTogZHRzOiBhc3BlZWQ6IHlvc2VtaXRlNDogQWRkIGdwaW8gcGNhOTUwNg0K
PiBmb3IgQ1BMRCBJT0UNCj4NCj4gIFtFeHRlcm5hbCBTZW5kZXJdDQo+DQo+ICBbRXh0ZXJuYWwg
U2VuZGVyXQ0KPg0KPiBPbiBGcmksIDIwMjQtMDktMTMgYXQgMDM6MjYgKzAwMDAsIERlbHBoaW5l
X0NDX0NoaXUvV1lIUS9XaXd5bm4gd3JvdGU6DQo+ID4NCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBEZWxwaGluZV9DQ19DaGl1L1dZSFEvV2l3eW5uDQo+ID4g
PiBTZW50OiBGcmlkYXksIFNlcHRlbWJlciAxMywgMjAyNCAxMDowOCBBTQ0KPiA+ID4gVG86IEFu
ZHJldyBKZWZmZXJ5IDxhbmRyZXdAY29kZWNvbnN0cnVjdC5jb20uYXU+Ow0KPiA+ID4gRGVscGhp
bmVfQ0NfQ2hpdS9XWUhRL1dpd3lubiA8RGVscGhpbmVfQ0NfQ2hpdUB3aXd5bm4uY29tPjsNCj4g
PiA+IHBhdHJpY2tAc3R3Y3gueHl6OyBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPjsgS3J6
eXN6dG9mDQo+ID4gPiBLb3psb3dza2kgPGtyemsrZHRAa2VybmVsLm9yZz47IENvbm9yIERvb2xl
eSA8Y29ub3IrZHRAa2VybmVsLm9yZz47DQo+ID4gPiBKb2VsIFN0YW5sZXkgPGpvZWxAam1zLmlk
LmF1Pg0KPiA+ID4gQ2M6IFJpY2t5IENYIFd1IDxyaWNreS5jeC53dS53aXd5bm5AZ21haWwuY29t
PjsNCj4gPiA+IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC1hcm0ta2VybmVsQGxp
c3RzLmluZnJhZGVhZC5vcmc7DQo+ID4gPiBsaW51eC1hc3BlZWRAbGlzdHMub3psYWJzLm9yZzsg
bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZw0KPiA+ID4gU3ViamVjdDogUkU6IFtQQVRDSCB2
MSAyLzJdIEFSTTogZHRzOiBhc3BlZWQ6IHlvc2VtaXRlNDogQWRkIGdwaW8NCj4gPiA+IHBjYTk1
MDYgZm9yIENQTEQgSU9FDQo+ID4gPg0KPiA+ID4NCj4gPiA+DQo+ID4gPiA+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+ID4gPiA+IEZyb206IEFuZHJldyBKZWZmZXJ5IDxhbmRyZXdAY29k
ZWNvbnN0cnVjdC5jb20uYXU+DQo+ID4gPiA+IFNlbnQ6IFRodXJzZGF5LCBTZXB0ZW1iZXIgMTIs
IDIwMjQgMTA6MTEgQU0NCj4gPiA+ID4gVG86IERlbHBoaW5lX0NDX0NoaXUvV1lIUS9XaXd5bm4N
Cj4gPERlbHBoaW5lX0NDX0NoaXVAd2l3eW5uLmNvbT47DQo+ID4gPiA+IHBhdHJpY2tAc3R3Y3gu
eHl6OyBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPjsgS3J6eXN6dG9mDQo+ID4gPiA+IEtv
emxvd3NraSA8a3J6aytkdEBrZXJuZWwub3JnPjsgQ29ub3IgRG9vbGV5DQo+ID4gPiA+IDxjb25v
citkdEBrZXJuZWwub3JnPjsgSm9lbCBTdGFubGV5IDxqb2VsQGptcy5pZC5hdT4NCj4gPiA+ID4g
Q2M6IFJpY2t5IENYIFd1IDxyaWNreS5jeC53dS53aXd5bm5AZ21haWwuY29tPjsNCj4gPiA+ID4g
ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFk
ZWFkLm9yZzsNCj4gPiA+ID4gbGludXgtYXNwZWVkQGxpc3RzLm96bGFicy5vcmc7IGxpbnV4LWtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSCB2MSAyLzJd
IEFSTTogZHRzOiBhc3BlZWQ6IHlvc2VtaXRlNDogQWRkIGdwaW8NCj4gPiA+ID4gcGNhOTUwNiBm
b3IgQ1BMRCBJT0UNCj4gPiA+ID4NCj4gPiA+ID4gIFtFeHRlcm5hbCBTZW5kZXJdDQo+ID4gPiA+
DQo+ID4gPiA+ICBbRXh0ZXJuYWwgU2VuZGVyXQ0KPiA+ID4gPg0KPiA+ID4gPiBPbiBUdWUsIDIw
MjQtMDktMTAgYXQgMTM6NDcgKzA4MDAsIERlbHBoaW5lIENDIENoaXUgd3JvdGU6DQo+ID4gPiA+
ID4gRnJvbTogUmlja3kgQ1ggV3UgPHJpY2t5LmN4Lnd1Lndpd3lubkBnbWFpbC5jb20+DQo+ID4g
PiA+ID4NCj4gPiA+ID4gPiBXZSB1c2UgQ1BMRCB0byBlbXVsYXRlIGdwaW8gcGNhOTUwNiBJL08g
ZXhwYW5kZXIgb24gZWFjaCBzZXJ2ZXINCj4gPiA+ID4gPiBib2FyZHMuDQo+ID4gPiA+ID4gVGhl
cmVmb3JlLCBhZGQgcGNhOTUwNiB0byBwcm9iZSBkcml2ZXIgZm9yIHRoZSBDUExEIEkvTyBleHBh
bmRlci4NCj4gPiA+ID4NCj4gPiA+ID4gSSB0aGluayBpdCBtaWdodCBiZSBiZXN0IGlmIHlvdSBh
ZGQgeW91ciBvd24gY29tcGF0aWJsZSB0byB0aGUNCj4gPiA+ID4gbGlzdCBpbiB0aGUgZ3Bpby1w
Y2E5NXh4IGJpbmRpbmcganVzdCBpbiBjYXNlIHRoZXJlIGFyZSBzb21lDQo+ID4gPiA+IGJlaGF2
aW91cmFsIHF1aXJrcyBvZiB5b3VyIENQTEQgaW1wbGVtZW50YXRpb24/IE5vdCBzdXJlIGlmIHRo
aXMNCj4gPiA+ID4gc2hvdWxkIGJlICJmYWNlYm9vayxwY2E5NTA2IiBvciAid3l3aW5uLHBjYTk1
MDYiLCBidXQgYXNzdW1pbmcNCj4gPiA+ID4gZmFjZWJvb2ssIGZyb20gdGhlcmUgeW91IGNhbiBz
cGVjaWZ5DQo+ID4gPiA+DQo+ID4gPiA+ICAgICBjb21wYXRpYmxlID0gImZhY2Vib29rLHBjYTk1
MDYiLCAibnhwLHBjYTk1MDYiOw0KPiA+ID4gPg0KPiA+ID4gPiBUaGlzIGFsbG93cyB5b3UgdG8g
YWRkIHRoZSBxdWlya3MgdG8gdGhlIGRyaXZlciBhcyByZXF1aXJlZCBpbiB0aGUNCj4gPiA+ID4g
ZnV0dXJlIHRocm91Z2ggdGhlIG1vcmUtc3BlY2lmaWMgY29tcGF0aWJsZS4NCj4gPiA+ID4NCj4g
PiA+ID4gQW5kcmV3DQo+ID4gPg0KPiA+ID4gSGkgQW5kcmV3LA0KPiA+ID4NCj4gPiA+IFRoYW5r
cyBmb3IgdGhlIHJldmlldy4NCj4gPiA+IEknbGwgYWRkIHRoZSAiZmFjZWJvb2sscGNhOTUwNiIg
aW4gZ3Bpby1wY2E5NXh4IGJpbmRpbmcgaW4gbmV4dA0KPiA+ID4gdmVyc2lvbiBvZiBwYXRjaGVz
Lg0KPiA+DQo+ID4gSGkgQW5kcmV3LA0KPiA+DQo+ID4gSSB0cmllZCB0byBhZGQgImZhY2Vib29r
LHBjYTk1MDYiIGluIHRoZSBjb21wYXRpYmxlIGxpc3Qgb2YNCj4gPiBncGlvLXBjYTk1eHggYmlu
ZGluZyBhbmQgYWRkIGNvbXBhdGlibGUgPSAiZmFjZWJvb2sscGNhOTUwNiIsDQo+ID4gIm54cCxw
Y2E5NTA2IiBidXQgZ290IGZvbGxvd2luZyBmYWlsZWQNCj4gPiBtZXNzYWdlczoNCj4gPiAgICAg
Z3Bpb0AyMTogY29tcGF0aWJsZTogJ29uZU9mJyBjb25kaXRpb25hbCBmYWlsZWQsIG9uZSBtdXN0
IGJlIGZpeGVkOg0KPiA+ICAgICAgICAgWydmYWNlYm9vayxwY2E5NTA2JywgJ254cCxwY2E5NTA2
J10gaXMgdG9vIGxvbmcNCj4gPiAgICAgICAgICdkaW9kZXMscGk0aW9lNXY2NTM0cScgd2FzIGV4
cGVjdGVkDQo+ID4gICAgICAgICAnbnhwLHBjYWw2NTM0JyB3YXMgZXhwZWN0ZWQNCj4gPiAgICAg
ICAgIGZyb20gc2NoZW1hICRpZDoNCj4gPiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0
cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvZ3Bpby9ncGlvLXBjDQo+ID4NCj4gYTk1eHgueWFt
bCpfXztJdyEhSjYzcXFnWGohS2w0cUhzLWMwRU9CUG12M2FvU1BOb09JNHJ5UTA3R0hDaWFGSVpr
bjcNCj4gZEgNCj4gPiAtYVlfNTBic09vUzNabUYxYlFwVnQwWl9wZEtBTm9wVHV0LW80Q0h6bFdX
Ul95YTAkDQo+ID4gV291bGQgbGlrZSB0byBhc2sgZG8geW91IGhhdmUgYW55IHN1Z2dlc3Rpb25z
PyBUaGFua3MuDQo+DQo+IE1tbSwgbWF5YmUgaXQncyBiZXN0IGlmIHdlIGxlYXZlIHRoZSBjb21w
YXRpYmxlIGFzIGp1c3QgJ254cCxwY2E5NTA2Jw0KPiBmb3Igbm93LCBidXQgaWYgeW91IGRvIGRp
c2NvdmVyIHF1aXJrcyB0aGVuIHdlIGNhbiBjb25zaWRlciB0aGlzIGFnYWluLg0KPg0KPiBBbmRy
ZXcNCkhpIEFuZHJldywNClRoYW5rcyBmb3IgeW91ciByZXBseS4NCkknbGwga2VlcCB0aGVzZSBw
YXRjaGVzIGF0IHYxLiBUaGFua3MuDQpXSVdZTk4gUFJPUFJJRVRBUlkNClRoaXMgZW1haWwgKGFu
ZCBhbnkgYXR0YWNobWVudHMpIGNvbnRhaW5zIHByb3ByaWV0YXJ5IG9yIGNvbmZpZGVudGlhbCBp
bmZvcm1hdGlvbiBhbmQgaXMgZm9yIHRoZSBzb2xlIHVzZSBvZiBpdHMgaW50ZW5kZWQgcmVjaXBp
ZW50LiBBbnkgdW5hdXRob3JpemVkIHJldmlldywgdXNlLCBjb3B5aW5nIG9yIGRpc3RyaWJ1dGlv
biBvZiB0aGlzIGVtYWlsIG9yIHRoZSBjb250ZW50IG9mIHRoaXMgZW1haWwgaXMgc3RyaWN0bHkg
cHJvaGliaXRlZC4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkIHJlY2lwaWVudCwgcGxlYXNl
IG5vdGlmeSB0aGUgc2VuZGVyIGFuZCBkZWxldGUgdGhpcyBlbWFpbCBpbW1lZGlhdGVseS4NCg==
