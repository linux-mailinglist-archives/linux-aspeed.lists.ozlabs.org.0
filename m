Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D8C7257B0
	for <lists+linux-aspeed@lfdr.de>; Wed,  7 Jun 2023 10:32:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QbgZq3MG8z3dtH
	for <lists+linux-aspeed@lfdr.de>; Wed,  7 Jun 2023 18:32:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=XdycWaOF;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:704b::709; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=billy_tsai@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=XdycWaOF;
	dkim-atps=neutral
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20709.outbound.protection.outlook.com [IPv6:2a01:111:f403:704b::709])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QbgZh469Hz3brd
	for <linux-aspeed@lists.ozlabs.org>; Wed,  7 Jun 2023 18:32:41 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KnTSYDEq/ug646L6URAzBiL2o/SqjYIcRO2cLgt9WHj/GId3mV2mZjj9LPrPGinD2y7Nr5uv4RsvE6E3RXCyWpy65yYDpgXYI+hHpfd3prhCSQ1M6m80aEFI+guJ2hpw45Tt3jG9lMeFo/Qo9RUIDZUyAyRv+3AxRUzcqTq1/kkm67th9Sy1LqPbxBClYpvzEfmqs+3qLzvPmkGrOE9OmKs4DENWv+45rueCw8H/iabRxG9d3Hkqo93Y9V9CL4wIBFAYqeM1l+NcHB0s2ZX1Aq1GmHeXmCS73lDem5gOx+d7EaS0flSYpmtjf3fk+A2cR5Q6h4REWH9qW11K5h4o9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dbbfdDygkjEFuFhmOln10ZABeeYjy6/jbxmN/iUJH20=;
 b=VAm8UxvHp1ImecuoLOv5dikj4kmqUrEPBxwpLVi7SM183yeQa5TJmcizzz8NYhieAr0Dxc6f4Q8wU2jbill4mofKRa4b+NFEa8oyL8ggQiNE0mIYmmg3JCA3Je9MAeij9XP0iAlr9WTHC2i7L6gc+ccNQf/OKY5xZViEi+UCmBCP/tFu8ieahxWneBKSigGKKDG3kn09JPGZkR4O4zTPsIbp1WvQhxjkPgtyXD69RVNl3mSucHmraBkgdV3PjJ6qRh2Q9G03MilsNUG9hpu22mAJc3xT1WppRZzIJN4d0J03HXjDrLddFcmKRztvhapEV6bxo/HU12lDw74Q9y1qVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dbbfdDygkjEFuFhmOln10ZABeeYjy6/jbxmN/iUJH20=;
 b=XdycWaOFRX4vB77S2LzXuq+RKGxo1P7F7pWz8ju1wsOd7Y5XxDMVWSBF5QdgVNKkFo5dWfUiT1ljv/1mb58u6KP0trTVwor1BDXq62k92MXAwjjx5a21KlvXhPynsDcQTLiIHiFERheKK10cYjBTxEYYOruZLZf5XDRdLHYJSjxezyNxkEitGu/sRSCzA6bZ2Zrp8hbf9TjdoKmGwfWPtVMFHy+QjNhoJyY10twa3iwqgQGoluLnXowMMxbgElkC+5dmLIGsK7gr2l8hZchutunTumdalksVnkG42Bw6YLfo2up+ugPQyG4YX7d21v9mfvyup0Od++cvgXARXMuOMA==
Received: from SG2PR06MB3365.apcprd06.prod.outlook.com (2603:1096:4:69::12) by
 TYZPR06MB6786.apcprd06.prod.outlook.com (2603:1096:400:45e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.28; Wed, 7 Jun
 2023 08:32:18 +0000
Received: from SG2PR06MB3365.apcprd06.prod.outlook.com
 ([fe80::cc45:2366:5fc9:c775]) by SG2PR06MB3365.apcprd06.prod.outlook.com
 ([fe80::cc45:2366:5fc9:c775%3]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 08:32:18 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Patrick Williams
	<patrick@stwcx.xyz>
Subject: Re: [v5 3/5] dt-bindings: mfd: Add aspeed pwm-tach binding
Thread-Topic: [v5 3/5] dt-bindings: mfd: Add aspeed pwm-tach binding
Thread-Index:  AQHZmFtk1R/dtj8sXk+ajmqdJHRQi699mE4AgAA3RYCAAAS/AIAA3fD6gAA7MoCAAAOpSw==
Date: Wed, 7 Jun 2023 08:32:18 +0000
Message-ID:  <SG2PR06MB33657063A2E3239AD0A21F718B53A@SG2PR06MB3365.apcprd06.prod.outlook.com>
References: <20230606094535.5388-1-billy_tsai@aspeedtech.com>
 <20230606094535.5388-4-billy_tsai@aspeedtech.com>
 <35bf0a69-bcf6-ae35-eb3c-e74cfcf9c571@linaro.org>
 <ZH89fXknZlhGmM_H@heinlein.vulture-banana.ts.net>
 <c28f963e-d13c-6b5c-c389-996e986f81d5@linaro.org>
 <SG2PR06MB33652E18980E9CF8E4F0894D8B53A@SG2PR06MB3365.apcprd06.prod.outlook.com>
 <742d3161-3a4d-ea77-7bd4-85f6636bf400@linaro.org>
In-Reply-To: <742d3161-3a4d-ea77-7bd4-85f6636bf400@linaro.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR06MB3365:EE_|TYZPR06MB6786:EE_
x-ms-office365-filtering-correlation-id: 54a646b5-206b-4960-b32c-08db6731b4a6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  iUcPVCevsIl8YZAAEkghZJEfOs2EX/dwbfMGhjxPhEbApc0zAYItnQaIXut2tBX1yduKeA8GNL0rMhX5E6lcnCgRjqqhsaNHNGx2JoqNXzG9I6YnlQM1kK60RfHwGR3BCY04t4COR4r86WvQY3+419XeTQSJK/L1m0uE+0xjyPToaBGYfxl32u4EQ7FFwgISCw8diKRjAwOF6P2O0giorywqbvndpGoe3eUjRD5kA7C+YP8pzrnAB5bCABuSPonow9zu1Es3oAT51/mnLsdDkN7MM4qGR6bRnI4o7VMTEkMbv1H/2VGvFs4DgmNPt/swQEGLbXHCrMbK4sU2BZAJikaYXNoScyG7aid3LXLCcpCCCR2dJlQAGlWaDjSLVgUbErNr+qxXNQBp9sdo2jTMDm2NhnbiYmJ1DkyArqLoxW4C3gbI7xX/WGuauli7UN48nXp32KBLt15jFIXmW3XObiJC084ILqieZIhOV/5tdTY2oi9K36wdZMnIa3bHEhs/x2bke5EkMn0IcjVjyGBh33lkpckOruUXjA5s18rov7W+xKxMBCDY5+a4Rx9nGcQ/wrtECbnYEU9t4uTOpRhCHLjdgC2qed9+5snlUi4pplwuyvvIJ+QrLpxFpaNCDpRx
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR06MB3365.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(39850400004)(396003)(346002)(376002)(451199021)(55236004)(33656002)(8936002)(64756008)(66446008)(66556008)(316002)(41300700001)(478600001)(8676002)(38100700002)(558084003)(52536014)(66476007)(9686003)(4326008)(5660300002)(66946007)(26005)(6506007)(76116006)(91956017)(110136005)(7416002)(186003)(54906003)(122000001)(71200400001)(2906002)(55016003)(7696005)(38070700005)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?2D0JyYxi3glcThKXUTmA0eSvEQWnt4oqyq9krt9a9LmHR5xAUU0C/dhQnHgr?=
 =?us-ascii?Q?vmdJ1btH4wrZzl90Ewbi0SxmlkUxCQtq6NfAe0EM/mBq4c6/Fwn68D03JAxv?=
 =?us-ascii?Q?68qgvqIE+0n+oJb0CtsGY1A9uEhGa3wvHUFodxMfUi6AgHHdSOGWjyxzB655?=
 =?us-ascii?Q?fIYQYcFAs9I01av5ODENoMkQsLVyjL1fIsMpyzjQoPa66aJ5AdqEyo8rjbUo?=
 =?us-ascii?Q?Z61VFckexupE31fUrjyhKFuU2UJ5jVHfv8Du8K3t18rM7v6DX/wjfelggsEp?=
 =?us-ascii?Q?kHgz/0Rq7idT9nkoBrxcNiYmaWqxZcNMZL346Zaqt6BtMPLLW+hnFMnrT0/1?=
 =?us-ascii?Q?9Jo5AeRm+HTrFRe1ImICI09Mn5bxh/VaspC7pL+0tPVB0xPedAlcsecVxdGR?=
 =?us-ascii?Q?gcGFMgtiQdZkplEWYQg1R2or/SQiKkKn8OfeFE1LTbHo/8ro97d7pfMTQKDe?=
 =?us-ascii?Q?XdZwfUzV3oeymeewM48oal7psqKxS8mSWYNaA/H6Xo8jGlUMDGZM+cvy4P2/?=
 =?us-ascii?Q?VnwXJADnSS5qJORrT5O+GyaS4f4JY0PyLQBhOsXIBanlSk21bMRpnP8LF3KY?=
 =?us-ascii?Q?PJngO5rXb+eW9DbeQlfTpUwu1cWtzsQXtoZOfCvIagHvHH1N+7twPHIY9VNY?=
 =?us-ascii?Q?e1CAihkVtO/oyjZ01soFra4ksuj8kGmNEb8YafuWxT5mczMzh0w7tw1JHJNz?=
 =?us-ascii?Q?fzkEQ3fAiq7McNdckcOY6JaB3hm2x9A3sdj56uUYvIQUCmBFID9yzyv4x4Ec?=
 =?us-ascii?Q?ypbABoiLa7tDQm0+E5iynVt+Gdw75WaeFK8lQz8u2zrhS8ADlxuYiGHq+zs/?=
 =?us-ascii?Q?rhEg1uhRB8eCAGlxll44wyKPhPNQ81o/ia0pvTLXtQa/x6wIPN39/iRIpnvl?=
 =?us-ascii?Q?199tJGLHMHINT4ZR/jA+FDWcmma4z/WKilrQvHv7euiDsx23Pqg836IrOrmg?=
 =?us-ascii?Q?7Q4k4MfOFSm3UPxlW96FagG+3v2Wg6NYEK9hdEQ1LwguWdLDOgF7Dakao3mv?=
 =?us-ascii?Q?py2TvktbckWvb8WpuAQYNtWIz44Cu4XWMUMsBbMxJLs/30asDVNBNdC/lVeK?=
 =?us-ascii?Q?YKRWz+AA6QAzKNTzyJgfsneQ/emKhKkMZwNn0JbtqzK+48J/93pbjmDR1rWd?=
 =?us-ascii?Q?W0d8d3Gp8PB4ooCutM9f/Bb9gHsX5BEqt2ycLkL8RZe61fYIVBtAlN/kyQYS?=
 =?us-ascii?Q?9siZhN7EXNinuvkJ9kjIRuOVPf+YXpcwiT1sBhFLONM5PHISpL8cyDfwenQ7?=
 =?us-ascii?Q?30HMuPTgv779vK406xpGOmcQLja46++qGoB0hZk2f68egTg7jzcJzihDAUzd?=
 =?us-ascii?Q?71RaVIT1tyDcnvYbOLwr7T0Nd++I922XJS9G4oLICes/GVehSmQxDQqnb70l?=
 =?us-ascii?Q?vPXAw+eo/f4zGd9ssMKCjkGScyhDeyig5WWrzy1CUwQAWS+5WIST2C/VwYx8?=
 =?us-ascii?Q?xj2YRu81CXpcVNEwHlpU6v8tZg1IGk5PAecfOcmTUJlW/RA/2dwy49YmxV+V?=
 =?us-ascii?Q?GVdKp179/xEZJ36Z6TI+8A0LdgwK0vXyq6UaiHrIKZaY7Gg6SIskHEzq+oKx?=
 =?us-ascii?Q?5Voyz57eYD2VInLjT1Odz1X2z/4cmGLF/mK87ozjFTZPdao5WfKi6o9sdIJA?=
 =?us-ascii?Q?ljpMbZaB18V2rNj82Mx4Gk8=3D?=
Content-Type: multipart/alternative;
	boundary="_000_SG2PR06MB33657063A2E3239AD0A21F718B53ASG2PR06MB3365apcp_"
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB3365.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54a646b5-206b-4960-b32c-08db6731b4a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2023 08:32:18.4575
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zKRQaKLHL1310OO4FizUZhnvrh8wfEF/7lMB2kQWaemAxDG2uC/WUVMPg//kHhkk2X8UacMSfdAFi/DDw8BRMauBvrhYdM40YfSxYgKZoWY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6786
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

--_000_SG2PR06MB33657063A2E3239AD0A21F718B53ASG2PR06MB3365apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ok, I got it. I will remove usage of the simple-mfd and parent node in next=
 version of the patch.
Thanks

Best Regards,
Billy Tsai

--_000_SG2PR06MB33657063A2E3239AD0A21F718B53ASG2PR06MB3365apcp_
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
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><span style=3D"font-s=
ize:11.0pt">Ok, I got it. I will remove usage of the simple-mfd and parent =
node in next version of the patch.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;color=
:#212121">Thanks<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;color=
:#212121"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;color=
:#212121">Best Regards,&nbsp;</span><span style=3D"color:#212121"><o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;color=
:#212121">Billy Tsai</span><span style=3D"color:#212121"><o:p></o:p></span>=
</p>
</div>
</div>
</body>
</html>

--_000_SG2PR06MB33657063A2E3239AD0A21F718B53ASG2PR06MB3365apcp_--
