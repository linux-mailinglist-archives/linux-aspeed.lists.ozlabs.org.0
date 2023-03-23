Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4065B6C997C
	for <lists+linux-aspeed@lfdr.de>; Mon, 27 Mar 2023 04:07:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PlGR94Y2Xz3cFd
	for <lists+linux-aspeed@lfdr.de>; Mon, 27 Mar 2023 13:07:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jt0T1kyT;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b31; helo=mail-yb1-xb31.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jt0T1kyT;
	dkim-atps=neutral
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PhzLQ4Z0wz3cB1
	for <linux-aspeed@lists.ozlabs.org>; Thu, 23 Mar 2023 19:40:12 +1100 (AEDT)
Received: by mail-yb1-xb31.google.com with SMTP id e71so23936214ybc.0
        for <linux-aspeed@lists.ozlabs.org>; Thu, 23 Mar 2023 01:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679560808;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LVdvufZV56apmT3wmD9ncMcsijkg1/WCzRLjEqhYbYk=;
        b=jt0T1kyTzkSVHHCl6C3RepTUHJHJMJwp3E7PBrhT2/xYa5EtksiTTG/c8wwIzIU4Z/
         SP6qSrUD+NxMXZX1bTG8PCQpgfuHP59u0Np8wiu0KUJPXSqAJzXQDAgAhdBdm4ERqTZu
         W1iU/UXMn4o+x12ZfA1TbzzlGle1mhqc6+pCFoTYeSycXLH0chaeh9w1eBTkD2vOP8sA
         vAdlNnAtJbu1a1BYoccU9GKqHc2Cvh+aARoS6g2QyjguTZ3KI+BylBNheh9Xg9t4NtTd
         2k3OHgvwLC4ljAJqFRZ+gv0eOvpjcGObjDM/uBGal3iyuErBjVTwBqdgO9KbDxL+mVt4
         VMjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679560808;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LVdvufZV56apmT3wmD9ncMcsijkg1/WCzRLjEqhYbYk=;
        b=YgynuExW+X+9qBMgQ2d3zvTLblF0YNlhwoUmvc22OyAtAv81TdfBHx4oPM1xqwdsNz
         MCK8L+fod88SIHzmlHJnpNw/UfeI2Fo+zjW202WdWC4H+MUPh0Zc9QQXmnQwF1l5Zde9
         N5sa/NKYPjT1PPMrvTS1gUbyPyH3N6y5d5AlzWHFbkNt7yE7izbdGmV0yWLucECwrKHv
         peQ3uu5pV6745Qv1DXJl5y4/r83qlepwiIV6iM5yM6sA+kZX0caLKa1PHy9f5JYbOiig
         ZzwTW0YnRsWVQJ1s0q5d5errkwCns7s1BVe52kOz1c4BY3+vjZMOcMbW7fhp0jeQaDPq
         c5PQ==
X-Gm-Message-State: AAQBX9f969DXe/m1YeRH2pmlwJqwKy3Q81BQQlhX7c1eUKqdVnJ/vNlk
	lZXblrEo455vbAGJ7seJ7i+gic8PNq1YfSidaDcnXQ==
X-Google-Smtp-Source: AKy350aSyoiWihVzfFCCUghPO+0y8OTXazqo59ZooJtguYITdbyYyykALVgXcFtgTaOhhPAE83rDbJuRGMjWP7pJT3I=
X-Received: by 2002:a25:8712:0:b0:b26:47f3:6cb with SMTP id
 a18-20020a258712000000b00b2647f306cbmr1346675ybl.4.1679560808264; Thu, 23 Mar
 2023 01:40:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230317233623.3968172-1-robh@kernel.org>
In-Reply-To: <20230317233623.3968172-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 23 Mar 2023 09:39:57 +0100
Message-ID: <CACRpkdYq4jE7Qn1w8iPeGz7vxj_CeZ+H48B0TVYmeF4Tt=kHgA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: Drop unneeded quotes
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 27 Mar 2023 13:07:10 +1100
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

Should I queue this patch by the way, or do you need it to go into some
DT-related tree?

Yours,
Linus Walleij
