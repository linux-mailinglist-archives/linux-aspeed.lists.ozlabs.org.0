Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A2A6F6042
	for <lists+linux-aspeed@lfdr.de>; Wed,  3 May 2023 22:40:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QBTNR5kmpz3cd4
	for <lists+linux-aspeed@lfdr.de>; Thu,  4 May 2023 06:40:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PpH7MTH5;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b29; helo=mail-yb1-xb29.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PpH7MTH5;
	dkim-atps=neutral
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QBTND1Qf4z3cCC
	for <linux-aspeed@lists.ozlabs.org>; Thu,  4 May 2023 06:40:10 +1000 (AEST)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-b9a6eec8611so5624806276.0
        for <linux-aspeed@lists.ozlabs.org>; Wed, 03 May 2023 13:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683146408; x=1685738408;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hgRsKnqFosP21nRhvJTwDb+9jWUZ4oTCBD+B9SUv1+c=;
        b=PpH7MTH5m9dkyEXVIA4ICZkEIVn6fbuhrX3P1BdP3if0uOROgJ2F72A2yUx7yz3sXS
         HWtVkM2kQYKv0Z/8qhzueuBS50AQOyk7K3BJwxgGieroePKE8eXjAn/Rs2ABvHBf1Ijz
         U1P79PfFgwkyyx9FoqJJyXG0FJZj0hjbpTgXC89JzuVKxRrHt/Ymllp9Jk2sJJ4tWbfw
         y4m4tu9rb4QhSiyNaqi6I7vrNrgcUZvWsj2crRyd3wJnXlNcu8YGFm5WF58h1WRW0V1s
         LqLygvOy2n4JrcJ0Gc4Jwlxu7AuH88CzuoSB7p+d0z+N11Z8y9Tc5gacDsefTGoZl+E/
         SfdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683146408; x=1685738408;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hgRsKnqFosP21nRhvJTwDb+9jWUZ4oTCBD+B9SUv1+c=;
        b=eDF2M7aIJIMZ/BTXuBqKOWfDIU2dRS4rGRk/CvqnQcHtjHlm3czIZcCj7t/cFNTy2A
         twbpg+cR/NTkhL+16HD0cyqHAXqHL7Zu25LLtjAiYpQO9jINou52kpyoIDiQCA18GQ1Q
         4h+zx7NztTPTSUZfSkdu8fSTZPRQqfah3ajJskwswq+7Bbg4iSHreth4WA5rF/gbun01
         j8e91F5/DWFx9TH8MLIRRMcCoHWzJR28vVCNaaHAFRTAOMf//f6mBPpRHQ463aNPlGgm
         YdZ3Rubc3YXWP0+NdAytsSvaxppF6+R1OFf8JlsS2KTcpKCKd8x7Yl0BF1mPW62ZE9Mq
         Qp5Q==
X-Gm-Message-State: AC+VfDy057Tj4wPB/gtWMp4ZBH6GyQ5grK3T0NuIi0iQZwuyCNo2RWd+
	UlV7sApF6/14DBebKxllB5PnQgz4RcSdVQSzMMh1vg==
X-Google-Smtp-Source: ACHHUZ504wPVYlURitbUXR0w6GF5Hd5chFJsuF27bLfRTjvW8/vWf4wN9zc7VHWrnnoXqNvPfLtTOnqfU50Ll8hIGF4=
X-Received: by 2002:a25:656:0:b0:b25:a1e1:5b65 with SMTP id
 83-20020a250656000000b00b25a1e15b65mr3778724ybg.5.1683146407758; Wed, 03 May
 2023 13:40:07 -0700 (PDT)
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
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 3 May 2023 22:39:55 +0200
Message-ID: <CACRpkdZBFqhoK7WhERX8yfBHL8kxYqnOZGgBCcWaHpT8qB2S4Q@mail.gmail.com>
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
Cc: linux-aspeed@lists.ozlabs.org, linux-realtek-soc@lists.infradead.org, linux-arm-kernel@axis.com, linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org, openbmc@lists.ozlabs.org, Krzysztof Kozlowski <krzk@kernel.org>, linux-rockchip@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org, Linux-OMAP <linux-omap@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, linux-kernel@vger.kernel.org, Christian Marangi <ansuelsmth@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, kernel@dh-electronics.com, Krzysztof Kozlowski <krzk+dt@kernel.o
 rg>, "linux-oxnas@groups.io" <linux-oxnas@groups.io>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, May 3, 2023 at 10:37=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
> On Wed, May 3, 2023, at 15:16, Rob Herring wrote:
>
> > We could do a second level of directories here:
>
> Works for me, but at that point, I'd really also want to do it
> for nxp with its five or more product lines (mxs, imx, lpc,
> s32, layerscape, vybrid)
>
> > intel/pxa/
> > intel/ixp/
> > intel/socfpga/
>
> and intel/axxia I guess.

This looks neat. I like it.

Yours,
Linus Walleij
