Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CD56F95AA
	for <lists+linux-aspeed@lfdr.de>; Sun,  7 May 2023 02:36:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QDQT52YPXz3bbP
	for <lists+linux-aspeed@lfdr.de>; Sun,  7 May 2023 10:36:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=w24SJl1j;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::112b; helo=mail-yw1-x112b.google.com; envelope-from=dmitry.baryshkov@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=w24SJl1j;
	dkim-atps=neutral
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QBG8D40L5z3bnM
	for <linux-aspeed@lists.ozlabs.org>; Wed,  3 May 2023 22:14:02 +1000 (AEST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-55af4277904so16148307b3.1
        for <linux-aspeed@lists.ozlabs.org>; Wed, 03 May 2023 05:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683116031; x=1685708031;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HLFpTw4Opsx0SIhXDBcwLEPI4lObbahA52WBgGIUVsM=;
        b=w24SJl1jEsx1dsysGc/JqXn8TRE0UMobpr8S9T3y+gEnR/nI+CHCSx5trFpTNAVCVG
         8XS7YABKoVXwdqhydgmtWe9LQJJ7LBPnr1fCtb0rshbAxTDbaTU+5U0WNdSypx0SKblE
         0CP6meVuOVDCtCX96ONGJ58N4h4LCh6KY7HQXwOPLcftT7CWUqTxxZHaVMF/ygVuJ3xU
         KtX9ixUBAF79tkLLjx9Hg+1rarQ5Su54dehEmdGZNBkbkoufEbwweYd9rnB2Q94mEjKe
         bYeSIwtnrv7tEjxTeB2h1XUenyGb9cWojKfDEo4AC69c880iPhtph2axVQ7WlTkbXxO7
         +S+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683116031; x=1685708031;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HLFpTw4Opsx0SIhXDBcwLEPI4lObbahA52WBgGIUVsM=;
        b=kQgeGg16L1SHJXUKoiX4wk6W1xLEMyPbs4opamoTOFLpub1KFWrn3XF/FaHyoWKUoH
         aztQ8MRX/slVmwTgUEyXvM7KS7vHDwhPsDbWKW3ys2wjB2FzKZXTpBS4PV8vlC7DENVo
         txQZnAV4I1y/dkCYcpdTciKcXCHdgOyM4sfjkzHGW7kxmSIY0XbyhakVD56vW8ZaTO1l
         z7xbucoMVYCfVfp2xvyW90hE35FkLb3k9I4D3EK/K/8esF7+ccK5V6wE9uGznFu5VXX9
         yEdxqPHyjqqlW6PxONhAK5xvlJ7bv6LO/bmfAuPPQ9f1tH5vHRSoDEBXT5QClQgoIO3s
         PElw==
X-Gm-Message-State: AC+VfDxn1RFEzrnYlMZw3aqzj6fjjjzn9L+0QIEqEgF+u4j7ESl9eOLQ
	MVXsh/1pYx6c6dA2eMh70KPKEAJBkr7ew6V9yUDmFg==
X-Google-Smtp-Source: ACHHUZ66hRgZLiqP0HgNywmuyEJNjQjxpzuYU/Ewr0nLiWAs/k7+ydf4eMIyKQKo0mpz4nSzQd/diYDGzmnUCVXeNlI=
X-Received: by 2002:a81:4f04:0:b0:54f:ddb9:95e7 with SMTP id
 d4-20020a814f04000000b0054fddb995e7mr20136923ywb.34.1683116031053; Wed, 03
 May 2023 05:13:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220328000915.15041-1-ansuelsmth@gmail.com> <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain> <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
 <720a2829-b6b5-411c-ac69-9a53e881f48d@app.fastmail.com> <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
 <bce93654-fc36-3d12-282d-76fafb8f51ce@linaro.org> <CAL_JsqJXd_EpOQwwNEAn25mzFfkhEvqzur6ui5Ca+dbt2kA8-Q@mail.gmail.com>
 <5e318b02-8f33-4e2d-a956-5660e1c60619@app.fastmail.com>
In-Reply-To: <5e318b02-8f33-4e2d-a956-5660e1c60619@app.fastmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 3 May 2023 15:13:39 +0300
Message-ID: <CAA8EJpq8x5wQa3fMebaSP3hCdMiCsZRaF+B4Y3N3royW_CeXCA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
To: Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sun, 07 May 2023 10:35:52 +1000
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
Cc: linux-aspeed@lists.ozlabs.org, linux-realtek-soc@lists.infradead.org, linux-arm-kernel@axis.com, linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org, openbmc@lists.ozlabs.org, Krzysztof Kozlowski <krzk@kernel.org>, linux-rockchip@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org, linux-unisoc@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org, Linux-OMAP <linux-omap@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Christian Marangi <ansuelsmth@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, kernel@dh-electronics.com, Krzysztof Kozlowski <krzk+dt@kernel.org>, "linux-oxnas@groups.io" <linux-oxnas@groups
 .io>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 3 May 2023 at 13:39, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Wed, May 3, 2023, at 03:17, Rob Herring wrote:
> > On Tue, May 2, 2023 at 5:52=E2=80=AFPM Dmitry Baryshkov <dmitry.baryshk=
ov@linaro.org> wrote:
> >> On 02/05/2023 22:40, Rob Herring wrote:
> >> >      'berlin' : 'berlin',
> >> >      'pxa2' : 'pxa',
> >> >      'pxa3' : 'pxa',
> >> >      'pxa' : 'marvell',
> >>
> >> I'd question if it makes sense to split the pxa line. Yes, it was sold
> >> by Intel to Marvell, but IIRC the devices still had some inheritance.
> >> So, if we have the 'pxa' subdir, I'd move Marvell PXAs to that dir too=
.
> >
> > I think I probably split it because it was different maintainers.
> > Though it doesn't look like pxa168 or pxa910 have any maintainer. They
> > are a mixture of pxa and mmp I think.
>
> I think the original split here is probably the best we can do,
> but there is no good way to do it because of the confusing naming
> and the problem that there is no clear line between pxa and mmp.
> As far as I can tell, the release timeline was:
>
> Intel pxa2xx (mach-pxa, xscale, still exists)
> Intel pxa3xx (mach-pxa, xscale, still exists)
> Intel pxa90x (never merged)
> Marvell pxa93x (mach-pxa, xscale, removed in Linux-6.3, no DT)
> Marvell pxa92x (never merged)
> Marvell pxa91x (mach-mmp, pj1, still exists)
> Marvell pxa168 (mach-mmp, pj1, still exists)
> Marvell pxa95x (mach-pxa, pj4, long gone)
> Marvell pxa688 (mach-mmp, pj4, known as mmp2)
>
> So with pxa93x out of the picture, we can simplify it as using
> 'pxa' as the name for all the above chips with an Intel XScale
> core, and 'marvell' for all the other ones that have a Marvell
> core and exist in mach-mmp.

Should it be 'intel' for pxa[23]xx then?

>
>      Arnd



--=20
With best wishes
Dmitry
