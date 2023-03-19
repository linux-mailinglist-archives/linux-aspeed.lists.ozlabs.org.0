Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B1F6C5C50
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 Mar 2023 02:50:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PhpFD4Dbmz3bg8
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 Mar 2023 12:50:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PqJlDX0g;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b2a; helo=mail-yb1-xb2a.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PqJlDX0g;
	dkim-atps=neutral
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PfrHJ49vMz2xJ4
	for <linux-aspeed@lists.ozlabs.org>; Mon, 20 Mar 2023 08:15:06 +1100 (AEDT)
Received: by mail-yb1-xb2a.google.com with SMTP id e71so10911362ybc.0
        for <linux-aspeed@lists.ozlabs.org>; Sun, 19 Mar 2023 14:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679260500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o0iorqXQgWfUsmZ323+Wyn0oeyKtqb16TQ+B351+3qA=;
        b=PqJlDX0gTYbEtn8Inp0Uq9s7u/HTYqGjD1dgyn2nK1HN81qzYpJ9YK87P3/GK9pyjS
         NIox5xD6dYqMCgOx32vaNV7CStlqriTHBcn+xVBoWVHv64f9OkeU7yqIs+ePEjrucDlf
         hLYQeSFr+uU2/M2tfVJ5lrNZIIQBGZMUOQR/x/Pb64/87ScadQHktjIXmYzf0soAd8Cm
         1/vXcIPIvmyXhvwjyg9zJXzO53/CrLg2sarThltEBai116bRrT//SIC4+loKJSCgmFoX
         qFt40qfje7rzwaijTzBX1bDxUpXmUPSUnzUEnrOEFINsNM2XFX8efE0qIlI4ANoUsKOX
         jQCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679260500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o0iorqXQgWfUsmZ323+Wyn0oeyKtqb16TQ+B351+3qA=;
        b=SNI4L55sQMEZXiX2iKuoKwEZmr1P/Vhhk76BF8Kn+qpUDzJUlsIXa7VB7rPFMSMw1v
         XJJqkz2LmepPDdvUkYmMypc5cYNMsZd/UjTQKptpHwqeKzrLRt9m2zdcoT64XvDKbCtX
         EM5z09q6M187o+jYi1jBvo++R+91996Y6z8ZCJ4iKMf1hTyHkNGPLUtKqExigqhYYJvV
         N7xFgbcEQhKPChNuMaaXDvHlj9mhViFP5TSfAVTVx9qqbjEMMEyw4uJ3w5LOymLYrkRT
         gKlY1LZE5DNd58Ng1YBCaxZ5ZIJ+uwWt/aYGi2lw3qMaywDPblBvqN/HvleQkNZmqJyd
         kziA==
X-Gm-Message-State: AO0yUKXZ67J3pkuLcjyxxn3Vma2K8b5xyIxUZJZzAsg/URoopWzSL7hd
	g4tengxXaeUKGD+MoLqMo8dgbOyEBckidL28Pl5Ecg==
X-Google-Smtp-Source: AK7set88lgxJVA166ieuR2TTLZeS1J0rp7AfomiAt3xMAZzNkfr7DVMxQnogtWZ9zBjTSPGk/rTQReVq7hLkbmXRmbU=
X-Received: by 2002:a05:6902:1143:b0:aa9:bd2e:3746 with SMTP id
 p3-20020a056902114300b00aa9bd2e3746mr2997588ybu.4.1679260499808; Sun, 19 Mar
 2023 14:14:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230317233623.3968172-1-robh@kernel.org>
In-Reply-To: <20230317233623.3968172-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 19 Mar 2023 22:14:48 +0100
Message-ID: <CACRpkdYFJ-q9OT2b7U-CP08XGfdoD-qN3k3C2KBHhnuBdfSi7A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: Drop unneeded quotes
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 23 Mar 2023 12:49:28 +1100
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
Cc: alsa-devel@alsa-project.org, Sean Wang <sean.wang@kernel.org>, Jacky Bai <ping.bai@nxp.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Tomasz Figa <tomasz.figa@gmail.com>, linux-aspeed@lists.ozlabs.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, asahi@lists.linux.dev, Sylwester Nawrocki <s.nawrocki@samsung.com>, Fabio Estevam <festevam@gmail.com>, Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Heiko Stuebner <heiko@sntech.de>, linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Samuel Holland <samuel@sholland.org>, openbmc@lists.ozlabs.org, Manivannan Sadhasivam <mani@kernel.org>, Michal Simek <michal.simek@xilinx.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, linux-su
 nxi@lists.linux.dev, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, Charles Keepax <ckeepax@opensource.cirrus.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Sven Peter <sven@svenpeter.dev>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linux-actions@lists.infradead.org, Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-gpio@vger.kernel.org, Richard Fitzgerald <rf@opensource.cirrus.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Dong Aisheng <aisheng.dong@nxp.com>, Damien Le Moal <damien.lemoal@wdc.com>, Dvorkin Dmitry <dvorkin@tibbo.com>, Bjorn Andersson <andersson@kernel.org>, Hector Martin <marcan@marcan.st>, linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>, Jianlong Huang <jianlong.huang@starfivetech.com>, linux-riscv@lists.infradead.org, Masami Hiramatsu <mhiramat@k
 ernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, patches@opensource.cirrus.com, Wells Lu <wellslutw@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, Shawn Guo <shawnguo@kernel.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sat, Mar 18, 2023 at 12:36=E2=80=AFAM Rob Herring <robh@kernel.org> wrot=
e:

> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Less bad examples =3D good.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
