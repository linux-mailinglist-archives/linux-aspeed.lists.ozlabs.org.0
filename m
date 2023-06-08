Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBD3727AA4
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Jun 2023 10:57:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcJ531Zkwz3dxH
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Jun 2023 18:57:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=omq+IU0t;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feab::719; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=billy_tsai@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=omq+IU0t;
	dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20719.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::719])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcJ4s11MKz3cCh
	for <linux-aspeed@lists.ozlabs.org>; Thu,  8 Jun 2023 18:57:31 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lUXFpcoCng3b9hBj1oFOCyIrXviDxOGeWMHyjrd/cJhKoWQ6OhuDiqs9RQuOPlS0rrK5T6uvGVQV6guk4RDfKurU2X5Qilg7LsOMZB9+DXIxcrnBBjsJKzzwsF7tw3gEw7A/yQvUVLtA+c7gw7lvUBcOVPFjRPojBvJuEAGQ7CuI8TGMUMuKRlVhFVwWpLRdfuea9Mq5uqseANQbUC5MAAV5ZkvHHS+9TMn9BJ2wf8q9Ic7THzvJLOeR33DgQlKBM9eEoIQM3WYTByJex38HQ+eaPjBnXJrC76wafs0HXDjApehHft1S8pmZUYHCJ1ElUU2EeKo6sujTrNbun6Pfjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3W3do1Edacy/ya5nR3PtAsniR0546xTNsgPSwagwtAY=;
 b=BXBv0aR61TWT3ddQkFyhFIHs/WLORHb3gx8cdvLyidozRpWHG3fQ0s66KSQjyqQeCu9J0meOKMbCdmbmvanDugTR0a1nAdPX0AbP2w4nNhhmXLfiUVmy/GTZ1KRvJIrj0zIULW+jW3oCTIZJzIGRK04WzvVF/n5kly4AtkGTm2NrNurJWQhMWrs2A1Isz4VZ4LmfseM7656rHyJLf72T2mx8B2mcy0B00UfnIsK6mgCwex28kLs4VoFeSJTqm4mYt+6XSlheExNTs4dUpZQ/JcSl53r8QwWNvtSuuZ1xYNmpZkqk9xSm7kKWUM1lHj1dQgPVxXpnDiWyZjpkTzZBbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3W3do1Edacy/ya5nR3PtAsniR0546xTNsgPSwagwtAY=;
 b=omq+IU0tEurpZfpeavdRqavP2cywR+nIX7rn2+6dGklHwEsYO4P8HkFTNne1Z3HZ8OxZqxnxEUfpPCJSy+duaP8e4mb8DEqigvxDn8f9kkOqA9KIFgNSbO0Yk+9MhQ8IRNC5YAzOGSp9SdcvHJAqo4+NBpD2ZmDVF1GYMfRB/mGlO6K3VkjwtN7SKTEwq2gBd9SakQIZ2FZlf87HtmdQPRr0XOFLihWZIfOP+Sbl66kj+6jrRETD7ZzYFPe4P/JJvPeFi88F/pduqdtUo9OOvNm76gnVuIAA77qenlOdw4AqpY1uA4gNX0o/5tfEGpw7IgOi3kEvGp1NWDHx87yGhQ==
Received: from SG2PR06MB3365.apcprd06.prod.outlook.com (2603:1096:4:69::12) by
 SEYPR06MB6397.apcprd06.prod.outlook.com (2603:1096:101:143::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.38; Thu, 8 Jun 2023 08:57:06 +0000
Received: from SG2PR06MB3365.apcprd06.prod.outlook.com
 ([fe80::cc45:2366:5fc9:c775]) by SG2PR06MB3365.apcprd06.prod.outlook.com
 ([fe80::cc45:2366:5fc9:c775%3]) with mapi id 15.20.6455.030; Thu, 8 Jun 2023
 08:57:05 +0000
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
Thread-Index:  AQHZma8+6LJZhu/Vfk6W8iuVf8iT56+AdouAgAAQppOAAAI2gIAAA3JlgAAIdACAAAA3fA==
Date: Thu, 8 Jun 2023 08:57:05 +0000
Message-ID:  <SG2PR06MB3365FCF5BEA6555EC503EFEC8B50A@SG2PR06MB3365.apcprd06.prod.outlook.com>
References: <20230608021839.12769-1-billy_tsai@aspeedtech.com>
 <20230608021839.12769-2-billy_tsai@aspeedtech.com>
 <4dffd320-8e30-fb30-6ded-79519afddc21@linaro.org>
 <SG2PR06MB3365DD80EA2FD026D400C4A78B50A@SG2PR06MB3365.apcprd06.prod.outlook.com>
 <61278e12-ba39-4503-ca74-a7118b0f6e99@linaro.org>
 <SG2PR06MB336528007D2685F8D95DF4078B50A@SG2PR06MB3365.apcprd06.prod.outlook.com>
 <9f8a9208-62d4-0c96-7d1c-a452d3d7e799@linaro.org>
In-Reply-To: <9f8a9208-62d4-0c96-7d1c-a452d3d7e799@linaro.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR06MB3365:EE_|SEYPR06MB6397:EE_
x-ms-office365-filtering-correlation-id: c4692100-fe4e-4a92-489e-08db67fe5578
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  uO8FC6AuCQocT0gNlxevVnVoA7qZhpdQTkA8ucclFoe7jRvN+GcUpIOvBhnp/z0CQ8+KYasd1Xx3A30+izF2lVidtFRyG5rC+7rec5UoriuZhAVCJ4Kl1IGgsuakkS5kWDvPlpi4l4McXU7LC5FBkHZelrboco91BrOPEv+TgiJ0opeyRoNWICkDNNKXJDqdjJbJ1OpBMGacq0l/lp/oNkacv6gCfzLRGgGqefTp5nHXj6JM+uWJVKfw+9/lmfGY66zsnuU+gGtO++UfrK7s0nIxNMyjZNVl1uyWrpPrLc1l0WBkkaoZbrSSEmQYGkC4TsmwsM6BqUU8GcraCz+oDNSTwVndNg1F6j7qCEY0b6BpaSQWhoKGBEi8oXNC0XSQKVnbPAiqn/ZX77B+cMBqBAqp3Cox8puGp41HXF5rU68KX1ERHPZjsDM9N21w5/4Sbscp3tBklqcfCguXrjF+/kQ8230e8KopU8027RmWtVYqTb4XYfANQa1G+IGQWxNnO11wqz5TIjpBeedGK+WWt9sLobIHh/pDD4M4abJuh6IMi+LAxLASTM1gDjCqoIu3OoTtluJQH7pcqbmi/FtZ+WxUBzJ9lJ2sMa7abbND79xsMBDh3orR48xT5+fojOpf
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR06MB3365.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(346002)(366004)(39850400004)(376002)(451199021)(26005)(55236004)(9686003)(6506007)(53546011)(966005)(83380400001)(186003)(91956017)(921005)(2906002)(66446008)(64756008)(122000001)(76116006)(66946007)(66476007)(66556008)(7696005)(71200400001)(5660300002)(38100700002)(7416002)(8936002)(86362001)(8676002)(52536014)(38070700005)(110136005)(55016003)(478600001)(33656002)(41300700001)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?X6zOfySVQB6G5IFmZsN8b2b2QF74FJHCE4dINZwkicYWl3i/1J2e2QNmF6us?=
 =?us-ascii?Q?6HH2r71aZ4p4dxXVUY5hfWrjeHgp8jS58W5NGJyJNvYWz0HGQUURpiiYpZ6L?=
 =?us-ascii?Q?db44IH/c7ebxDHDJSpaMWAdJnrbnIEe6SLcNNoNvZo/XnnUo7lVdvLagFDzL?=
 =?us-ascii?Q?weUgjzk7eM+20g01YOve5saBAAnhpOeOPm70PcQ4FLhUfel8Lby6sC9RPasU?=
 =?us-ascii?Q?tdxUuk2mxeGr4hMY3aWW3tKliwQ2fooiChibXV8kpgDv0UoQcwJM/9SykO9k?=
 =?us-ascii?Q?CXSnBhI9pLTIlqlku8NaVYbypgmEXef1jlrHT5MMWOVMalsRsJFoCYpWPCDl?=
 =?us-ascii?Q?RrPsol2p/3wC6V+hSSjjKBnEvjFRdtR5im/VBlPKvLCMRQEglq1PMn5by38Q?=
 =?us-ascii?Q?e54jvx6BDTWe8dcDGN0iO39dAdCMKIQ/XI2+kiermr/c0+SMMU61Y87xuUFs?=
 =?us-ascii?Q?fQkrVePFfRphG8vvOao2qh9g4IDD39fX/nPwygjZpKV3OBylUZtcYHeGSy9c?=
 =?us-ascii?Q?YwusytoDIzW0cQS6eZclhR3MwGiIJXtRfjkPEhrqNW4W2hqBn5iKe4C9UCVf?=
 =?us-ascii?Q?Vv/OAWS6X/nENTjvBm3DTOlWdLJzjnlOsoD2+jpCgs95gD6HvxX+EC5DvZsq?=
 =?us-ascii?Q?jGHvtTzxMmOpFnbTGe5HLf3NLEehGashebxGKUrgXH+UsN+PcrerBx6SoGzP?=
 =?us-ascii?Q?hKdZXZBw1bB9qiWrhw3pMeRRfCjwvWznOH+KGy2rZ86zUa7rYZAaiaCQtrlS?=
 =?us-ascii?Q?WWu3ez0Zvsh+ZDy3BpLh7eG4+OMmu/DyQ2D4WkKMgrif3UrKSaAUKnApE+hc?=
 =?us-ascii?Q?nYXXVGYLV/hzODNSr3bsjdQUGxnuf4Bv5PJ0rIxvnsbVUOBYgFYavJMfa5s8?=
 =?us-ascii?Q?4RmAPdzoq6/mG50AKxzrbBUmrcuQfmfQ6+QVdXSN21wcVdA4D234sjZ6omaa?=
 =?us-ascii?Q?fGqdeO58eg50C3pvclxcOJ1J8bXMTM+3iM1aAQaIVCVG4wYyLnjSBThPesVZ?=
 =?us-ascii?Q?ioNflxRfmTS3+ju91+NRgzAmUEn1LmlUko+zW2t7vLMnRXBYNxDR3ppH8zJZ?=
 =?us-ascii?Q?v4quvdwR/8epKckUN/wIqpAqamTDQbbM9NJRmrR3eBYqmd0mnu31jF8z2VTA?=
 =?us-ascii?Q?NYogj4GUx1D0rL44DENJGzzDeo8iJ0mG/+mWKZ3pXgoCYJ0duNYion/PXQsJ?=
 =?us-ascii?Q?RJkv4WFwimCuvenOVlSjfjbgJoIf00hGVYyOnYAw/3u7rsdmEe+Yiv261+ue?=
 =?us-ascii?Q?aM382rh38VXaNJRn/9N4ts/S/KQqgGXcGqNSr1BGTPyh2UkrLBDIejLUZz6D?=
 =?us-ascii?Q?o8zOOlN2cJIcmQAewha56fUDVjMHZHMwdjSulFnp7t6TGj4J1I02k3pYWASx?=
 =?us-ascii?Q?ByU95uLLjo6Jg+Xc79midcAwwtKwKLnB10xR3+BP+a7BTcE72oaRKdDCxrtm?=
 =?us-ascii?Q?jYzRMDUOFJ7N1NIMf8RrzKf4QXgWCAFbTZuFscgpqdNTox9MqKl2R4oTP8Hu?=
 =?us-ascii?Q?7En4G95flxdkWSe11GHwyqW+z/I2NhPK7uGCK7MyPcn9IxtlBZ5w1KPSajIC?=
 =?us-ascii?Q?TO9SRwFul22xERrqGJf7NXpd+LZxQqPvnWpyx5sINuEVJuc+woxI/bdb/MNq?=
 =?us-ascii?Q?E3rfDHWfI/eshD4EUWREcB8=3D?=
Content-Type: multipart/alternative;
	boundary="_000_SG2PR06MB3365FCF5BEA6555EC503EFEC8B50ASG2PR06MB3365apcp_"
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB3365.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4692100-fe4e-4a92-489e-08db67fe5578
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2023 08:57:05.5917
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lq46MZozeSrH6A/oJ7HQU3+qqFzE20+niiDH2NDoymlTQfXfYPITD6D7L3c77TzSGrz+MaRRpquQW11qW0xoebi1ZoqSCIK1Fq1BENxh6fU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6397
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

--_000_SG2PR06MB3365FCF5BEA6555EC503EFEC8B50ASG2PR06MB3365apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On 08/06/2023 10:21, Billy Tsai wrote:
        >>         On 08/06/2023 09:47, Billy Tsai wrote:
        >>         >>
        >>         >>   >> +
        >>         >>   >> +allOf:
        >>         >>   >> +  - $ref: pwm.yaml#
        >>         >>   >> +
        >>         >>   >> +properties:
        >>         >>   >> +  compatible:
        >>         >>   >> +    enum:
        >>         >>   >> +      - aspeed,ast2600-pwm
        >>         >>   >> +
        >>         >>   >> +  "#pwm-cells":
        >>         >>   >> +    const: 3
        >>         >>
        >>         >>   > 3 cells? For one PWM? What are they?
        >>         >>
        >>         >> channel, period and polarity.
        >>
        >>         > Don't cut my responses. You wrote you have one PWM out=
put, so only one
        >>         > channel. What do you put then in the channel?
        >>
        >> You need to put 0 in the cell of the channel, the example of the=
 dts usage will like following:

        > If you always put 0 isn't this a proof that it's wrong?

No, if your PWM controller only has one pwm output, then it should only be =
configured as 0.
This is the usage of the pwm-cells property.
https://github.com/torvalds/linux/blob/master/drivers/pwm/core.c#L129-L158
https://github.com/torvalds/linux/blob/master/include/linux/pwm.h#LL299C20-=
L299C20
All of the pwm driver with npwm =3D 1 will has the same usage.


--_000_SG2PR06MB3365FCF5BEA6555EC503EFEC8B50ASG2PR06MB3365apcp_
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
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">On 08/06/2023 10:21=
, Billy Tsai wrote:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; On 08/06/2023 09:47, Billy Tsai wrote:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; &gt;&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; &gt;&gt;&nbsp;&nbsp; &gt;&gt; +<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; &gt;&gt;&nbsp;&nbsp; &gt;&gt; +allOf:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; &gt;&gt;&nbsp;&nbsp; &gt;&gt; +&nbsp; - $ref: pwm.yaml#<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; &gt;&gt;&nbsp;&nbsp; &gt;&gt; +<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; &gt;&gt;&nbsp;&nbsp; &gt;&gt; +properties:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; &gt;&gt;&nbsp;&nbsp; &gt;&gt; +&nbsp; compatible:<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; &gt;&gt;&nbsp;&nbsp; &gt;&gt; +&nbsp;&nbsp;&nbsp; enum:<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; &gt;&gt;&nbsp;&nbsp; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - aspee=
d,ast2600-pwm<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; &gt;&gt;&nbsp;&nbsp; &gt;&gt; +<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp; &nbsp;&nbsp;&nbsp;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; &gt;&gt;&nbsp;&nbsp; &gt;&gt; +&nbsp; &quot;#pwm-cells&quot;:<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; &gt;&gt;&nbsp;&nbsp; &gt;&gt; +&nbsp;&nbsp;&nbsp; const: 3<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; &gt;&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; &gt;&gt;&nbsp;&nbsp; &gt; 3 cells? For one PWM? What are they?<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; &gt;&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; &gt;&gt; channel, period and polarity.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt; <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; &gt; Don't cut my responses. You wrote you have one PWM output, =
so only one<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; &gt; channel. What do you put then in the channel?<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt; <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&gt;&gt; You need to put 0 in the cell of the =
channel, the example of the dts usage will like following:<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &gt; If you always put 0 isn't this a proof that it=
's wrong?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">No, if your PWM con=
troller only has one pwm output, then it should only be configured as 0.<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">This is the usage o=
f the pwm-cells property.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">https://github.com/=
torvalds/linux/blob/master/drivers/pwm/core.c#L129-L158
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">https://github.com/=
torvalds/linux/blob/master/include/linux/pwm.h#LL299C20-L299C20<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">All of the pwm driv=
er with npwm =3D 1 will has the same usage.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</div>
</body>
</html>

--_000_SG2PR06MB3365FCF5BEA6555EC503EFEC8B50ASG2PR06MB3365apcp_--
