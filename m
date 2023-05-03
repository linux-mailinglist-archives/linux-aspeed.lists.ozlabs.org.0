Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BDC6F4E53
	for <lists+linux-aspeed@lfdr.de>; Wed,  3 May 2023 03:04:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q9zHx0S00z3cKj
	for <lists+linux-aspeed@lfdr.de>; Wed,  3 May 2023 11:04:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QoGLyyHr;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QoGLyyHr;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q9zHm1jjDz30Ky;
	Wed,  3 May 2023 11:04:36 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8E3DB629D7;
	Wed,  3 May 2023 01:04:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DB88C433AA;
	Wed,  3 May 2023 01:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683075872;
	bh=3tzUPFXqJgNCRsublfj+ZgGaTs7KzeK4/lauS5NgXbw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QoGLyyHrVl2A+YTplbrnYiMEIz6wk+jP9SV8dz5UCtY76MWzNfxcDGsWDt7XzaFbR
	 Xr4LoafVLAa94EjThKoFMtXLMkvCzIlI51WqQfPmq+42ZRGmwhqCuG73rtNFS7wUkc
	 +fEXrSTR/j+xouT44ufNnuT7bR771W/YBDuqC0FtyyPhTIzbPY4lJHmmC4JrKp+LqL
	 VUXrPWi4q/OV1Ezdi6st//MbXuMfXSMqmAVFzsUiMTdstEd3wZmJZlVLjAXQcv6nMA
	 7k3X1222URsa6zFwyiuGaddxH/mAzA1qAvda1W1zjhNGD1pbVwdRUepxFlVrtRcox8
	 yQNSGRSC9H6BA==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ac6e24b985so3947081fa.2;
        Tue, 02 May 2023 18:04:32 -0700 (PDT)
X-Gm-Message-State: AC+VfDwIFVVpVPUKYnYPnGhXMHan+6JOfH/d3pF9n0EQnet1q1aObAKW
	5I7RQHXDjGO8Lkf1JoazWYh8k2dFNwWPja4c8g==
X-Google-Smtp-Source: ACHHUZ4mSLqb1ExsMkOjNsdZYIFyOMFO5WWfDnvfwZvuM9fv3TyrxmQhN6hT67g4AYdNW/MVo7uZ6IBv6mL14dd4tuc=
X-Received: by 2002:a2e:8402:0:b0:2a8:d103:dc8 with SMTP id
 z2-20020a2e8402000000b002a8d1030dc8mr4705375ljg.2.1683075870337; Tue, 02 May
 2023 18:04:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220328000915.15041-1-ansuelsmth@gmail.com> <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain> <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
 <720a2829-b6b5-411c-ac69-9a53e881f48d@app.fastmail.com> <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
 <d4b52074-d11c-4c7a-ad74-b2fce64c6d30@gmail.com>
In-Reply-To: <d4b52074-d11c-4c7a-ad74-b2fce64c6d30@gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 2 May 2023 20:04:17 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKRcMSijAdiP_BpyBGRuMhscZ12QFcLBAeZ+TcaQg7r4g@mail.gmail.com>
Message-ID: <CAL_JsqKRcMSijAdiP_BpyBGRuMhscZ12QFcLBAeZ+TcaQg7r4g@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
To: Florian Fainelli <f.fainelli@gmail.com>
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
Cc: linux-aspeed@lists.ozlabs.org, linux-realtek-soc@lists.infradead.org, linux-arm-kernel@axis.com, linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org, openbmc@lists.ozlabs.org, Krzysztof Kozlowski <krzk@kernel.org>, linux-rockchip@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org, linux-unisoc@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org, Linux-OMAP <linux-omap@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Christian Marangi <ansuelsmth@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, kernel@dh-electronics.com, Krzysztof Kozlowski <krzk+dt@kernel.org>, "linux-oxnas@groups.io" <linux-oxnas@groups.io
 >
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, May 2, 2023 at 6:02=E2=80=AFPM Florian Fainelli <f.fainelli@gmail.c=
om> wrote:
>
> On 5/2/23 12:40, Rob Herring wrote:
> > On Tue, May 2, 2023 at 3:15=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wr=
ote:
> >>
> >> On Tue, Apr 25, 2023, at 17:57, Rob Herring wrote:
> >>> On Tue, Apr 25, 2023 at 2:28=E2=80=AFAM Geert Uytterhoeven <geert@lin=
ux-m68k.org> wrote:
> >>>
> >>>> Does your script also cater for .dts files not matching any pattern,
> >>>> but including a .dtsi file that does match a pattern?
> >>>
> >>> I assume I built everything after moving, but maybe not...
> >>>
> >>> That's all just "details". First, we need agreement on a) moving
> >>> things to subdirs and b) doing it 1-by-1 or all at once. So far we've
> >>> been stuck on a) for being 'too much churn'.
> >>
> >> Sorry for missing most of the discussion last week. The script sounds
> >> fine to me, the only reason I didn't want to do this in the past is th=
at
> >> we had the plan to move platforms out of the kernel tree to an externa=
l
> >> repository and I wanted to do this platform at a time and also only mo=
ve
> >> each one once. I don't think that is going to happen anytime soon now,
> >> so let's just do your script.
> >>
> >> Can you send me the script and/or a pull request of the resulting
> >> tree based on my soc/dt branch? Everything is merged upstream,
> >> and I think git-merge would handle the remaining merges with any
> >> other changes in mainline.
> >
> > I've dusted off my script and made a branch[1] with the result.
> > There's just a couple of fixes needed after the script is run (see the
> > top commit). The cross arch includes are all fixed up by the script.
> > dtbs_install maintains a flat install. I compared the number of .dtbs
> > before and after to check the script.
> >
> > I think the only issue remaining is finalizing the mapping of
> > platforms to subdirs. What I have currently is a mixture of SoC
> > families and vendors. The most notable are all the Freescale/NXP
> > platforms, pxa, socfpga, and stm32. It's not consistent with arm64
> > either. Once that's finalized, I still need to go update MAINTAINERS.
> >
> > Here's the current mapping:
> >
> > vendor_map =3D {
> >      'alphascale' : 'alphascale',
> >      'alpine' : 'alpine',
> >      'artpec' : 'axis',
> >      'axm' : 'lsi',
> >      'cx9' : 'cnxt',
> >      'ecx' : 'calxeda',
> >      'highbank' : 'calxeda',
> >      'ep7' : 'cirrus',
> >      'mxs': 'mxs',
> >      'imx23': 'mxs',
> >      'imx28': 'mxs',
> >      'sun' : 'allwinner',
> >      'imx': 'imx',
> >      'e6' : 'imx',
> >      'e7' : 'imx',
> >      'mba6' : 'imx',
> >      'ls': 'fsl',
> >      'vf': 'fsl',
> >      'qcom': 'qcom',
> >      'am3' : 'ti',
> >      'am4' : 'ti',
> >      'am5' : 'ti',
> >      'dra' : 'ti',
> >      'keystone' : 'ti',
> >      'omap' : 'ti',
> >      'compulab' : 'ti',
> >      'logicpd' : 'ti',
> >      'elpida' : 'ti',
> >      'motorola' : 'ti',
> >      'twl' : 'ti',
> >      'da' : 'ti',
> >      'dm' : 'ti',
> >      'nspire' : 'nspire',
> >      'armada' : 'marvell',
> >      'dove' : 'marvell',
> >      'kirkwood' : 'marvell',
> >      'orion' : 'marvell',
> >      'mvebu' : 'marvell',
> >      'mmp' : 'marvell',
> >      'berlin' : 'berlin',
> >      'pxa2' : 'pxa',
> >      'pxa3' : 'pxa',
> >      'pxa' : 'marvell',
> >      'arm-' : 'arm',
> >      'integ' : 'arm',
> >      'mps' : 'arm',
> >      've' : 'arm',
> >      'aspeed' : 'aspeed',
> >      'ast2' : 'aspeed',
> >      'facebook' : 'aspeed',
> >      'ibm' : 'aspeed',
> >      'openbmc' : 'aspeed',
> >      'en7' : 'airoha',
> >      'at91' : 'microchip',
> >      'sama' : 'microchip',
> >      'sam9' : 'microchip',
> >      'usb_' : 'microchip',
> >      'tny_' : 'microchip',
> >      'mpa1600' : 'microchip',
> >      'animeo_ip' : 'microchip',
> >      'aks-cdu' : 'microchip',
> >      'ethernut5' : 'microchip',
> >      'evk-pro3' : 'microchip',
> >      'pm9g45' : 'microchip',
> >      'ge86' : 'microchip',
> >      'bcm' : 'brcm',
>
> How about we use 'broadcom' here, to follow what arm64 does? I could
> rename arch/mips/boot/dts/brcm to arch/mips/boot/dts/broadcom for
> consistency, too?

Okay, though if starting clean I'd somewhat prefer to use the vendor
prefix. I guess since arm and arm64 share dtsi files, they should
match.

Rob
