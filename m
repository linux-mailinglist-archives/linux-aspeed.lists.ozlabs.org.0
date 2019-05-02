Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CBF11341
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 May 2019 08:12:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vlKD2cxDzDqRJ
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 May 2019 16:12:00 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=aspeedtech.com
 (client-ip=211.20.114.71; helo=twspam01.aspeedtech.com;
 envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=aspeedtech.com
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vlK66wWDzDq74
 for <linux-aspeed@lists.ozlabs.org>; Thu,  2 May 2019 16:11:53 +1000 (AEST)
Received: from mail.aspeedtech.com (twmbx02.aspeed.com [192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id x4264YIL086705;
 Thu, 2 May 2019 14:04:34 +0800 (GMT-8)
 (envelope-from ryan_chen@aspeedtech.com)
Received: from TWMBX01.aspeed.com (192.168.0.23) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.620.29; Thu, 2 May
 2019 14:11:27 +0800
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX01.aspeed.com
 (192.168.0.23) with Microsoft SMTP Server (TLS) id 15.0.620.29; Thu, 2 May
 2019 14:11:24 +0800
Received: from TWMBX02.aspeed.com ([fe80::997d:c0a7:f01f:e1a7]) by
 TWMBX02.aspeed.com ([fe80::997d:c0a7:f01f:e1a7%12]) with mapi id
 15.00.0620.020; Thu, 2 May 2019 14:11:25 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Andrew Jeffery <andrew@aj.id.au>, Timothy Pearson
 <tpearson@raptorengineering.com>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>
Subject: RE: [PATCH 3/3] aspeed/pinctrl: Fix simultaneous DVO and serial
 outputs on AST2500 devices
Thread-Topic: [PATCH 3/3] aspeed/pinctrl: Fix simultaneous DVO and serial
 outputs on AST2500 devices
Thread-Index: AdUArd1rHC5yrTgvQ3OX0sxLyO5G/A==
Date: Thu, 2 May 2019 06:11:24 +0000
Message-ID: <79c6403dc60142488f0a7b1ec049951f@TWMBX02.aspeed.com>
References: <236762130.3394112.1556751009128.JavaMail.zimbra@raptorengineeringinc.com>
 <128da9c8-d138-47b9-b323-b845bd93ca2f@www.fastmail.com>
In-Reply-To: <128da9c8-d138-47b9-b323-b845bd93ca2f@www.fastmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.0.81]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com x4264YIL086705
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

> There appears to be a significant error in the pinmux table starting=20
> on page 127 of the AST2500 datasheet v1.6.  Specifically, the COND2=20
> (DVO) requirement is incorrectly applied to multiple digital video=20
> input (DVI) muxed pins, and no DVI-specific condition is provided. =20
> This results in the serial devices incorrectly overriding the DVO=20
> pinmuxes and disabling the DVO pins.
>=20
> Create a new condition code (COND6) for DVI enable, and update the=20
> most seriously affected pins to use the new condition code.
>=20
> Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
> ---
>  drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
> b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
> index 6f357a11e89a..676f90d3c5f3 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
> @@ -29,6 +29,7 @@
> =20
>  #define COND1		{ ASPEED_IP_SCU, SCU90, BIT(6), 0, 0 }
>  #define COND2		{ ASPEED_IP_SCU, SCU94, GENMASK(1, 0), 0, 0 }
> +#define COND6		{ ASPEED_IP_SCU, SCU90, GENMASK(5, 4), 0, 0 }
> =20
>  /* LHCR0 is offset from the end of the H8S/2168-compatible registers */
>  #define LHCR0		0x20
> @@ -660,8 +661,8 @@ SSSF_PIN_DECL(T2, GPIOL0, NCTS1,=20
> SIG_DESC_SET(SCU84, 16));
> =20
>  #define T1 89
>  #define T1_DESC		SIG_DESC_SET(SCU84, 17)
> -SIG_EXPR_LIST_DECL_SINGLE(VPIDE, VPI24, VPI_24_RSVD_DESC, T1_DESC,=20
> COND2); -SIG_EXPR_LIST_DECL_SINGLE(NDCD1, NDCD1, T1_DESC, COND2);
> +SIG_EXPR_LIST_DECL_SINGLE(VPIDE, VPI24, VPI_24_RSVD_DESC, T1_DESC,=20
> +COND6); SIG_EXPR_LIST_DECL_SINGLE(NDCD1, NDCD1, T1_DESC, COND6);

>>I feel like you didn't test this patch, because VPI_24_RSVD_DESC (the DVI=
 condition) requires SCU90[5]=3D0b1, but your >>introduction of COND6 requi=
res SCU90[5:4]=3D0b00 for the mux configuration to succeed. This can't work=
 - bit 5 of SCU90 can not >>simultaneously take the values 1 and 0.

>>Ryan: Can we just drop the COND2 requirement for function 2 of balls T1, =
U2, P4 and P3?
>>I think that gets us where we need to be?

No, that will have some impact, we don't know.=20


>  MS_PIN_DECL(T1, GPIOL1, VPIDE, NDCD1);  FUNC_GROUP_DECL(NDCD1, T1);
> =20
> @@ -674,22 +675,22 @@ FUNC_GROUP_DECL(NDSR1, U1);
> =20
>  #define U2 91
>  #define U2_DESC		SIG_DESC_SET(SCU84, 19)
> -SIG_EXPR_LIST_DECL_SINGLE(VPIHS, VPI24, VPI_24_RSVD_DESC, U2_DESC,=20
> COND2); -SIG_EXPR_LIST_DECL_SINGLE(NRI1, NRI1, U2_DESC, COND2);
> +SIG_EXPR_LIST_DECL_SINGLE(VPIHS, VPI24, VPI_24_RSVD_DESC, U2_DESC,=20
> +COND6); SIG_EXPR_LIST_DECL_SINGLE(NRI1, NRI1, U2_DESC, COND6);
>  MS_PIN_DECL(U2, GPIOL3, VPIHS, NRI1);  FUNC_GROUP_DECL(NRI1, U2);
> =20
>  #define P4 92
>  #define P4_DESC		SIG_DESC_SET(SCU84, 20)
> -SIG_EXPR_LIST_DECL_SINGLE(VPIVS, VPI24, VPI_24_RSVD_DESC, P4_DESC,=20
> COND2); -SIG_EXPR_LIST_DECL_SINGLE(NDTR1, NDTR1, P4_DESC, COND2);
> +SIG_EXPR_LIST_DECL_SINGLE(VPIVS, VPI24, VPI_24_RSVD_DESC, P4_DESC,=20
> +COND6); SIG_EXPR_LIST_DECL_SINGLE(NDTR1, NDTR1, P4_DESC, COND6);
>  MS_PIN_DECL(P4, GPIOL4, VPIVS, NDTR1);  FUNC_GROUP_DECL(NDTR1, P4);
> =20
>  #define P3 93
>  #define P3_DESC		SIG_DESC_SET(SCU84, 21)
> -SIG_EXPR_LIST_DECL_SINGLE(VPICLK, VPI24, VPI_24_RSVD_DESC, P3_DESC,=20
> COND2); -SIG_EXPR_LIST_DECL_SINGLE(NRTS1, NRTS1, P3_DESC, COND2);
> +SIG_EXPR_LIST_DECL_SINGLE(VPICLK, VPI24, VPI_24_RSVD_DESC, P3_DESC,=20
> +COND6); SIG_EXPR_LIST_DECL_SINGLE(NRTS1, NRTS1, P3_DESC, COND6);
>  MS_PIN_DECL(P3, GPIOL5, VPICLK, NRTS1);  FUNC_GROUP_DECL(NRTS1, P3);
> =20
> --
> 2.11.0
>
