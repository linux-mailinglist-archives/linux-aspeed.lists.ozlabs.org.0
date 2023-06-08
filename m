Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BF7728990
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Jun 2023 22:34:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcbXp1BvZz3f0h
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Jun 2023 06:34:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fgaZ349J;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fgaZ349J;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcbXg3fJjz3bhL;
	Fri,  9 Jun 2023 06:34:11 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F1DE3641A4;
	Thu,  8 Jun 2023 20:34:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56EFCC4339E;
	Thu,  8 Jun 2023 20:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686256448;
	bh=sDQU8yDhZvEN0YygXlDwwk/pG5OO2+PNN+eimNV1mxQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fgaZ349JLx+w83grh2ZLXulv/+6NJAi3DgUkiDjdPUnEbtk4GQEssHtbOIddqu7NS
	 lPaC6AHuim2fJRANrT5DaAmdXiQpvBm+7mGFYRsrpE+oxJUOyxOcSTn5lKiyDxe1Or
	 n5YgMMfQ4bTaC2QJt/JnTYxj/givMqGUBBz3rUIry4SQD/wz5fgIIRzW+GMrEpzSFi
	 PbfnO38m/nfnN3xuhX7TtG4zZHxJFbZGDmEo4sAIkiZ9b2pSGKKgp/euyIGBlEVoLc
	 GjISgjtw2dBk6OSTF08aIBGYgRcFyZGTf1PvKvLV50bqV6sHmzKcOLVI2G/vh42+xc
	 r1JZZ8BI/NqLw==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-4f63ea7bfb6so1275383e87.3;
        Thu, 08 Jun 2023 13:34:08 -0700 (PDT)
X-Gm-Message-State: AC+VfDxAMhe+kbAdPN5WPSoHmQS5Pemr0CdLqwIQtJh25YAcLf6YluOR
	3X9+OQyAmavSiyWGPuxramb07JUD2HHys3rAeQ==
X-Google-Smtp-Source: ACHHUZ5SCj+1HRHRtKPyWx3l9LJOj9l0nyCPip7lrCiON1VeZXUrpVZAJ73MOZnz04qUR2b59Vv4/CBNUYxpj6dT0Jg=
X-Received: by 2002:a2e:9cd6:0:b0:2b1:d91b:51c3 with SMTP id
 g22-20020a2e9cd6000000b002b1d91b51c3mr4481468ljj.30.1686256446472; Thu, 08
 Jun 2023 13:34:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220328000915.15041-1-ansuelsmth@gmail.com> <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain> <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
 <720a2829-b6b5-411c-ac69-9a53e881f48d@app.fastmail.com> <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
 <ZFrPJQdwoxqFpzUO@probook>
In-Reply-To: <ZFrPJQdwoxqFpzUO@probook>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 8 Jun 2023 14:33:53 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLTj_L-V8HR=TzO6+r9Xew=yivaKG1ngCn+NCjgPZwZzw@mail.gmail.com>
Message-ID: <CAL_JsqLTj_L-V8HR=TzO6+r9Xew=yivaKG1ngCn+NCjgPZwZzw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
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
Cc: linux-aspeed@lists.ozlabs.org, linux-realtek-soc@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>, linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org, openbmc@lists.ozlabs.org, linux-arm-kernel@axis.com, linux-rockchip@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org, linux-unisoc@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org, Linux-OMAP <linux-omap@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Christian Marangi <ansuelsmth@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, kernel@dh-electronics.com, Krzysztof Kozlowski <krzk+dt@kernel.org>, "linux-oxnas@groups.io" <linux-oxnas@groups.io
 >
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, May 9, 2023 at 4:55=E2=80=AFPM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:
>
> On Tue, May 02, 2023 at 02:40:19PM -0500, Rob Herring wrote:
> [...]
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
> [...]
> >     'aspeed' : 'aspeed',
> >     'ast2' : 'aspeed',
> >     'facebook' : 'aspeed',
> >     'ibm' : 'aspeed',
>
> >     'openbmc' : 'aspeed',
>
> The openbmc flash layouts are currently only used by aspeed devicetrees,
> but they don't really depend on any aspeed details. It would be possible
> to reuse them in Nuvoton BMC devicetrees in the future, for example.
>
> In that sense, I think putting them in a separate "openbmc" directory
> would be slightly better.

Could be used on arm64 or riscv too at some point. We do some cross
arch includes, but IMO it would be better to move to
include/dt-bindings/ or somewhere outside of arch/. Other common
things I didn't move. I could do that here too. I prefer to that the
sub-directories are just chip vendors/families.

Rob
