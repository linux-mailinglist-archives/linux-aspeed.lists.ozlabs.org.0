Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1424445E6
	for <lists+linux-aspeed@lfdr.de>; Wed,  3 Nov 2021 17:29:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HksgL5dbDz2xvc
	for <lists+linux-aspeed@lfdr.de>; Thu,  4 Nov 2021 03:29:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sOCrnQn1;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=sOCrnQn1; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hksft0xcTz2yLg
 for <linux-aspeed@lists.ozlabs.org>; Thu,  4 Nov 2021 03:29:25 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C2C2060F10
 for <linux-aspeed@lists.ozlabs.org>; Wed,  3 Nov 2021 16:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635956963;
 bh=xOABt8qeC9A9l4bh2g20t12RpjOx+xP+axBwdu8bH/I=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=sOCrnQn1XOtO/G7eEm72MDyK4Akei0cYCWPld84EwFTB3hGGpdFQ+W7lf1dNef3AO
 RcXcCxfGy1WRZDEZ7RROkD09KMxvtMrAGjj87+tlezQlYcmu0oKBam5UqIY/bYIvg9
 3QVwLE6ZhYKRtlfg93jl/iBO0U5uWQLhKSxFbsyjRQvgvspkR3md6WslIzqa7cvSJC
 eifmQBUg1R05A89iBrKIRlWb5kTaHwcaw9Ewc+rqb+WOTLAerJB5A0R2K4h6mFFqXt
 ZwRX/UUgUHMbxJCZGfzYTHBztwVDB/HDgDBLfBdp4U9YprIqEQc3I+nDHTM0oSGxyZ
 9yl0k/aoz8SKQ==
Received: by mail-ed1-f43.google.com with SMTP id o8so11341656edc.3
 for <linux-aspeed@lists.ozlabs.org>; Wed, 03 Nov 2021 09:29:23 -0700 (PDT)
X-Gm-Message-State: AOAM533VHFKf4YkDOnySe0Wp1Tx1IN4dZaA/wrMOV2e8wDu+Au9NXiQH
 oxx9Wt7jjyqVSE27F5v0o2LE1DReMGBWPIQZHw==
X-Google-Smtp-Source: ABdhPJwrgCpf59XLe8AzG7aA287qwiUonBjeXHhzxNgyHuhZcky+70ZcLVmG9yQtmb7fXidrSaVea6PBkVRNdzGFm1M=
X-Received: by 2002:a50:da06:: with SMTP id z6mr61608023edj.355.1635956959583; 
 Wed, 03 Nov 2021 09:29:19 -0700 (PDT)
MIME-Version: 1.0
References: <20211102203717.96794-1-jae.hyun.yoo@intel.com>
 <20211102203717.96794-6-jae.hyun.yoo@intel.com>
 <1635902437.654631.3880388.nullmailer@robh.at.kernel.org>
 <8db279c9-4c76-91a5-3617-a17effb2d103@linux.intel.com>
In-Reply-To: <8db279c9-4c76-91a5-3617-a17effb2d103@linux.intel.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 3 Nov 2021 11:29:08 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+SwCqFycKz4+agRsB3qr4Rbfra55Q6tNbMH2bNtoX+hA@mail.gmail.com>
Message-ID: <CAL_Jsq+SwCqFycKz4+agRsB3qr4Rbfra55Q6tNbMH2bNtoX+hA@mail.gmail.com>
Subject: Re: [PATCH -next v2 5/6] dt-bindings: ipmi: aspeed,kcs-bmc: add
 'clocks' as a required property
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
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
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 devicetree@vger.kernel.org, Corey Minyard <minyard@acm.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, jae.hyun.yoo@intel.com,
 openipmi-developer@lists.sourceforge.net,
 Haiyue Wang <haiyue.wang@linux.intel.com>, Cedric Le Goater <clg@kaod.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Nov 3, 2021 at 11:08 AM Jae Hyun Yoo
<jae.hyun.yoo@linux.intel.com> wrote:
>
> Hi Rob,
>
> On 11/2/2021 6:20 PM, Rob Herring wrote:
> > On Tue, 02 Nov 2021 13:37:16 -0700, jae.hyun.yoo@intel.com wrote:
> >> From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> >>
> >> Add 'clocks' as a required property.
> >>
> >> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> >> ---
> >> v1 -> v2:
> >> Changes sinve v1:
> >>   - Added 'clocks' property into kcs-bmc bindings using
> >>     'aspeed,ast2400-kcs-bmc.yaml' because it's not merged into
> >>     'aspeed-lpc.yaml' yet. The bindings merging could be done using a
> >>     separate patch later.
> >>
> >>   .../devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml   | 7 +++++++
> >>   1 file changed, 7 insertions(+)
> >>
> >
> > Running 'make dtbs_check' with the schema in this patch gives the
> > following warnings. Consider if they are expected or the schema is
> > incorrect. These may not be new warnings.
> >
> > Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> > This will change in the future.
> >
> > Full log is available here: https://patchwork.ozlabs.org/patch/1549943
> >
> >
> > kcs@114: 'clocks' is a required property
> >       arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dt.yaml
> >       arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dt.yaml
> >       arch/arm/boot/dts/aspeed-bmc-inspur-nf5280m6.dt.yaml
> >
> > kcs@24: 'clocks' is a required property
> >       arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dt.yaml
> >
> > kcs@28: 'clocks' is a required property
> >       arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dt.yaml
> >       arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dt.yaml
> >       arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dt.yaml
> >
> > kcs@2c: 'clocks' is a required property
> >       arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dt.yaml
> >       arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dt.yaml
> >       arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dt.yaml
> >       arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dt.yaml
> >       arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dt.yaml
> >       arch/arm/boot/dts/aspeed-bmc-inspur-nf5280m6.dt.yaml
> >
>
> #4/6 in this patch adds 'clocks' into aspeed-g5.dtsi and aspeed-g6.dtsi
> as a default property and all above dts files include the dtsi file so
> these warning shouldn't be seen. Is it a result after applying all
> changes in this series or just after cherry picking #5/6 patch only?

Only patch 5 is applied.

> I tested 'dtbs_check' before submitting this series I tested it again
> and got the same good result like below.
>
> Aren't the above warnings false positive? Or did I miss something?

What you missed is this is an ABI. You cannot make something required
that was not required before. If the driver follows the schema and
makes 'clocks' required, then old DTBs with a new kernel will break.

It's possible that 'clocks' was always required or that it never
worked without clocks, then this change is okay. Looking at this
patch, I have no way to know that. The commit message has to explain
that. A commit message needs to answer WHY are you making the change.
You don't really need WHAT the change is as anyone can read the diff.

Rob
