Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8A527C8A8
	for <lists+linux-aspeed@lfdr.de>; Tue, 29 Sep 2020 14:03:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0yj66PqmzDqYS
	for <lists+linux-aspeed@lfdr.de>; Tue, 29 Sep 2020 22:03:54 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::542;
 helo=mail-ed1-x542.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=U2ylC5Xq; dkim-atps=neutral
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0yhv0SB1zDqLn
 for <linux-aspeed@lists.ozlabs.org>; Tue, 29 Sep 2020 22:03:37 +1000 (AEST)
Received: by mail-ed1-x542.google.com with SMTP id i1so6059365edv.2
 for <linux-aspeed@lists.ozlabs.org>; Tue, 29 Sep 2020 05:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=60xpqL1mFMP5mTEXMd+Hf/JbwDeJfK2G/uC8t1br+6k=;
 b=U2ylC5Xqp6u8ik+qLLVYLPja9a6CNN7H2bkCEa//UctRW98qRrcJt5iSmfa7HlRGDa
 EDm/19NA602YOLiGzy8pur/PiSigZOnjiDFPDfp0wDQytj0AVKE9l1GJEsQDPHSaTpWN
 VKjV4VqmYPDpuUP8xoVz5EngrDU4Ndza9QesC6eHUD3jbdE7/xUMMFZhYMSOldDRFI3t
 ZdZxo51YFr3ToZQL3S3K4YVDbUkKbPpvyhMDBjwurhhpkVJ0dBbq+psxbbaZoqMRtKT+
 C5157f+z9w4veodAaTjN6EGUBR216cMGPBpMSLAghcRBokc8uH+foNEF+FhICHvyRD9T
 7rng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=60xpqL1mFMP5mTEXMd+Hf/JbwDeJfK2G/uC8t1br+6k=;
 b=rgV+r3raXvNFvCEN22IBkp9YkcvbHG0BJgXM4wZMW9AykePgXzgrU7W+ZTNcbxWhLr
 f1v7NGI8E0BYaT1qmhGDF5ZtsefvObqa9UH/KxpJhHctP2dK5Xt86CyAQmwP+Eawf4kr
 UpodrhvRrOPptnMcSscJPCmtfex17dv/9/BIhGVME3sD5AHz0++QW1hwUDi474qg1H0+
 Xe7tcbjrYXPYM/5edIENbfSgqWBy3dIgX/7pt7IGI8xYYd/6B7xWdPV7Eph9V6rh3OhV
 Qyz/qfLWpKfTQhLYxjM0S8qlfIKYkdQ285ytW05wdTtGxEXcHVEdIzMYDUDV8X3vHlmW
 1aBw==
X-Gm-Message-State: AOAM533s4+vXZ75DtxV0v6MLUdaNRC0x7nydKBOX+0RP34qJtmxIJbqU
 ijYOoL0OBkqUSrCpruMbeCdiaOXQFiEVcJeDSglNEA==
X-Google-Smtp-Source: ABdhPJx9YWw+klvNRqJR45fFUSS6cO52gWk7vHm028tT+rGobO97VJryE+a83/bztKgnEOk/N/ouPUUF0IEqke5ZwL8=
X-Received: by 2002:a50:8e17:: with SMTP id 23mr2797118edw.42.1601381012666;
 Tue, 29 Sep 2020 05:03:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200916155715.21009-1-krzk@kernel.org>
 <20200916155715.21009-2-krzk@kernel.org>
 <20200925154804.GB16392@kozik-lap>
In-Reply-To: <20200925154804.GB16392@kozik-lap>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 29 Sep 2020 14:03:21 +0200
Message-ID: <CACRpkdZ8Db+6yf6QG8kNgLBWFUzfogxu-CGjy-jYgXSR_sKoFA@mail.gmail.com>
Subject: Re: [PATCH v3 01/15] dt-bindings: gpio: convert bindings for NXP
 PCA953x family to dtschema
To: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Nishanth Menon <nm@ti.com>, Andrew Lunn <andrew@lunn.ch>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Tony Lindgren <tony@atomide.com>,
 Michal Simek <michal.simek@xilinx.com>, Fabio Estevam <festevam@gmail.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tero Kristo <t-kristo@ti.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Sep 25, 2020 at 5:48 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:

> The first two patches (bindings) have Rob's ack/review. Could you pick
> them via GPIO tree?

Yup! Patches 1 & 2 applied to the GPIO tree.

Thanks for doing this schema work, much appreciated.

Yours,
Linus Walleij
