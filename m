Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 204496F4C35
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 May 2023 23:28:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q9tTv6d9Kz3cCm
	for <lists+linux-aspeed@lfdr.de>; Wed,  3 May 2023 07:28:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QeycS2K3;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QeycS2K3;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q9tTn3H8qz3c46;
	Wed,  3 May 2023 07:27:57 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 08F62621E5;
	Tue,  2 May 2023 21:27:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ED51C433AC;
	Tue,  2 May 2023 21:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683062874;
	bh=jCPU9c2wabBAGUXBx0w4fzzWZn23Up45NdgJcoiuHoA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QeycS2K3ewctYzTEloVu2+psY1yqWMXDLYjl/hvzEsuI/rCoQyIWWrcInlG2NU5Vt
	 ZhiIh1MtTKjd9pFeckk+tiJy1vVp29OFdMTgDcx/WJ8LIp4BhfJ3MXtCJQAtf7GADC
	 ZJdBo0RViTWUfEfA3DXuXjn1fFMM3XfEJZyZ5wmhns7RNVlUIWAnXy7ypOpLvEIpYJ
	 r4LQxZKMQxJG/FTUbYhGjyuF3Mv044AWIzcT07DI6ofTS/0sY0cUV9ehQof2sSRQE/
	 DSdSrQeAczbNO8taFydoCq3ou1kt6VgqPZ91Zx6Dw9OIFvc9BxWvsfCMDi0PxjaTpH
	 o/TXDp3yhtUmA==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2a7b02615f1so44664821fa.0;
        Tue, 02 May 2023 14:27:53 -0700 (PDT)
X-Gm-Message-State: AC+VfDwtvCKpeTUXuOCuevLdZ+BGre3F05HjkufphCK+5rh8BRqAT8Hh
	XZqKgDZ+QIBz2ujvX8zAPQ+L/pGIeF/aNjy8PQ==
X-Google-Smtp-Source: ACHHUZ4VmzJ58Blp8vkFEMpnZTP3rUtg0aygjDIMYeTMpSWAwJvPoANOd1LtrOl749GRPWYY5WO4jHHB7hvvVyp4ngc=
X-Received: by 2002:a2e:860b:0:b0:2a8:bb99:250d with SMTP id
 a11-20020a2e860b000000b002a8bb99250dmr5156347lji.6.1683062871907; Tue, 02 May
 2023 14:27:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220328000915.15041-1-ansuelsmth@gmail.com> <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain> <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
 <720a2829-b6b5-411c-ac69-9a53e881f48d@app.fastmail.com> <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
 <CACRpkdZx6vEVnxVt0tW4nYtnbv8g=Dc11sa_3myB3GW4jXk1oA@mail.gmail.com>
In-Reply-To: <CACRpkdZx6vEVnxVt0tW4nYtnbv8g=Dc11sa_3myB3GW4jXk1oA@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 2 May 2023 16:27:39 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKzof_mYRw9Dd0YAVWr1AFoO8gwkVUR22AJX_RF2xv0aA@mail.gmail.com>
Message-ID: <CAL_JsqKzof_mYRw9Dd0YAVWr1AFoO8gwkVUR22AJX_RF2xv0aA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
To: Linus Walleij <linus.walleij@linaro.org>
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

On Tue, May 2, 2023 at 4:19=E2=80=AFPM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> On Tue, May 2, 2023 at 9:40=E2=80=AFPM Rob Herring <robh+dt@kernel.org> w=
rote:
>
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
>
> I see my nits were fixed like I wanted them, and it's now mostly a
> mix of soc and vendor names that make sense so from my point of view:
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>
> NB:
> arch/arm64/boot/dts/arm$
> vexpress-v2m-rs1.dtsi -> ../../../../arm/boot/dts/vexpress-v2m-rs1.dtsi
>
> This still works after the script, yes?

Yes, because in the script I do:

git grep -l -F "vexpress-v2m-rs1" arch/arm64/boot/dts | xargs perl -p
-i -e "s/vexpress-v2m-rs1/arm\/arm\/vexpress-v2m-rs1/"

Rob
