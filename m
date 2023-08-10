Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDD87802F2
	for <lists+linux-aspeed@lfdr.de>; Fri, 18 Aug 2023 03:17:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=permerror header.d=linaro.org header.i=@linaro.org header.a=rsa-sha1 header.s=google header.b=sKRwat/b;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRkVl3mb8z3bYt
	for <lists+linux-aspeed@lfdr.de>; Fri, 18 Aug 2023 11:17:03 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sKRwat/b;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::112e; helo=mail-yw1-x112e.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RM0F4376pz2ysB
	for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Aug 2023 18:18:48 +1000 (AEST)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-583d63ca1e9so8517917b3.1
        for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Aug 2023 01:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691655524; x=1692260324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N1S3yE96sxZWitB4oiJ30vpkB3MWLEMpL6UDMSJWZXU=;
        b=sKRwat/bRypjQs0GDj+E5aX6U0l+rdH2Ppp7jgbUiwQQsqjEaK0abvIScLRA0wD+XB
         V+k33vveoWCeS1c6XgCqjjXWr//cl1HyFtdD8ttwfDC6tU5h0yWEtUhgAWWlSrBAqi9t
         tXTEm4YMv0WM1uBDtQtenVY2VwUD4UxTzpZEwHsGCFe7Z/2lAj6TisZ1wfKRqkKtHkMv
         q4kQ3tqQ3kjjJBlQFVfvfmjVGvTI9ZG6qPa9xIgWc3cwJulHzC1kKt6V4uv2UEb2aMy8
         OAS7Hff9YtpzqDV058P27LVyQvRktH36oLc1Ux2VOWBYO61uLfbyzTdGhTV/qpGrAtF8
         glUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691655524; x=1692260324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N1S3yE96sxZWitB4oiJ30vpkB3MWLEMpL6UDMSJWZXU=;
        b=Xlx/dBRpQOdKrMj9tRPxhV01Q2LQAOWfduoWlh/GZzPkFdYG1eT2OGkRf+IBnvfGQH
         SMivJBScLh3ehjGoSB435f8QOaWyZIUWLg2pUVJ44VWsD8OWKHCmXQ02ZoSFE+d6Igbq
         u8D+tlGvd9RypKR49zjBK+KB57cxOEjnF9BBiUzb4pcZe8ugAJN8YqkIC7J/bh+1wiFI
         +SZe13L3SMhoIvjaEycKHUEGmV2MQDr8ZJ+SK40pAhUL3AVmNSajOHawQiJM4S9W2T7L
         JHcUyQ+b7aPTvmM9iDHuJNkNBBt+4EIyc7TfBqBSE3FBrL0SDJafXiTeplY9GUJUMj17
         zM5A==
X-Gm-Message-State: AOJu0YwERdxrMuVUdnQM9XyzC5enYZE5Al+ho4oXaoBJ+0smzbRMULkB
	ne6XqUrN3tFoeSejMfaPyiHtPpbwspHq1TDGKGkPJw==
X-Google-Smtp-Source: AGHT+IE+UnSxHykLJJfIQch1e5QQ0u1bPECfUCUFUDCntbpI1NXH0v2rJAWr/evYDXltegUQu7z4Swu4ag0Zr1/V/sw=
X-Received: by 2002:a25:3611:0:b0:d4c:aa71:8294 with SMTP id
 d17-20020a253611000000b00d4caa718294mr1849966yba.33.1691655524705; Thu, 10
 Aug 2023 01:18:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230803-dt-header-cleanups-for-soc-v2-0-d8de2cc88bff@kernel.org> <20230803-dt-header-cleanups-for-soc-v2-8-d8de2cc88bff@kernel.org>
In-Reply-To: <20230803-dt-header-cleanups-for-soc-v2-8-d8de2cc88bff@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 10 Aug 2023 10:18:33 +0200
Message-ID: <CACRpkdaX=nABoxGMAK+3uEHOt1imucK6LXXRrNuAYFiH3-jt7g@mail.gmail.com>
Subject: Re: [PATCH v2 08/23] ARM: nomadik: Drop unused includes
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 18 Aug 2023 11:16:42 +1000
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
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>, Sascha Hauer <s.hauer@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>, Stuart Yoder <stuyoder@gmail.com>, Jean-Marie Verdun <verdun@hpe.com>, Liviu Dudau <liviu.dudau@arm.com>, Tali Perry <tali.perry1@gmail.com>, linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Jisheng Zhang <jszhang@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>, linux-aspeed@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>, Fabio Estevam <festevam@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Samuel Holland <samuel@sholland.org>, Viresh Kumar <vireshk@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Nancy Yuen <yuenn@google.com>, Chen-Yu Tsai <wens@csie.org>, linux-rockchip@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Qiang 
 Zhao <qiang.zhao@nxp.com>, Patrice Chotard <patrice.chotard@foss.st.com>, Tsahee Zidenberg <tsahee@annapurnalabs.com>, linux-pm@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, Jay Fang <f.fangjian@huawei.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>, soc@kernel.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, Nick Hawkins <nick.hawkins@hpe.com>, Matthias Brugger <matthias.bgg@gmail.com>, Michal Simek <michal.simek@amd.com>, Cristian Marussi <cristian.marussi@arm.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, Antoine Tenart <atenart@kernel.org>, linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, Dinh Nguyen <dinguyen@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Shiraz Has him <shiraz.linux.kernel
 @gmail.com>, openbmc@lists.ozlabs.org, Daniel Mack <daniel@zonque.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Aug 4, 2023 at 12:44=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:

> Several includes are not needed, so drop them.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Thanks for cleaning out this.

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Will you funnel this to ARM SoC with the rest?

Yours,
Linus Walleij
