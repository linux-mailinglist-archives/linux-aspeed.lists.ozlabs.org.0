Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A8029CF4F
	for <lists+linux-aspeed@lfdr.de>; Wed, 28 Oct 2020 10:50:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLkNC75b7zDqT6
	for <lists+linux-aspeed@lfdr.de>; Wed, 28 Oct 2020 20:50:51 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::741;
 helo=mail-qk1-x741.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=LQDMMEAp; dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLkN563WpzDqMB
 for <linux-aspeed@lists.ozlabs.org>; Wed, 28 Oct 2020 20:50:45 +1100 (AEDT)
Received: by mail-qk1-x741.google.com with SMTP id j129so3930133qke.5
 for <linux-aspeed@lists.ozlabs.org>; Wed, 28 Oct 2020 02:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9VlqcSxbD+zLpLTx76uBLItIwcrcc3ZCFs1WdNdmfa0=;
 b=LQDMMEApne+8MoHy34kvudx2LbXKqf9+rPl1U6HMLUgdj3hVYJa6ZZqfOdt18khqtF
 Y8qR3e4tV6JpGfmTU5EVUT+0b3mtPH46XQJ2WnU4MexLWydQVDN7A11ZihckrdLm8yZR
 glpYN4J4/+dIxP1AsmxqbDfq7kD8m/FewNEl8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9VlqcSxbD+zLpLTx76uBLItIwcrcc3ZCFs1WdNdmfa0=;
 b=Ps8/b7m0pXY/wlbFkusAqjlJqBHZROXjrwX4coNCJ0JIUMUBDADFH5kL16kGFCZAyO
 pEPGKqbl8OD1cEkANmqj55Xp+eLlftLZWZ+vEXUghZPI9sEespkHNg5rQqbxHGdVi2/V
 oESvSnWzt6pRCc9dHIWCejmfJynec5hYHVj/8x67DP300A3kNFX/5J0+Ua4n3eD3T7hV
 m5/ZgXKzKvVgA+m7hhrqugsfGmeepFj8uOTFlGRcOq9WidfaMLStVOifbvnrVYCR2fb6
 wAaz7OB54FbGjzBfFHPJNJhtQZOKTGDVbUfzGB+GQ0cYLUdLFqsr8aAN+AMxQ5dpDBNy
 yYAw==
X-Gm-Message-State: AOAM530kjq749dcBBt+1acz4smauNfQoZkgf0w2a2fiWQAYL5IeY+EO7
 7VBNAK94LSUtkRlp4/RxAt4ZRYefz95Ugzu/Cxs=
X-Google-Smtp-Source: ABdhPJxGTvfUKiXdm0GufiMR7Kg/9Pu15EnXOZNLVhMaVAa/tdwnYilJ2+nd98SbbcNfTjVhm+hyCdE0889DRu1/mfE=
X-Received: by 2002:a05:620a:1e7:: with SMTP id
 x7mr6190070qkn.465.1603878641900; 
 Wed, 28 Oct 2020 02:50:41 -0700 (PDT)
MIME-Version: 1.0
References: <20201027123722.2935-1-aladyshev22@gmail.com>
 <f35152af-34ad-178b-61db-0e57c8d19f3f@amd.com>
In-Reply-To: <f35152af-34ad-178b-61db-0e57c8d19f3f@amd.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 28 Oct 2020 09:50:26 +0000
Message-ID: <CACPK8Xfr=Gd+oowhzZrLfAyVA7_J9=WhZGXUvfqXeu2XtP2A7Q@mail.gmail.com>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Konstantin Aladyshev <aladyshev22@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 28 Oct 2020 at 09:00, Supreeth Venkatesh
<supreeth.venkatesh@amd.com> wrote:
>
> These changes are already merged in https://github.com/openbmc/linux/blob/dev-5.8/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts by Joel.
> Please abandon these changes.

That is the openbmc kernel tree, where we stage patches on their way
to mainline. This submission is for mainline, where this patch has not
been merged.

Cheers,

Joel

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
