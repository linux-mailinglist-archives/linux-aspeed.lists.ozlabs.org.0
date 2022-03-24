Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6854E5FA1
	for <lists+linux-aspeed@lfdr.de>; Thu, 24 Mar 2022 08:43:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KPHJv0w8rz308F
	for <lists+linux-aspeed@lfdr.de>; Thu, 24 Mar 2022 18:43:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=H6/ewmk3;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feae::709;
 helo=apc01-psa-obe.outbound.protection.outlook.com;
 envelope-from=howard_chiu@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=H6/ewmk3; 
 dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on20709.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::709])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KPHJl5lL0z2yyG
 for <linux-aspeed@lists.ozlabs.org>; Thu, 24 Mar 2022 18:43:19 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XoUv1/DNLPq9B3J4Afpn+1deb7OxfhAr2kic+MTORPfW8udifIsbH3EbzhJic818XPIALBb9W2tFv9B96Sa2U4ZlrtkIofWyLkDO91Ei67fPq54gvwcI+TLOEEfVwjVBGr9sMRD6Suocbt2mhRHFBx7f0D+SU1niy2UnrcuTwQlmdSbSgTdaMfHJpgJS/HFlPdwc45BCN3IG7F+VtLH5FrBBmyvbrcUe6tsY9ky7O2shjSV5RxNbj/EiDxCyyB0BVHuDEVuensbtYyvCDBx9r87UHYpaJ+c0g5clrNa94lJbQ5fciFLfkbpgElC6obRSS9tMxP5ec6XBAJZZYFWjog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xzzvkWmL05qARlXf5DC2Cr4ebOPDl7aqHL/JOYTZD+g=;
 b=DZNCb4AZYctuaZJuDdXfp7CzaZnND9oHIk6sNPZYJ/7i8g31M6QF2AB6goBZd8DAUOGJ6fHe9vI6Hmlc87AbcC2g6gAENsMhR2Tn9kNbUCjnpmSvHrpyEAiZKyQH8lYppmXFacb+jp6p62pEFKtoDhDbZKzb6V9/IObWTUY3Cer3E0Aw5N56brx9x7Rh7OA+GmAhvCh1TxS67JWAYtX9p4PMZIn2LfU1Ib1+3yqaBkNZj0vjBczCKl6meBA2VMYBjBKVqeZB1722/LFt4PK192vpmXVEzL1Yav3DdtkKAtbVyc+mRV5ekxLBUJA4sSnMF3grpo53thBqJbkrJHBWJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xzzvkWmL05qARlXf5DC2Cr4ebOPDl7aqHL/JOYTZD+g=;
 b=H6/ewmk3xLCmyHrPQW5AyENGa8jmTkTpIS5zkMCSLUNGz4TO+fCpA+dpmYYXcVV1So+voKKw0Q2WidE/Q+nlPmv8uwsplSSaHYn5UCSjppnG23FOBYM/sDzB7+E6MhGwB3UOuPmijffRdYheTMMsYFt3XM56PJurNBaLiuT1NWJYHaI6yxb2vQ7MDpFPDxPST6angsF1hoqyAIgQLMcBaGL55hRmdzadJ4xJErWkR5t6IADJ5zHOidAY3Bg5i257bUBLl36Pe1YtIXQRyVn4++f5ccDtzcnNYVC5RdEKxaWTIvGOo+OurjQvkTdHwIgQrmbv9tq56EPRdLriY2Y5fw==
Received: from SG2PR06MB2315.apcprd06.prod.outlook.com (2603:1096:4:b::19) by
 SG2PR06MB2298.apcprd06.prod.outlook.com (2603:1096:4:8::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.19; Thu, 24 Mar 2022 07:27:33 +0000
Received: from SG2PR06MB2315.apcprd06.prod.outlook.com
 ([fe80::ac36:fcaf:45dc:f830]) by SG2PR06MB2315.apcprd06.prod.outlook.com
 ([fe80::ac36:fcaf:45dc:f830%6]) with mapi id 15.20.5081.019; Thu, 24 Mar 2022
 07:27:33 +0000
From: Howard Chiu <howard_chiu@aspeedtech.com>
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 "andrew@aj.id.au" <andrew@aj.id.au>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 2/3] dt-bindings: clock: Add AST2600 video engine reset
 definition
Thread-Topic: [PATCH v1 2/3] dt-bindings: clock: Add AST2600 video engine
 reset definition
Thread-Index: Adg/UKCbpNLlLr71St+tw+UGNvcM8w==
Date: Thu, 24 Mar 2022 07:27:33 +0000
Message-ID: <SG2PR06MB2315F68B23BB0998B8F7E93EE6199@SG2PR06MB2315.apcprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 16841a76-45aa-4132-7f3c-08da0d67c37c
x-ms-traffictypediagnostic: SG2PR06MB2298:EE_
x-microsoft-antispam-prvs: <SG2PR06MB22986444977D8B8027854C0FE6199@SG2PR06MB2298.apcprd06.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1BY9qGrw3RsSgB04+oqgMoFAzRJz/9LKwHiycmC4JLHV4wCPlDhkrUSZK3v+VZt99KL6ZPOc0xogvVs3LdbOuV8xm53BSonNAWbXrD4yULSpfCt5UQ1tk4wqsY+vDNnwF3jrk1IDr53l1tO8Uq/jFiAtImcM9hKZcjE6xJI2/WX3Blzc4tnBePOQbzcPMZnGYrbI31pL+SVWzjxSY7p9nImw3u2yQKPAS0AN3rRLdrmJE/R3SAdASr8VtKnpDZzzw7F2aYi6D+KSVVn2bkGTeIynuUmGlJTlTAs8LwYq0ufwDz/XxwcCqRA2tI6UTlaj6mN6a9owql/gj99oU8mhyj88tbh6N7C2uUjITrctxrDZZyufmHgC/w2oWVm/2tLNmjfIXWZEEdmF6xidovOo+abSlzJbz/yi8337lgaJl9jiMLEQsStsDwEx8czXrcnwP9m0f6V8NibkFFCaniFFwZ3KT3Y6In4oEcPDssSov7FLjHIF+JoDnbu614FCQxjE6Gn4vc8ld2Q2Xug05BtDJ1I0fXZb6Ntvd52iVDePRvXiSSKKPXKT9637o2365gjjxnt2jOMNSPdwvjUQDE7KUX0oazGOx81sll3L3vNWlmgtqzi3L4++HJWiODgYL6pZQQZoL/yPWVPQ0oGyE2XgfBAcMkKgTBz22HXCiXuWk5pEfvkwZRMHT1RObcCfQhACZTco5tGCwB8X2J/t7BcUTg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR06MB2315.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(136003)(346002)(376002)(39850400004)(396003)(26005)(107886003)(186003)(83380400001)(38070700005)(38100700002)(122000001)(86362001)(76116006)(6506007)(64756008)(66946007)(7696005)(66556008)(66446008)(55016003)(66476007)(508600001)(33656002)(4326008)(5660300002)(71200400001)(8676002)(2906002)(52536014)(316002)(4744005)(8936002)(110136005)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?AgmSqsvcJSIqZ7pAkbTMipXMsxE3LaOiiE0xaVnEfvs1/O/PvYAyOUZudcNr?=
 =?us-ascii?Q?uc3unSHHks8JZKO7vZRBFVdt2iRILQrwaAqaXB5yYIJv4nmh6NqakdCd0CLn?=
 =?us-ascii?Q?cgGmkF2AGk9CZSlh4EP+hye8IgnsjHPewkmxa0Ic3U4IwWoZW32ZDiKyeGnn?=
 =?us-ascii?Q?T6orxYdvgoL4DReJaIy1C2qqLCh0KYqjetj+JTprJHPmAsodKrsqKyEd/sEV?=
 =?us-ascii?Q?fM4JL3eYnSnQIw5HDMhwzu4iqBZqy1/13TbUgWaVdlzwtRhE6G8TzjnNnL+v?=
 =?us-ascii?Q?rK/xscBeSrAfr69hloK6bnuyJM5sfsQKo7PPKfwYUvSNOH8i1XSh9QE3zt29?=
 =?us-ascii?Q?ZGLWzmFLsijEpOlLqLeKuybtn7K8sl0cosJXifTd3+Vra2Uzyuev/iwUjfaf?=
 =?us-ascii?Q?bd+TsdVIunQ3MmB68mx9PaQ+h83L2j2eXwvmTVpxjm34Iwx8rcKvZqlMDr65?=
 =?us-ascii?Q?RLHvgPXYsNbzPCt27nR9QdQsq8Z4kHZJAfkzzTdq+whRunPUPb6bPTPDGnEG?=
 =?us-ascii?Q?JASwQOEXbdjEsuR0r1U9FXb985xGIJ1kImaLyb3xXR51aHmcTae/jT6qoERe?=
 =?us-ascii?Q?fuE2gzglCEhtt6kU4gG7v1OSdrsks5gopM5WhMZAlA+85gfflVIiUle0zsiw?=
 =?us-ascii?Q?YqqXN1w8jB/0eHydc5BX1BNVZk+SYywYpHJMA3vHLywd1KNKlNo/Q6quO6R/?=
 =?us-ascii?Q?gr6CBleq2JnXjTMjeAop9LVtF1PTDmK4QFiTOz87ORn0d6qCKO0KWB59z3E/?=
 =?us-ascii?Q?D1tnLv25LuXy2M+S8tvrqBRxlxwx4ARtdTPXe1tsfVsoQidjGXYywp/LfYa6?=
 =?us-ascii?Q?arr+wH7i96AjqAaDfeO2qco2uCp8L2FdCAiS47EcQ8NPRK3rwhLeRS6la8so?=
 =?us-ascii?Q?iQ/zHhr94XRO/aXHx+lpNvxzq71Vdmp83C4EvEL81Fb2i5ZqFcRdTFx7RFkg?=
 =?us-ascii?Q?0LSEF6/e5tpPmkPMwDQ4jqBHDRndut3f2leXQw3KN4VJGMMwnrmRw9MvXaUL?=
 =?us-ascii?Q?izqBWf1lwj3OqEt2KdKhKuCDg1gZtTHPsWeanGUIKT0m4zi+W9F7CntCig/i?=
 =?us-ascii?Q?sqDJdYkDbX5Vyxv9AkIHaCj1oCzpk+PDw2R2QCGBerqOzric2wDLhFrHG5zD?=
 =?us-ascii?Q?S9Sp6iwzAb43ftJnIu6ImbTAu7p5Ev8xTW/j8AtlQJLVTpX85KME5jv1wvbw?=
 =?us-ascii?Q?P2SqGGn4S5O5Qv2fG9VHrkB7KJSue33KDLEAs2IZalZL4VGR/xIRzUvmOGeH?=
 =?us-ascii?Q?nG3NDBcer/LUIG5cVAwVbNQaXb43GaLqtW9yVSUt4/Z0N3mszRw1fIBxsQYc?=
 =?us-ascii?Q?O2pgcP7d6cVa/6mRRQaU8foJLa1PQaHn1jQAAnAcu4A8mEVtgSYtq2FpY/S4?=
 =?us-ascii?Q?drUp6xs44TngB6S9Vqih1OhHDjPewQkLa3ezqHwU5KvFUUJ+SjHClZkLAwlv?=
 =?us-ascii?Q?zmyu5v1ffML8HKvgQ7AwlsZirCYhyAW9aLks2W/DdidsvrTux1diIw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB2315.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16841a76-45aa-4132-7f3c-08da0d67c37c
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2022 07:27:33.6355 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UrmWRqmZZnYZ01ATpRcdyUuDhpGy70jn7UXWp99U/unOQWkRdE+oe+OV4WEw4TMqjvGHAUPt5R9xaj30ftHdwCulC6QYkw43jrHfIs1dFx4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB2298
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
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Reset bit for VE is 6

Signed-off-by: Howard Chiu <howard_chiu@aspeedtech.com>
---
 include/dt-bindings/clock/ast2600-clock.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/ast2600-clock.h b/include/dt-binding=
s/clock/ast2600-clock.h
index 62b9520a00fd..a7d0ad9539eb 100644
--- a/include/dt-bindings/clock/ast2600-clock.h
+++ b/include/dt-bindings/clock/ast2600-clock.h
@@ -110,6 +110,7 @@
 #define ASPEED_RESET_PCIE_DEV_OEN	20
 #define ASPEED_RESET_PCIE_RC_O		19
 #define ASPEED_RESET_PCIE_RC_OEN	18
+#define ASPEED_RESET_VIDEO		6
 #define ASPEED_RESET_PCI_DP		5
 #define ASPEED_RESET_AHB		1
 #define ASPEED_RESET_SDRAM		0
--=20
2.25.1

