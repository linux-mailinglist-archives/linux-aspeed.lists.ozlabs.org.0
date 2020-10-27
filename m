Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B0E29CADB
	for <lists+linux-aspeed@lfdr.de>; Tue, 27 Oct 2020 22:01:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLPJ53qmkzDqPQ
	for <lists+linux-aspeed@lfdr.de>; Wed, 28 Oct 2020 08:01:09 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::144;
 helo=mail-lf1-x144.google.com; envelope-from=aladyshev22@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ElUgjMkw; dkim-atps=neutral
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLPHv25QrzDqLR
 for <linux-aspeed@lists.ozlabs.org>; Wed, 28 Oct 2020 08:00:58 +1100 (AEDT)
Received: by mail-lf1-x144.google.com with SMTP id l28so4093542lfp.10
 for <linux-aspeed@lists.ozlabs.org>; Tue, 27 Oct 2020 14:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J7PGG156cg19twbXTKEP6KsKcgx/xu67BqCSAp2wGso=;
 b=ElUgjMkwUlxXH3aOdHNzbzqlkDzAJA6gyHEI6s8BCe6UAJHOGwsxQrICvT3kv33VuA
 0YkBLKrb5wtpEtzBgZvbAo3fIZBeUgwUvXRiTsPIJxwkXIAgqmqSV0/tY6qCjCsRh/on
 HjewOcE+Ya25yVwAuteuc0Rz+3pm1cCG/ddvUbZ7CoxJmVrDVThDR+mmEWPG8lYV7nha
 Y+FT9AgoJgNo7QfSz5PfDZi8qSeQ3b4d4wUaLUPvDZRM803nDa+VcryKHO2bvjQskukW
 nhs9rF87hmqrMehiK0AK0QRuvTqHsqO2pCwYkFqnEc+G48iDrMzsk5Vcdb2MRQyHQZXa
 G/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J7PGG156cg19twbXTKEP6KsKcgx/xu67BqCSAp2wGso=;
 b=BAjSQAK/EuQGyNpuMiarGmsapB9HKbUlIrz2on7paMHAHijsXFrcABEqrbpXl7UTIR
 1hn9IjwC234w0nSoUhF8js//tYDoe7LnZQijfGrlh7b2P6xIi31Acz1PuMWc67o9Mx1i
 H4mxxTNfT+jTbujilH8uhNOtm21VcwOJBGfBhUNn5lQACb1C2p2SSe8QULXXn9JjogUQ
 vD4W9M9bM3WOHvRR4Pl8dB9vCCRAtGbSYRHqAy0RzEBW/dp8WeUzKSLYEIJNa/FwejSm
 ZzoPIMcYhw55rKtF8TrtichYXpb4aBu1rGrrNYLcy/cNZvoMR7UW14hM9RY9dtfHbuLa
 q+sg==
X-Gm-Message-State: AOAM533b5sUrazHblVck3V2aXy32TsQNIToM4wCPWuIq7VBpnP5JC2Uu
 iLJFEDTrQ9haAh/7lMkb/3pwqPfJG0s5qvVLJuY=
X-Google-Smtp-Source: ABdhPJzRKV/YkyO+AIFyjgP7U9onChTXNYu9Sr4kL2PrmCdDG9M/zhQ40SSgrzzaoPkl6zwQRhTucXZ/9sRj9RSxEsg=
X-Received: by 2002:a05:6512:34d3:: with SMTP id
 w19mr1449082lfr.418.1603832453713; 
 Tue, 27 Oct 2020 14:00:53 -0700 (PDT)
MIME-Version: 1.0
References: <20201027123722.2935-1-aladyshev22@gmail.com>
 <f35152af-34ad-178b-61db-0e57c8d19f3f@amd.com>
In-Reply-To: <f35152af-34ad-178b-61db-0e57c8d19f3f@amd.com>
From: Konstantin Aladyshev <aladyshev22@gmail.com>
Date: Wed, 28 Oct 2020 00:00:41 +0300
Message-ID: <CACSj6VW_Nwwt=6fZG0OiKh4rySHPYs__uRzrN+=OdVwXVMz6og@mail.gmail.com>
Subject: Re: [PATCH 1/3] ARM: dts: aspeed: amd-ethanolx: Update KCS nodes to
 use v2 binding
To: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

These changes got picked up from my backport patch to the 'dev-5.8'
branch of the OpenBMC Linux repository.
This patch also needed to be added to the main ASPEED Linux kernel, so
it could get into subsequent branches of the OpenBMC Linux repository.

Best regards,
Konstantin Aladyshev


On Tue, Oct 27, 2020 at 5:10 PM Supreeth Venkatesh
<supreeth.venkatesh@amd.com> wrote:
>
> These changes are already merged in https://github.com/openbmc/linux/blob/dev-5.8/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts by Joel.
> Please abandon these changes.
>
> Thanks,
> Supreeth
>
> On 10/27/20 7:37 AM, Konstantin Aladyshev wrote:
> > [CAUTION: External Email]
> >
> > KCS nodes compatible property in the 'aspeed-g5.dtsi' file was
> > changed to use v2 binding in the commit fa4c8ec6feaa
> > ("ARM: dts: aspeed: Change KCS nodes to v2 binding").
> > For the proper initialization of /dev/ipmi-kcs* devices
> > KCS node variables also need to be changed to use v2 binding.
> >
> > Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
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
