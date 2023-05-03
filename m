Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E8A6F6143
	for <lists+linux-aspeed@lfdr.de>; Thu,  4 May 2023 00:23:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QBWgW6XDMz3cLT
	for <lists+linux-aspeed@lfdr.de>; Thu,  4 May 2023 08:23:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gyKS6Mtt;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gyKS6Mtt;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QBWff1wF4z3cfh;
	Thu,  4 May 2023 08:22:50 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AC9146305B;
	Wed,  3 May 2023 22:22:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19337C4339C;
	Wed,  3 May 2023 22:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683152567;
	bh=3fU8zKQCl4Kz1eWXPpHONjdIQH2Taxo8c7rFXpP8al8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gyKS6MttCNtMBfY1UbH64Gxs+WPEh98Gt6OT01M40SteIWEK5rSEDwur1RaXFO+KB
	 k1tdcAAsc2c2rzXvd1weeyyawHuQ8Lq59qhupvTSHCEywGQVnNLirhUV5LFKBX8xed
	 l0/UGIQ3CmVjXekItREFnJAzg+8iaG+wi29nNBk6X2ZIHAF+OpORY7hcZEXw8ggyI7
	 lqhuUpVxEH1ffbseQZUFxUdR9etC+52u7eYE9GhWMkOLouRSZWF2P5Zy0o7/nRvHLU
	 sdqmfLYRY9trzvPKYYsZ5exHv0HiJ28pGmOXf1C9Ug/qGMH9We/64sSgv1jQPsw+Ts
	 HEEttqKJrWkpw==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2a7af0cb2e6so59882811fa.0;
        Wed, 03 May 2023 15:22:46 -0700 (PDT)
X-Gm-Message-State: AC+VfDymvILlDJjw37OC8l/Yuf+2Hz70YM+4kA7Fdp9R+rWO5j2OodTt
	0Hr0YG5Pwk9XQt5POmQxFJ97hTyE2VkrsoyZDA==
X-Google-Smtp-Source: ACHHUZ7HeoGV7sGaLAr5Tc+TosYIxgwnkvp5ZEsh8Jj7wpXuo0FJb1Bm44GqyVTuGr9wlxbZQ+2RYfnrH8bg8TYUOtU=
X-Received: by 2002:a19:ee03:0:b0:4ea:fa26:2378 with SMTP id
 g3-20020a19ee03000000b004eafa262378mr1222041lfb.23.1683152565137; Wed, 03 May
 2023 15:22:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220328000915.15041-1-ansuelsmth@gmail.com> <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain> <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
 <720a2829-b6b5-411c-ac69-9a53e881f48d@app.fastmail.com> <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
 <bce93654-fc36-3d12-282d-76fafb8f51ce@linaro.org> <CAL_JsqJXd_EpOQwwNEAn25mzFfkhEvqzur6ui5Ca+dbt2kA8-Q@mail.gmail.com>
 <5e318b02-8f33-4e2d-a956-5660e1c60619@app.fastmail.com> <CAA8EJpq8x5wQa3fMebaSP3hCdMiCsZRaF+B4Y3N3royW_CeXCA@mail.gmail.com>
 <4e1e70a9-9b28-410b-bd29-fb5f5805798f@app.fastmail.com> <CAL_JsqJEdZBS231TvkmmipaXEqzvDjz+A32V6uJ4zfSMAJHn2w@mail.gmail.com>
 <4d9b4159-88b2-48cf-84d9-34169928c8e4@app.fastmail.com>
In-Reply-To: <4d9b4159-88b2-48cf-84d9-34169928c8e4@app.fastmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 3 May 2023 17:22:32 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLi+h3E8wEjuzjdh-VhWac8VJAfBeAKAHMny=gg=-OQgQ@mail.gmail.com>
Message-ID: <CAL_JsqLi+h3E8wEjuzjdh-VhWac8VJAfBeAKAHMny=gg=-OQgQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
To: Arnd Bergmann <arnd@arndb.de>
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
Cc: linux-aspeed@lists.ozlabs.org, linux-realtek-soc@lists.infradead.org, linux-arm-kernel@axis.com, linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org, openbmc@lists.ozlabs.org, Krzysztof Kozlowski <krzk@kernel.org>, linux-rockchip@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org, Linux-OMAP <linux-omap@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, linux-kernel@vger.kernel.org, Christian Marangi <ansuelsmth@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, kernel@dh-electronics.com, Krzysztof Kozlowski <krzk+dt@kernel.org>, "linux-oxnas@groups.io" <linu
 x-oxnas@groups.io>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, May 3, 2023 at 3:37=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Wed, May 3, 2023, at 15:16, Rob Herring wrote:
>
> > We could do a second level of directories here:
>
> Works for me, but at that point, I'd really also want to do it
> for nxp with its five or more product lines (mxs, imx, lpc,
> s32, layerscape, vybrid)

And marvell, microchip(lan96), ti, and broadcom probably. I think I
withdraw my suggestion...

Rob
