Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8119298DE7C
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Oct 2024 17:10:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XJdXk3N9wz2yYK
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Oct 2024 01:10:30 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c400::" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727881825;
	cv=pass; b=oUpbQqYMCU+TZdytVFwkXhPj13rO1qoiP989wfx3pmJypVA9td+c+xA5qqD7tiL6CccqyVIP7nXlap0Y/3VNB8oeiIJk89NxetsAjCWQVHcK8payeef6FnfBaMv41YmlCNjTAkAk9I//g//IMoS8LQkpN+MouTQStzfaRE3rx1RRYx9H6KtVkKZQLP2XVndvrdwEdQbcl28jbWJDhL7vOg9Vg9FQLoZ/538Y5jV7fe4HA0cvjcwLVVjDqhUb28+zRKbHYr5GCZP5hJtI5f47amYAfFM1eS4WFv79ndaDSZOndyIeZuXsY66r1hY2ibZrVSoe7oeiohsw2SGfgcQClw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727881825; c=relaxed/relaxed;
	bh=kgRdHo/XhTOEKr5+2I71LdD82XM9Vx5NVaKN0h83xHc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UL8jEZBw0VYNVYPILBY6vK3u40Eg9gMeIIBWLzxXR6vFQaNdYdYkRoTaff6vqL7PF+MOuvUfZhAWK9QAZ7Bvi463NplP8yrCQcznSyd2ZAV1wEm/z4+nCJhlsw7bM3fLOrC8vAFxSa/3ugv8TkJbGuVaQFIBp926wvlb5O5drYOzruQq0G5kxWlWeRpg3218fN6pQcLv4aV1WnDLD7TCr9CP3ugXNyEsQkMAjNZQOHXvzqB5aSM1KLfvFaI6riTQRzUdFGuXp6lyzlCp8SlADRvSIoo7h/BtwxMcLRzNWfAobxJ8WQBx7QDNOqAvJfIKjwWR9aCHvLu6tj7Ow+xUGg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=2a01:111:f403:c400::; helo=hk2pr02cu002.outbound.protection.outlook.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c400::; helo=hk2pr02cu002.outbound.protection.outlook.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazlp170100000.outbound.protection.outlook.com [IPv6:2a01:111:f403:c400::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XJdXS041gz2xGw
	for <linux-aspeed@lists.ozlabs.org>; Thu,  3 Oct 2024 01:09:57 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wC4QrVLbcz19pcPCAwKk/dOB2iWfsqzMgkisnI0Aod3jHTOOB/uwNrkjx0m+D5sJ8Mxq+IxLaCoIexVfbYisiYhbCfWDW/koXa8dT4c8vxoE0vScq8jxmypbr676DL4gkzm8nFGcWnkVs5uoHtPKOuksCwxKUXSCX3LEO4GOO3eyoC7kQxNUdbMOx+BWPqRqnDB6qQtSnLIUhCeFNaqAEydUgKs8xCY28KtVy4xq8HGLlnKeEahaMaEa1EqMHxPkqME1D5NT3IXSpEV7Sy+9ltG3eFxdJg9HUPM6VPpE8bzHpqIdeMk2WaZAXpALxOWLsp4FkRG0fVVwtBj4btBc6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kgRdHo/XhTOEKr5+2I71LdD82XM9Vx5NVaKN0h83xHc=;
 b=dBqOzM1kEzQda/cGFTRjFN8SgEqHk5wVAI1PgOBTkuDy06XVpgpue+jdA+pxRnM/meR0Et737y0z/HMnoo39Se/kaj427m2YGhxKnXIvjQwiOCGJ1RnrkMdPL1ga+IZxJfPGeIJb4FdvsR5zBAMZw+wIbGwtbnNH0Z6NrdmE8tTmQOc5ecs1eWaCvJ4DJ/np+huSxmNqqX6pKVIp/2ZNmYcev9QqcbhC2baQZBUiZEyZx9M5pSVUk4OrCiI3DZWEWmtEEHpCd/S+CCrWAmIO2gN+QCiWuZnuAQX2w6L/6IlAbjcA407af0Y1GeQJQWgKje5Y71LGB8sQ4M6wPA/wPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kgRdHo/XhTOEKr5+2I71LdD82XM9Vx5NVaKN0h83xHc=;
 b=aPCXHX13y5Ac7gLOYo4eDu3Rk3AAIyOouQk4DystZU+3AN9/EFqeBD5m5stQfBIxy6hplFdwREfiLIU496RaE/CA6LjkTIRwMPv50YQaaDesw48tb6axH0/zToPzARkFqJR9S1jBxdsXgIv1/LELV1YQ6v1L4QkN0qet9aY0zdbmnMs+VZEbbMGyDASXqjCUO4HiuSyRO4EcRKtZdVSGrKIH0f79uje2B7g6/5tFvIqdEOrqxhM95y5VRRIKrEgkI9YN9jPKg/y/m/ChD96kbqc5bX8o9yFKEWnAheGoVtqh0wRglMe+rHvBIM9w7ajvnko7Wrd4qRpnbClS2TZmwA==
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com (2603:1096:604:29c::6)
 by TYSPR06MB6314.apcprd06.prod.outlook.com (2603:1096:400:417::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Wed, 2 Oct
 2024 15:09:29 +0000
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::814e:819a:7d52:7448]) by OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::814e:819a:7d52:7448%7]) with mapi id 15.20.8026.016; Wed, 2 Oct 2024
 15:09:29 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij
	<linus.walleij@linaro.org>
Subject: Re: [PATCH v4 6/6] gpio: aspeed: Add the flush write to ensure the
 write complete.
Thread-Topic: [PATCH v4 6/6] gpio: aspeed: Add the flush write to ensure the
 write complete.
Thread-Index: AQHbCnhxj9zpVgrVIEm0MBTx4OQN67JyBIQAgAFR3ICAAEyvuw==
Date: Wed, 2 Oct 2024 15:09:29 +0000
Message-ID:  <OSQPR06MB7252DF4BB404D5C01785BB5B8B702@OSQPR06MB7252.apcprd06.prod.outlook.com>
References: <20240919094339.2407641-1-billy_tsai@aspeedtech.com>
 <20240919094339.2407641-7-billy_tsai@aspeedtech.com>
 <CACRpkdbFD9CiqVwQ5xxZ9SfQtVvDJGCr=8spxBG4u-JQ0PKJ3w@mail.gmail.com>
 <CAMRc=MdvV7Z2yPpoR9mXLH6UCF5uA=TbkC_qUSj=akP_09M0WQ@mail.gmail.com>
In-Reply-To:  <CAMRc=MdvV7Z2yPpoR9mXLH6UCF5uA=TbkC_qUSj=akP_09M0WQ@mail.gmail.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR06MB7252:EE_|TYSPR06MB6314:EE_
x-ms-office365-filtering-correlation-id: 49a93680-0a87-42a2-79a1-08dce2f43651
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:  =?utf-8?B?Rm5DMUFmTFFmQ3pLam1mYU5RQ2tiQVYzeGdGOGZ3NzZCNnNmbkRkNnB0TFVC?=
 =?utf-8?B?QVJHTnBZVVcrNFljYkljYnE4dmZnQjN6OUJmM3J3NnhSbndFZkRuWlY2eTN2?=
 =?utf-8?B?VHVpUzk4clFYd1A5UGIxSFVtN2U5cllBbHZCRWJWR09oSFBaTitTSHRJMnNK?=
 =?utf-8?B?TUhmTDN1Uzhvb3o2dWQ2TzZtWTh1c21RUHJ6RWhEb2lPNi9wcDg5QWhQT212?=
 =?utf-8?B?MVgwaU50WVdKZkd2RjdBazA1RUVjWWZRblZXVXBRMGpYT0JlU2FpZVZTUlZ3?=
 =?utf-8?B?clQwRG1BMktUQTR4THh6a01nVzk1UnZlWGRMbWgxT0QwWjgrL1cyeE0zVzAz?=
 =?utf-8?B?aXVIZUJ0TFlSaXhxMlJLdlhHRWR5MWpVK0U4c1cxZXBScEpsTFdROWdYdVBM?=
 =?utf-8?B?ZFNnc2VFMmNubWMyWXhEcThhT3VOUGdvMmZMSmdmN0d0STU5eDBpdUh5bTN4?=
 =?utf-8?B?YWNLNGtJSFRYb0VOb3VQRlhsTEFHRTVpUHBzeVorUXFDeFRhYks2TnM5OXk0?=
 =?utf-8?B?UE5QNVNRNDQxdEN1WEhQQ3NXcTIrNHdCdWNOZ0VzeTlrREU3T3dCUjJoZWhZ?=
 =?utf-8?B?cU9VZUlZY1Q3Ni9ndDdRVmVFNFpoTFpEUUlaSlAxcjNYVXRRYU5saXVSLzBy?=
 =?utf-8?B?c1NQS1pyUXRZQi83Zzk2aTN2RTZMSFUxMjl2TGxKUVU1QWpMVWdCQ3JyY0Rx?=
 =?utf-8?B?dktkdDJVN2RXTk5yOHFzRzNuMU1uS25YbWVOR1VDN2tTb21walc4YkREMk14?=
 =?utf-8?B?c3dTZzRha2U2Rzc2cFlodGVOVjN4Q0Nlb3U1SFFiZjROVDVnY3V1VE44cHBt?=
 =?utf-8?B?c2kvcXh3WUpSczlnMmJwTXFHRi9tOEF0ZVZTMkR0c0wxNXFoUGYwMW53Y1lL?=
 =?utf-8?B?OUpTUDBXVkRZVHpjVnpMSHdqUTY0UThNajJLNXdvdk56Ykp2emlwbWo1M0xo?=
 =?utf-8?B?K3Y0UUtIakZTU002WWpnUzNmVU5EQWtSRDVMMGJpZzN1K3hSMmZhcndjcm41?=
 =?utf-8?B?dnV4N1FVZzJzR3h0bThuTkU2V2VMSXpMOTVOVWRneTd4M3kzTndmSVZMU0xw?=
 =?utf-8?B?TUovZjltL3FrVklYVnBSazVmQ0pUeTJ0STdZZHYvb3hCeFhCbmZMNS9xVGR2?=
 =?utf-8?B?ZlZLN1cyV2wxUFVMaWlWeUpBWGZsZnhDQ0h3Szk1bUpobU1iQjlYWTNiYXJB?=
 =?utf-8?B?ajJIWFppVmxjaXFmZURBTkFISXlPMW1yMitEempqSU9oOURNU0QvNkZIRmlk?=
 =?utf-8?B?TXhFTXlqTzRUQWFSYU9tYUZFMHAzRXpWd3ltY25iRGhRNFVvZjN0RkR1d25I?=
 =?utf-8?B?UXBQeTExdGVlb3hINEx0TUNFY3pVVzZESzU4cFNJdEQ1YzA2NlpiNXBXdi9Z?=
 =?utf-8?B?T3RUVDVlSjRacFE1MVV4Uk5Qc1BwWlpRMEJONFd6ekdUMlk4RjdLb1dDakRs?=
 =?utf-8?B?c3UzTGJpMnM1K0tvWmhSLzhZR2ppTjM0UjYrNUt5czdDdnJHMmhaZnBidlNX?=
 =?utf-8?B?WEN5OXQyNExpZG1JRU1Fc0ZMUmk0RUU3UlNWb0YyUHZUSzBDRHlreFhGb3Jv?=
 =?utf-8?B?VVZmc1VwaUpkT1Zkb2hRUFZUL2IwTys0cnRXa2loQkd4a0lFRGZ3V1VQRlBv?=
 =?utf-8?B?MWlZV3ZrVEpxS0k5SmVSLzAzTFMyT2p0RWZmVjVsajhxMndWcnVPZGMrenln?=
 =?utf-8?B?U0pHQnpua1llQ281aDBvVDdIMERuVHFSZU1BaU94SmdBcFhlT2pxWFlXdGt2?=
 =?utf-8?B?Z3VWOVozbUpZc1JuUzRnMndzT2ZlaHBIMHlSSmpsRWpzc3R5ZFIvcGhVbWFo?=
 =?utf-8?B?cFZqU3pDVWZiNlN6UFppdz09?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR06MB7252.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?NXFxUXNUYjZ0U2Q1RU50eXcxaW5MUWUwdWk4TWFMU0lKTjBIWUpIVVFKaTU3?=
 =?utf-8?B?NDNtbmFVUzJkS1ptMUNyMnN2dGFDdm5UK1EyK1hVaWNHMDhxRTlnYlJLT2tD?=
 =?utf-8?B?ZFRFYkFvRWpXRjc1WGx4L3UyZ01vUC9nb1Z5RDUvQjRJdWhVdytzRmw1QnZS?=
 =?utf-8?B?V0p1Tkl3L3JJZTFmaFE5anRiZVkvbEJSaWhQTkZ0VThNUEFKMTBCMUxQeXVF?=
 =?utf-8?B?OGZIcUg5UzF2NVV6QktwQi9IUHo3ZjhGbmprY3BKTWx0eFplSWhsTlZ2VU5n?=
 =?utf-8?B?eDNwczFYZkFER0loNVRPN3ozTW1MVnlwQkNUYnN6N2FHc2NWbmpxWGl0RlNQ?=
 =?utf-8?B?UlBUZDFnbWUxMTJUekFONHJwR2toNVhnak5GMzJqeDNldnRKbkxPNndrcVFU?=
 =?utf-8?B?bFlMdUtjeDZ6M0wzbE1obE5acHl6Y1prdzdGVWswQnIrY2FGRWZUSm1Jekla?=
 =?utf-8?B?VVpGSlFTWEE3UTlGTnFkWCt1VXJYTEU5RjIrRWxaQ1ZQTUcxSTNpRWlNZlJt?=
 =?utf-8?B?ZUtXRWdKanhicWNlbVF5L3FrcjRYc1BpMnFpRnNaV0lhRUJnL0t1M0F0K0U0?=
 =?utf-8?B?ZE9yc0RMdGdwM1RJMExDTzJ2MGcyMml3eStzM3hLc1c2bFAxVnVqVTdDNmZm?=
 =?utf-8?B?cUdEangxaVBiY2p4S1JIdm4vQUlRb0dRRFNTOHFJQTM1eldFRWJmM2hSYVdR?=
 =?utf-8?B?NDFxa0tGQVFqYU9JUEFqSitLOHRBKzZvS1dEd2NDWjE1MDZkNUQzMm9IcXpT?=
 =?utf-8?B?d1lmRFo4cVM2YVJyZXpkUmRNQll1Q29pQ1NMbXdETHZDeC8vNlhMTG1aUWdt?=
 =?utf-8?B?YmNIeWlLTTZEMTJ5ZEhBRnc5RDdIQ1lZWld1ejFKc3ZZcVRZY3RiQzhMTkF2?=
 =?utf-8?B?c3BiOWNqeXdGZlBJNEFKWm83eVg4Znp3b09hbHdlSWtDZWJ0REk0ME5TZzhp?=
 =?utf-8?B?Z1FBTEcyQmVkNGlXZ3Npc0VrbFhJZFdZWHdQUEJwdmJNNWZvMlNCMUVjQzJi?=
 =?utf-8?B?eGNVYSsweTdaUWwybFJMeHloemJGMTRYKytmV1hZOEl5ZmVDdUdDNzJGWmJo?=
 =?utf-8?B?dEpuL0xBYkVpalNaNVpsbHJxbnZmUlVPTnhBU3RDa3E0RVFpUjhLMmFteE9r?=
 =?utf-8?B?THlmQ2JiUlBVYXA4ZERYc3JHRFZBbmQ4RkVCTnZVVVBtd3VOcmEyNTBZc3RR?=
 =?utf-8?B?b2pNb0ZISFlVN3I2dW9qZ3BTNEkydXYxV0czbUVQSDgrcVVQMWZMS1NRMEl2?=
 =?utf-8?B?N0hPUXFDWnRUNTZORC81ZjF6a1JMSXU0WEpjS3h4NGxHeCtVbDd5cjMwaDJQ?=
 =?utf-8?B?NmZFSldvYS91cTVwZFNLZTFWb0FlMDRYazVYZnJBMklaL2dYaHI1aTNEWU50?=
 =?utf-8?B?bytSUXdYRFhOMWhicnBHT1owOStEemdtd1NnV3NzT0laVVdFQy9tU1p0OWU0?=
 =?utf-8?B?Y3Q5dG9LdVdMWkg0bWlNTVJVRTkxRWZhY05oaVNobURrNGo1bHpxcEN2NlhD?=
 =?utf-8?B?bHI4anIwclJZQVVkcmNGNXdhWlZMMEpZWE9ySWhwNzdFZm4rZVBnWERvKy9p?=
 =?utf-8?B?eEhudUc3OWErc0JBS2wrRmNKb25FQ3crYjZXOG5vQU5zVklZNXBzampFT08z?=
 =?utf-8?B?MG1rbWovaHFmeE9tdm9scXIrOWVDUDJsQUJ5dHNkbFZiTEdrVjVsb3lGK2h0?=
 =?utf-8?B?a2p4aGxHNUNHaHhsOUxFNld2ZGdGRXU4REI2NWdSUUJNZFpYOVBsMVNqdUR0?=
 =?utf-8?B?NTJBajU2d3R5MmVCVnA4b1MyYk5LV2txZU4ra3hCbCttNEgyaTBGYnM4NmRi?=
 =?utf-8?B?M3dHQkVqa1dWOWRIR1lvazl5N3BaeDBtRFppTE1BZE9NYVpwcmgvdS9zSTFB?=
 =?utf-8?B?Tlp2Vmd4elJROE5zTHB5ZTMrSmgwekdoeTZtYkoveitNUTFENVp2UzN2NE96?=
 =?utf-8?B?ekJSNW5taGxBL1R2SHZMSE9FUzhHNnRYMTB2R0huYVVjbnk0eG1EaHdYMGtC?=
 =?utf-8?B?NWRtVUtlTXEwUVRFalVRQzJvb1NiTkNSVWs1akZGY1RuNmZma3dCRHpBU0Fm?=
 =?utf-8?B?d0VpMGpGallFVnVhdC9jZWZPV1ZsWXIrVTY5ekttbWNna010T01BSFdCcjFy?=
 =?utf-8?Q?eIj/IzuASbwVfWe8eL9JjLuHZ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSQPR06MB7252.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49a93680-0a87-42a2-79a1-08dce2f43651
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2024 15:09:29.0824
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i6VxcfYRKTG2bSNZkRlYutV2jV58WtJwhpFsUSO4YymG7O9cguYwi6tfZ94HHA9KyYmFNQFVXUNjjL1N4XB9lZ8KL4UvewxDbLptiLBBve0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6314
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: "robh@kernel.org" <robh@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Peter.Yin@quantatw.com" <Peter.Yin@quantatw.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "Jay_Zhang@wiwynn.com" <Jay_Zhang@wiwynn.com>, BMC-SW <BMC-SW@aspeedtech.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

PiA+Cj4gPiBPbiBUaHUsIFNlcCAxOSwgMjAyNCBhdCAxMTo0M+KAr0FNIEJpbGx5IFRzYWkgPGJp
bGx5X3RzYWlAYXNwZWVkdGVjaC5jb20+IHdyb3RlOgo+ID4KPiA+ID4gUGVyZm9ybWluZyBhIGR1
bW15IHJlYWQgZW5zdXJlcyB0aGF0IHRoZSByZWdpc3RlciB3cml0ZSBvcGVyYXRpb24gaXMgZnVs
bHkKPiA+ID4gY29tcGxldGVkLCBtaXRpZ2F0aW5nIGFueSBwb3RlbnRpYWwgYnVzIGRlbGF5cyB0
aGF0IGNvdWxkIG90aGVyd2lzZSBpbXBhY3QKPiA+ID4gdGhlIGZyZXF1ZW5jeSBvZiBiaXRiYW5n
IHVzYWdlLiBFLmcuLCBpZiB0aGUgSlRBRyBhcHBsaWNhdGlvbiB1c2VzIEdQSU8gdG8KPiA+ID4g
Y29udHJvbCB0aGUgSlRBRyBwaW5zIChUQ0ssIFRNUywgVERJLCBURE8sIGFuZCBUUlNUKSwgYW5k
IHRoZSBhcHBsaWNhdGlvbgo+ID4gPiBzZXRzIHRoZSBUQ0sgY2xvY2sgdG8gMSBNSHosIHRoZSBH
UElP4oCZcyBoaWdoL2xvdyB0cmFuc2l0aW9ucyB3aWxsIHJlbHkgb24KPiA+ID4gYSBkZWxheSBm
dW5jdGlvbiB0byBlbnN1cmUgdGhlIGNsb2NrIGZyZXF1ZW5jeSBkb2VzIG5vdCBleGNlZWQgMSBN
SHouCj4gPiA+IEhvd2V2ZXIsIHRoaXMgY2FuIGxlYWQgdG8gcmFwaWQgdG9nZ2xpbmcgb2YgdGhl
IEdQSU8gYmVjYXVzZSB0aGUgd3JpdGUKPiA+ID4gb3BlcmF0aW9uIGlzIFBPU1RlZCBhbmQgZG9l
cyBub3Qgd2FpdCBmb3IgYSBidXMgYWNrbm93bGVkZ21lbnQuCj4gPiA+Cj4gPiA+IFNpZ25lZC1v
ZmYtYnk6IEJpbGx5IFRzYWkgPGJpbGx5X3RzYWlAYXNwZWVkdGVjaC5jb20+Cj4gPgo+ID4gSWYg
dGhpcyBhcHBsaWVzIGNsZWFubHkgb24gbWFpbmxpbmUgSSB0aGluayBpdCBzaG91bGQgZ28gaW50
byBmaXhlcyBhcy1pcy4KPiA+Cj4gPiBSZXZpZXdlZC1ieTogTGludXMgV2FsbGVpaiA8bGludXMu
d2FsbGVpakBsaW5hcm8ub3JnPgo+ID4KPiA+IFlvdXJzLAo+ID4gTGludXMgV2FsbGVpagoKPiBJ
IGFncmVlIGJ1dCBpdCBkb2Vzbid0LiA6KAoKPiBCaWxseTogcGxlYXNlIHNlbmQgaXQgc2VwYXJh
dGVseSBhbmQgLSB3aGlsZSBhdCBpdCAtIHVzZSBhIEMtc3R5bGUgY29tbWVudC4KCj4gQmFydAoK
SGkgTGludXMgV2FsbGVpaiBhbmQgQmFydCwKClNvcnJ5LCBJIGRvbuKAmXQgcXVpdGUgdW5kZXJz
dGFuZCB0aGUgbWVhbmluZyBvZiDigJxzZW5kIGl0IHNlcGFyYXRlbHku4oCdIApEb2VzIHRoaXMg
bWVhbiBJIG5lZWQgdG8gc2VuZCB0aGlzIHBhdGNoIGluZGl2aWR1YWxseSBhZnRlciB0aGUgR1BJ
TyBwYXRjaCBzZXJpZXMgaGFzIGJlZW4gYWNjZXB0ZWQ/CgpUaGFua3MKCkJpbGx5IFRzYWk=
