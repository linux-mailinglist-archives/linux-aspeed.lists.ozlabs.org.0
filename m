Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B764644C5
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 Dec 2021 03:09:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J3jG86kLnz30CK
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 Dec 2021 13:09:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=EzBKeJEr;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feab::71c;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=neal_liu@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=EzBKeJEr; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2071c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::71c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J3jFw3FzYz2yN1
 for <linux-aspeed@lists.ozlabs.org>; Wed,  1 Dec 2021 13:09:35 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MAbI1Zf+nsYNs4gsnuzKfSvRhr2OEj6Vs7CPni/099Vk7yNpAASM3F/Eu7ugyhfdCoKvD7k6GyIztSc3HgJlhaxY+xvaGBfF9u/dbpgNSVxnbyCdeIsc+80OvHw5+fBkLWtZ9pE+NHdNwNkOfaU8OqTTO+2zByZuITG5YrcQ4KJRhAHR3Rw49qiXP9XCceiTHWCE4T5SAWKFY2n98G4BroMGpH20ctxat0qZWs5BPMLR+lg1lLXmTgZt0iJvMn+TxTek0ZHUqO5yVrwuEvPJG/RD7PvIHfpeUpP5uEIslCEvnfo/RZsgG7J4ggs5GenVadfERuauLUSuFiFZWAkDyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CK/H5UASUbEpUnk5Mq34IdoXHK8bdK+Zm1S/nFcsjMo=;
 b=L/fDQwMxLtI9V6HXa9JAXLmNSonsVraTgyp6BRUApdXLuIw+0pQg+WeZAuGO2Eq2Yhkd1D+yoUErl/GfPEhRw0cd1UO9HrTZvodOWCYMXzI0yVAxjLKEQC1MOh87+hVQRJt9++9tU8pOTD9762VHb5jQ6HMzp16IY1CVf0S7IHycBnHS2KuM+cWz4SYxcqaV4VehbIt25N11HkmuDdFntAG11B3JO3VuoVs/VdeYxh5dY8uQlJYpVvzKZHY4zNXk+BsWmfOjjQj0KtI4v3p0qlkTFfWRTTts7FIdVDIL1hCEdRhzthRROnKM3df9ZPRl/ePiejQtnEjbQZuUBDgntw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CK/H5UASUbEpUnk5Mq34IdoXHK8bdK+Zm1S/nFcsjMo=;
 b=EzBKeJErDMohnQol2Ic088JObmVVInmbS6/vdmGk7zozT6dNBNtYC5WpvzKy+5fdaAycEUrPmpFrGpF6yAI8ESAcAvaU//SsxjkKge/e/Y8UbWIUnJdJ7o76p/y+8/qiXCaBgPA1pJkJ1G0XiMi2BFqZ3c0VprH7y67qHskhkgIUj4mTZdn5Y48WF25/rF2jKSoR776NpSzt3XVfSPPE0PhAHYkJai+7CuNi1BqSHJdmMoa7cgni1+uWgC0GQ1wAvbYtIUaVZcjEs4mv2wksRvlaQuVjwmiBh8BfFn2sgSoRS2ZtQ+t5RX1AiwPTI24hBBuy7CsWmozN/8L1rULV5w==
Received: from HK0PR06MB3202.apcprd06.prod.outlook.com (2603:1096:203:87::17)
 by HK0PR06MB2340.apcprd06.prod.outlook.com (2603:1096:203:4e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Wed, 1 Dec
 2021 02:09:13 +0000
Received: from HK0PR06MB3202.apcprd06.prod.outlook.com
 ([fe80::70c4:b471:2d05:1209]) by HK0PR06MB3202.apcprd06.prod.outlook.com
 ([fe80::70c4:b471:2d05:1209%6]) with mapi id 15.20.4734.024; Wed, 1 Dec 2021
 02:09:13 +0000
From: Neal Liu <neal_liu@aspeedtech.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: RE: [PATCH v2 0/4] Refactor Aspeed USB vhub driver
Thread-Topic: [PATCH v2 0/4] Refactor Aspeed USB vhub driver
Thread-Index: AQHX5d7b3n/88SxJpkaa+8Yyah7NIqwb8uSAgADyFnA=
Date: Wed, 1 Dec 2021 02:09:13 +0000
Message-ID: <HK0PR06MB3202C0D98DD6B300D9102B1380689@HK0PR06MB3202.apcprd06.prod.outlook.com>
References: <20211130113847.1405873-1-neal_liu@aspeedtech.com>
 <YaYOFTmLLUJpPug1@kroah.com>
In-Reply-To: <YaYOFTmLLUJpPug1@kroah.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 86207a7a-344d-4594-0e96-08d9b46f9219
x-ms-traffictypediagnostic: HK0PR06MB2340:
x-microsoft-antispam-prvs: <HK0PR06MB23407C7924A82879D491345C80689@HK0PR06MB2340.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FVUzWPAEuNJYZymcxO/VEv4zIXQ27p7x4wuutEukxxvf80Dxx2di081IouO4tmW8r/kabWbz8XgeQ7tAX/BxAFHVFoLQE7FcJ/K7ic7gS1sYrXQWBN7JC/qYZ27fgBF8qAHaQdMic6Lyw5tuePLDaSMMOQs0vFIKbtiwQjOzEfTokuckxl6t+eXoQUtoE05OVvJAd300lkOMsMoREUq+05awkbkYfT/J/npJ032YHldbZH2aYEau9+E5xDeDIpWN6GEdtUhJdSbRtxgNBcoeTV+9KQnqyv7eXiUTYwBGxmSvPPylym20oJhqI0HNTLBJx5d3CxWfPw3xfYwlEKG2M57VLq5LicpGrEynbzppLA1Z67DcL2Sl43BVOKU34/KqPIa76Tl7TO9YSfmNNA7jqdip+MDvugvXRQiat07qNVjFZKDkZqkAF9LvTnydLpHeFHA/qHoK6svCMdDzPteQ59vnlQ9iE0XlM5KdyhFDIY7UuGhJkqlxHjpzpFIOfFF4yRIitSgGpeYecBFB70VlJh4PHW+rkbgH0bcHNi25nofi9otu4dkbxt3kUzAQDHTtnfOfhZ0L9UnKFVb3DCnLfzVM/pgTfsy0+0Y6tl5SN6Y7N62fwe1d34C7pxObS49cc6bGvwzg/bq8opPKHAnaR3VpXxKfsV20q9Gej2nFMgzGJKG/6u9/FAWi69o6iITHyjuyJZNrD1zmoqEli7dSyw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3202.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(136003)(346002)(39850400004)(376002)(396003)(76116006)(6916009)(8676002)(26005)(8936002)(6506007)(38070700005)(66446008)(5660300002)(9686003)(33656002)(38100700002)(86362001)(4744005)(66556008)(54906003)(186003)(508600001)(64756008)(52536014)(122000001)(2906002)(53546011)(66946007)(55016003)(316002)(7696005)(107886003)(4326008)(7416002)(71200400001)(83380400001)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hJyHJVUcLcArYBIxMAvfvjYpS6eMlmjDSrncJfF6zTvHUm3m3ez+T0qU0wo0?=
 =?us-ascii?Q?kvoYSEbEM2u5M9HNBd5pXzrM4TN9BmtBJTTohBNoI2d07W6TgZmLUBX5F7Pf?=
 =?us-ascii?Q?XOMafNIglDsSUst6k9WBzflJruNx5mI9DqNywshzDlizO2KgOUJctNJ0V9Zp?=
 =?us-ascii?Q?WgijdN5Bx0EWx65OBj4oArdcunzk/lD25C8tHGwsppMlV05flAJjiUz4rlVM?=
 =?us-ascii?Q?FavCmh41A+LKTcDNoxntMEeNxCMGfRl4lc2UnFUSjDZgq0/RVgu0xgcfIZmo?=
 =?us-ascii?Q?/uaWqLAyaLTQ+9E2FWv31c1S6M31Z0wulTDY+7KSZVlCReBaYJQsWMZKOgHu?=
 =?us-ascii?Q?HYkl/YqtC0zchvsxycQAR8Mf4/I5maTPcGR257HHq1qWHEaMqxXPWheOoCDW?=
 =?us-ascii?Q?0msvpSfrW2b4CAbhd1TUah7GK7HyTD61E3fBzyjz/QcbAx3wd7tjoBsCxaS+?=
 =?us-ascii?Q?uM4rI8tfn8znrgQiA4D37LcmCpDX9pxPGmF+kPocz2Zcmc0qq/t4SIddiuJJ?=
 =?us-ascii?Q?LA4qz+zHkrCksGcV0n89f4nvkflYR7mgibom4JQPRP+LWaPvW16AdlOEOFbE?=
 =?us-ascii?Q?LyjHsFyFdMl8MXm0k7tN97j0wyVnX7dmqOZRhVEKIkl7PuRfWAOyHwJXmhm7?=
 =?us-ascii?Q?pJ55gIzz8omnQAxTZEmvfXwSrqzWFKDYdoqBIEVpMRS2Nl+zfJP7AHscg8OR?=
 =?us-ascii?Q?BKhiJ/hk9aMlHAco2UzfNhsjHjS9TYB4TB4sBL3cTBRSs4HOqSZyVUPKu7rZ?=
 =?us-ascii?Q?KAFaSOe5OeRfNVyFiYAlQ2DkbRQyVrXwUVEXGSRisRyBWxOp1Hz6cxchQ0tG?=
 =?us-ascii?Q?jnsAyY9HVbTXlpVxoqWB/UWsf2atfMSyu9PPQ3nYhvM5DtASBVr/Yzd15d7E?=
 =?us-ascii?Q?AutpXKsDhRh5ZtMQFsc81KQ5KyX/FgN1uYWKbn6eQgwwriSakT9PxbYyN+/J?=
 =?us-ascii?Q?tms9GvoEP9gPOaFENffTOCHMTzc4h5S+7OYSixL836sRLZ9EYn4ACScKpJZb?=
 =?us-ascii?Q?8s6kXCxya+7qSXt1dETyxfW17/s2HP4wId1NrHaCpBUveq+7x2S2JwEbGvXn?=
 =?us-ascii?Q?pcZsIm7noMNs0zKDE58rSzCZasvCeGPBnYFNqBlYCcXqoVuyJ5DWbQCaSDxD?=
 =?us-ascii?Q?Pr7ywQcDm87Vn6rdW3R/QGTvWluxzfcDIPmg0sEDf+zZ3a2Wy1t+J/JUMkLV?=
 =?us-ascii?Q?2tBU8Kwo3r9A8qGl5hT/Kx8Cdl9I4RhpL9L63EDEZrNQazbw+KJJh2GFZ0CK?=
 =?us-ascii?Q?1lXKE9KTOdUf9RqozEwSVff1x2zWW3LmjRyM/KC8I3KNU2GR83mGzTIlV7xI?=
 =?us-ascii?Q?W88q/AcJ3fNDPlqPZ64IzpeaY2MVosi2UZCsNI687wL5HJ331ypbpkXfDx3o?=
 =?us-ascii?Q?gxI4KyVmJ49rb+ox/ILbRyZwyWHf3dYNcUPtGFfo8cGNkCRjWjpNwg4L543N?=
 =?us-ascii?Q?/JoxrjWNMZF3y5gYKtmmgCAErziE4mRM4TysdZtOWoEdh+9pP+/h8QvnTVKp?=
 =?us-ascii?Q?du9ZIm8OW/4Vds3GfDdq5lSdEM3u0esr7L8n/E2sTcIq0COfqe4Ep4reinKV?=
 =?us-ascii?Q?3hv3MSxjQPvTOElLf8HIfEt1jcpDTtWFRRHCNqNsygUUWpXcvHdAMrJdVYD4?=
 =?us-ascii?Q?IAXqz9yCNwPjr6xsGSzWdbI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3202.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86207a7a-344d-4594-0e96-08d9b46f9219
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2021 02:09:13.3701 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mWA004/lYSsLg8CnCbQA/EMboOXfVg2w3V0VNuqUdrG4HNLdsUCQoUTvgKl+idMj2Zzez2Ze2sj9afy4gts0vA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2340
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
Cc: Sasha Levin <sashal@kernel.org>, Felipe Balbi <balbi@kernel.org>,
 kernel test robot <lkp@intel.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 BMC-SW <BMC-SW@aspeedtech.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Julia Lawall <julia.lawall@inria.fr>, Cai Huoqing <caihuoqing@baidu.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

> -----Original Message-----
> From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Sent: Tuesday, November 30, 2021 7:42 PM
> To: Neal Liu <neal_liu@aspeedtech.com>
> Cc: Felipe Balbi <balbi@kernel.org>; Joel Stanley <joel@jms.id.au>; Andre=
w
> Jeffery <andrew@aj.id.au>; Cai Huoqing <caihuoqing@baidu.com>; Tao Ren
> <rentao.bupt@gmail.com>; Julia Lawall <julia.lawall@inria.fr>; kernel tes=
t
> robot <lkp@intel.com>; Sasha Levin <sashal@kernel.org>;
> linux-usb@vger.kernel.org; linux-kernel@vger.kernel.org;
> linux-arm-kernel@lists.infradead.org; linux-aspeed@lists.ozlabs.org;
> benh@kernel.crashing.org; BMC-SW <BMC-SW@aspeedtech.com>
> Subject: Re: [PATCH v2 0/4] Refactor Aspeed USB vhub driver
>=20
> On Tue, Nov 30, 2021 at 07:38:43PM +0800, Neal Liu wrote:
> > +Ben.
> > ---
> >
> > These patch series include 2 parts. One is adding more features to
> > pass USB30CV compliance test, the other is fixing hw issues.
> > More detail descriptions are included below patchsets.
> >
> > Change since v1:
> > - Remove unnecessary configs for SET_CONFIGURATION.
> > - Separate supporting test mode to new patch.
> >
> > *** BLURB HERE ***
>=20
> No blurb?

It been cut off...
I'll fix it.
Thanks

- Neal
