Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E15111D4
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 May 2019 05:21:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vgXW1Wm5zDqQC
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 May 2019 13:21:31 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=aspeedtech.com
 (client-ip=211.20.114.71; helo=twspam01.aspeedtech.com;
 envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=aspeedtech.com
X-Greylist: delayed 879 seconds by postgrey-1.36 at bilbo;
 Thu, 02 May 2019 13:21:26 AEST
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vgXQ2KxFzDqNt
 for <linux-aspeed@lists.ozlabs.org>; Thu,  2 May 2019 13:21:26 +1000 (AEST)
Received: from twspam01.aspeedtech.com (localhost [127.0.0.2] (may be forged))
 by twspam01.aspeedtech.com with ESMTP id x423016G063601
 for <linux-aspeed@lists.ozlabs.org>; Thu, 2 May 2019 11:00:01 +0800 (GMT-8)
 (envelope-from ryan_chen@aspeedtech.com)
Received: from mail.aspeedtech.com (twmbx02.aspeed.com [192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id x422xZR0063379;
 Thu, 2 May 2019 10:59:35 +0800 (GMT-8)
 (envelope-from ryan_chen@aspeedtech.com)
Received: from TWMBX01.aspeed.com (192.168.0.23) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.620.29; Thu, 2 May
 2019 11:06:27 +0800
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX01.aspeed.com
 (192.168.0.23) with Microsoft SMTP Server (TLS) id 15.0.620.29; Thu, 2 May
 2019 11:06:25 +0800
Received: from TWMBX02.aspeed.com ([fe80::997d:c0a7:f01f:e1a7]) by
 TWMBX02.aspeed.com ([fe80::997d:c0a7:f01f:e1a7%12]) with mapi id
 15.00.0620.020; Thu, 2 May 2019 11:06:25 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Andrew Jeffery <andrew@aj.id.au>, Timothy Pearson
 <tpearson@raptorengineering.com>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>
Subject: RE: [PATCH 2/3] aspeed/pinctrl: Fix simultaneous RS-232 / PWM and
 DVO outputs on AST2500 devices
Thread-Topic: [PATCH 2/3] aspeed/pinctrl: Fix simultaneous RS-232 / PWM and
 DVO outputs on AST2500 devices
Thread-Index: AdUAlAXpS154mlgPT4yc4y3VL8kZBw==
Date: Thu, 2 May 2019 03:06:25 +0000
Message-ID: <d5a0e5a855144fd6bb65c569b37dedfa@TWMBX02.aspeed.com>
References: <1890791123.3393899.1556750986902.JavaMail.zimbra@raptorengineeringinc.com>
 <f35bf045-48e4-432f-8239-29f8f6746158@www.fastmail.com>
In-Reply-To: <f35bf045-48e4-432f-8239-29f8f6746158@www.fastmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.0.81]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com x422xZR0063379
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
Cc: Morris Mao <morris_mao@aspeedtech.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

>On Thu, 2 May 2019, at 08:20, Timothy Pearson wrote:
> There appears to be a small error in the pinmux table on pages 130 and
> 131 of the AST2500 datasheet v1.6.  Specifically, the COND2=20
> requirement used to mux the surrounding pins to DVI was inadvertently=20
> replicated to pins V1, W1, V2, and W2 in the table, which do not=20
> incorporate DVI functionality.
>=20
> As a result of this error, both serial TX lines and the PWM 0/1=20
> outputs were overriding the VPO pinmux settings when VPO was enabled=20
> in the pinmux hogs.
>=20
> This patch has been verified to function on Blackbird hardware.  Both=20
> serial TXD pins and PWM0/PWM1 were functionally tested with SCU94[1:0]=20
> set to 0x1.

Hello Tim.

The AST2500 pwm0/1 configure need following condition, the SCU94[1:0] is 0x=
1, it should not work.=20
Could you help confirm it?=20

v2 : pwm 0 : scu88[0] =3D 1 & scu 94[1:0] =3D 0 & scu90[5] =3D 0
w2 : pwm 1 : scu88[1] =3D 1 & scu 94[1:0] =3D 0 & scu90[5] =3D 0




> Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
> ---
>  drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
> b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
> index 187abd7693cf..6f357a11e89a 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
> @@ -696,14 +696,14 @@ FUNC_GROUP_DECL(NRTS1, P3);  #define V1 94
>  #define V1_DESC		SIG_DESC_SET(SCU84, 22)
>  SIG_EXPR_LIST_DECL_SINGLE(DASHV1, DASHV1, VPIRSVD_DESC, V1_DESC);=20
> -SIG_EXPR_LIST_DECL_SINGLE(TXD1, TXD1, V1_DESC, COND2);
> +SIG_EXPR_LIST_DECL_SINGLE(TXD1, TXD1, V1_DESC);
>  MS_PIN_DECL(V1, GPIOL6, DASHV1, TXD1);  FUNC_GROUP_DECL(TXD1, V1);
> =20
>  #define W1 95
>  #define W1_DESC		SIG_DESC_SET(SCU84, 23)
>  SIG_EXPR_LIST_DECL_SINGLE(DASHW1, DASHW1, VPIRSVD_DESC, W1_DESC);=20
> -SIG_EXPR_LIST_DECL_SINGLE(RXD1, RXD1, W1_DESC, COND2);
> +SIG_EXPR_LIST_DECL_SINGLE(RXD1, RXD1, W1_DESC);
>  MS_PIN_DECL(W1, GPIOL7, DASHW1, RXD1);  FUNC_GROUP_DECL(RXD1, W1);
> =20
> @@ -766,14 +766,14 @@ FUNC_GROUP_DECL(RXD2, T5);  #define V2 104
>  #define V2_DESC         SIG_DESC_SET(SCU88, 0)
>  SIG_EXPR_LIST_DECL_SINGLE(DASHN0, DASHN0, VPIRSVD_DESC, V2_DESC);=20
> -SIG_EXPR_LIST_DECL_SINGLE(PWM0, PWM0, V2_DESC, COND2);
> +SIG_EXPR_LIST_DECL_SINGLE(PWM0, PWM0, V2_DESC);
>  MS_PIN_DECL(V2, GPION0, DASHN0, PWM0);  FUNC_GROUP_DECL(PWM0, V2);
> =20
>  #define W2 105
>  #define W2_DESC         SIG_DESC_SET(SCU88, 1)
>  SIG_EXPR_LIST_DECL_SINGLE(DASHN1, DASHN1, VPIRSVD_DESC, W2_DESC);=20
> -SIG_EXPR_LIST_DECL_SINGLE(PWM1, PWM1, W2_DESC, COND2);
> +SIG_EXPR_LIST_DECL_SINGLE(PWM1, PWM1, W2_DESC);
>  MS_PIN_DECL(W2, GPION1, DASHN1, PWM1);  FUNC_GROUP_DECL(PWM1, W2);

>>This looks reasonable to me. I'd like Ryan to chime in though.


>>Ryan, can you confirm the datasheet needs correction here?

>>Tim: You need to send these to a broader audience than the linux-aspeed@ =
list. Please use ./scripts/get_maintainer.pl to >>determine the appropriate=
 people to send to. This at least needs to go to Linus Walleij, who maintai=
ns pinctrl.


> =20
> --
> 2.11.0
>=20
>
