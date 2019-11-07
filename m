Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4DBF2B4A
	for <lists+linux-aspeed@lfdr.de>; Thu,  7 Nov 2019 10:49:07 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477zBR4CyRzF6Jy
	for <lists+linux-aspeed@lfdr.de>; Thu,  7 Nov 2019 20:49:03 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::142;
 helo=mail-lf1-x142.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="aihVYo6v"; 
 dkim-atps=neutral
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477xGz38gzzF5xM
 for <linux-aspeed@lists.ozlabs.org>; Thu,  7 Nov 2019 19:22:51 +1100 (AEDT)
Received: by mail-lf1-x142.google.com with SMTP id m6so906655lfl.3
 for <linux-aspeed@lists.ozlabs.org>; Thu, 07 Nov 2019 00:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W1kMVjXy8TfTB/av4qsnw1G4ZHclSRdrlLtTCyTAB3g=;
 b=aihVYo6vGJcSeMzZA2gHQagzuZuVYL80Tl8HsV3o3LI/DBg/S5MVPTitfm7pDFAG6E
 KU7Z1uXIrrxA5+r3lGKAenb9vmOH8pAHta+z2HuVGSB9kZOdz5AgkNdvAbRde2xOvpoT
 UzS8yGbMFd4DKYtsb3RNUpUElWYw56B6yCUzHCngiVaTKGxNs8EmIs8SqB757Vwf7VCX
 fwVEWkW6ZJ96L32Zj0dhvc0ujr2loUfyfL3PJK2DRlar2WzaN4hH3/gqSQ4Ye2vE2W10
 yDUxaSTMoU4hyrN/yWNS9R4ldaKnokRAtrRVSfZzc1jrl3LQMW5QsT76aHAI4spwff8o
 FNFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W1kMVjXy8TfTB/av4qsnw1G4ZHclSRdrlLtTCyTAB3g=;
 b=oBB5gAeXJp7L2ZJxdvCkyc3lYQpd1IhSUjngXdI7/mFzngn2dT5vLuPOECfjJLUXII
 +O8tGHdOmFD+z43tp7UKDG6s3bgVerF3dGOKw0kv+EBoP6jAIhDNLh+mAmS42mhY6u70
 O07IFsROkkC9V0aJ+FIO/9H3TXgGue43LeFuzCeK2HrTAs4DfIntUyFmnqdEKnD+Rt3b
 iJt0yAs88l4UlL5Uoz1OQ/HWEeLH+1NGgPnTRXjKeQgWtQVnI3h+QWzNs1DDw6vT3Rj/
 aNdufAZjInNEWHto6+vaX0bAsxBlTZ6EuqwXIhTAawDC9jLxTulNzHMKTSu3Csfmb6ke
 VC+g==
X-Gm-Message-State: APjAAAVQ0p3SZ60ibV7T3Q5AvCeDOUYKN6X8HEzsuKb7G/zwcX0N0/KP
 nxZSf/MTQxylupg252ufVZ4MHu3XIJTV9x5EYCL+Gg==
X-Google-Smtp-Source: APXvYqy/AiAWlfAU/KnMLcnvlDO6zbO8H2HQsF3Z0XznPUZPaxE+dGbrTI9u/vdRHxraIochQ2FKHYEfNic+fopaYJs=
X-Received: by 2002:a19:ca13:: with SMTP id a19mr1415050lfg.133.1573114966856; 
 Thu, 07 Nov 2019 00:22:46 -0800 (PST)
MIME-Version: 1.0
References: <cover.1573029228.git.matti.vaittinen@fi.rohmeurope.com>
 <20191106120846.5bunrqj3uz4khih5@earth.universe>
 <ddcd02cc6c709837a28cae2cbfa672c506927659.camel@fi.rohmeurope.com>
In-Reply-To: <ddcd02cc6c709837a28cae2cbfa672c506927659.camel@fi.rohmeurope.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 7 Nov 2019 09:22:35 +0100
Message-ID: <CACRpkdbaRsv+cKz7yxKxvs+99GRK50-d_kpKcdVn3NVV9Qr6Ng@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add definition for GPIO direction
To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 07 Nov 2019 20:47:02 +1100
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "david.daney@cavium.com" <david.daney@cavium.com>,
 "sathyanarayanan.kuppuswamy@linux.intel.com"
 <sathyanarayanan.kuppuswamy@linux.intel.com>,
 "sre@kernel.org" <sre@kernel.org>, "ptyser@xes-inc.com" <ptyser@xes-inc.com>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "marek.behun@nic.cz" <marek.behun@nic.cz>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>,
 "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
 "khilman@kernel.org" <khilman@kernel.org>,
 "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
 "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
 "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "bamv2005@gmail.com" <bamv2005@gmail.com>,
 "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>,
 "linux-imx@nxp.com" <linux-imx@nxp.com>,
 "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 "grygorii.strashko@ti.com" <grygorii.strashko@ti.com>,
 "ckeepax@opensource.cirrus.com" <ckeepax@opensource.cirrus.com>,
 "alexandre.torgue@st.com" <alexandre.torgue@st.com>,
 "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
 "rjui@broadcom.com" <rjui@broadcom.com>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "vilhelm.gray@gmail.com" <vilhelm.gray@gmail.com>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "rf@opensource.cirrus.com" <rf@opensource.cirrus.com>,
 "ssantosh@kernel.org" <ssantosh@kernel.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "sbranden@broadcom.com" <sbranden@broadcom.com>,
 "yamada.masahiro@socionext.com" <yamada.masahiro@socionext.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "t.scherer@eckelmann.de" <t.scherer@eckelmann.de>,
 "ludovic.desroches@microchip.com" <ludovic.desroches@microchip.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 "info@metux.net" <info@metux.net>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Nov 6, 2019 at 1:25 PM Vaittinen, Matti
<Matti.Vaittinen@fi.rohmeurope.com> wrote:
> On Wed, 2019-11-06 at 13:08 +0100, Sebastian Reichel wrote:
> > On Wed, Nov 06, 2019 at 10:51:06AM +0200, Matti Vaittinen wrote:
> > > The patch series adds definitions for GPIO line directions.
> > >
> > > For occasional GPIO contributor like me it is always a pain to
> > > remember
> > > whether 1 or 0 was used for GPIO direction INPUT/OUTPUT.
> >
> > Maybe also update the GPIO drivers in pinctrl?
(...)
> Ouch. I didn't check from pinctrl but I see those should be converted
> as well. I'm a bit short on time right now so if anyone else is
> interested I won't mind :)
>
> Luckily the value for IN and OUT is not changed - only the defines were
> added - so all of the drivers do not need to be done at once. If no one
> else will take the pinctrl part then I can probably do pinctrl patches
> for v5.6 cycle.

No hurry with that. This is a good start, we don't have to fix
the whole world at once.

Let's look at this for v5.6.

Yours,
Linus Walleij
