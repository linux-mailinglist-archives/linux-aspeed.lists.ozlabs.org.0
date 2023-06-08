Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9365C727884
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Jun 2023 09:16:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcFr52Tqvz3dtG
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Jun 2023 17:16:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=P5bQGCv0;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feae::719; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=billy_tsai@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=P5bQGCv0;
	dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20719.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::719])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcFqx6HcLz3cKW
	for <linux-aspeed@lists.ozlabs.org>; Thu,  8 Jun 2023 17:16:12 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KjlEB1hRtS1EP5COAIoSuyKhIm9bDjlufd9ozeI0tgS0amdhTD+eL7pNbAlWdOmPGONRdbo30i9HC96pDhvZmIFSM4uZp5sV5R8c/FoJnSBMsSYUePth0Bm3MilrqN8egdzlK84ZMJibVvrc6XIfaz7ZGC5UcyfGLBfW/IEs0qH2buZ35+qavFb9qczOFV6+ezRvWAlEunzy4bS80MY12x/UAg4S0YUwhxmNloeC9pLvuNKQL7po7RxIRFVEJtOisYGanKO2l0yhYQV+orLhzYCBxhCq3t0nL2xtSI9M+a5j882nAAJDJj1aQ6iqVuJL9xwAzDUVQLhnxA2KdbQpsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NLF2NSI88WL+3SlNyN9K7EDfyQMVqHu1zXP9L8RMpT0=;
 b=mDlvZu3a+6w+Fvb7CPfKyYBZU/hdw4Ny8elD+d3KZ3LqETpDso5d9F3YxDGylnKOM7Pe8KHwDxMsfjHwjwrDogZN5aW0m3wU1W2dVYRUoDiEeA5bqp0KI9oh94tl76h7GCTHCLHy2p9iW7SYyZ+LQewf2GYjqZbzMJPGFICT6vNXucZQ8EhQx5k0hA6O4fHjjvsnxOuRfgqGpl33vB2VWnesL9OfxlBEMgAX+COJ4wAQzR/4HSw6xlJA7H73h0H6v21RNrMNlBpFeeUwcV8VowEGeEExJbFBkVtu0d+g1eMP/OpDF+RIOo45YnEMLsBFCWjaJzNhQ9JclKhsdcs2cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NLF2NSI88WL+3SlNyN9K7EDfyQMVqHu1zXP9L8RMpT0=;
 b=P5bQGCv0N9tNBsCkWmHrJN5P+g4t6GIPKy3u3Z7zF5twWfb6JPcsvpM95NWRK86ISeo38TGCPhQyQ/3e9gxeNBH84u3V7IBmt3dfaVH3hms/hKq7m6nd+pxcwF5H7DcME/PEd/mQjg6k5athPbAoa4EifgasBbiCbpdaQngV2PI0Ajra40lmGPkTA9OmoJjXqw4DnkpMs4GOnRqSVXyqaHljqj89tqHJ/M3mQr65VeFGECphJgHYgfyK83EyK8+dGwIB0JhxNcmxLwe/Goesz9fzVzQeeDNL4Pic23Xr+S08gZgA8eF07oaSBvcU6VsQqx1GatnVyYt/IfWuSqDMww==
Received: from SG2PR06MB3365.apcprd06.prod.outlook.com (2603:1096:4:69::12) by
 PSAPR06MB4469.apcprd06.prod.outlook.com (2603:1096:301:89::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.38; Thu, 8 Jun 2023 07:15:50 +0000
Received: from SG2PR06MB3365.apcprd06.prod.outlook.com
 ([fe80::cc45:2366:5fc9:c775]) by SG2PR06MB3365.apcprd06.prod.outlook.com
 ([fe80::cc45:2366:5fc9:c775%3]) with mapi id 15.20.6455.030; Thu, 8 Jun 2023
 07:15:50 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, "jdelvare@suse.com"
	<jdelvare@suse.com>, "linux@roeck-us.net" <linux@roeck-us.net>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"joel@jms.id.au" <joel@jms.id.au>, "andrew@aj.id.au" <andrew@aj.id.au>,
	"lee@kernel.org" <lee@kernel.org>, "thierry.reding@gmail.com"
	<thierry.reding@gmail.com>, "u.kleine-koenig@pengutronix.de"
	<u.kleine-koenig@pengutronix.de>, "corbet@lwn.net" <corbet@lwn.net>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-pwm@vger.kernel.org"
	<linux-pwm@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>
Subject: Re: [v4 1/5] dt-bindings: mfd: Add aspeed pwm-tach binding
Thread-Topic: [v4 1/5] dt-bindings: mfd: Add aspeed pwm-tach binding
Thread-Index: AQHY/wMOXeMHCeVuUE6+Ya/NPsQ1eK5MLAIAgTV/HQCAAAhGPQ==
Date: Thu, 8 Jun 2023 07:15:49 +0000
Message-ID:  <SG2PR06MB3365AE9D075601CB62C6E7F78B50A@SG2PR06MB3365.apcprd06.prod.outlook.com>
References: <20221123061635.32025-1-billy_tsai@aspeedtech.com>
 <20221123061635.32025-2-billy_tsai@aspeedtech.com>
 <c4b188b1-06a4-3cb0-a758-e12942e1f67b@linaro.org>
 <ce99a709-ba4a-eb53-39ac-88a194879000@linaro.org>
In-Reply-To: <ce99a709-ba4a-eb53-39ac-88a194879000@linaro.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR06MB3365:EE_|PSAPR06MB4469:EE_
x-ms-office365-filtering-correlation-id: 2457edef-f685-4d99-65ea-08db67f03019
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  VoRdYfQp73G+Vf0WoOX66u+1nqKhj2Qy2/LycAGILVpsBj3qDjoXFCpgGfAV9XZ8PnIeuw45r1dYN6RMRyzK256YTiUiUEMgw7vnYRlgx8/v0Y+L4WqHjt6zVZFk4LKGV06UQDx9YSQAoaYqck0rJWs0j6W0JpmCer9lhPyn8j1OLg5yhP6E6PQlmQcU1jgGWrqJdY1FkQ6oMIip2Kqss4awW1PF5KgDLFjAIzPjTCOagYDw/p6h0zwc1Dj2cjDAoyO+/16VwJFGvLPpBvROgzdu1vF5qUvRF6bN4zTTUZPuhF4SVHnPW5E/MlkZYoizAB751vaKV4MQCTcsHKwQ7NWfnX9vArb+m1za2bIQWD/EVfDrkz0TADb0/p5d3KbfcyTgesSf4cplPTGu9S1aXH79dAZVPVb9lHJXMCRqZcTzUJYl5XnrnS14WXGk4Y/cLluuQqEjXUcKJ5aynEtpzzQu+T+cdb0LXjLdWZ729SeLPUK9Jc9eL/W0aofpQ6o2Qp3EDhKbMQFOTkybmIV7+u6bp+mkWwrJOVN21/0fhWXplBk8kQ8PERANWKw6VXeuN9cX2Cd/X8QmpmxUbEFzJXwBTY8lIiSOKCsZ+7kQf77ZWRcPOLSTMO59/kiEbFni
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR06MB3365.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(346002)(376002)(39840400004)(136003)(451199021)(91956017)(64756008)(66446008)(66556008)(66946007)(66476007)(110136005)(76116006)(52536014)(8936002)(5660300002)(8676002)(478600001)(71200400001)(316002)(7696005)(41300700001)(38100700002)(122000001)(921005)(55016003)(53546011)(55236004)(38070700005)(9686003)(6506007)(26005)(7416002)(186003)(86362001)(2906002)(4744005)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?ymtfzBWkUszDziN/q0gxEjlk3wuoIYnky+1WQ4M1fI890Xn7gLc10X+hp3FB?=
 =?us-ascii?Q?0GdfXpR0bpPjKoxSFe5c9yMpgqgaYBY4nf75W6E7FbIg8qO9FE5lbOreukwd?=
 =?us-ascii?Q?glpCN435ISjhZD61tr91NTvbcGhfLDeX0AKKhPK7e5VfBYtwmlAZDNK4zq/J?=
 =?us-ascii?Q?4ufsdkXOHRKyOhRBduUpEJRqtnBY9Wihiv3YUj6clJ1Ck9Y7f4z6cfXhhoqb?=
 =?us-ascii?Q?q85CA0Ed2Are/FaFYd1LCOzsK4ijWGBntwL1j4at4hkRN9lzy5RgfSR6TWqB?=
 =?us-ascii?Q?k4RyTbfMkPbyac/Cz9VxrYuvGA/MJtSGrFwSfId2hRoOd+uIuLHQ7HDtDHzw?=
 =?us-ascii?Q?4YtTaPbtpvEBnCfyXg0MmfU1M4pmlXeTtmyIrYZIjQoPPz5VMoGmp0IDWiFY?=
 =?us-ascii?Q?jUHpklWZrS84REZZNkyQbVfshhBIIoLic7/hahNrUm56/f5gia3+6+fS7L1G?=
 =?us-ascii?Q?fR7/vNl0RccX/8ScRuqULbAa1xD0gZOcVm9TDNn4FHrznxUtQzGU7quO3xIk?=
 =?us-ascii?Q?53QiXm0Icx39DsL+Q1SrBaTEp0OnhQ9BfXdpHH5buYxMrgtapSwhEbrZA6Xx?=
 =?us-ascii?Q?5lwPvRcV+G5oHrYoS670oWKhv+M3Eqvl0EvCi/rxpwJR/4BAkeZeL8FEwrLp?=
 =?us-ascii?Q?c829ruzRjR4v8OTZS+Pf2m753gH2xnETUJnOBDLiag2430PJeQakJ30kBkCz?=
 =?us-ascii?Q?DlDX40/EJI/xAflp7fBOtu0kwbrbjShajF3xdwkkpwikc6i13jGOhRGYU0tq?=
 =?us-ascii?Q?8Oav6WRH2ar+66bTgSsupecPsZNuT5t9KShiYP/oKWHPBYczu8GSCarp1Ahz?=
 =?us-ascii?Q?xZcrBCeT03akWI16LuoEsW98sl9wPqcUgDEraC9lkySOeqiRKTt72SUi/pwi?=
 =?us-ascii?Q?UIeHhW4eKtKXXzjrucZ6xx2OPgmEeX3QYbaz0td8EnkGDHq7MK/lEmXwqMq4?=
 =?us-ascii?Q?ugAtBikCdfJQAK89sZjyLYxdWKPrbiurESCz16WDEshBDvjsFjliErizKGzR?=
 =?us-ascii?Q?21BxGdxPZrw+lfqkIdi42bIC34Lm5FMlCO8FOfn/WR7j4BDcuiTga1Pkz3fo?=
 =?us-ascii?Q?B9ax8u5BScQC47myJC9ZE4Fe8P7ZkeT/h2fIC+Kwg2xucsTvO5l9YIsW6wZA?=
 =?us-ascii?Q?rfUSsKSVPrHRCKq9Nl/a/7cKlqYWZQSlumVdnsN3TpwDoR3IjBN2Qa+TGAdA?=
 =?us-ascii?Q?CBBurduzmGX0inLuRbqiLe0VPgHR/agZqO8JnlDUvE+J75f8M+2RCCM3pAoG?=
 =?us-ascii?Q?Fg653ECX97oJ2PwI42bw/QwJIHmQwdIg0klxZVwpobaZxwdwk7QHSNLVj1r+?=
 =?us-ascii?Q?55/5A0AkivADt1u0mbObrg27nLedzPKNIURwk6ig0odiqit7o6FjHBUM8yA+?=
 =?us-ascii?Q?q5tg958GhXmEZBH9eT1ZOPXPq4yGgcQPw8YClt3v2vhhmWhA6BCBafV0zB+f?=
 =?us-ascii?Q?aI6YLyYFmNFbUFwgh/kNqw3f7GcTpnw9/3kS9Aq8kbob4HGeYI//BsXODF7x?=
 =?us-ascii?Q?6xjSUUdh7TRa8Ga/11tBEzF30eGQxl5rQFeCLz9CkiGlVKNOmQjTCZlDHvs3?=
 =?us-ascii?Q?JTMjKMjBOYir1S1PJ8YFasaq3/78diQaPu1neqYmlLxMMOjewQ5ePB42FibY?=
 =?us-ascii?Q?4tItHOdrLwiEOfGM5UdHJEc=3D?=
Content-Type: multipart/alternative;
	boundary="_000_SG2PR06MB3365AE9D075601CB62C6E7F78B50ASG2PR06MB3365apcp_"
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB3365.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2457edef-f685-4d99-65ea-08db67f03019
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2023 07:15:49.9670
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HpY61lTpYxwJVLVXI9L65RQ+lXnZNfgh9R0H+q7xbUwf3RiZSVq+x5ZCYQaLyK6W3Z7Zf8a0mm3nvfZohkrQgOvn3VjIBf4IkJ7825YaYVc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR06MB4469
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

--_000_SG2PR06MB3365AE9D075601CB62C6E7F78B50ASG2PR06MB3365apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

        On 23/11/2022 09:24, Krzysztof Kozlowski wrote:
        >> On 23/11/2022 07:16, Billy Tsai wrote:
        >>> Add device binding for aspeed pwm-tach device which is a multi-=
function
        >>> device include pwm and tach function.
        >>
        >> Subject: drop second, redundant "bindings".

        > Where did you implement this comment in your v6?

Sorry, I guess by "Subject: drop second, redundant "bindings"" you meant to=
 remove the second "bindings" string from my subject. So I change the subje=
ct from "dt-bindings: hwmon: Add bindings for aspeed tach controller" and "=
dt-bindings: pwm: Add bindings for aspeed pwm controller" in v4 to "dt-bind=
ings: hwmon: Add ASPEED TACH Control documentation" and "dt-bindings: pwm: =
Add ASPEED PWM Control documentation" in v6.
If I have misunderstood your comment, please let me know.

        >> Also use proper PATCH prefix.

        > Where did you implement this comment in your v6?

I apologize for forgetting that part of the change.


--_000_SG2PR06MB3365AE9D075601CB62C6E7F78B50ASG2PR06MB3365apcp_
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
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; On 23/11/2022 09:24, Krzysztof Kozlowski wrote:<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt; On 23/11/2022 07:16, Billy Tsai wrote:<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&gt; Add device binding for aspeed pwm-tach=
 device which is a multi-function<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&gt; device include pwm and tach function.<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt; <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&gt;&gt; Subject: drop second, redundant &quot=
;bindings&quot;.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt; Where did you implement this comment in your v=
6?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Sorry, I guess by &=
quot;Subject: drop second, redundant &quot;bindings&quot;&quot; you meant t=
o remove the second &quot;bindings&quot; string from my subject. So I chang=
e the subject from &quot;dt-bindings: hwmon: Add bindings for aspeed tach
 controller&quot; and &quot;dt-bindings: pwm: Add bindings for aspeed pwm c=
ontroller&quot; in v4 to &quot;dt-bindings: hwmon: Add ASPEED TACH Control =
documentation&quot; and &quot;dt-bindings: pwm: Add ASPEED PWM Control docu=
mentation&quot; in v6.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">If I have misunders=
tood your comment, please let me know.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt; Also use proper PATCH prefix.<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt; Where did you implement this comment in your v=
6?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">I apologize for for=
getting that part of the change.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
</div>
</div>
</body>
</html>

--_000_SG2PR06MB3365AE9D075601CB62C6E7F78B50ASG2PR06MB3365apcp_--
