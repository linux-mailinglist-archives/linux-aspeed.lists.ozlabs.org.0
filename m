Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D38F2B49
	for <lists+linux-aspeed@lfdr.de>; Thu,  7 Nov 2019 10:49:00 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477zBK6KPTzDr0f
	for <lists+linux-aspeed@lfdr.de>; Thu,  7 Nov 2019 20:48:57 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::241;
 helo=mail-lj1-x241.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="aR0m+nKj"; 
 dkim-atps=neutral
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477xDJ36TKzF5kL
 for <linux-aspeed@lists.ozlabs.org>; Thu,  7 Nov 2019 19:20:31 +1100 (AEDT)
Received: by mail-lj1-x241.google.com with SMTP id e9so1183916ljp.13
 for <linux-aspeed@lists.ozlabs.org>; Thu, 07 Nov 2019 00:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DlF4imC2yuisAQo2SgUCy1P9SylqUN75hyqh76y3GuU=;
 b=aR0m+nKjgA8feFlTBlwL84cE9daL5eeq25n5+TiO9llQb9TsmGAwBzMrydUeOVpqcd
 G/NOnRqUmqV9FDnFABUvFStxGmc4lYiT1CO71XxvWX8QHiG+QuYeULshpCobKFsWAsYm
 tdhQ8t6991g/IUrvBhXPOW8BhPBS86zZJGQOc82tWlYl1GOQvr9MTGWvpPLFiIeR9lEr
 foMt76rS4g+F3J5BvZ1hmIknazOLP6jdC15sbiF4dtMlHzvLlDlwdEVWxYVkVYDLBy/H
 2YD/40djhB6z1791duVFLnjNJBICD/pXuSn9Wyozo1Bsi0Bqg8js/iowtRmXORd7WJzi
 n1iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DlF4imC2yuisAQo2SgUCy1P9SylqUN75hyqh76y3GuU=;
 b=SmQ3UWEpzQUzHwypy6CI2YBVM3+gppxbF1z4v1Lr4UyOB8rJ/2juC1AbwWV8JTo1B1
 1ONPwn1JrUUTGalzXS8TH+T9h5ZS0EJvAqYAVF/CrTS2ACo0VQZhgzPvhPnPIx2WxgC6
 pA+MXQHr2yKjF1ayJr2n1/e4uus68aUZK07JVcIW37UAQ9+eDPBwNWDX1g+WV9ZrldXY
 NZc5+tB9nepCrWIBvEohPjSns50BxexITSX3RL4N0PYTI/f5kjwf44ZA4Zbc8o4LNF24
 m6fMQ+ozFgs0GfxoQyq2Ap5D7OrO2N9TpA783rHvHGqAfTOUwPY0ggaupjkSe5uCd5tk
 LyCA==
X-Gm-Message-State: APjAAAXO+XMiofO/SqpKCunF/Rmm8fxuq/waygfcs8zBWGvDQWw4y7vL
 DByJZUBWaYtDuEZg6MZqnb6Hieg7GXWth9/tEEPMlQ==
X-Google-Smtp-Source: APXvYqxJbhcWq+G1f8Jk5lv3i720/gVAo6L3L+y4Wi2RhTUP1I1SjMgB/XswEKoQSm7d2gl5jZMd4ClfaG2HxTvfJoQ=
X-Received: by 2002:a05:651c:1202:: with SMTP id
 i2mr1417186lja.218.1573114826673; 
 Thu, 07 Nov 2019 00:20:26 -0800 (PST)
MIME-Version: 1.0
References: <cover.1573029228.git.matti.vaittinen@fi.rohmeurope.com>
 <fcd51b067bafa571b3d9879a3afc31e8c764100d.1573029228.git.matti.vaittinen@fi.rohmeurope.com>
In-Reply-To: <fcd51b067bafa571b3d9879a3afc31e8c764100d.1573029228.git.matti.vaittinen@fi.rohmeurope.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 7 Nov 2019 09:20:15 +0100
Message-ID: <CACRpkdZm823gEkpw8hYfuLp99ssKtGQMcEcZHC34xd2kQPYH-A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] gpio: Add definition for GPIO direction
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
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
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 David Daney <david.daney@cavium.com>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Peter Tyser <ptyser@xes-inc.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Kevin Hilman <khilman@kernel.org>,
 Michal Simek <michal.simek@xilinx.com>, Marek Behun <marek.behun@nic.cz>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Bamvor Jian Zhang <bamv2005@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 linux-pwm@vger.kernel.org, Grygorii Strashko <grygorii.strashko@ti.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 Matti Vaittinen <mazziesaccount@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, linux-tegra@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Scott Branden <sbranden@broadcom.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, "Enrico Weigelt,
 metux IT consult" <info@metux.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Thorsten Scherer <t.scherer@eckelmann.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, patches@opensource.cirrus.com,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Nov 6, 2019 at 9:51 AM Matti Vaittinen
<matti.vaittinen@fi.rohmeurope.com> wrote:

> At least for me it is difficult to remember the meaning of GPIO
> direction values. Define GPIO_LINE_DIRECTION_IN and
> GPIO_LINE_DIRECTION_OUT so that occasional GPIO contributors would
> not need to always check the meaning of hard coded values 1 and 0.
>
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>

Patch applied.

Yours,
Linus Walleij
