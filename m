Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B595993D62
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Oct 2024 05:13:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XN1Ls6yfFz3bcP
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Oct 2024 14:13:41 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c400::2" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728357219;
	cv=pass; b=KSJ1dO9xV8QGDppUXCfPRHT2GAsDouoOjHgD1yfx2DhNtGNu5h2hif0h0fmNth9pTieUDdOJE56tli/6ylk7xrLnWFgxm76Dtf34Gnt8uBYBXyS0+bmywTyHo44cvvKbQoWtLYG+r8emL0EnHUCiY2xbY5lctn6OFdWqB4x5RS4UCKEyFy/+t9PZFES9mnpkKWR733kV7SKEI75DEFyKAt22CoWrKS+HdbdpLZjEW4Z106VfUr/ULd/CBIklDxMGGgPxqcJChF8Kkf9M8IJ9wOcImgm6XcwJhfWrOWNkVlS1UNWT9qAgcIr02nt8rg8mPuHafA2dKsYlf+XNopt2hw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728357219; c=relaxed/relaxed;
	bh=Nwf0oxwQq/ZVkxCRVOtIfufVVz4HMpCtgZG4oxhSevE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AS3b6ppi8raYpD5JvBRRdaAVPIhrHH+far34RxaQ660eq1V8Peahpht0PyBXulOOmpUmbQ7XsYJUM2HDCj6m0FKv/Ko4xrOcvpNTKozrYOAunxerq1UITqzTG7WYHpZcyCxbdn2w3eBcgUdE7Wx0wECNIIMYY16Rf2MCsfJl+m/RpIIRmRwqZ/0cPAatkOBfwJ055QfqbswzVUQ8DDSBTuob41Iz1kxsrxOwGY/MRbffJrC11uflynL7wf9wzWWfOo8iwwSS9CIHMVokTDNQsILyllEZzT+t1Ce98qenYEb++r9kRgpEgMz9UGeEpzd/Z982gkAFXMS6go4NaJhDrQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=WS0rrZPq; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c400::2; helo=hk3pr03cu002.outbound.protection.outlook.com; envelope-from=kevin_chen@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=WS0rrZPq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c400::2; helo=hk3pr03cu002.outbound.protection.outlook.com; envelope-from=kevin_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from HK3PR03CU002.outbound.protection.outlook.com (mail-eastasiaazlp170110002.outbound.protection.outlook.com [IPv6:2a01:111:f403:c400::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XN1Lp67yJz2ysb
	for <linux-aspeed@lists.ozlabs.org>; Tue,  8 Oct 2024 14:13:38 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M42V1btCF3j4ZmbQiK6hxh6y9pTWf52GzlmJmPXOfdeRSh0O4EpwYfx+Xs0f8Ph2CEoCNi+gYQ8BEC6rXO/vxKQ2A8VFO3fbYBQpWLef60m3/j7Ff2rNsOqR0hdBpOV2YqOTLrRBaGtCU74nh4OmRdhQNfOxjqCxOwZANc/B77xUl3dRRJp5KXxduECw2jARFiiETlxQCfRY/BgOzqdSGtXVKAKr5WtwWy+UwN0bbNimqJuSzfFKJvaAohNtBlXEaBzypNjUUOo99voDklpwKhIfN/iiG0zIvGtftMuBkWSELJm9eboAC45sMHcEIJvW1pyeInKwcbfRrPDo2fxREw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nwf0oxwQq/ZVkxCRVOtIfufVVz4HMpCtgZG4oxhSevE=;
 b=po8DYccSgUlpC3Ji43lDt5fWSI6Gx1oYEvmGfbwYNv73w4kzVbln09d5NOy/DkC7ZFb0zBJ9yfPZL34X8MZ3frobdchMIsVt65OrvqtRZD/sMyDXEpvu+UCcVAHdRozMD6/SxaEUjwlwmOzRHowspPmJhsFXgUmLOgOsInfX3P856V7QeU/Zr8gyH5NiNngGk6XplRhxxy8nMXrmmour5oWLGtvEan4X6jmhIuj7OmzPMOTCeEVsYnbyJxGmyYJ6GOHFcx29abrK7lGQ+YGz406aHO77TMVI18tIqAvSuUn81tonyYZEmRuBXAX87NXomSZHMF87/rBHjXqs9OTszA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nwf0oxwQq/ZVkxCRVOtIfufVVz4HMpCtgZG4oxhSevE=;
 b=WS0rrZPqo+6vF+VVAaeSpEjnbAXcgHWwtb4sjAjziaxI0VhHVZoHQE5c8qCAwEaNr08FAcUSNoqM7M8S+jdJNKGW9OYfcm7PIP66oauNg49s5oCcAu5rvtVoNyoBLZ6M/MRQtEY4GGla/yOOzXybQQXSAFDkNARS6OtfEkQPIgAL4cOOgOyXndYqjqPaN7XchbRoGOCfHEoxMybEua41mkA14TD+vqMcuRITJ6lPQrlUQXQZUIlf9Opp6ZhS2AEsHm+yxVW50KeTi6/mRdutIRAJgVDb8SZzSZYJYbDrZEZO0Rl1mSU8tqwWPjdLA6cOcjR9FEIy3406n52yuyxawA==
Received: from PSAPR06MB4949.apcprd06.prod.outlook.com (2603:1096:301:ad::9)
 by PUZPR06MB5649.apcprd06.prod.outlook.com (2603:1096:301:fe::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.15; Tue, 8 Oct
 2024 03:13:13 +0000
Received: from PSAPR06MB4949.apcprd06.prod.outlook.com
 ([fe80::7bdd:639a:6b94:37bf]) by PSAPR06MB4949.apcprd06.prod.outlook.com
 ([fe80::7bdd:639a:6b94:37bf%5]) with mapi id 15.20.8048.013; Tue, 8 Oct 2024
 03:13:12 +0000
From: Kevin Chen <kevin_chen@aspeedtech.com>
To: Arnd Bergmann <arnd@arndb.de>, Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
Subject: RE: [PATCH v2 7/9] arm64: defconfig: Add ASPEED AST2700 family
 support
Thread-Topic: [PATCH v2 7/9] arm64: defconfig: Add ASPEED AST2700 family
 support
Thread-Index: AQHa5Ls5nDTJDluzbU+9LAh6c6NjRLIUWKYAgAABTICAaDwcoA==
Date: Tue, 8 Oct 2024 03:13:12 +0000
Message-ID:  <PSAPR06MB494936C8FB5CAF373264F384897E2@PSAPR06MB4949.apcprd06.prod.outlook.com>
References: <20240802090544.2741206-1-kevin_chen@aspeedtech.com>
 <20240802090544.2741206-9-kevin_chen@aspeedtech.com>
 <CAA8EJprcmQvE3PjySxBKq7Qv3JHJHhic2aQ5MDnwZaf-D=K2Rw@mail.gmail.com>
 <9795437d-b409-4105-9583-4dcb24b5a06c@app.fastmail.com>
In-Reply-To: <9795437d-b409-4105-9583-4dcb24b5a06c@app.fastmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR06MB4949:EE_|PUZPR06MB5649:EE_
x-ms-office365-filtering-correlation-id: f86bd558-3801-4e72-9d95-08dce74724d2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:  =?iso-8859-1?Q?vnvZ5m8aNLEJGiFHzAMfxa32VAOyu0CoSNH+cyQ/jRA71aEla63jrhUuXI?=
 =?iso-8859-1?Q?qWtrmxED/ClqGY3rXum+6Kh4seHYl8TN+xftGemqUE/upvPAemJ48H5DVT?=
 =?iso-8859-1?Q?RfLQKkexa/lEsD27TjDJFZ1GFeXvaBokZF+cFOlDwXW2bTO4eCS67SGIVr?=
 =?iso-8859-1?Q?3t3B30ZpN1KQA6ySC3pU4Vpp+vq+fQge+Rqb21OKAbQGFuE+vheqdayn0i?=
 =?iso-8859-1?Q?PjZ6r7aQ5SY1ifweQwBg2G+ynbSWUPWNTauyfu5Q1diANFJEHIojCA5PvY?=
 =?iso-8859-1?Q?z5XkG7pqkBXgNLtt7NejAjZFAHKhW+Xnp7Cacl5DtjG1WbguhVnxQ6oiOH?=
 =?iso-8859-1?Q?0lYyUu1bHR1XWk/VWWsLV0RFq34sZPiV8Rh3yqqB2UZdpYH47XayJSwvv/?=
 =?iso-8859-1?Q?xsQlB17CEqV+1DQJ1e+7qIH+xQxoIFsjivaQd7f/RT0FMNwMKowIQ1vv2X?=
 =?iso-8859-1?Q?4tCYZI8TDGGucHNQhC6jn/OneTmZeRqDTs9UABKcZtcNzo91/8ffbmu1yA?=
 =?iso-8859-1?Q?79VjboAlRPqFnzJ6HUJGaIyWHZqi+95yNXMPy5Z1Oe9oe6Vjhqp7WZiEZy?=
 =?iso-8859-1?Q?TRx0zke2AHqVT375V/LYiOTIxxLnZYsZGwO/y131SLoyUbSL3yLWXqYGcp?=
 =?iso-8859-1?Q?LLPffsOciQpeoS79YK48L1CSAZkYsTSsAG4beNn7iBa44gUxQepcIAM9zT?=
 =?iso-8859-1?Q?Ol5M1U6ptiHUbMM3RXWf5MCdOGf0LiLP7CsPMCYBOJbRATKpTkSUP/AjTA?=
 =?iso-8859-1?Q?6bLlhH6K0vxOQLeOQcLOvWj9k0iAJH8uM25Iuc2A8eUXIbNxHqaNkj+o/e?=
 =?iso-8859-1?Q?+lMnzrTHGna6602DMFoPsUgMBpZmGwYKsHa/06GUvDx9vVJo09MRPBu9sP?=
 =?iso-8859-1?Q?kgmzrrrTHmqy0WShEKer0q3UycgcqUs3PV2Ln4CEPsLEzgkkBl9UmIWYdK?=
 =?iso-8859-1?Q?qcBF5nuZIaZ7rA69oz+8V4s6Q7sPecjWFiCEh5HV17ZAqDZvkIXIGRKasw?=
 =?iso-8859-1?Q?7H+aluMWJsxbrgsBXw5vCIxq/o16Yio6v598Lbdv8WcNqXwRYAZMX0L4Dx?=
 =?iso-8859-1?Q?qNSBD12gnSv513jG1/8R2WA3FXgBZeKg+okku/sUkToaU0zmq2cWLKKG1Y?=
 =?iso-8859-1?Q?5sygKjJeAWWM1j4zmCeEkosCbUKQvxpE6aKBxZgcydWCGUNudoKVtKxoOF?=
 =?iso-8859-1?Q?sPgaAkXjb8TSaCHGsUgqnX26zBTxplH5yYJR91Rt+ldqVSN8MIOlklvj65?=
 =?iso-8859-1?Q?3jrZRBo++N7HpNsaRD6thSWKatXR6V3VdOBYZcyHWWUFC3Xo+dWuFqA3sa?=
 =?iso-8859-1?Q?OGFvZVuzectXN9WQcxKiPDxYD/8YGm8tnpecaO4ajh8cD1ZDqcRala7dI8?=
 =?iso-8859-1?Q?2vTZhDGgh5?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR06MB4949.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?iso-8859-1?Q?zTCxyG6gYCO8Ob0P8YGfqhl+AJhYumWf+Kr/D8mbfJrsgg5/YGLHHV2Zim?=
 =?iso-8859-1?Q?OM6vnZpUQ+Ql2DWEhndPWia+/Smpy5Ws9DmNrttoadbkyqmlpMY406834x?=
 =?iso-8859-1?Q?8146FmXkQVBrxw8yN6//L2FMomNB2uy8OZMApEcuepE2b0o63EbzmW6JPK?=
 =?iso-8859-1?Q?jwOObMpACrxYfp087i0HcFHzZ/yP3bVjiOAYtq1SqsJb6iIG1/7zWBH0Y5?=
 =?iso-8859-1?Q?4uc4CAis86IABTlOKsgCSJvyM7GY2hnqxd2hDTeJoPeLyINew81NWMe6Ir?=
 =?iso-8859-1?Q?qhiweNdsWd4DviSsp6GIgP+7kYMIm6EoTGTDNGrGX5bAL5baIwkEI7MkSu?=
 =?iso-8859-1?Q?Yho0HzVEJ5uT2bPY+11KNksqb1qBgXsNozBTXeLiTrPLMmQlIupf0BVKxI?=
 =?iso-8859-1?Q?/IlOzuho4pUIWCEFIlwO4Iqd7AajLAOQ3HncexjsEHZyKJQsmV7QXXLFFS?=
 =?iso-8859-1?Q?dewCXFaXAN1vnmL5zs0iVbrLzGC4EpX1Nepc3iTIboVASkjqU888Dj/IFI?=
 =?iso-8859-1?Q?xcWJ72EDR1AmapimUzFFxGexAYLl5Fbwtl72qEiHsKvVBNM2g+MKDgwT7e?=
 =?iso-8859-1?Q?9sgPX1EkrCDWv1agOCU5mhLpFPYJ8Girl46rgbxE9vgPkViN7DfBk6SBEa?=
 =?iso-8859-1?Q?ahen2WmA1e5Gyn5WxuVH5SlSvZCCzb6/uWr+nex6vJThc9Vo1hs34obuhl?=
 =?iso-8859-1?Q?Ia6CJ3c7dDVyWXI+u4PisMIQSHgU2LNCrmlool/Nt2KjWXY3gfqcnIykcr?=
 =?iso-8859-1?Q?htc+19nxZfhZZRfyVEaIkKYtR3KrdyCRyw0libFy8ZI5cFcWIGn0R5z/H6?=
 =?iso-8859-1?Q?i6C7TtN7Stz/RbuA+KLzFmeOOEBrmsr8YfBC4TiAMh89w4RKwZox0Zv+Ue?=
 =?iso-8859-1?Q?E5hBJY98yJAihgiJ6Os1i11sGYxtOf8qL3GOWhuASLzM6YZwBpDmLMQXpR?=
 =?iso-8859-1?Q?WErz54YO9Coqr5AzG6ikQcsFLUy2s9KbNPsIctoj5lvajR8ymbiG4DHi7R?=
 =?iso-8859-1?Q?HUeL45Y7oXt7s5S+hkq1yOz/00pHb8mMbiH2UKACqlKJzDejz2q0zt1wgY?=
 =?iso-8859-1?Q?UFsaC0PuRvqsX6kp3zxyXTR7PbOpFQHIlJnHrL0N3FhKxeoLomDBNv8ijR?=
 =?iso-8859-1?Q?095/KAY4LI3XBFLIkxBS9BPthTtxHxERPB0kNh/+PwACO6xtuIzNwc0nn6?=
 =?iso-8859-1?Q?n3sdCBMUJNWN+6H4ibteGbqR15VzdS7KDRi6G2YIfjTQxKN+Imud5kIpm5?=
 =?iso-8859-1?Q?0dyEdhp9ViKK/jFQSTMP15QgX1Ec1TofwhSAewezTb1CzIuFkpp+WbxbBt?=
 =?iso-8859-1?Q?De1sBGgVn1qcHx69jqOjxX3wm1aNTSrGmBKvzuFcF6cAeMcpMeK2KYYfP5?=
 =?iso-8859-1?Q?wlL+lkJ8c/t2f7W/we6eYSY9mclUZktH3BhGRJdV/GCPmle4PIEqJm4b0Y?=
 =?iso-8859-1?Q?C/9OfeZK+Nyl+xfbZ577teQodIr3ywO4RycAubYEthcmdCwU0LVF2cMQS9?=
 =?iso-8859-1?Q?6ZQK4OViyBfhD0cVOC6GLMgGJvd1d7bpyFsra76tnmhdcMFtnjexoQiSC7?=
 =?iso-8859-1?Q?HPX3kilEl4xtWzhj5kqVufbyILPI0F4aCEgvLvQL3b/ZJqjSirL/DSj0xw?=
 =?iso-8859-1?Q?yXZ2pPeZJgFAsTpr8oRvc3uFycb3APPpJi?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4949.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f86bd558-3801-4e72-9d95-08dce74724d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2024 03:13:12.6189
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H3lMROX3AOZl6E//L1JPtPyI8CHFLOQ4CbxckW+tmZNZDjGHkA/HZ+FzlbWEBU0r1GHj+OjwulR3HrJHZDsj73pvJFHTwupMYHPdc/hXiq4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5649
X-Spam-Status: No, score=0.6 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS,UPPERCASE_50_75 autolearn=disabled version=4.0.0
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Catalin Marinas <catalin.marinas@arm.com>, Michael Turquette <mturquette@baylibre.com>, Will Deacon <will@kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Rob Herring <robh@kernel.org>, Bjorn Andersson <quic_bjorande@quicinc.com>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, Udit Kumar <u-kumar1@ti.com>, Lee Jones <lee@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>, =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, "soc@kernel.org" <soc@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Olof Johansson <olof@lixom.net>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

> >>
> >> Enable CONFIG_ARCH_ASPEED in arm64 defconfig.
> >
> > Why? Usually the defconfig changes have "Enable CONFIG_FOO as it is
> > used on the Bar Baz platform" commit message.
>=20
> I would also expect to see aspeed specific device drivers to get enabled =
in the
> same commit. On arm32, I see
For different device drivers, ASPEED would submit code by its owner with CO=
NFIG enabled.

>=20
> CONFIG_ASPEED_KCS_IPMI_BMC=3Dm
> CONFIG_ASPEED_BT_IPMI_BMC=3Dm
> CONFIG_I2C_ASPEED=3Dm
> CONFIG_SPI_ASPEED_SMC=3Dm
> CONFIG_GPIO_ASPEED_SGPIO=3Dy
> CONFIG_SENSORS_ASPEED=3Dm
> CONFIG_VIDEO_ASPEED=3Dm
> CONFIG_DRM_ASPEED_GFX=3Dm
> CONFIG_USB_ASPEED_VHUB=3Dm
> CONFIG_RTC_DRV_ASPEED=3Dm
> CONFIG_ASPEED_LPC_CTRL=3Dm
> CONFIG_ASPEED_LPC_SNOOP=3Dm
> CONFIG_ASPEED_P2A_CTRL=3Dm
> CONFIG_ASPEED_ADC=3Dm
> CONFIG_FSI_MASTER_ASPEED=3Dm
>=20
> Presumably not all but a lot of these are also used on AST2700.
>=20
>      Arnd
