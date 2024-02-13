Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FB29578D4
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:56:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqHV4jN2z3bvW
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:56:06 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dBwUm+FV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b2e; helo=mail-yb1-xb2e.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TZFLN6ZNRz30Qk
	for <linux-aspeed@lists.ozlabs.org>; Wed, 14 Feb 2024 08:47:54 +1100 (AEDT)
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-dccb1421bdeso1102707276.1
        for <linux-aspeed@lists.ozlabs.org>; Tue, 13 Feb 2024 13:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707860870; x=1708465670; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Xj7EazHfkvqhAcFDgWE71D7H9yEicOk1M857cHV2u0=;
        b=dBwUm+FVC/rGz1k5E+rFYRe3eHYNLd8+m9bECGkCk6HK8dw16+ffoWJUpZJ1fM70Qf
         pwk/J6F7SPJ21oHEgRQfSkEB9r6TD75FwZGvAZBdWcfXnbIWr2qw9g7ts6aFSZxrUdpD
         DtAb2HYSFxv0DcnpJbFUSaXYyPkIWfv+SgnhNQOuGGd7cBHoK8AtoXvHUTVJOdUM7+zj
         otTmCFz8Nk1nh75roRUU6A6z0rTlrdL8uk0bzLctPg+FhLjeVFivFSrco5cvxGVFVrbZ
         FyfRaIWTKbTuqyHsyFl4O5iJBirNzQsuJ6uCySLHozV/rYPF6WGiThWcbPD2L1RR+PYq
         ygZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707860870; x=1708465670;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Xj7EazHfkvqhAcFDgWE71D7H9yEicOk1M857cHV2u0=;
        b=V56+r9ugebq8HsobIRRSvSgyrZcwb3qpAG+yh0284baDYBZ9gu+y6NJveJk8UR0Usv
         fZEgmq8I/08UpgF5aV7zr24mp0iQ1g4a7q9xZ2BL48enpu36hxns3LT5+21TXpxcMQ+Q
         ZgCfVAY9hrPDdW7iStstMlwP96ZEUpqZAckTonjt/9sEUuEQqXtQbTgKRUOrNwil8T4u
         xYQbzEQeoJ4QF5Kjk8TRwvOPl9xEzHBKZbnMgCDT/J1vXkf3EXHwVg+pHViszqpcOAgQ
         MrADzCfhjknQd/pbDIoXIP+XyBWYo3KVE+mIuDzaFgPia6Mu0+78NfXmu1Jbikc67IbP
         kKYA==
X-Forwarded-Encrypted: i=1; AJvYcCU6i2mK8jwAT6f6B4A3fsKCHVpyJ1EaaChVZxhuuGp12LPzZzAu9C3QZwJH8+0iwHjJdMfjl44z0nM75BH4gNh+WGWEwj7vTwZCc95FBA==
X-Gm-Message-State: AOJu0YwfAHBp3OOLwblqL/LYnFRsyi6Qc/1wrCwEubmcwDHNmbRLLJi4
	EUP7vbSqh7sEqI8qqqDeuTiIICDRW5IaIEJ4i5NyOtt4kZTvWApPHV7AatKFH963FF/F7ke9OHS
	G2eT0PhzlFg+AAAZrs/vO18JmZQazPaKkEe0TQA==
X-Google-Smtp-Source: AGHT+IFa7Zt8v9y973vv6MpdAwv7+Tn3+by0Zhu9bHJxIuhmjm9zf8ed0hjSWCanmVOGM7vq2XjFxfCkSYAs+ofuT1Q=
X-Received: by 2002:a25:ae47:0:b0:dcd:49d0:eece with SMTP id
 g7-20020a25ae47000000b00dcd49d0eecemr434149ybe.60.1707860869809; Tue, 13 Feb
 2024 13:47:49 -0800 (PST)
MIME-Version: 1.0
References: <20240213-arm-dt-cleanups-v1-0-f2dee1292525@kernel.org> <20240213-arm-dt-cleanups-v1-4-f2dee1292525@kernel.org>
In-Reply-To: <20240213-arm-dt-cleanups-v1-4-f2dee1292525@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 Feb 2024 22:47:39 +0100
Message-ID: <CACRpkdbPANM0-h_g+6Zazgw9U5W8ZDc=EG4ZiTv64JVmZAPivg@mail.gmail.com>
Subject: Re: [PATCH 4/6] arm: dts: Fix dtc interrupt_map warnings
To: Rob Herring <robh@kernel.org>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Geert Uytterhoeven <geert+renesas@glider.be>, Tony Lindgren <tony@atomide.com>, linux-arm-msm@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>, Stefan Agner <stefan@agner.ch>, Chanho Min <chanho.min@lge.com>, Thierry Reding <thierry.reding@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Nicolas Schier <nicolas@fjasle.eu>, Bjorn Andersson <andersson@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, linux-aspeed@lists.ozlabs.org, Gregory Clement <gregory.clement@bootlin.com>, Magnus Damm <magnus.damm@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-renesas-soc@vger.kernel.org, Andrew Jeffery <andrew@codeconstruct.com.au>, Linus Walleij <linusw@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-tegra@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kbuild@vger.kernel.org, Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Nathan Chancellor <nathan@kernel.org>, soc@kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Imre Kaloz <kaloz@openwrt.org>, Scott Branden <sbranden@broadcom.com>, openbmc@lists.ozlabs.org, Antoine Tenart <atenart@kernel.org>, linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Tsahee Zidenberg <tsahee@annapurnalabs.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Feb 13, 2024 at 8:35=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:

> The dtc interrupt_map warning is off because its dependency,
> interrupt_provider, is off by default. Fix all the warnings so it can be
> enabled.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Thanks for doing this Rob! The schemas finds so many mistakes...
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
