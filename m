Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 66422727922
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Jun 2023 09:48:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcGXX73mJz3drw
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Jun 2023 17:47:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=bxMogKQT;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feab::713; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=billy_tsai@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=bxMogKQT;
	dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20713.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::713])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcGXM2mjPz3cdZ
	for <linux-aspeed@lists.ozlabs.org>; Thu,  8 Jun 2023 17:47:45 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GJyKslKj89We+Ogy0uODHafUDZYMhV4sQaS4/OdbFIubcUH3lEnf0CNi7gFAb5KGegvLO5lq3DG4UI7D/f4/FOEafxRyA1Qm/ltxS/y+SRIoYd7o59+pAQzSznm3SF/hKEoTVBgdmI+diqd+njm5xkLHHsjvqTm8o1zON1O7i/0mYGrCEvEYmoHwBOnDh3euvLF0iOxxH4EZmpQPSAzXWUdvf3KB6YHFx5MMjZMYTsMN8+ZaZzo220u9f+VJsyljiWRlS0o2RjedJpyKPM9Yd7NSDOSKvqJrN0zffXC/nsby1EVivSJBzAHdRzaMjm5pbotMRUJsxXlOYO7qvj7EYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CqmDnWPHsC7zL8kzKV/eQ4+MUzdfXbrwuDbM6ZjiAx8=;
 b=Fr+2cU4IsAEBWSIC20y8KNBYvR0mIrY2PqU2KVBLte9EXsZ8L2K9rWc4qheaeU9eZGkOlgHyE0e6uIMKIY0Wm6WOLMhOtxFvqcbyFGBlU1wgevp4TSt6y5dlUfFrV+Sq0M9YaeWgudA/kV03bOZs3KDQC1USFtX5bZzEeFzPWEb5MX7HfYzuoi96Vdnhn90RxGKxnH3UN6laems0bDSDrym5WqqC1q0AkWXXlMvmXvsjPeGmcYp28JGnqG5gKXjFsqdBdccGgZKYdrMJQX5YApnDUlYYE1kOqaCsF6IkVcAwymt0HzjCzX4VtbQ2Ucel3llqR7Tya1Zlo8uTmWuQKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CqmDnWPHsC7zL8kzKV/eQ4+MUzdfXbrwuDbM6ZjiAx8=;
 b=bxMogKQTOcWPjpcgOlY6B7H8QiEZnucVZsnWkMlPj8kyYjlKbtbjlACarUfgA70IIGQCL3gI7Duy1J2ZD56EYusFAqEI6yrCsXmTPw5JZVbYiPHTPoZNp131bF7Z29WPUGvQHPQZu/Xv4pU4kvWtU4YUENN149O0YGKRVP9U1eWy9lhbz5nVV/1Ows4i2tJgyxIuM1vBDb6en2EUG15eCqWissh0pbpfoJGyh04jetIPEFNSHXs3sl7wqiU2eGLFUcVBNrFX/JyC4b8ojFLsYbAp6IoCGD9FGJLeHZoJzjFWmM1GY2Gdi2/1NuHOXAX/8dhxt81BXIU5sgaW3vZ+gw==
Received: from SG2PR06MB3365.apcprd06.prod.outlook.com (2603:1096:4:69::12) by
 KL1PR0601MB3873.apcprd06.prod.outlook.com (2603:1096:820:20::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Thu, 8 Jun
 2023 07:47:24 +0000
Received: from SG2PR06MB3365.apcprd06.prod.outlook.com
 ([fe80::cc45:2366:5fc9:c775]) by SG2PR06MB3365.apcprd06.prod.outlook.com
 ([fe80::cc45:2366:5fc9:c775%3]) with mapi id 15.20.6455.030; Thu, 8 Jun 2023
 07:47:23 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, "jdelvare@suse.com"
	<jdelvare@suse.com>, "linux@roeck-us.net" <linux@roeck-us.net>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
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
Subject: Re: [v6 1/4] dt-bindings: pwm: Add ASPEED PWM Control documentation
Thread-Topic: [v6 1/4] dt-bindings: pwm: Add ASPEED PWM Control documentation
Thread-Index: AQHZma8+6LJZhu/Vfk6W8iuVf8iT56+AdouAgAAQppM=
Date: Thu, 8 Jun 2023 07:47:23 +0000
Message-ID:  <SG2PR06MB3365DD80EA2FD026D400C4A78B50A@SG2PR06MB3365.apcprd06.prod.outlook.com>
References: <20230608021839.12769-1-billy_tsai@aspeedtech.com>
 <20230608021839.12769-2-billy_tsai@aspeedtech.com>
 <4dffd320-8e30-fb30-6ded-79519afddc21@linaro.org>
In-Reply-To: <4dffd320-8e30-fb30-6ded-79519afddc21@linaro.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR06MB3365:EE_|KL1PR0601MB3873:EE_
x-ms-office365-filtering-correlation-id: a6171b57-398f-4674-7156-08db67f498e4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Un0OWxMx8B7HSHDhDCc40HRVnO/vKcJ+JoYX08HlYTexIuOQBiU8H/wWAzDJdTUKSfq8eYg7UZQmaTgezNuohwMz7lBmoAFNN9Y0gAm2LaZjVFj+SMHQoNsLCdx/t4ee5PqkklPjN42Fdjb1AjkrcIC3SnAaZSqJXBCJzqAxLEYyEmQl7vR2/+2Zhfwnv2ugo3ImjIy0zMd7yxl2sBbROcgmlgoOph7isb+r+Kj87lxwzom3wnLdtgV1v+BXzzOF6vS6SwIlnR0Caj2N23dVkILO8Dwp3OcmYhGNFE48Q5Cm6jPJ4lAKg4375fOW3rfTcHfnDoGo4RO4php2T3wB4szHUkbwMnku912/uYvfoDEYMCW1B1+V6VITRtIFu+W2e7kN/9qt7lJj8+5CLWyNhFN9+GnJ+ccteeVgc5/m6w63I2clPFLCIApN0P2dasRvviNLgXXQ3wbqI9pz6pqqWafJa0yM5ua//1hcgEbV8pDokRLjAKM9XdGi991WBbMPQ3f/XDleXmwnJsdAqRkFwRItXb0JkzFJpGMetJU2yYEcOlNMc5LteAzd8P/HVWBw7lmqShnOTZQCnbPIFUFqT5Ux3G73j+mXBkQHVmw402QapXGcyjrhk41f7yTn3v21nU89vbf+BnbbfZg7wr5amw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR06MB3365.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39850400004)(396003)(136003)(366004)(376002)(451199021)(110136005)(2906002)(38070700005)(71200400001)(478600001)(33656002)(86362001)(52536014)(38100700002)(41300700001)(7416002)(8676002)(8936002)(5660300002)(55016003)(76116006)(91956017)(122000001)(64756008)(66556008)(921005)(66476007)(83380400001)(66446008)(6506007)(66946007)(9686003)(55236004)(26005)(186003)(316002)(7696005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?Rl0RgeNqTTRezMPhwdDnp0cht8gYx23liE9FooehRwQyyQ3qNM1kE58mixq1?=
 =?us-ascii?Q?LO3WL+aVnQ5Yial+zqbdw4QxXbOl8RaBDGZJG+rAz1FDhtG0usyfEcksJpVw?=
 =?us-ascii?Q?YKzRGfNEkwXuKAUj8E+qRJgxI9AmSj6oBdXFTf1STfmWeVj5NKvFj4AsHxt5?=
 =?us-ascii?Q?44PGCbvf1kk3Be+vzABW7/w8vzmvfWZ0eHBxqPt92SJisDTcOU9v44JokgoZ?=
 =?us-ascii?Q?t+I5J1Hig+G1KgOPIgQIiJlSTfUuaH3vs9mGYToZxO5VGsEHsMo3mCbJBMWZ?=
 =?us-ascii?Q?7vcaJedg6pwKvz2Za28f2oSRMnQNHu1WvXMH3rS72MMgoRV36SNzmUYx0rcK?=
 =?us-ascii?Q?7tUWs8BE9YmgLO/6kY3U4i8nUziejzC85GC9KkflujNBJWLnd9Hsu5FMcPua?=
 =?us-ascii?Q?2c4xgNGGyNNzxQaQsyc3ANYuc6MBe+WG1q75c73igGDX9SPO8HF2dXGXlB7m?=
 =?us-ascii?Q?jFUne9ge3/wMmNq4wn3vwOh3oLwxtVyOqafqPcBwld6mw8OhRfTI94xqgqTc?=
 =?us-ascii?Q?xR9hqSujLzpv5MgFSSSW5jJkwyuXaOKWbh55YqLlKy+O0wG/VHYIimfoWbgV?=
 =?us-ascii?Q?uq4u1/A2dA46T39Ch1uVxRR0wA46+KIQsDcsaAhGMwpkDryVddN9GO8NUIRI?=
 =?us-ascii?Q?8+DVX/bSmRDZkw6yCOKLaJsRpBKbXbyjFpKubvdjUvzZ7dvnrtFSSfc0Qmaa?=
 =?us-ascii?Q?+iJJLqGAQleS4Ul+XgXdwWiPMKWdVbk2HDAThKDIIVIc+l+Oq6FWGPRxBodh?=
 =?us-ascii?Q?SqzROEYqyGg2sDKfJPvh4F1d8wW09fRSofCE6BKSFYtvuwLVG38i/Lgn04Ne?=
 =?us-ascii?Q?iu1R9UdNX2tM6YOmyzFUVtO00pd/dTG1UcBLv+yMxsgjEgTkytnA4NI1ypfu?=
 =?us-ascii?Q?OthelKSceM7wDpQKYo+8qXT79uDG4DJ9cuax/FO6IgI8GcRt6LL/53bSP3xX?=
 =?us-ascii?Q?8hYwV0qXCQVTx0I6xoqpB+XJzn3E0zpMsYPigAhQYZtrixmoxgP8cS13e4S9?=
 =?us-ascii?Q?fHPqzzIcmXj+7nWnV72Q4zLyZot5Dx5OJy99VWSg+n9mbD1PjPlr32c6SOsS?=
 =?us-ascii?Q?pyzLGQ5xsNo4ArC61QFb2D4xbr8TjcDGPVyCKYa6il0o5Ly/mOVbTV6PqC4U?=
 =?us-ascii?Q?WdPp8osCJeJrl3/TF+B380qpoCsiNUfgvBXdW05oLOFwN6aKj8RdNumPa9ax?=
 =?us-ascii?Q?wtgDIvkV9amC8VNfv/WP33JUQgZJEvZKMLqkX8IrSfSTYJcFDgBkCPbY49rr?=
 =?us-ascii?Q?fr/ZlPXA3B+nDthncgA9SScr9dvG+Nzd0weFzkxVDCm5FIA4ll7+k451GNC5?=
 =?us-ascii?Q?eI6qAogk8PSF82ssjJFzobIrFXf88pM+9pJ1I3/khf4uabczShXNwPXiRv+y?=
 =?us-ascii?Q?p7+6iEb+9nU0Tz7lsia16DmsTVxFlg3fNtMvjCl8IV0yml3JjyB3unuRshuk?=
 =?us-ascii?Q?0kYzOVfR934tvPDM2/neHUNMzX4HI/xHEFXRrElvzugOcdr1BbVvhEHpUWC3?=
 =?us-ascii?Q?IrorIofrtoMK7GFj4Za9//GJJ8cE5dXOmDEOUZPmdFMCdpvEajhiF5EcmW1/?=
 =?us-ascii?Q?ILUzgtjwPXUsFoxaxPqO/44JQtka1mw+pDBPcWWaSPlrf1nhInDSmOLOlv8q?=
 =?us-ascii?Q?4HVg1pj5FaaCzTTr+jgsDvw=3D?=
Content-Type: multipart/alternative;
	boundary="_000_SG2PR06MB3365DD80EA2FD026D400C4A78B50ASG2PR06MB3365apcp_"
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB3365.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6171b57-398f-4674-7156-08db67f498e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2023 07:47:23.7798
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I4i9SzMzHNucN6vSUxi1yZs8DSmF8IvHh+Rk55syN7pCA/DSMSVEy6ngQoh/MmEwy8/OcGZ5KgI2FfZfvUM5zsxTJruBHXwdMoHSREiYr8E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB3873
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

--_000_SG2PR06MB3365DD80EA2FD026D400C4A78B50ASG2PR06MB3365apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


  >> +
  >> +allOf:
  >> +  - $ref: pwm.yaml#
  >> +
  >> +properties:
  >> +  compatible:
  >> +    enum:
  >> +      - aspeed,ast2600-pwm
  >> +
  >> +  "#pwm-cells":
  >> +    const: 3

  > 3 cells? For one PWM? What are they?

channel, period and polarity.

  >> +
  >> +  clocks:
  >> +    maxItems: 1
  >> +
  >> +  resets:
  >> +    maxItems: 1
  >> +
  >> +required:
  >> +  - compatible
  >> +  - clocks
  >> +  - resets
  >> +
  >> +additionalProperties: false

  > Missing examples. All bindings need examples.

The examples will looks like following:

pwm0: pwm0@1e610000 {
  compatible =3D "aspeed,ast2600-pwm";
  reg =3D <0x1e610000 0x8>;
  #pwm-cells =3D <3>;
  #address-cells =3D <1>;
  #size-cells =3D <0>;
  pinctrl-names =3D "default";
  pinctrl-0 =3D <&pinctrl_pwm0_default>;
  clocks =3D <&syscon ASPEED_CLK_AHB>;
  resets =3D <&syscon ASPEED_RESET_PWM>;
  status =3D "disabled";
};

pwm1: pwm1@1e610010 {
  compatible =3D "aspeed,ast2600-pwm";
  reg =3D <0x1e610010 0x8>;
  #pwm-cells =3D <3>;
  #address-cells =3D <1>;
  #size-cells =3D <0>;
  pinctrl-names =3D "default";
  pinctrl-0 =3D <&pinctrl_pwm1_default>;
  clocks =3D <&syscon ASPEED_CLK_AHB>;
  resets =3D <&syscon ASPEED_RESET_PWM>;
  status =3D "disabled";
};
...

Thanks


--_000_SG2PR06MB3365DD80EA2FD026D400C4A78B50ASG2PR06MB3365apcp_
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
<body lang=3D"en-TW" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; &gt;&gt; +<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; &gt;&gt; +al=
lOf:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; &gt;&gt; +&n=
bsp; - $ref: pwm.yaml#<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; &gt;&gt; +<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; &gt;&gt; +pr=
operties:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; &gt;&gt; +&n=
bsp; compatible:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; &gt;&gt; +&n=
bsp;&nbsp;&nbsp; enum:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; &gt;&gt; +&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; - aspeed,ast2600-pwm<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; &gt;&gt; +<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; &gt;&gt; +&n=
bsp; &quot;#pwm-cells&quot;:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; &gt;&gt; +&n=
bsp;&nbsp;&nbsp; const: 3<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; &gt; 3 cells=
? For one PWM? What are they?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">channel, period and=
 polarity.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; &gt;&gt; +<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; &gt;&gt; +&n=
bsp; clocks:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; &gt;&gt; +&n=
bsp;&nbsp;&nbsp; maxItems: 1<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; &gt;&gt; +<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; &gt;&gt; +&n=
bsp; resets:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; &gt;&gt; +&n=
bsp;&nbsp;&nbsp; maxItems: 1<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; &gt;&gt; +<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; &gt;&gt; +re=
quired:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; &gt;&gt; +&n=
bsp; - compatible<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; &gt;&gt; +&n=
bsp; - clocks<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; &gt;&gt; +&n=
bsp; - resets<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; &gt;&gt; +<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; &gt;&gt; +ad=
ditionalProperties: false<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; &gt; Missing=
 examples. All bindings need examples.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">The examples will l=
ooks like following:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">pwm0: pwm0@1e610000=
 {<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; compatible =
=3D &quot;aspeed,ast2600-pwm&quot;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; reg =3D &lt;=
0x1e610000 0x8&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; #pwm-cells =
=3D &lt;3&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; #address-cel=
ls =3D &lt;1&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; #size-cells =
=3D &lt;0&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; pinctrl-name=
s =3D &quot;default&quot;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; pinctrl-0 =
=3D &lt;&amp;pinctrl_pwm0_default&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; clocks =3D &=
lt;&amp;syscon ASPEED_CLK_AHB&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; resets =3D &=
lt;&amp;syscon ASPEED_RESET_PWM&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; status =3D &=
quot;disabled&quot;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">};<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">pwm1: pwm1@1e610010=
 {<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; compatible =
=3D &quot;aspeed,ast2600-pwm&quot;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; reg =3D &lt;=
0x1e610010 0x8&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; #pwm-cells =
=3D &lt;3&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; #address-cel=
ls =3D &lt;1&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; #size-cells =
=3D &lt;0&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; pinctrl-name=
s =3D &quot;default&quot;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; pinctrl-0 =
=3D &lt;&amp;pinctrl_pwm1_default&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; clocks =3D &=
lt;&amp;syscon ASPEED_CLK_AHB&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; resets =3D &=
lt;&amp;syscon ASPEED_RESET_PWM&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; status =3D &=
quot;disabled&quot;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">};<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">...<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">Than=
ks</span><span style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><span lang=3D"EN-US" =
style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></span></p>
</div>
</div>
</body>
</html>

--_000_SG2PR06MB3365DD80EA2FD026D400C4A78B50ASG2PR06MB3365apcp_--
