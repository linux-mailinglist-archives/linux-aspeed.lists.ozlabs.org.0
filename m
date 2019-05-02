Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 615871126B
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 May 2019 06:59:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vjjH6SlHzDqR1
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 May 2019 14:59:15 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vjjC1lf4zDqPG
 for <linux-aspeed@lists.ozlabs.org>; Thu,  2 May 2019 14:59:09 +1000 (AEST)
Received: from mail.aspeedtech.com (twmbx02.aspeed.com [192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id x424pwFd078318;
 Thu, 2 May 2019 12:51:58 +0800 (GMT-8)
 (envelope-from ryan_chen@aspeedtech.com)
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.620.29; Thu, 2 May
 2019 12:58:51 +0800
Received: from TWMBX02.aspeed.com ([fe80::997d:c0a7:f01f:e1a7]) by
 TWMBX02.aspeed.com ([fe80::997d:c0a7:f01f:e1a7%12]) with mapi id
 15.00.0620.020; Thu, 2 May 2019 12:58:51 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Andrew Jeffery <andrew@aj.id.au>, Timothy Pearson
 <tpearson@raptorengineering.com>
Subject: RE: [PATCH 2/3] aspeed/pinctrl: Fix simultaneous RS-232 / PWM and
 DVO outputs on AST2500 devices
Thread-Topic: [PATCH 2/3] aspeed/pinctrl: Fix simultaneous RS-232 / PWM and
 DVO outputs on AST2500 devices
Thread-Index: AdUAlAXpS154mlgPT4yc4y3VL8kZB2RDAL2hZEHNz/D5u2QEAP//a88g
Date: Thu, 2 May 2019 04:58:51 +0000
Message-ID: <08e21a55c7e746cda83694845c2b3429@TWMBX02.aspeed.com>
References: <1890791123.3393899.1556750986902.JavaMail.zimbra@raptorengineeringinc.com>
 <f35bf045-48e4-432f-8239-29f8f6746158@www.fastmail.com>
 <d5a0e5a855144fd6bb65c569b37dedfa@TWMBX02.aspeed.com>
 <313461427.3426138.1556768056285.JavaMail.zimbra@raptorengineeringinc.com>
 <921172cf50484d839bd30fa27ecf525e@TWMBX02.aspeed.com>
 <46d7b027-0f88-47e3-a132-e59b7640c867@www.fastmail.com>
In-Reply-To: <46d7b027-0f88-47e3-a132-e59b7640c867@www.fastmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.0.81]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com x424pwFd078318
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
Cc: Morris Mao <morris_mao@aspeedtech.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

> ----- Original Message -----
> > From: "Ryan Chen" <ryan_chen@aspeedtech.com>
> > To: "Andrew Jeffery" <andrew@aj.id.au>, "Timothy Pearson" <tpearson@rap=
torengineering.com>, "linux-aspeed"
> > <linux-aspeed@lists.ozlabs.org>
> > Cc: "Morris Mao" <morris_mao@aspeedtech.com>
> > Sent: Wednesday, May 1, 2019 10:06:25 PM
> > Subject: RE: [PATCH 2/3] aspeed/pinctrl: Fix simultaneous RS-232 /=20
> > PWM and DVO outputs on AST2500 devices
>=20
> >>On Thu, 2 May 2019, at 08:20, Timothy Pearson wrote:
> >> There appears to be a small error in the pinmux table on pages 130=20
> >>and
> >> 131 of the AST2500 datasheet v1.6.  Specifically, the COND2=20
> >>requirement used to mux the surrounding pins to DVI was=20
> >>inadvertently replicated to pins V1, W1, V2, and W2 in the table,=20
> >>which do not incorporate DVI functionality.
> >>=20
> >> As a result of this error, both serial TX lines and the PWM 0/1=20
> >> outputs were overriding the VPO pinmux settings when VPO was=20
> >> enabled in the pinmux hogs.
> >>=20
> >> This patch has been verified to function on Blackbird hardware. =20
> >> Both serial TXD pins and PWM0/PWM1 were functionally tested with=20
> >> SCU94[1:0] set to 0x1.
> >=20
> > Hello Tim.
> >=20
> > The AST2500 pwm0/1 configure need following condition, the=20
> > SCU94[1:0] is 0x1, it should not work.
> > Could you help confirm it?
> >=20
> > v2 : pwm 0 : scu88[0] =3D 1 & scu 94[1:0] =3D 0 & scu90[5] =3D 0
> > w2 : pwm 1 : scu88[1] =3D 1 & scu 94[1:0] =3D 0 & scu90[5] =3D 0
>=20
> >>I can confirm that with SCU94[1:0] =3D=3D 0x1 the PWM0 and PWM1 outputs=
 work correctly -- this was tested on our Blackbird >>hardware.  If you are=
 reading from the datasheet, I suspect there are a few errors in it relatin=
g to the relatively rarely used DVO >>mux settings.
>=20
> Yes it can work after check with designer, if you don't enable the CRT=20
> driver, it will work.
> But for safety.

>>What do you mean by "for safety"?

Sorry, my point is if gfx driver also loaded, it will impact.
But, It is ok for this modification. Due to pinctrl gfx pwm is separate dri=
ver setting.=20


> You need also and with COND2 for pwm driver loaded.

>>I'm confused here because it sounds like from Tim's experiment PWM0 / PWM=
1 work without the dependency on COND2 >>despite VPO being enabled, and the=
 designer confirms as much, but we shouldn't do it?

>>Regardless, in summary you're saying that for TXD1 and RXD1 the change to=
 remove the dependence on COND2 is appropriate, but not for PWM0 and PWM1?

>=20
>=20
>
