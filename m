Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B169957951
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:57:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqJD40Csz3wTq
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:56:44 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SJVE7IGM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b31; helo=mail-yb1-xb31.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vnwfj1k9rz3g3y
	for <linux-aspeed@lists.ozlabs.org>; Mon, 27 May 2024 22:57:49 +1000 (AEST)
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-df4e5b89e49so5153619276.0
        for <linux-aspeed@lists.ozlabs.org>; Mon, 27 May 2024 05:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716814666; x=1717419466; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rNZ98tycbIm8gHCECF6fFAUqvVWA7Py4cjGRVlBtUzM=;
        b=SJVE7IGMQg46D654EVQR4jSJSWVnWelXFuHFsBXwhMmmJm9orI9Gs4atGRpiiuHLYg
         YND7rOGkliXFbS+L5iwTyt8PUJsCgv6j65u0R0VyT4gOP2156HnxHGPKvbxT9GfaO8T3
         LLHzPbWztM7iDAi3ZwA1Ev4T06dxOoYIyeKz4xRlQvDPwud1Ru12L96QAZUdsNi6RpqN
         XVMywg9F8OPTrHMm9Y7yHLlOk1Kw/u5gnhlc4w/yL7FIkDsbDRG7baqwbZKp6xds4n53
         L7f3SF9tmlmo0Xoh3kEGocKujwRaVvYGgP9J2tua8CLlHMCQvAdxHLsC8rltMFFiDhwV
         q3Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716814666; x=1717419466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rNZ98tycbIm8gHCECF6fFAUqvVWA7Py4cjGRVlBtUzM=;
        b=UQUjU3A4cwQomwfEdWVXOvy0q8OL24wK0NmW6npCob/oT/qnX3Go8dHX7gKl2XW3w7
         tPmNbOx8hMGH9vrZJzsPhIZE9hKCu8zxCvUyccznP4LG3wb14krq1a/NYh4/K3P6STMY
         rUAMEBorSCeuSsPQ2hJysfuBBEhRv9PNv7LU1mrGyyeq19siu8WplNignuCLAvh9rPVR
         RUg0AhN+AF3bcGs7XZlZWZpNW4mG1Bo8mVR8ZO2b4L1HPNT+eKxzI0tMNbJcp8k3yhWe
         jACHIVgUbPuuO53UCy8mjnIpnvX7TYV8i4qQ7RH5AjD4xZBKLssE84LQVZs/EflBrD05
         n4Fg==
X-Forwarded-Encrypted: i=1; AJvYcCUVXSKJqli5o3uieUz+T9N8CkfhFAQxpTAKLIK0MTGMZVY9tvyqsXobXXIrMdWfTzOvn3YosBumI93spl/2McqS8OaZLfL7CS+vJtYfpQ==
X-Gm-Message-State: AOJu0YylkM0Fob4RgGaUtyIrsqZsAFko1w//KgW7IkQEkr2ZXIg1PQqz
	ozmZha+6Yxu1W9Wsx4RxxeG++kd5ywllJg9BzmGRdtj8Zx0bfZytO/K9IzTlS+3opSBSSTijZNz
	1pmWw3uMjwSZdLs+BRcLiJypgPgLEf6GhO7Fq8A==
X-Google-Smtp-Source: AGHT+IGPHGbdeDgQwNEq4mWXFwTqV0k8iDBOK2TyTZ4utk5viKokv4dr91DnLp+C01zzJZrl1Jzg3NthvUqaC/NhrDk=
X-Received: by 2002:a05:6902:70a:b0:df7:9946:b32c with SMTP id
 3f1490d57ef6-df79946bc95mr6983978276.29.1716814666366; Mon, 27 May 2024
 05:57:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com> <20240504-pinctrl-cleanup-v2-8-26c5f2dc1181@nxp.com>
In-Reply-To: <20240504-pinctrl-cleanup-v2-8-26c5f2dc1181@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 May 2024 14:57:35 +0200
Message-ID: <CACRpkdbt0kE6VP3O+63U1rmJ_JKRvWENCnETT4f+mvNMMphLeA@mail.gmail.com>
Subject: Re: [PATCH v2 08/20] pinctrl: st: Use scope based of_node_put() cleanups
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 20 Aug 2024 09:56:01 +1000
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
Cc: imx@lists.linux.dev, Alexandre Belloni <alexandre.belloni@bootlin.com>, Peng Fan <peng.fan@nxp.com>, Emil Renner Berthing <kernel@esmil.dk>, Geert Uytterhoeven <geert+renesas@glider.be>, Tony Lindgren <tony@atomide.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Hal Feng <hal.feng@starfivetech.com>, Fabio Estevam <festevam@gmail.com>, Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, Dan Carpenter <dan.carpenter@linaro.org>, Heiko Stuebner <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Chunyan Zhang <zhang.lyra@gmail.com>, openbmc@lists.ozlabs.org, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, Ludovic Desroches <ludovic.desroches@microchip.com>, Jacky Bai <ping.bai@nxp.com>, Orson Zhai <orsonzhai@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, Patrice Chotard <patrice.chotard@foss.st.com>, Chester Lin <chester62515@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Stephen Warren <swarren@wwwdotorg.org>, Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org, soc@kernel.org, Damien Le Moal <dlemoal@kernel.org>, linux-mediatek@lists.infradead.org, Baolin Wang <baolin.wang@linux.alibaba.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Dong Aisheng <aisheng.dong@nxp.com>, Matthias Brugger <mbrugger@suse.com>, Dvorkin Dmitry <dvorkin@tibbo.com>, Sean Wang <sean.wang@kernel.org>, linux-stm32@st-md-mailman.stormreply.com, Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Jianlong Huang <jianlong.huang@starfivetech.com>, linux-riscv@lists.infradead.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Viresh Kumar <vireshk@kernel.org>, Wells Lu <wellslutw@gmail.com>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sat, May 4, 2024 at 3:14=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> Use scope based of_node_put() cleanup to simplify code.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Patch applied.

Yours,
Linus Walleij
