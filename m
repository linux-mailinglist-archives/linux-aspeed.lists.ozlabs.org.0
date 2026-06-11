Return-Path: <linux-aspeed+bounces-4233-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 26+YOCtKKmo/mAMAu9opvQ
	(envelope-from <linux-aspeed+bounces-4233-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Thu, 11 Jun 2026 07:39:55 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DA266EB6B
	for <lists+linux-aspeed@lfdr.de>; Thu, 11 Jun 2026 07:39:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=hagYWP7V;
	spf=pass (mail.lfdr.de: domain of "linux-aspeed+bounces-4233-lists+linux-aspeed=lfdr.de@lists.ozlabs.org" designates 112.213.38.117 as permitted sender) smtp.mailfrom="linux-aspeed+bounces-4233-lists+linux-aspeed=lfdr.de@lists.ozlabs.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("lists.ozlabs.org:s=201707:i=2")
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gbWgW5mcVz3br5;
	Thu, 11 Jun 2026 15:39:51 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1781156391;
	cv=pass; b=Va5kr7ICxeh0loe0GpsYAC/YzDHKEJWPh6cdMqCVrVL9JUQXCYyV5O4mAK4rT+MKydCv75CK4LH46QRW64KAPk/jrNT2kaVprA0wSGnvS3lMZsRv0MFqkko3/BsqiVgcnHxyB6LPUW9i2WBZhy+99YmNXMggy/+s8EsbD35atvQG1RdQbsWZOqIEw9hDELl8igqrqLfY+tiRrYIoVQpS5dornkRt5dzNzDwFaPWgUPaHIXxTcsco+eAOqQ60a4sKCShbEd87uKOQCGJPYZ9W/W6wu/Pm2qWaj21VtGfIeG2D25iBSentmLIB31wj2Fpn3NRh+6tesyTNH7WlauTKSg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1781156391; c=relaxed/relaxed;
	bh=3oB59fVMVK27SoPfM6pxgXOWQ6r4jMS+0G1YJm98FsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TEDaskq5Nx5ErYndvpTHbfxKoXsAJ657gnQEktsg77R5BwQppeLyJ15fY7tOM5NbFg1X4YNPi0Ono/EDLCLrQ6rjEm3p/OlBtFRf2Ce6n1KoiQIZ9ns7Bj9dWJrpC6VJTBVLXfhnAMn6DYeub3OO9pHoXSpGnTIqXhmzvoGSdtoVAF9izS9gdCD86xWntSsXglYmUeabcD09phtu5SZTJI2XJsi33dT7Z0ksUHd0a3xhMA0f3oTRbDU+kmDR6On1dsPCbVuZvRQrk0/I91KOCMRV32PbZaD+YMV2jzBNmauiSawvgYeoVn4SxqAbtBp1kPtqMNdeGzSjCuD7Wz4buw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hagYWP7V; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com; envelope-from=kylehsieh1995@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gbWgV20DBz2ySS
	for <linux-aspeed@lists.ozlabs.org>; Thu, 11 Jun 2026 15:39:49 +1000 (AEST)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-396aacc5bcfso74094241fa.3
        for <linux-aspeed@lists.ozlabs.org>; Wed, 10 Jun 2026 22:39:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781156386; cv=none;
        d=google.com; s=arc-20240605;
        b=XPZsoHSJd9zIVOtlv3maQ1ArPtXQkQEXu0Kep1f8ENYpFWpLPBimQJTdjCI0DZaeBO
         HV8oW9gbWKQG6FPmGNg0vdg55egHkim26jcSE9QUubBYj25a19ILHkAT9iTYXzLWN8fh
         UBVkxC6EzoNIl/v347DGhuQlLN5TFZotoPwGfDofty6uTOibhB+xDPQku5vKIQIMY/XP
         59eXVA7jH9X7hXCOCoxYw7gPbLZS1NALeUPhTg9w+gw9Pn8L2oWZQQ6KGkQayEdiEMea
         pasRezTFw6pEEkVqIr/elr+biA8HGx8URGb51krk824VSEGqSniNPuYD7XOpEG61A8hg
         77tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3oB59fVMVK27SoPfM6pxgXOWQ6r4jMS+0G1YJm98FsA=;
        fh=4TOuiNgNQ5G316uPL+KddHAD9n+xwmVvSAi+sNGItlI=;
        b=iSj97XEq8fNoPgSyFW1i9TJntfUly4ir4PsNQ9E2igzvxqueICUZof59f6ZcILKqtz
         vqru5/p+4pIJJZErsCi10AafU314bEBQqeHTTY/8W/Rnt4Z+hCTJQL2pBptSj70HU/j2
         Cmm5UL8QK4E83+fpCO1j4tBH8nVonNRjHutqVQ0t5BNEJl7ipbMI2iAEnlipP4jDKfLz
         SQPi0tOS6G8vf9G13agwSB/hUoz+Yj50K0Vs+ogRPQ/a+a3eK6b7awUvjKyecJiZ3va+
         xMavddZJFHKxciwJ+fpu9tD2O5Ls9ZvVFryc6NeijDvLH4ca1/NELdJFulvs9E5s+Aw/
         R+SQ==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781156386; x=1781761186; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3oB59fVMVK27SoPfM6pxgXOWQ6r4jMS+0G1YJm98FsA=;
        b=hagYWP7VJf7HICaZn0Jid06cw/uHJlrYPK3+Gc14VrtZ1c7NkPCKh/pb0wLbx84yLN
         CFALUZXLXJii50Zb22HRsLuisBD8x0IUct1xSJDAKBqInQqnY4AXYP7Ze6q99ger6Sso
         ImrWaLWO7WvhsOIF395+gtRP1ReFYwMJB/fodbuVo4t8/eO2uLktd+vOOQCgf13s+S/u
         XPUFrtScKC80N36sv7jOFTMURPchg+Zarv6JRsx5ysl5aKNX05td0IpujnPbNhW1iAul
         jCidVl7XsxLdf3ifbYbPDTdXA+fF/3AKJEgVPTVB4EaY92yliBsSIDg/YFQki0vbzJMC
         Lpuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781156386; x=1781761186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3oB59fVMVK27SoPfM6pxgXOWQ6r4jMS+0G1YJm98FsA=;
        b=BrhinyNjZMs6pGG0JpEu0uXhImhaAZ7ypeU/3Zdad6zCDWsgwekyRrutrYGuidt0/q
         /WkY4iONDRBd0Vov/QR7UdbUW4mvcyjBgllh5pWje9I+/v3plxLCMC83YFeyyPSxEP5s
         2s4XrwMThwUBGG4vbdX9D767aNLqx/gxYBhcDiC/TfmWy0icE+wKRCLszc0qPY78870S
         Rr61XjlTD60NxTk52Bjvm03YJ7s0l1wEc6mwTFn9FTejexslSdiBtKl9SXBTEYkSzOU8
         mcctNgFMK09MYtwKWY0OrDjv9uadAu/V3VnC/7dI+Qi2DAM0ymP3/6DS3Ado8oRudTqV
         B0UQ==
X-Forwarded-Encrypted: i=1; AFNElJ8JOtxawlp+KtO0IplmaJ5UXMRPIgmUWWHDGYmCqu/8abpOTFXlPYIuPaVJhPX7x4FtN0c5nmrZ2Xi8QbU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzf1RXQDz1fnaCv3BMKzKo8uDCXlviPQki8vSTvsOYezkTHd5KL
	DRMNpSs4qhHXzpi85aBPuXf31FZ/DtS7a7aRL2Mw0Cb+nuy2yFz2k7xpyNVfB3QgHVszsOiKne0
	wqkqzLMAOiRllWDQ9UL+f+dmjdmFkqi0=
X-Gm-Gg: Acq92OGUi/9MUGdEAs++/getp4uv7tsfp66oAEJ2hacEOIUqK3Y9zOtnvm/RTTZD8ZU
	/rSLRgkiAWnJ+bsCcLnvH519gG32Wln1IYwlCdxxZpq8BUvttKSpSEbrPSu8IMF+60zbD/ATo91
	flla+tLrPWdajjdjDKyAbgwX8S1NAsxOkdU8noRKO2qAtsWXj8J0QdjWnPLM8Heo8v2hwBP49jO
	Jk5XRahjdpSlUejh/S57RqYh9rQwJC/A8KYjgsjA6UCA6nxEVyCWhPH8G7uNRxwoLi1XC3rN+rz
	wnjs5zc6PZx/wyZuc4E=
X-Received: by 2002:a2e:a107:0:b0:393:975b:5635 with SMTP id
 38308e7fff4ca-39919fb6857mr2532671fa.12.1781156385590; Wed, 10 Jun 2026
 22:39:45 -0700 (PDT)
X-Mailing-List: linux-aspeed@lists.ozlabs.org
List-Id: <linux-aspeed.lists.ozlabs.org>
List-Help: <mailto:linux-aspeed+help@lists.ozlabs.org>
List-Owner: <mailto:linux-aspeed+owner@lists.ozlabs.org>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linux-aspeed/>,
  <https://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Subscribe: <mailto:linux-aspeed+subscribe@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-digest@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linux-aspeed+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <20260608-ventura2_initial_dts-v5-0-37ee5bcf58b6@gmail.com>
 <20260608-ventura2_initial_dts-v5-2-37ee5bcf58b6@gmail.com> <3d56889c004fc2d11b76ace6033c7ccfb8a37d03.camel@codeconstruct.com.au>
In-Reply-To: <3d56889c004fc2d11b76ace6033c7ccfb8a37d03.camel@codeconstruct.com.au>
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Thu, 11 Jun 2026 13:41:15 +0800
X-Gm-Features: AVVi8Ccm0DC9rSjRQJdBWLuBDknFZNLKxN-D90VWvba6LpRXnzFxGYFIhU7-HJk
Message-ID: <CAF7HswNYvs73zoCDdVq_E11H82Djy=2OY-k8=zq+G6EGrV_6Qg@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] ARM: dts: aspeed: ventura2: Add Meta ventura2 BMC
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,WEIRD_QUOTING autolearn=disabled version=4.0.1
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4233-lists,linux-aspeed=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andrew@codeconstruct.com.au,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[kylehsieh1995@gmail.com,linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kylehsieh1995@gmail.com,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,lists.ozlabs.org:from_smtp,codeconstruct.com.au:email,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 38DA266EB6B

On Wed, Jun 10, 2026 at 7:15=E2=80=AFPM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> Hi Kyle,
>
> On Mon, 2026-06-08 at 10:42 +0800, Kyle Hsieh wrote:
> > Add linux device tree entry related to the Meta(Facebook) rmc-node.
>
> This is redundant as it is evident from the patch itself. Can you
> please remove it?
>
> > The system use an AT2600 BMC.
> > This node is named "ventura2".
>
> Can you provide some more detail about the platform in the commit
> message? What's it's purpose? Can you describe some interesting
> features or details about its design?
>
Hi Andrew,

To briefly answer your question: Ventura2 is Rack Management
Controller. It is a modular device primarily designed to manage liquid
cooling systems and monitor rack-level hardware states. Its key
hardware features include an extensive I2C/GPIO topology for
tray-level and rack-level liquid leakage detection, as well as MCTP
over I2C support for asynchronous device communications.

I will remove the redundant sentence and include this detailed
description of the platform's purpose and architecture in the commit
message for v7.
> >
> > Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
> > ---
> >  arch/arm/boot/dts/aspeed/Makefile                  |    1 +
> >  .../dts/aspeed/aspeed-bmc-facebook-ventura2.dts    | 2888 ++++++++++++=
++++++++
> >  2 files changed, 2889 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspe=
ed/Makefile
> > index 9adf9278dc94..6b96997629d4 100644
> > --- a/arch/arm/boot/dts/aspeed/Makefile
> > +++ b/arch/arm/boot/dts/aspeed/Makefile
> > @@ -32,6 +32,7 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D \
> >       aspeed-bmc-facebook-minipack.dtb \
> >       aspeed-bmc-facebook-santabarbara.dtb \
> >       aspeed-bmc-facebook-tiogapass.dtb \
> > +     aspeed-bmc-facebook-ventura2.dtb \
> >       aspeed-bmc-facebook-wedge40.dtb \
> >       aspeed-bmc-facebook-wedge100.dtb \
> >       aspeed-bmc-facebook-wedge400-data64.dtb \
> > diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts =
b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
> > new file mode 100644
> > index 000000000000..9bf7d6e52e40
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
> > @@ -0,0 +1,2888 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +// Copyright (c) 2023 Facebook Inc.
> > +/dts-v1/;
> > +
> > +#include "aspeed-g6.dtsi"
> > +#include <dt-bindings/i2c/i2c.h>
> > +#include <dt-bindings/gpio/aspeed-gpio.h>
> > +
> > +/ {
> > +     model =3D "Facebook Ventura2 RMC";
> > +     compatible =3D "facebook,ventura2-rmc", "aspeed,ast2600";
> >
>
> ...
>
> > +};
> > +
>
> ...
>
> > +&gpio1 {
> > +     gpio-line-names =3D
> > +     /*18A0-18A7*/   "","","","","","","","",
> > +     /*18B0-18B7*/   "","","","",
> > +                     "FM_BOARD_BMC_REV_ID0","FM_BOARD_BMC_REV_ID1",
> > +                     "FM_BOARD_BMC_REV_ID2","",
> > +     /*18C0-18C7*/   "SPI_BMC_BIOS_ROM_IRQ0_R_N","","","","","","","",
> > +     /*18D0-18D7*/   "","","","","","","","",
> > +     /*18E0-18E3*/   "FM_BMC_PROT_LS_EN","AC_PWR_BMC_BTN_R_N","","";
> > +};
> > +
> > +&i2c0 {
> > +     status =3D "okay";
> > +
> > +     i2c-mux@77 {
> > +             compatible =3D "nxp,pca9548";
> > +             reg =3D <0x77>;
> > +             #address-cells =3D <1>;
> > +             #size-cells =3D <0>;
> > +             i2c-mux-idle-disconnect;
> > +
> > +             i2c0mux0ch0: i2c@0 {
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +                     reg =3D <0>;
> > +             };
> > +
> > +             i2c0mux0ch1: i2c@1 {
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +                     reg =3D <1>;
> > +             };
> > +
> > +             i2c0mux0ch2: i2c@2 {
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +                     reg =3D <2>;
> > +             };
> > +
> > +             i2c0mux0ch3: i2c@3 {
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +                     reg =3D <3>;
> > +                     status =3D "okay";
> > +             };
> > +
> > +             i2c0mux0ch4: i2c@4 {
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +                     reg =3D <4>;
> > +                     status =3D "okay";
> > +             };
> > +
> > +             i2c0mux0ch5: i2c@5 {
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +                     reg =3D <5>;
> > +                     status =3D "okay";
> > +
> > +                     eeprom@56 {
> > +                             compatible =3D "atmel,24c128";
> > +                             reg =3D <0x56>;
> > +                     };
> > +             };
> > +
> > +             i2c0mux0ch6: i2c@6 {
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +                     reg =3D <6>;
> > +
> > +                     eeprom@56 {
> > +                             compatible =3D "atmel,24c128";
> > +                             reg =3D <0x56>;
> > +                     };
> > +
> > +                     fan_io_expander0: gpio@20 {
> > +                             compatible =3D "nxp,pca9555";
> > +                             reg =3D <0x20>;
> > +                             gpio-controller;
> > +                             #gpio-cells =3D <2>;
> > +                     };
> > +
> > +                     fan_io_expander1: gpio@21 {
> > +                             compatible =3D "nxp,pca9555";
> > +                             reg =3D <0x21>;
> > +                             gpio-controller;
> > +                             #gpio-cells =3D <2>;
> > +                     };
> > +
> > +                     adc@1d {
> > +                             compatible =3D "ti,adc128d818";
> > +                             reg =3D <0x1d>;
> > +                             ti,mode =3D /bits/ 8 <1>;
> > +                     };
> > +
> > +                     adc@35 {
> > +                             compatible =3D "maxim,max11617";
> > +                             reg =3D <0x35>;
> > +                     };
> > +             };
> > +
> > +             i2c0mux0ch7: i2c@7 {
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +                     reg =3D <7>;
> > +
> > +                     fanctl0: fan-controller@20 {
> > +                             compatible =3D "maxim,max31790";
> > +                             reg =3D <0x20>;
> > +                             #address-cells =3D <1>;
> > +                             #size-cells =3D <0>;
> > +                             channel@2 {
>
> Can you make sure that you consistently use a blank line to separate
> child nodes from each other and from properties in their parent?
>
> Please fix throughout.

I will recheck the whole file to satisfy the rule in the next patch v7, tha=
nks.
>
> > +                                     reg =3D <2>;
> > +                                     sensor-type =3D "TACH";
> > +                             };
> > +                             channel@5 {
> > +                                     reg =3D <5>;
> > +                                     sensor-type =3D "TACH";
> > +                             };
> > +                     };
> > +
> > +                     fanctl1: fan-controller@23 {
> > +                             compatible =3D "nuvoton,nct7363";
> > +                             reg =3D <0x23>;
> > +                             #pwm-cells =3D <2>;
> > +
> > +                             fan-9 {
> > +                                     pwms =3D <&fanctl1 0 20000>;
> > +                                     tach-ch =3D /bits/ 8 <0x09>;
> > +                             };
> > +
> > +                             fan-11 {
> > +                                     pwms =3D <&fanctl1 0 20000>;
> > +                                     tach-ch =3D /bits/ 8 <0x0B>;
> > +                             };
> > +
> > +                             fan-10 {
> > +                                     pwms =3D <&fanctl1 4 20000>;
> > +                                     tach-ch =3D /bits/ 8 <0x0A>;
> > +                             };
> > +
> > +                             fan-13 {
> > +                                     pwms =3D <&fanctl1 4 20000>;
> > +                                     tach-ch =3D /bits/ 8 <0x0D>;
> > +                             };
> > +
> > +                             fan-15 {
> > +                                     pwms =3D <&fanctl1 6 20000>;
> > +                                     tach-ch =3D /bits/ 8 <0x0F>;
> > +                             };
> > +
> > +                             fan-1 {
>
> Can you please sort the fan nodes in ascending order?
I will reorder the fan node in next patch v7.
>
> > +                                     pwms =3D <&fanctl1 6 20000>;
> > +                                     tach-ch =3D /bits/ 8 <0x01>;
> > +                             };
> > +
> > +                             fan-0 {
> > +                                     pwms =3D <&fanctl1 10 20000>;
> > +                                     tach-ch =3D /bits/ 8 <0x00>;
> > +                             };
> > +
> > +                             fan-3 {
> > +                                     pwms =3D <&fanctl1 10 20000>;
> > +                                     tach-ch =3D /bits/ 8 <0x03>;
> > +                             };
> > +                     };
> > +             };
> > +     };
> > +};
> >
>
> ...
>
> > +
> > +     // Marvell 88E6393X EEPROM
>
> Please try to be consistent with the comment style (prefer /* */).
I will fix this in the next patch v7, thanks for your suggestion.
>
> > +     eeprom@50 {
> > +             compatible =3D "atmel,24c64";
> > +             reg =3D <0x50>;
> > +     };
> > +
> > +     rtc@51 {
> > +             compatible =3D "nxp,pcf8563";
> > +             reg =3D <0x51>;
> > +     };
> > +};
> > +

