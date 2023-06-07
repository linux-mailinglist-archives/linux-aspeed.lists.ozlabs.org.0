Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E76A725421
	for <lists+linux-aspeed@lfdr.de>; Wed,  7 Jun 2023 08:26:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QbcnY13jfz3dsS
	for <lists+linux-aspeed@lfdr.de>; Wed,  7 Jun 2023 16:26:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=ddwadNte;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feae::707; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=billy_tsai@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=ddwadNte;
	dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20707.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::707])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QbcnL6kJsz30QQ
	for <linux-aspeed@lists.ozlabs.org>; Wed,  7 Jun 2023 16:26:42 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gfuSs/DU2qP3XHjL3PWADx/s/PQ1q2Uwof8HS6zEljJ8rIHDjj2tdgas6d9SOZ0svfjj15+IuqLv2/pmfboEuUXpM9kK4U0gciX8fpv/OhaJls2+tJf5Xw37TMjPWU0bt/OvtK8X0dFKs2tT0Ioi3DqPBosGyGgJWZhVchtqCRgKh68bjhY8DKQCSi+XyxjS1+r5Mk3yLC9sRZEOZneu/QGbdHh9IZpH1aZk67gOmUq0pzHX+VjQT6LJ6o2hL5ixKbGYEbMACaLhmgpgnq8sR/4hywTrOEPLd2dYo9VDb0dYwTVbHMjABDJUfAKJ/64HfHabTfAnvySdCvAgG1ikig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i2vm91T82CsSZnVQHMvBie7ZlxDugFcHRR8BMBpenh0=;
 b=V92qKdJBcOEGwcxxgzXeD/g5cl2sJTsg4DPA9emLq+xOl51G5nBF+wQN/pv6ORsykzEJvlLZqUArCuvxOC+dKyTgpdAIGbGXMFIxqCJ9gSACoca72FCFeE+DdBZDDDTPu6Q/pFkluuryV2sJsrDatRMje+z9BXZ5/XtxdDcVmwLU96PBaviDSXf8ER5awECkb58YBtGVtYLua0hcraz9nYbqooNTMJgy9+EZxnarUnssYOOml8JDhRBuzldFXGUjf93JggOYlHliHh1PBfcIfzLlOnQeAQYN0JGPj5onAb+RF2THsa3Al24ctY8/mvTM+JIbeqP94xuuq69JqTkLYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i2vm91T82CsSZnVQHMvBie7ZlxDugFcHRR8BMBpenh0=;
 b=ddwadNteU2eO1qb40TAdGqbqxd0C3Du5SH2vmA5wyhFIO0KeOu2VZhIG1havpFwLowd+52e1e9UxLHtTG9DDMzPIJIB1gPAThgc2MbGTZ6Wx4QknQvIZtQP5xXtOGQ6un0+zOzODld5iT35Wir0ApkR5NQoYAxUMB8z9Qp1cfMfp8Zwz2iHs5cBFz1tkKmY5YNsazKh/dQ4hek0wy+FCCliWx9EL8rhfvtzO1tM+mKCWCklPSvVn5jZdi3KVLEYg2jfztmjLdc9LY3IhVOFpJvAnbewLJsv8V63YpMC8tMccOK5sgghm4j9NZDxAnMUECNzrXNuQdyyjmsqCBmG5vA==
Received: from SG2PR06MB3365.apcprd06.prod.outlook.com (2603:1096:4:69::12) by
 SI2PR06MB4108.apcprd06.prod.outlook.com (2603:1096:4:f4::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6477.19; Wed, 7 Jun 2023 06:26:20 +0000
Received: from SG2PR06MB3365.apcprd06.prod.outlook.com
 ([fe80::cc45:2366:5fc9:c775]) by SG2PR06MB3365.apcprd06.prod.outlook.com
 ([fe80::cc45:2366:5fc9:c775%3]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 06:26:19 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Patrick Williams
	<patrick@stwcx.xyz>
Subject: Re: [v5 3/5] dt-bindings: mfd: Add aspeed pwm-tach binding
Thread-Topic: [v5 3/5] dt-bindings: mfd: Add aspeed pwm-tach binding
Thread-Index: AQHZmFtk1R/dtj8sXk+ajmqdJHRQi699mE4AgAA3RYCAAAS/AIAA3fD6
Date: Wed, 7 Jun 2023 06:26:19 +0000
Message-ID:  <SG2PR06MB33652E18980E9CF8E4F0894D8B53A@SG2PR06MB3365.apcprd06.prod.outlook.com>
References: <20230606094535.5388-1-billy_tsai@aspeedtech.com>
 <20230606094535.5388-4-billy_tsai@aspeedtech.com>
 <35bf0a69-bcf6-ae35-eb3c-e74cfcf9c571@linaro.org>
 <ZH89fXknZlhGmM_H@heinlein.vulture-banana.ts.net>
 <c28f963e-d13c-6b5c-c389-996e986f81d5@linaro.org>
In-Reply-To: <c28f963e-d13c-6b5c-c389-996e986f81d5@linaro.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR06MB3365:EE_|SI2PR06MB4108:EE_
x-ms-office365-filtering-correlation-id: e60a1f3e-2da5-436f-2d5a-08db67201b50
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  qTzhDKaaEAqs3qbOHt3fcUaxPNJRPelm/7v2B1lesu6DNDav88O7cRHTOeDmjqfFFNLZgOlQL3BpmJiJ8BqsFcoI9QkplUp1PonUFdIV3v8CBzViDagrXnpHGWk/Zov4voNdDpcvM4EiHbMA5ypI8Cd0h8RZRQVavBzHRiW95uFG4irBc1n3WGblDZ431ktB3lkp9f+9L4mOmyZhuhtEQp/Pan1nBeHXpSz536es/bdOOEXOMav9NDvT/AqqwHds2ONVLpX+RGdOAKCwPAjvy1aYkAxWYr5Eit6dV3zfEu8GyMow25bkli2otzUbEPTOb+KjoOr5tNzIPxcSW1HEkoxJzKfX5BOnJUydnsK+Ye+5HE3wX0DNI3vSnutBJtNHbMSqfvHx69eTA2hC7xV4PKRoHvA/SIZAoI1APvB24tB/s04JoG9bccOLvgFRBU9QI/KhSVolfwHrvXO2lrj7n+yneNqebU3t2kWcUCBeiFD+uSlKucYoHM3p2ULMNDASUEwxIj2mySx16EVMg90PViQ0sP8xAPL0Gd8KsQfd3MN8CGOVzMCxPQZrYE7ufo77lK8SYshMbztL4wyLIPmgKxvVax2sT8Ca4bFXpLESisM=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR06MB3365.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(39850400004)(346002)(366004)(376002)(451199021)(55016003)(7696005)(966005)(316002)(122000001)(66476007)(76116006)(64756008)(66556008)(66946007)(91956017)(54906003)(66446008)(110136005)(4326008)(2906002)(5660300002)(7416002)(86362001)(38070700005)(38100700002)(41300700001)(33656002)(8676002)(8936002)(71200400001)(55236004)(52536014)(478600001)(186003)(83380400001)(9686003)(53546011)(6506007)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?Windows-1252?Q?wBSEM0eiYZTSXZTbrH0rIqtjUfLIxviiJqiWngun3fSb8/PAO9Hc++oi?=
 =?Windows-1252?Q?Gu4du+z8VF/Bk9X6Rv0F0fTeNFq/phJpFlvYD618RVGYuyZGHdSq2Zsm?=
 =?Windows-1252?Q?f0FZdSt2rWh00j+NFXb+CAhgjY36+WvU60WHDIeB6rr8r3axFLiff7pR?=
 =?Windows-1252?Q?YEyCpKk1SL9OyCYtgwPrFObDbFfikoVbYHaFoThd0N3v/nVIewytIR3V?=
 =?Windows-1252?Q?uYByrtL2Oa8c+hLrWO78uC+kZu3EXjQ8E6ThMCLnzQ8+8pknTwVtadjM?=
 =?Windows-1252?Q?pS1juKWVGoVAVFgmGWvmJ0HaKShAeezYCjcx/TyB6SYKi6JNlkahHp1L?=
 =?Windows-1252?Q?e4IDNUvFeiIqTMOJb6wycarNo6myOYvEoVTIQWQJMGs/HbhPqsDC4juF?=
 =?Windows-1252?Q?wwhASSVq9l3fYSfZyqDKfdtPEwVF2zNwWXw4HsAl3UUeb8PHeq9RcKyY?=
 =?Windows-1252?Q?doef01553LATNOuTxrq6FDSv/rCSYXfLCU8VKl9fVUjrRDwnHjOlX9N2?=
 =?Windows-1252?Q?DTpvxLZHUSR/cSfloCLVgp7CDuxB9lqIZWUE1rCLbaFRpZjwg+Xt7usW?=
 =?Windows-1252?Q?/vgsCl7h4stWNIMzCMVItygre9X3WN7qfp3Z369GnyvzgHuA1SMkZnU6?=
 =?Windows-1252?Q?RN3qt8OUiiGjR9wmmn0kcMdgcMqPQx0uW4UhSXL0sxZcRRIY4u8jnQrd?=
 =?Windows-1252?Q?3hnCyUEDDfcp+U43CsMa1U4W/TB2HhgCtOsIuY00Rfx525aMK8CBdQq1?=
 =?Windows-1252?Q?HnHMuDB2z3dsACSXQAWazs8jhcTv3L3FgsjPIy7GbVfnZR6NAOIdsy1c?=
 =?Windows-1252?Q?pAivqweDAAmSri11lgJ1jwNALgHrbFELmoIw/W/7GDJg9IKEQNcV5KIp?=
 =?Windows-1252?Q?BGBo/MCDVVrGZJfW1hL+v8jYxWAKRBgjaZNlJfK+IaRzB6OMMGRHeAGM?=
 =?Windows-1252?Q?KwqY0zCRex14xljmjpzX/f2zB4KCrdMgy1559EtqWf1GtWBW7XglvIE+?=
 =?Windows-1252?Q?IOYMXm3B1GcKRRV+VsZaG1SyPpfkQbmIyV10EtpyYx6iYdYiLM7IJ4E1?=
 =?Windows-1252?Q?zC1zWDCuJwe0px3bmipw6tOeAZ+RWqkF9TO3MUrt+gAYfWWzAdIf7/nm?=
 =?Windows-1252?Q?ehFUvMsm0LKUCY16VU2pq2sSwpwDHP+JXviPRTcPmgP43eI7hlm77CGH?=
 =?Windows-1252?Q?QpHZ9LMB7ch8Ouy69wd9Y0s4JudMDin0F3ruUKo30LMivUNRkcdlLpax?=
 =?Windows-1252?Q?v1crpLVeMGrDuW4CxyNgSb2k61CdYxSa6dzw39bAjU5vGENCpICs7SRF?=
 =?Windows-1252?Q?aWWffuX/mTPOzpwNegctbKfPwE0d7lK/hyLUiIy8k9ODhSmUcNrZDiGS?=
 =?Windows-1252?Q?a5saCuGevjQzJnlMhJ1sZE8NxU0ALNfbSvI/pCz4JTbg1Xf+Jgr7oxKs?=
 =?Windows-1252?Q?GGtFrma2Y1aA2FbCLnvfl9ib1xKHd/wnbCeEk63OBBh9rtZTB5+5masQ?=
 =?Windows-1252?Q?TC05KS81CGXa+NXUtAWTIMVhbWAfSRcKr+MvFOsTOYIHJdphLyCaufq/?=
 =?Windows-1252?Q?CMZJyOYeILVe0d6yAaX5Mlv9Xl1Ywy8wwaGFuzZgTlRQuzg8kDfiAfNh?=
 =?Windows-1252?Q?4NJw6DF/fq0ADTwS+o6yvQ4p5V5UhCdEQFPNrG2TablKu2+JAT6p8nfs?=
 =?Windows-1252?Q?DXdAV5hbp7RVLsHn7H0Cl08nHrb0vjLm5M3e78zp16C3/hgQhJDWXcCm?=
 =?Windows-1252?Q?JyB9ZTUOB5IFm88C+D8=3D?=
Content-Type: multipart/alternative;
	boundary="_000_SG2PR06MB33652E18980E9CF8E4F0894D8B53ASG2PR06MB3365apcp_"
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB3365.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e60a1f3e-2da5-436f-2d5a-08db67201b50
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2023 06:26:19.7508
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qzOuQaQ6aQkYlvgBJlbqbhCk/waQWoOpnPAmn1+WSpQB+NCOFL101+FK8aQHPupJpDZfNwuYhKIRAAOKl7BF8gsboKQi3z6QuPmcoksmivU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB4108
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
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "jdelvare@suse.com" <jdelvare@suse.com>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "corbet@lwn.net" <corbet@lwn.net>, "lee@kernel.org" <lee@kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>, "linux@roeck-us.net" <linux@roeck-us.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

--_000_SG2PR06MB33652E18980E9CF8E4F0894D8B53ASG2PR06MB3365apcp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

        On 06/06/2023 16:06, Patrick Williams wrote:
        >> On Tue, Jun 06, 2023 at 12:49:04PM +0200, Krzysztof Kozlowski wr=
ote:
        >>
        >> Hi Krzysztof,
        >>
        >> Thank you for reviewing this from Billy.
        >>
        >> The Aspeed chip is heavily used by the OpenBMC community and the=
 2600
        >> has been used in production systems for almost 2 years now.  Man=
y
        >> companies are having to carry previous versions of these as patc=
hes, and
        >> some of the APIs changed since the last revision from Billy.  So=
, I had
        >> asked him to submit the latest patch set with as many revisions =
as he
        >> understood what to change, since the conversation seemed to have=
 died
        >> since last time he submitted.
        >>
        >> I don't believe Billy is intentionally ignoring your feedback an=
d he is
        >> motivated to get this patch set wrapped up into an acceptable st=
ate.
        >>
        >>> On 06/06/2023 11:45, Billy Tsai wrote:
        >>
        >>> NAK. You got here clear comment. You cannot have simple MFD wit=
h
        >>> resources. It is not simple anymore.
        >>>
        >>
        >> In fairness, Billy asked for clarification from you on this poin=
t and didn't
        >> receive it.
        >>
        >> https://lore.kernel.org/lkml/24DD1FEB-95F3-47BE-BE61-8B0E6FBDE20=
F@aspeedtech.com/

        > I gave the instruction what Billy should do:

        > https://lore.kernel.org/lkml/41500a04-b004-0e2c-20a1-3a3092b90e6d=
@linaro.org/

        > What about other ignored comments? About subject, quotes and more=
? Even
        > if this one was unclear, then why ignoring all the rest?

It's possible that there was some confusion regarding your message. I apolo=
gize for any misunderstanding.
About the subject: I apologize for the misunderstanding. I just drop the re=
dundant "bindings" in the commit message.
About the quotes: I believe the issue was simply related to the order of th=
e patches, and I have resolved it. Did I misunderstand?
About the Missing description:

> +patternProperties:
> +  "^fan@[a-z0-9]+$":
> +    type: object

> Missing description. But more important - why do you have such child
> nodes? Your example does not have them. What's the point? Do you expect
> different number of fans per one device (one compatible)?

In this patch series, I have included examples and descriptions to provide =
additional information.
The child node is used to enable the channel of this tach controller.
I expect that the dts will include information regarding the number of fans=
 connected to the board and their corresponding channels.

        >>
        >> He felt what he was trying to accomplish met the documented
        >> expectations.  Are there some changes that need to be done in mf=
d.txt to
        >> further clarify when to use it and when not to?

        > I think mfd.txt clearly states:
        > "For more complex devices, when the nexus driver has to
        > probe registers to figure out what child devices exist etc, this =
should
        > not be used. In the latter case the child devices will be determi=
ned by
        > the operating system."

About the mfd:
For our pwm and tach devices, there is no need to check/apply any hardware =
register from parent to determine child=92s existence or functional.
They don=92t have any dependency on the parent node. In fact, it doesn=92t =
require a specific driver to bind with the "aspeed,ast2600-pwm-tach" label.=
 Their purpose is solely to share the same clock, reset phandle and base ad=
dress. The main reason for using simple-mfd in this case is because these t=
wo independent devices share the same base address. In fact, I can relocate=
 the clock and reset configurations to the child nodes rather than the pare=
nt node.  In this case, I still can't use simple-mfd?

I appreciate your assistance and review.

Best Regards,
Billy Tsai

--_000_SG2PR06MB33652E18980E9CF8E4F0894D8B53ASG2PR06MB3365apcp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
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
	{font-family:"\@PMingLiU";
	panose-1:2 1 6 1 0 1 1 1 1 1;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;}
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
<body lang=3D"en-TW" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; On 06/06/2023 16:06, Patrick Williams wrote:<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt; On Tue, Jun 06, 2023 at 12:49:04PM +0200, =
Krzysztof Kozlowski wrote:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt; <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&gt;&gt; Hi Krzysztof,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt; <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&gt;&gt; Thank you for reviewing this from Bil=
ly.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt; <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&gt;&gt; The Aspeed chip is heavily used by th=
e OpenBMC community and the 2600<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt; has been used in production systems for al=
most 2 years now.&nbsp; Many<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt; companies are having to carry previous ver=
sions of these as patches, and<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt; some of the APIs changed since the last re=
vision from Billy.&nbsp; So, I had<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt; asked him to submit the latest patch set w=
ith as many revisions as he<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt; understood what to change, since the conve=
rsation seemed to have died<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt; since last time he submitted.&nbsp;
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&gt;&gt; <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&gt;&gt; I don't believe Billy is intentionall=
y ignoring your feedback and he is<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt; motivated to get this patch set wrapped up=
 into an acceptable state.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt; <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&gt;&gt;&gt; On 06/06/2023 11:45, Billy Tsai w=
rote:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp; <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&gt;&gt;&gt; NAK. You got here clear comment. =
You cannot have simple MFD with<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&gt; resources. It is not simple anymore.<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt; <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&gt;&gt; In fairness, Billy asked for clarific=
ation from you on this point and didn't<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt; receive it.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt; <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&gt;&gt; https://lore.kernel.org/lkml/24DD1FEB=
-95F3-47BE-BE61-8B0E6FBDE20F@aspeedtech.com/<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt; I gave the instruction what Billy should do:<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt; https://lore.kernel.org/lkml/41500a04-b004-0e2=
c-20a1-3a3092b90e6d@linaro.org/<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt; What about other ignored comments? About subje=
ct, quotes and more? Even<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt; if this one was unclear, then why ignoring all=
 the rest?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">It's possible that =
there was some confusion regarding your message. I apologize for any misund=
erstanding.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">About the subject: =
I apologize for the misunderstanding. I just drop the redundant &quot;bindi=
ngs&quot; in the commit message.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">About the quotes: I=
 believe the issue was simply related to the order of the patches, and I ha=
ve resolved it. Did I misunderstand?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">About the Missing d=
escription:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; +patternProper=
ties:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; +&nbsp; &quot;=
^fan@[a-z0-9]+$&quot;:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; +&nbsp;&nbsp;&=
nbsp; type: object<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; Missing descri=
ption. But more important - why do you have such child<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; nodes? Your ex=
ample does not have them. What's the point? Do you expect<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; different numb=
er of fans per one device (one compatible)?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">In this patch serie=
s, I have included examples and descriptions to provide additional informat=
ion.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">The child node is u=
sed to enable the channel of this tach controller.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">I expect that the d=
ts will include information regarding the number of fans connected to the b=
oard and their corresponding channels.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt; <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&gt;&gt; He felt what he was trying to accompl=
ish met the documented<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt; expectations.&nbsp; Are there some changes=
 that need to be done in mfd.txt to<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt; further clarify when to use it and when no=
t to?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt; I think mfd.txt clearly states:<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt; &quot;For more complex devices, when the nexus=
 driver has to<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt; probe registers to figure out what child devic=
es exist etc, this should<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt; not be used. In the latter case the child devi=
ces will be determined by<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt; the operating system.&quot;<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">About the mfd</span=
><span lang=3D"EN-US" style=3D"font-size:11.0pt">:
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">For =
our </span><span lang=3D"EN-US" style=3D"font-size:11.0pt;mso-fareast-langu=
age:ZH-TW">p</span><span lang=3D"EN-US" style=3D"font-size:11.0pt">wm and t=
ach devices, there is no need to check/apply any
 hardware register from parent to determine child=92s existence or function=
al.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">They=
</span><span style=3D"font-size:11.0pt"> do</span><span lang=3D"EN-US" styl=
e=3D"font-size:11.0pt">n=92t</span><span style=3D"font-size:11.0pt"> have a=
ny dependency on the parent node</span><span lang=3D"EN-US" style=3D"font-s=
ize:11.0pt">.
 In fact, it </span><span style=3D"font-size:11.0pt">do</span><span lang=3D=
"EN-US" style=3D"font-size:11.0pt">esn=92t</span><span style=3D"font-size:1=
1.0pt"> require a specific driver to bind with the &quot;aspeed,ast2600-pwm=
-tach&quot; label. Their purpose is solely to share
 the same clock, reset </span><span lang=3D"EN-US" style=3D"font-size:11.0p=
t">phandle
</span><span style=3D"font-size:11.0pt">and base address.</span><span style=
=3D"font-size:11.0pt">
<span lang=3D"EN-US">The main reason for using simple-mfd in this case is b=
ecause these two independent devices share the same base address. In fact, =
I can relocate the clock and reset configurations to the child nodes rather=
 than the parent node. &nbsp;In this case,
 I still can't use simple-mfd?<o:p></o:p></span></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;mso-f=
areast-language:ZH-TW"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;mso-f=
areast-language:ZH-TW">I appreciate your assistance and review.<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;mso-f=
areast-language:ZH-TW"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;mso-f=
areast-language:ZH-TW">Best Regards,
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;mso-f=
areast-language:ZH-TW">Billy Tsai<o:p></o:p></span></p>
</div>
</div>
</body>
</html>

--_000_SG2PR06MB33652E18980E9CF8E4F0894D8B53ASG2PR06MB3365apcp_--
