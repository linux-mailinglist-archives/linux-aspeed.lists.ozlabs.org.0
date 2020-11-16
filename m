Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 597162B3CC0
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Nov 2020 07:01:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZJNr3sDGzDqQ1
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Nov 2020 17:01:32 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::841;
 helo=mail-qt1-x841.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Y2cO200u; dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZJNj1YXPzDqNr
 for <linux-aspeed@lists.ozlabs.org>; Mon, 16 Nov 2020 17:01:21 +1100 (AEDT)
Received: by mail-qt1-x841.google.com with SMTP id p12so12165840qtp.7
 for <linux-aspeed@lists.ozlabs.org>; Sun, 15 Nov 2020 22:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BOSzuAb0KtO5IrGQgh+zcL/DrrVG9ViTlb9HVDC64TA=;
 b=Y2cO200uEKK8gkHL83dAlv2FWysq5IP5GmCQzZ5HZhX2JS/9J2NUMSy8RlfHSu+9AY
 qWgCA4pmoqXz+Nhg0OZ0qI51920GrhbXpAi+B+hC8pdJLGbQVe1Vx7mKSVY5tNLADxmm
 eqbXPmJ54fs/GdeH6exQafteD93uHAjoNIaIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BOSzuAb0KtO5IrGQgh+zcL/DrrVG9ViTlb9HVDC64TA=;
 b=n2AR8L3Ye9zG6xNe86UfnnlayRTU5249AJU8ICJnsZOtp6U2PZ8pfbdeLO+O5v+U2u
 LABtuNtcym9ytvZnhVgadZxjiILwvBAJaavNH0h82uVIuZ11+3sZwUOz58hn/btGOKBI
 dFh33LiXzuyG1BXSnyhDCsQ459jOG38gmpPv25HhP9cxTC373gnsHAq1UPYDnxzgCHrr
 rfqhjLY6pS+bVC0KNRirzQ3WndjVXQL//PThiQpEKHwBYu/0vq2SXLUROU4nZPCO4MEH
 cj6/1fSGmn1QZrQ38sLsA3Xb8HU/tf0T27HgPr/ySYd3JLSs3LBoHdZsu1xmCIqhVvTD
 pulg==
X-Gm-Message-State: AOAM531fCVQqT/A2uQqMTdSPHy7NwiKxZ5O6srdHOw/lcJjXjHPvQWrz
 lCGXrJs7YRClaTFJ5BAJ48RFyxyrz6RVldfjsV8=
X-Google-Smtp-Source: ABdhPJymN4E+CjLOgLY6QKrhHru0Ujo2eWYUoR1buD30p1PrmB+U6Al3EpmbL0ieY7lTO57c9STdaN1DA0tsa4DQ8Cw=
X-Received: by 2002:aed:33a3:: with SMTP id v32mr13065479qtd.263.1605506475572; 
 Sun, 15 Nov 2020 22:01:15 -0800 (PST)
MIME-Version: 1.0
References: <20200930192507.27847-1-fercerpav@gmail.com>
 <CACPK8XdMXBUYZxYnvLeZ1V=mT6=uMhy6rNZ9dsksw0_yf6obeA@mail.gmail.com>
 <21F4D101-0402-4401-AD11-2EB12406F86A@fb.com>
In-Reply-To: <21F4D101-0402-4401-AD11-2EB12406F86A@fb.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 16 Nov 2020 06:01:03 +0000
Message-ID: <CACPK8XemKa2q8Yon8oe1mSP_WsDkogLaM9ARwQCBUUhaya_hBQ@mail.gmail.com>
Subject: Re: [PATCH] arm: dts: aspeed-bmc-tiogapass: enable second MAC
To: Vijay Khemka <vijaykhemka@fb.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Paul Fertser <fercerpav@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 12 Nov 2020 at 19:14, Vijay Khemka <vijaykhemka@fb.com> wrote:
>
>
>
> =EF=BB=BFOn 10/27/20, 10:51 PM, "Joel Stanley" <joel@jms.id.au> wrote:
>
>     On Wed, 30 Sep 2020 at 19:27, Paul Fertser <fercerpav@gmail.com> wrot=
e:
>     >
>     > Tioga Pass reference design includes Intel I210 Ethernet controller
>     > connected to the BMC with NC/SI.
>     >
>     > MAC readout is not supported.
>     >
>     > Signed-off-by: Paul Fertser <fercerpav@gmail.com>
> Reviewed-by: Vijay Khemka<vijaykhemkalinux@gmail.com>
> Tested-by: Vijay Khemka<vijaykhemkalinux@gmail.com>
>
>
>     Vijay, can I get a review from you on this one please?
>
> Sorry Joel, for late response, I have tested and verified this yesterday

Thanks for taking a look.

Paul, in the future please use scripts/get_maintainers.pl in the
kernel tree to send this patch to the correct location. Importantly,
you should cc linux-arm-kernel and myself (as the maintainer).

I've merged this for 5.11.

Cheers,

Joel
>
>     > ---
>     >  arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts | 8 ++++++++
>     >  1 file changed, 8 insertions(+)
>     >
>     > diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts b/=
arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
>     > index 2d44d9ad4e40..b2ba798bf3c4 100644
>     > --- a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
>     > +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
>     > @@ -196,6 +196,14 @@
>     >         use-ncsi;
>     >  };
>     >
>     > +&mac1 {
>     > +       status =3D "okay";
>     > +
>     > +       pinctrl-names =3D "default";
>     > +       pinctrl-0 =3D <&pinctrl_rmii2_default>;
>     > +       use-ncsi;
>     > +};
>     > +
>     >  &adc {
>     >         status =3D "okay";
>     >  };
>     > --
>     > 2.17.1
>     >
>
