Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 113C229CE2D
	for <lists+linux-aspeed@lfdr.de>; Wed, 28 Oct 2020 06:33:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLcfq1Dh6zDqPT
	for <lists+linux-aspeed@lfdr.de>; Wed, 28 Oct 2020 16:33:07 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::744;
 helo=mail-qk1-x744.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=CxDPTAZ9; dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLcfk0vsbzDqPS
 for <linux-aspeed@lists.ozlabs.org>; Wed, 28 Oct 2020 16:32:59 +1100 (AEDT)
Received: by mail-qk1-x744.google.com with SMTP id k9so3552629qki.6
 for <linux-aspeed@lists.ozlabs.org>; Tue, 27 Oct 2020 22:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8aw7ZHemSnajVRzYuFXmFbn4jbpV13Mk0VVFGbHWHtU=;
 b=CxDPTAZ9xoPOR2VRvQw+9E6WAmu71/qgxN+KqueOILrboadBMT+Rx/uQNdpPyOUu9V
 iO34P3hQt18DkXp66fjfvxorZWtTxqxCP89VrX5gUml/QAwfPuQqtzRFXuOepjiMmprs
 dex2ZNj7564llD2bUpw3+Bxtf/z950FiPX+Jg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8aw7ZHemSnajVRzYuFXmFbn4jbpV13Mk0VVFGbHWHtU=;
 b=NoDqmH3Y0GnVHjDWNWY3lrrm8pnogUmqRrn5mqXpu4Phf1i9ZKqkBcED1hKXRjQ/n9
 51jDNg6TqjAfNXZpR18tGiQ4TN8gDBe7gtKgSxpDwTK0r8PDox38/JHbeofYEGCEBidt
 axL/vEOsHgTGy4oAKLc9j6TwPFghYoMeu6uwllFUgB7eh+FxO8UzGClpTl8934vrtKG5
 +mp1Mc47tnBSXw1kF+ScqasBPq+jgtusBgGXWixgUU/z2ZLaWzObjiei9E2FONwFMqwj
 PWTnFL1WdyWAx0sxlhi1mrFbpv++Xa4BIjDEsogLfIH+wOxkq8O6fS3siBxZ3dZyDTiA
 yG/A==
X-Gm-Message-State: AOAM533wBtlIz5bn62zyXh1ajRdzFdbIDkwQA0IV4J5K6n0a7BIuLifs
 YywCjwCZfyde7N//4sMW9Xzm5S5ePhm1LKGahWo=
X-Google-Smtp-Source: ABdhPJwF26Jo+xfWPeZxUj30ahnn83k3ZAaKnMVTIkLm3zp3Zrdcuodf+uatXmR7Lray56YF9TVXu3DHmuQqMxbe2jc=
X-Received: by 2002:a37:a81:: with SMTP id 123mr5647706qkk.487.1603863175882; 
 Tue, 27 Oct 2020 22:32:55 -0700 (PDT)
MIME-Version: 1.0
References: <20201027123722.2935-1-aladyshev22@gmail.com>
 <CACPK8XcgKTEEfPL54Spd_AQTdJVm=xt+rqbteaYygLQw-GKRcQ@mail.gmail.com>
In-Reply-To: <CACPK8XcgKTEEfPL54Spd_AQTdJVm=xt+rqbteaYygLQw-GKRcQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 28 Oct 2020 05:32:43 +0000
Message-ID: <CACPK8XeO2Cin2bNkjoHz-oK22mRb0LBHSYRTtd56r5trmihP-g@mail.gmail.com>
Subject: Re: [PATCH 1/3] ARM: dts: aspeed: amd-ethanolx: Update KCS nodes to
 use v2 binding
To: Konstantin Aladyshev <aladyshev22@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Supreeth Venkatesh <supreeth.venkatesh@amd.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 28 Oct 2020 at 05:25, Joel Stanley <joel@jms.id.au> wrote:
>
> On Tue, 27 Oct 2020 at 12:38, Konstantin Aladyshev
> <aladyshev22@gmail.com> wrote:
> >
> > KCS nodes compatible property in the 'aspeed-g5.dtsi' file was
> > changed to use v2 binding in the commit fa4c8ec6feaa
> > ("ARM: dts: aspeed: Change KCS nodes to v2 binding").
> > For the proper initialization of /dev/ipmi-kcs* devices
> > KCS node variables also need to be changed to use v2 binding.
> >
> > Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
>
> Fixes: 09f5f680707e ("ipmi: kcs: aspeed: Implement v2 bindings")

Actually, this is probably better:

Fixes: fa4c8ec6feaa ("ARM: dts: aspeed: Change KCS nodes to v2 binding")

I slightly reworked your commit message when applying.

> Reviewed-by: Joel Stanley <joel@jms.id.au>
>
> > ---
> >  arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
> > index 60ba86f3e5bc..89ddc3847222 100644
> > --- a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
> > +++ b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
> > @@ -139,17 +139,17 @@
> >
> >  &kcs1 {
> >         status = "okay";
> > -       kcs_addr = <0x60>;
> > +       aspeed,lpc-io-reg = <0x60>;
> >  };
> >
> >  &kcs2 {
> >         status = "okay";
> > -       kcs_addr = <0x62>;
> > +       aspeed,lpc-io-reg = <0x62>;
> >  };
> >
> >  &kcs4 {
> >         status = "okay";
> > -       kcs_addr = <0x97DE>;
> > +       aspeed,lpc-io-reg = <0x97DE>;
> >  };
> >
> >  &lpc_snoop {
> > --
> > 2.17.1
> >
