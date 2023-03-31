Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD566D55D1
	for <lists+linux-aspeed@lfdr.de>; Tue,  4 Apr 2023 03:22:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pr93R4MwXz3cLF
	for <lists+linux-aspeed@lfdr.de>; Tue,  4 Apr 2023 11:22:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZMrC7RQQ;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::1129; helo=mail-yw1-x1129.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZMrC7RQQ;
	dkim-atps=neutral
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pp0Df1yfMz3cFY
	for <linux-aspeed@lists.ozlabs.org>; Fri, 31 Mar 2023 23:37:37 +1100 (AEDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-5463fa0c2bfso81726387b3.1
        for <linux-aspeed@lists.ozlabs.org>; Fri, 31 Mar 2023 05:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680266252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E6lKdgk6THqQzNp4VvxVKewKaHaWOnEhQknxk2acjn0=;
        b=ZMrC7RQQSpVfgy/SHMpfC+E2QpLMDaY5/yaDkSHUKYAESGTlYtEL7g/qRUeknQy91P
         zUvgfNL0L6h3FNfh9c8D2HFAFVYOCP9WG625XToYyxYEiXALrCS5KsLDkaIeSbXlXde1
         eg6UEhsSIBdX6MmhPhtTRLpJ9X4gdd+QI1NZNQSGtPnmNcH0Md5Wv/wDx/8mZJzSNT7K
         vAZIJkR9VzoIqc5aO0g4o0xB+IpDOheOKDhB6ttu5EMPirHAV26dyaOz/pB9Dw1cQhWl
         Nw5HjfOlvF3F0OheAjfDdZPbDekSVJ+CefyXJevdAGQrjbRZSi8YsUnd1+evdQw6Mb3h
         4YIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680266252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E6lKdgk6THqQzNp4VvxVKewKaHaWOnEhQknxk2acjn0=;
        b=rsM7j9lEJVRmcuMyTfTlmg6YcK/CutzDVnGlEiGI8fRr6w/RQZxDSrUO0sSDBKj6ou
         Y87GwTsnhZoR6YYcVseeE32Cwi+G9pqVkYZfrp2WKxavQbTHOBta6VaTRGlVcguDZaSD
         4IQFTfJeJzHeuFQNofQNt5kfiOTqAM4IsOxornIsSEU2MBW6Z3wGorZq+rrVFuSV95dT
         RTPAMsLlD39V4XXLUpEzUTsGzQVPQtt202ZmSb7PEwg+rlfErxhoXfAWqGzEVcIaRxGq
         NuuhVXvAaBLhA2fbphw+JaKCB1Xuiz02FTo8S64aRPHNcf5YB4LnuPwcQ6m4IgFAm+0E
         oXfA==
X-Gm-Message-State: AAQBX9enK3URGHbu1Lo6kR3ThNIFth8obxrcAzZC4RkP+u6tlk0xxhUX
	mFGFwvg+Rq0gCGOJbeglkZv1oZKDJbJYBGUZUejdyQ==
X-Google-Smtp-Source: AKy350aQG4pTb9063C5UpGPTZlWu/1jB1S9bOfbEf1bci1cyW8YxugalTaCiIXNAm4RWMBbCrWxYKS+tBxFA+9FzOXI=
X-Received: by 2002:a81:c84a:0:b0:541:753d:32f9 with SMTP id
 k10-20020a81c84a000000b00541753d32f9mr13384037ywl.9.1680266252481; Fri, 31
 Mar 2023 05:37:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230330200402.2731992-1-robh@kernel.org>
In-Reply-To: <20230330200402.2731992-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 31 Mar 2023 14:37:21 +0200
Message-ID: <CACRpkdYwM5Kw4XB9S5qoqdK-boiYp2iu=LRZ-B-vJb1k9fNnig@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: pinctrl: Drop unneeded quotes
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 04 Apr 2023 11:22:08 +1000
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
Cc: Drew Fustini <drew@beagleboard.org>, Peng Fan <peng.fan@nxp.com>, =?UTF-8?Q?Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>, Jacky Bai <ping.bai@nxp.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Tomasz Figa <tomasz.figa@gmail.com>, Cristian Ciocaltea <cristian.ciocaltea@gmail.com>, Paul Cercueil <paul@crapouillou.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, Chris Brandt <chris.brandt@renesas.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jonas Gorski <jonas.gorski@gmail.com>, asahi@lists.linux.dev, Sylwester Nawrocki <s.nawrocki@samsung.com>, Fabio Estevam <festevam@gmail.com>, Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Heiko Stuebner <heiko@sntech.de>, Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>, Mark Kettenis <kettenis@openbsd.org>, linux-samsung-soc@vger.kernel.org, Kunihiko Hayashi <hayashi.
 kunihiko@socionext.com>, linux-arm-kernel@lists.infradead.org, Samuel Holland <samuel@sholland.org>, Damien Le Moal <damien.lemoal@opensource.wdc.com>, Manivannan Sadhasivam <mani@kernel.org>, Michal Simek <michal.simek@xilinx.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, openbmc@lists.ozlabs.org, linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>, linux-renesas-soc@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>, linux-sunxi@lists.linux.dev, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, Charles Keepax <ckeepax@opensource.cirrus.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, alsa-devel@alsa-project.org, Sven Peter <sven@svenpeter.dev>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linux-actions@lists.infradead.org, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Maxime Ripard <mripard@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-gpio@vger.kernel.org, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, Chris Packham <chris.packham@alliedtelesis.co.nz>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Gareth Williams <gareth.williams.jx@renesas.com>, Patrick Rudolph <patrick.rudolph@9elements.com>, Lars Povlsen <lars.povlsen@microchip.com>, Dong Aisheng <aisheng.dong@nxp.com>, Neil Armstrong <neil.armstrong@linaro.org>, Damien Le Moal <damien.lemoal@wdc.com>, Phil Edworthy <phil.edworthy@renesas.com>, linux-aspeed@lists.ozlabs.org, Dvorkin Dmitry <dvorkin@tibbo.com>, Bjorn Andersson <andersson@kernel.org>, Hector Martin <marcan@marcan.st>, linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>, Jianlong Huang <jianlong.huang@starfivetech.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-riscv@lists.infradead.org, Jacopo Mondi <jacopo+renesas@jmondi.org>, Masami Hiramatsu <mhiramat@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, - <patches@opensour
 ce.cirrus.com>, Rahul Tanwar <rahul.tanwar@linux.intel.com>, Wells Lu <wellslutw@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, Shawn Guo <shawnguo@kernel.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Mar 30, 2023 at 10:05=E2=80=AFPM Rob Herring <robh@kernel.org> wrot=
e:

> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Acked-by: Hector Martin <marcan@marcan.st>
> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de> #rockchip
> Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> v2:
>  - Rebase on pinctrl tree

I applied it quickly before something else changes!

Thanks for respinning, and thanks as always for driving these changes.

Yours,
Linus Walleij
