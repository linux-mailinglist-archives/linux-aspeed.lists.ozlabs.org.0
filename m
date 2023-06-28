Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C71AA740944
	for <lists+linux-aspeed@lfdr.de>; Wed, 28 Jun 2023 07:31:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=K59kE4p0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QrVYQ2NcGz30P9
	for <lists+linux-aspeed@lfdr.de>; Wed, 28 Jun 2023 15:31:06 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=K59kE4p0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feae::728; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20728.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::728])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QrVY61klpz30GJ
	for <linux-aspeed@lists.ozlabs.org>; Wed, 28 Jun 2023 15:30:48 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zz0PHhtt3E538NI3yRZI40X3SrOEXXuxjTGPq8dZD5/B/U9+LnFpDYE5Ls3iVq2JR1axJFJbHL+XrEWGz8bwkKNc8PwdvzSeCzsT/67tUUwSzxdnE0W45iwyR1KX/3B005ZyJzedr9fb3uHvQrh8gxdpwF7ZCzpsCUH/VlLNnZ1jdYnWR0nQhS5254oXZ38mPeiVYXYHdWM4fB2+fTtAVq/rH4e0mMsWOvS06G6YciNzU5cgC+BZ3Nj2X3kamQ7vzfP2ptK9GO8ST9PImbeuyLYpDncjL4rW+gbRFTeFIgyGlaqYRa6N8fl4+FEFtnh2TDyJA82yvaiJFckyAj5N6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rr0MT5ockU49jLi3+CID0ADH809DppIn5ncGmNzy8VM=;
 b=WAnBxLxqpBaCTYCeqyCRy4ec7PqF0V7WM+33xiyzVxIV1qJe1HBWpge5g9V/Cj5GxUIs0L38wCG6DzVMw2Cjm/rsh494gEYLrRPznmTCHBa4nMqT2GrXiqgjvS8R6GehEbn4wuhDIX+a+VgRMDzjjVgJBzSsxL2ZUN8IEqADa2v+OqgVZBPRBbodOQFPcnOV3u0aR75gVf+vNkO1juK2mQukHKB1r4Bv1enNN/C0s1qSta9q/hTtIj6rvnSH/uIktlbAPqa9LWawqi+vVJPk6rvxY3ZQeQ/HWkAEu17nOLeoyNXAsrcBJx656dpga1u3AriXnt7e6g4F5sXBA1crFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rr0MT5ockU49jLi3+CID0ADH809DppIn5ncGmNzy8VM=;
 b=K59kE4p04Ur5G+nQB3W8aNomm9i7jZQYNEmnEFjBooLEO9RnBZuxX9pv/cihtDVvK6oufNb+YZjzCXjv2Um1VLp1wyvcmhhe5XWfPFjebi7V3/ivDtBsd5xXOO7dSVek6hiiLpHCxkoF9rZL8Ic+dG3vkLXEuxOlrS4EOjNQU9E898x1QsArmN06ayx6JOiE7HOVp537HYSk5QKsMaehqKWmjFFNFX9ChBxzlatWa/FJDOYl/iCH7SU8GrOX9QBp4sFna9AfRzibR+6Lf/m78yZJXjWfIeS042GP83urDdrDqzaNK5C6sAx/H2N5P6/LH11AfPit0EocJiHOG8wdxQ==
Received: from SG2PR06MB3365.apcprd06.prod.outlook.com (2603:1096:4:69::12) by
 KL1PR0601MB5725.apcprd06.prod.outlook.com (2603:1096:820:bb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Wed, 28 Jun
 2023 05:30:20 +0000
Received: from SG2PR06MB3365.apcprd06.prod.outlook.com
 ([fe80::cc45:2366:5fc9:c775]) by SG2PR06MB3365.apcprd06.prod.outlook.com
 ([fe80::cc45:2366:5fc9:c775%3]) with mapi id 15.20.6521.023; Wed, 28 Jun 2023
 05:30:20 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Guenter Roeck <linux@roeck-us.net>, "jdelvare@suse.com"
	<jdelvare@suse.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"joel@jms.id.au" <joel@jms.id.au>, "andrew@aj.id.au" <andrew@aj.id.au>,
	"thierry.reding@gmail.com" <thierry.reding@gmail.com>,
	"u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
	"corbet@lwn.net" <corbet@lwn.net>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-pwm@vger.kernel.org"
	<linux-pwm@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "patrick@stwcx.xyz" <patrick@stwcx.xyz>
Subject: Re: [v6 2/4] dt-bindings: hwmon: Add ASPEED TACH Control
 documentation
Thread-Topic: [v6 2/4] dt-bindings: hwmon: Add ASPEED TACH Control
 documentation
Thread-Index: AQHZma89aOEdGxKS0EScrdWknPpRuq+AWFqAgAAVuQmAAHXlAIAe65u5
Date: Wed, 28 Jun 2023 05:30:20 +0000
Message-ID:  <SG2PR06MB33654B0D05D4644D409C5E888B24A@SG2PR06MB3365.apcprd06.prod.outlook.com>
References: <20230608021839.12769-1-billy_tsai@aspeedtech.com>
 <20230608021839.12769-3-billy_tsai@aspeedtech.com>
 <c1c485b0-b68b-4db7-4b67-5d59f1ecb84e@roeck-us.net>
 <SG2PR06MB3365E360F3FCDE639F3D2D1E8B50A@SG2PR06MB3365.apcprd06.prod.outlook.com>
 <f76f89a0-7773-6f64-c890-293093d4aba3@roeck-us.net>
In-Reply-To: <f76f89a0-7773-6f64-c890-293093d4aba3@roeck-us.net>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR06MB3365:EE_|KL1PR0601MB5725:EE_
x-ms-office365-filtering-correlation-id: 914dd680-9083-404e-bd6f-08db7798c36b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  tUvQC1tUzAi2BSGscFYf3pnQJdHQcN1BPPp/sqi7KfaDj/Crv3gHA1y7XEAQlNm7925s+vqlmA/zZ0VDUtfwFNg9GSLHTKahu35udCvedNBe1CmOU0nrzNzhigcKr7ajsd34yMvCkVMekNdj/n7OA53WBoMdBP/tdjnKy7HabEcj8ZVpreEc0BMB0fEAgVrDQxOMtUrQoRJx1biNnphxCjh95fuBVIx4LEcROa+f6GySLlGTSKOrV7GnVGusH8nb5emlz2tsD9bLKadoZELemH78XOQuaJNXGzk7U6xY4qILR1KcNGrs7yeflH1q7U1rCauGfRcByFr886zxuc3rZDAqm/tDkeh7sU0+1r990qwqbIth7EtRFacMNllDJANCmFV0mauE2Zl8A1D8FYY7450PSSgn4dJEZfDOACPYF5kCalJgD15109WwviimP5V+7sL5g2nYEeprs86JvVw5lYF/ttJMXPyUihdgH/yRzsdUyqGqJy3tj2yXcMuuCRvXNZYYvCrZNQix//HErafVOSXbEbSfptUoWK8RTO1je5Vu1N+JEGddizoAcL1ReeXGfHeVn4AfzoLuN2nEat78CIOjkJGzWVopu8jdOwo71xqB8nMcsSOec0jNdi+1GVUB
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR06MB3365.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(376002)(136003)(366004)(39850400004)(451199021)(7416002)(52536014)(5660300002)(66946007)(91956017)(76116006)(33656002)(66556008)(64756008)(66446008)(66476007)(478600001)(316002)(8936002)(8676002)(2906002)(110136005)(55016003)(38070700005)(41300700001)(71200400001)(55236004)(186003)(7696005)(86362001)(26005)(6506007)(53546011)(38100700002)(9686003)(921005)(122000001)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?/EzR9pahVIK890CSI+gGJBiljPnNLdFPneE4TaFH/bKAzfhWtp9KS882CJjB?=
 =?us-ascii?Q?p6wfDAZN0d1ZW8wsU7eN/jhHH+NX2u6wbmkWS334IQmmpg557XLFUiHsRnlF?=
 =?us-ascii?Q?RngCN8z6XTUruyz9EWLRCC9qenK4kBirKQoKX5TXeTHCKQAgTv0T7CsnI0y/?=
 =?us-ascii?Q?5hPMZOeyfCt41rbZ3Gl0Z3Y+xgPmp0Mclw0NmM+lNrq7wt0L8M1TAzCyHi8R?=
 =?us-ascii?Q?v9XgwYfi2+IHVGsVC/XTkz11/9ryJwPn3QnkjoyjYAbIOPaWNidbbjJKXhHd?=
 =?us-ascii?Q?U4eIkxg9TDIDvb0cZtLcr6GJLMViKfOoRrvXP5TXH63ftrDVKIaxo5L5a3VV?=
 =?us-ascii?Q?18JXBNd8mce9VwKqN/6oxaaSLcfiEvF1jew4XNkMdLw+2XrZl8uDVkUUSHqx?=
 =?us-ascii?Q?1jBgmhouN21InFdT/Yi12xTruVy6U+YBGf5bZYiJT2WNdymbiF67dHEbuIlE?=
 =?us-ascii?Q?owc2HMOS2EMFUYui2bbfKQoZFKji155g/jvXhJHjtLWXZmfLLOGqQiNZ77Mk?=
 =?us-ascii?Q?K4oHS3sAL6Huo5n9hIiZZcSrTUj2La6g1qAZIK2eJzHfJw8RB7unE/yr4Mh8?=
 =?us-ascii?Q?fzqp1uZPFImfuR0TYJiGIjKS6LsECve1yqv3A+SUz0W/SdtUH/feUtQ8F5FL?=
 =?us-ascii?Q?78YclAPN4FzzD05xLsihG3rJHOJJpOfVXNjtVh6TpDSqOXfJ0ec0K2IL7GOZ?=
 =?us-ascii?Q?wK+2bP36Cu+VCM2ldeYUoIgMUxGpkTYgBjMms4aOYdArCt775f7ZpZzemzC8?=
 =?us-ascii?Q?U1TXzl+/k5HFGKmlfMJX9CXl4iAAimGE4EWwS93DSsxCtQS5jhnr+UFFqH02?=
 =?us-ascii?Q?kx3r1DU8AfeF4IPup4y6UdxshYoNAl6Xmn5iJVfO84ZENnNHnEVeYpzK0MPz?=
 =?us-ascii?Q?l41jPPEJ3jwtjIS1Yv1ty7MzWXevgQ2j52GthZYcp4CDFvR3gzOr8n6+x4YG?=
 =?us-ascii?Q?02PdJbV/qcLjKbGvEHHxXS0T6BKySQzYrNeM+1XS+ab5b5DSF2AfY3zceNoo?=
 =?us-ascii?Q?7Vy2361fOLwkv0To/e1RKuhn+5JsglJeLRqfiRVd6E61Bzs3ieEQGbu6ZWa2?=
 =?us-ascii?Q?vh6YJ3mU4nTz4C6ZW9KkWr4dT6epBcZ81TyrhKlYCmzJugoAbXZZXPq3YiZN?=
 =?us-ascii?Q?uYbtHtal+CVDpNPFhaHPNfPQrd4RTtlJrRh6QAspYw1ohaJ1s0xBG0pn85qw?=
 =?us-ascii?Q?Db8uD5FZ12319YQSM0h9VueHsbtcQSQ/tgAwUaGtvoq4VefNKBu3GBDJu4u3?=
 =?us-ascii?Q?eczzEVfH/puvG6j/V3q6NWVR76+QyNZjCoNRktoaWPR+q+D4AffXtX5/5lZ6?=
 =?us-ascii?Q?mjEfNWLCpGTqay1o6gk0g+8N6RA5ZFaBCDceKv/KAYWPAFHh51MFcbeBvaWZ?=
 =?us-ascii?Q?lxEd7yAVUKF6GjfDd2c7KlZ/u0y6bxvpeqsubBIEGtKqR7bflYEtQlTNbD7x?=
 =?us-ascii?Q?dhNUzAMi2IUyj0YJq1EwPu3K99pVvWwVbW0ERnjJIcUl1qib5qdDPtpQROGg?=
 =?us-ascii?Q?q0krz+H+qhOd0w0AdUVHmSc7i1tmQs067grhVVZxX+H1yF0IXlRadWd2gjoc?=
 =?us-ascii?Q?LyWHsdw8GXrRU6WwOZMAID5uQ6FYhtH0ZC0zWGyHcMg+hnbg610pFN2dWMwH?=
 =?us-ascii?Q?P/zqAvK9l36JgcNvQVlnnVk=3D?=
Content-Type: multipart/alternative;
	boundary="_000_SG2PR06MB33654B0D05D4644D409C5E888B24ASG2PR06MB3365apcp_"
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB3365.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 914dd680-9083-404e-bd6f-08db7798c36b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2023 05:30:20.0280
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZuNuoGmz8HTpr/bxtQ3vYhNOCaHa4Fz6FUvP3OKxZzrrenyxPqD3JTvlDdvzA9pMo5Ts+iCNhyl/2K2T+NANIl8E/Ug6+gNOjQhX7E2+e9k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5725
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

--_000_SG2PR06MB33654B0D05D4644D409C5E888B24ASG2PR06MB3365apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

        On 6/7/23 23:21, Billy Tsai wrote:
        > >          > The code says:
        > >
        > >          > In Aspeed AST2600 SoC features 16 TACH controllers, =
with each
        > >
        > >          > controller capable of supporting up to 1 input.
        > >
        > >          > which is a bit different. I guess there are no examp=
les anymore,
        > >
        > >          > but I'd really like to see how this looks like in th=
e devicetree file,
        > >
        > >          > and how the driver is supposed to distinguish/select=
 the 16 inputs.
        > >
        > > Hi Roeck,
        > >
        > > The node in the devicetree file will looks like following:
        > >
        > > tach0: tach0@1e610008 {
        > >
        > >          compatible =3D "aspeed,ast2600-tach";
        > >
        > >          reg =3D <0x1e610008 0x8>;
        > >
        > >          #address-cells =3D <1>;
        > >
        > >          #size-cells =3D <0>;
        > >
        > >          pinctrl-names =3D "default";
        > >
        > >          pinctrl-0 =3D <&pinctrl_tach0_default>;
        > >
        > >          clocks =3D <&syscon ASPEED_CLK_AHB>;
        > >
        > >          resets =3D <&syscon ASPEED_RESET_PWM>;
        > >
        > >          status =3D "disabled";
        > >
        > > };
        > >

        > Neither reg nor pinctrl is mentioned in the bindings. Maybe that =
is not needed nowadays,
        > but I find it confusing.

        > Either case, it is highly unusual that there would be 16 instance=
s of this device
        > instead of one. Why is this done ? It doesn't really make sense t=
o me.

Having 16 instances of PWM and Tach is more compatible with our hardware de=
sign.
This is because our register layout for PWM and Tach is not continuous.
PWM0 used 0x0 0x4, Tach0 used 0x8 0xc
PWM1 used 0x10 0x14, Tach1 used 0x18 0x1c
...
Each PWM/Tach instance has its own controller register and is not dependent=
 on others.

Thanks

Best Regards,
Billy Tsai

--_000_SG2PR06MB33654B0D05D4644D409C5E888B24ASG2PR06MB3365apcp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"en-TW" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<div id=3D"mail-editor-reference-message-container">
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; On 6/7/23 23:21, Billy Tsai wrote:<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; &gt; The code says:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; &gt; In Aspeed AST2600 SoC features 16 TACH controllers, =
with each<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; &gt; controller capable of supporting up to 1 input.<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; &gt; which is a bit different. I guess there are no examp=
les anymore,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; &gt; but I'd really like to see how this looks like in th=
e devicetree file,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; &gt; and how the driver is supposed to distinguish/select=
 the 16 inputs.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&gt; &gt; Hi Roeck,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&gt; &gt; The node in the devicetree file will=
 looks like following:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&gt; &gt; tach0: tach0@1e610008 {<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; compatible =3D &quot;aspeed,ast2600-tach&quot;;<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; reg =3D &lt;0x1e610008 0x8&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; #address-cells =3D &lt;1&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; #size-cells =3D &lt;0&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; pinctrl-names =3D &quot;default&quot;;<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; pinctrl-0 =3D &lt;&amp;pinctrl_tach0_default&gt;;<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; clocks =3D &lt;&amp;syscon ASPEED_CLK_AHB&gt;;<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; resets =3D &lt;&amp;syscon ASPEED_RESET_PWM&gt;;<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; status =3D &quot;disabled&quot;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&gt; &gt; };<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt; Neither reg nor pinctrl is mentioned in the bi=
ndings. Maybe that is not needed nowadays,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt; but I find it confusing.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt; Either case, it is highly unusual that there w=
ould be 16 instances of this device<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt; instead of one. Why is this done ? It doesn't =
really make sense to me.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Having 16 instances=
 of PWM and Tach is more compatible with our hardware design.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">This is because our=
 register layout for PWM and Tach is not continuous.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">PWM0 used 0x0 0x4, =
Tach0 used 0x8 0xc<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">PWM1 used 0x10 0x14=
, Tach1 used 0x18 0x1c<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">...<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Each PWM/Tach insta=
nce has its own controller register and is not dependent on others.<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Thanks<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Best Regards,<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Billy Tsai<o:p></o:=
p></span></p>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_SG2PR06MB33654B0D05D4644D409C5E888B24ASG2PR06MB3365apcp_--
